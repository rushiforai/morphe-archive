// Enter after the stock iterator initializes metadata, sets state=-1 and checks
// its owner. Preserve the server's status; only replace this UI/wait boundary.
ldr w8, [x20, #0xc0]
cmp w8, #1
b.ls notice
mov x0, xzr
bl #{signer_check}
tbz w0, #0, finished
notice:
adrp x19, #{vm_page}
ldr x19, [x19, #{vm_low}]
cbz x19, finished
sub sp, sp, #0x50
str xzr, [sp]
str wzr, [sp, #8]
mov x0, x19
mov x1, sp
mov w2, #6
movk w2, #1, lsl #16
ldr x8, [x19]
ldr x8, [x8, #0x30]
blr x8
cmn w0, #2
b.ne got_env
mov x0, x19
mov x1, sp
mov x2, xzr
ldr x8, [x19]
ldr x8, [x8, #0x20]
blr x8
cbnz w0, leave_stack
mov w8, #1
str w8, [sp, #8]
got_env:
cbnz w0, leave_stack
ldr x20, [sp]
cbz x20, detach
ldr x21, [x20]
mov x0, x20
mov w1, #16
ldr x8, [x21, #0x98]
blr x8
tbnz w0, #31, clear_without_frame

// Resolve the app helper through the Unity thread's context ClassLoader.
// FindClass alone can select the boot loader on native-attached threads.
mov x0, x20
adr x1, thread_name
ldr x8, [x21, #0x30]
blr x8
cbz x0, clear_frame
mov x22, x0
str x0, [sp, #0x10]
mov x0, x20
mov x1, x22
adr x2, current_thread
adr x3, current_thread_sig
ldr x8, [x21, #0x388]
blr x8
cbz x0, clear_frame
mov x2, x0
mov x0, x20
mov x1, x22
mov x3, xzr
ldr x8, [x21, #0x3a0]
blr x8
cbz x0, clear_frame
mov x22, x0
mov x0, x20
ldr x1, [sp, #0x10]
adr x2, get_loader
adr x3, get_loader_sig
ldr x8, [x21, #0x108]
blr x8
cbz x0, clear_frame
mov x2, x0
mov x0, x20
mov x1, x22
mov x3, xzr
ldr x8, [x21, #0x120]
blr x8
cbz x0, clear_frame
mov x22, x0
mov x0, x20
adr x1, loader_name
ldr x8, [x21, #0x30]
blr x8
cbz x0, clear_frame
mov x1, x0
mov x0, x20
adr x2, load_class
adr x3, load_class_sig
ldr x8, [x21, #0x108]
blr x8
cbz x0, clear_frame
mov x23, x0
mov x0, x20
adr x1, helper_name
ldr x8, [x21, #0x538]
blr x8
cbz x0, clear_frame
str x0, [sp, #0x18]
mov x0, x20
mov x1, x22
mov x2, x23
add x3, sp, #0x18
ldr x8, [x21, #0x120]
blr x8
cbz x0, clear_frame
mov x22, x0
mov x0, x20
mov x1, x22
adr x2, show_name
adr x3, show_sig
ldr x8, [x21, #0x388]
blr x8
cbz x0, clear_frame
mov x2, x0
mov x0, x20
mov x1, x22
mov x3, xzr
ldr x8, [x21, #0x478]
blr x8
clear_frame:
mov x0, x20
ldr x8, [x21, #0x88]
blr x8
mov x0, x20
mov x1, xzr
ldr x8, [x21, #0xa0]
blr x8
b detach
clear_without_frame:
mov x0, x20
ldr x8, [x21, #0x88]
blr x8
detach:
ldr w8, [sp, #8]
cbz w8, leave_stack
mov x0, x19
ldr x8, [x19]
ldr x8, [x8, #0x28]
blr x8
leave_stack:
add sp, sp, #0x50
finished:
mov w0, wzr
b #{epilogue}

thread_name: .asciz "java/lang/Thread"
current_thread: .asciz "currentThread"
current_thread_sig: .asciz "()Ljava/lang/Thread;"
get_loader: .asciz "getContextClassLoader"
get_loader_sig: .asciz "()Ljava/lang/ClassLoader;"
loader_name: .asciz "java/lang/ClassLoader"
load_class: .asciz "loadClass"
load_class_sig: .asciz "(Ljava/lang/String;)Ljava/lang/Class;"
helper_name: .asciz "pl.dudek.extension.coffeebusiness.CoffeeUpdateNotice"
show_name: .asciz "show"
show_sig: .asciz "()V"
