ENTRY(repair_entry)
game_get_player = 0x386bd78;
game_get_int = 0x387151c;
game_set_int = 0x3871490;
SECTIONS {
    . = 0x79a1000;
    .payload : { KEEP(*(.text.entry)) *(.text*) *(.rodata*) }
    /DISCARD/ : { *(.comment) *(.note*) *(.eh_frame*) }
}
ASSERT(SIZEOF(.data) == 0, "payload must not have writable data")
ASSERT(SIZEOF(.bss) == 0, "payload must not have writable state")
