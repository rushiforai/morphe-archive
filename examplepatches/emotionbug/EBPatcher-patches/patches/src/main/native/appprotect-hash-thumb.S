// Source for AppProtectNativeHashPatch; preserves ARM/Thumb interworking.
// llvm-mc-20 -triple=thumbv7a-linux-android -filetype=obj THIS -o /tmp/ap-hash32.o
// ld.lld -Ttext=0x28cc --defsym=original_calloc=0x1b70 -e original_hash /tmp/ap-hash32.o -o /tmp/ap-hash32.elf
// llvm-objcopy-20 -O binary --only-section=.text /tmp/ap-hash32.elf /tmp/ap-hash32.bin
.syntax unified
.thumb
.arch armv7-a
.text
.p2align 2
.global original_hash
.type original_hash,%function
.thumb_func
original_hash:
    cmp r2, #0x2c
    beq md5
    cmp r2, #0x26
    bne unsupported
    adr.w r3, sha256_hex
    movs r2, #65
    b allocate
md5:
    adr.w r3, md5_hex
    movs r2, #33
allocate:
    push {r4, r5, r6, lr}
    mov r4, r1
    mov r5, r3
    mov r6, r2
    movs r0, #1
    mov r1, r6
    blx original_calloc
    cbz r0, allocation_failed
    mov r1, r0
copy:
    ldrb r2, [r5], #1
    strb r2, [r1], #1
    subs r6, #1
    bne copy
    str r0, [r4]
    movs r0, #0
    pop {r4, r5, r6, pc}
allocation_failed:
    mov.w r0, #-1
    pop {r4, r5, r6, pc}
unsupported:
    mov.w r0, #-1
    bx lr
.size original_hash, .-original_hash
md5_hex:
    .zero 33
sha256_hex:
    .zero 65
