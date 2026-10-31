// Source for AppProtectNativeHashPatch. No runtime assembler is required.
// llvm-mc-20 -triple=aarch64-linux-android -filetype=obj THIS -o /tmp/ap-hash64.o
// ld.lld -Ttext=0x2be0 --defsym=original_calloc=0x1a40 -e original_hash /tmp/ap-hash64.o -o /tmp/ap-hash64.elf
// llvm-objcopy-20 -O binary --only-section=.text /tmp/ap-hash64.elf /tmp/ap-hash64.bin
// Only the instruction prefix is embedded in Java; MD5/SHA256 slots follow it.
.text
.p2align 2
.global original_hash
.type original_hash,%function
original_hash:
    cmp w2, #0x2c
    b.eq md5
    cmp w2, #0x26
    b.ne unsupported
    adr x3, sha256_hex
    mov w4, #65
    b allocate
md5:
    adr x3, md5_hex
    mov w4, #33
allocate:
    stp x19, x20, [sp, #-32]!
    stp x21, x30, [sp, #16]
    mov x19, x1
    mov x20, x3
    mov x21, x4
    mov w0, #1
    mov x1, x21
    bl original_calloc
    cbz x0, allocation_failed
    mov x3, x0
copy:
    ldrb w2, [x20], #1
    strb w2, [x3], #1
    subs x21, x21, #1
    b.ne copy
    str x0, [x19]
    mov w0, #0
    b restore
allocation_failed:
    mov w0, #-1
restore:
    ldp x21, x30, [sp, #16]
    ldp x19, x20, [sp], #32
    ret
unsupported:
    mov w0, #-1
    ret
.size original_hash, .-original_hash
md5_hex:
    .zero 33
sha256_hex:
    .zero 65
