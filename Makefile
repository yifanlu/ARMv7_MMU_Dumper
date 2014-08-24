CC=arm-none-eabi-gcc
CFLAGS=-std=c89 -march=armv7 -mthumb-interwork -Os -mthumb
LD=arm-none-eabi-gcc
LDFLAGS=-nodefaultlibs -nostdlib

OBJ=mmu_dump.o

all: mmu_dump

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS) $(CFLAGS_THUMB)

mmu_dump: $(OBJ)
	$(LD) -o $@ $^ $(LDFLAGS)

.PHONY: clean

clean:
	rm -rf *~ *.o
