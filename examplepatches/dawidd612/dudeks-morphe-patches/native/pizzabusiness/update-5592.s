// This boundary follows the original status 0/1 handling. Keep every status
// unchanged and replace only the two update-dialog paths with their existing
// continuation. Other statuses resume the original instruction sequence.
cmp w8, #2
b.eq notice
cmp w8, #3
b.eq notice
ldr x20, [x22, #0x10]
b #{original_resume}

notice:
stp x19, x30, [sp, #-0x40]!
add x0, sp, #0x10
adr x1, helper_name
adr x2, show_name
adr x3, show_signature
bl #{jni_method_info}
cbz w0, complete
ldr x19, [sp, #0x10]
ldr x1, [sp, #0x18]
ldr x2, [sp, #0x20]
mov x0, x19
mov x3, xzr
ldr x8, [x19]
ldr x8, [x8, #0x478]
blr x8
// A Java helper failure cannot block an independent game continuation.
mov x0, x19
ldr x8, [x19]
ldr x8, [x8, #0x88]
blr x8
mov x0, x19
ldr x1, [sp, #0x18]
ldr x8, [x19]
ldr x8, [x8, #0xb8]
blr x8
complete:
ldp x19, x30, [sp], #0x40
ldr x0, [x22, #0x40]
cbz x0, missing_callback
ldr x8, [x0]
ldr x8, [x8, #0x30]
blr x8
b #{cleanup}
missing_callback:
b #{missing_callback}

helper_name: .asciz "pl/dudek/extension/pizzabusiness/PizzaUpdateNotice"
show_name: .asciz "show"
show_signature: .asciz "()V"
