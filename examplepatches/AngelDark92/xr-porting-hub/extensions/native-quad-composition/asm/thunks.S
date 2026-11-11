// Scene-side thunks for the native quad helper. Assembled per exact base with -D constants and
// linked at the base's own addresses (see tools/build_patch_tables.py). Position independent:
// every reference to scene code is a direct branch to an absolute address; every reference to
// the thunks' own data is pc-relative. No relocation, import or table entry is added to the ELF.
//
// Contract (state lives in 16 bytes of the abandoned old projection block, outside any live field):
//     [renderer + SV + 0] = helper state pointer   [renderer + SV + 8] = gxr_sq_entry pointer
// A null entry means "helper unavailable": every thunk then does nothing (GetLayers pushes nothing).
//
// Required -D symbols: SV, NEXT_BASE, NEXT_FOVEA, CTX_TYPE_OFF, E2H_RENDERER_SUB, CTOR_ORIG_WORD,
//                      DTOR_ORIG_WORD, FLIP_CACHE_OFF
// Required linker symbols: dlsym_plt, log_plt, cpvl_plt, refspace_plt, new_plt, delete_plt,
//                          throwlen_plt, fov_fn, e2h_ret
    .arch armv8-a

// ------------------------------------------------------------------------------------------
// Region A: replaces the body of QSVLRendererXR::GetProjectionLayers (exported, address kept)
// ------------------------------------------------------------------------------------------
    .section .regionA, "ax"
    .globl gl_entry
gl_entry:                       // (this=x0, std::vector<layer*>& = x1)
    mov     w9, #SV
    add     x9, x0, x9
    ldp     x8, x10, [x9]       // state, entry
    cbz     x10, 1f
    mov     x2, x1
    mov     x1, x8
    mov     w0, #8              // GXR_SQ_LAYERS
    br      x10                 // tail call: an exception from operator new unwinds to our caller
1:  ret

    .globl t_ctor
t_ctor:                         // called from the constructor's normal return path; x19 = renderer
    stp     x29, x30, [sp, #-0x10]!
    mov     x29, sp
    mov     x0, x19
    bl      gxr_load
    ldp     x29, x30, [sp], #0x10
    .word   CTOR_ORIG_WORD      // the instruction the call replaced (not pc-relative)
    ret

    .globl t_dtor
t_dtor:                         // called from the destructor's straight-line prologue; x19 = renderer
    stp     x29, x30, [sp, #-0x10]!
    mov     x29, sp
    mov     w9, #SV
    add     x9, x19, x9
    ldp     x1, x10, [x9]
    stp     xzr, xzr, [x9]      // clear first so the state can never be destroyed twice
    cbz     x10, 1f
    mov     w0, #1              // GXR_SQ_DESTROY
    blr     x10
1:  ldp     x29, x30, [sp], #0x10
    .word   DTOR_ORIG_WORD
    ret

    .globl t_e2h
t_e2h:                          // reached by `b` from the end of GetEyeToHeadTransform's success path
    .if E2H_MODE == 1           // x21 = &client->context (client + E2H_CLIENT_CTX)
    mov     w9, #E2H_RENDERER_SUB
    sub     x9, x21, x9         // &client->renderer
    ldr     x9, [x9]
    .else                       // x20 = client
    ldr     x9, [x20, #0x138]   // client->renderer
    .endif
    cbz     x9, 2f
    mov     w10, #SV
    add     x9, x9, x10
    ldp     x1, x10, [x9]
    cbz     x10, 2f
    mov     x2, x8              // XrView[2]* located in VIEW space
    mov     w0, #4              // GXR_SQ_EYES
    blr     x10
2:  b       e2h_ret

    .p2align 2
gxr_load:                       // (renderer = x0)
    stp     x29, x30, [sp, #-0x30]!
    mov     x29, sp
    stp     x19, x20, [sp, #0x10]
    stp     x21, x22, [sp, #0x20]
    mov     x19, x0
    mov     x0, xzr             // RTLD_DEFAULT
    adr     x1, s_dlopen
    bl      dlsym_plt
    cbz     x0, .Lfail
    mov     x20, x0
    adr     x0, s_lib
    mov     w1, #2              // RTLD_NOW | RTLD_LOCAL
    blr     x20
    cbz     x0, .Lfail
    adr     x1, s_entry
    bl      dlsym_plt           // x0 = handle from dlopen
    cbz     x0, .Lnoentry
    mov     x22, x0
    mov     w0, #0              // GXR_SQ_CREATE
    mov     x1, xzr
    adr     x2, gxr_table
    mov     x3, x19
    blr     x22
    cbz     x0, .Lfail
    mov     w9, #SV
    add     x9, x19, x9
    stp     x0, x22, [x9]       // (state, entry)
    b       .Ldone
.Lnoentry:
    adr     x2, s_noentry
    b       .Llog
.Lfail:
    adr     x2, s_fail
.Llog:
    mov     w0, #6              // ANDROID_LOG_ERROR
    adr     x1, s_tag
    bl      log_plt
    mov     w9, #SV
    add     x9, x19, x9
    stp     xzr, xzr, [x9]
.Ldone:
    ldp     x19, x20, [sp, #0x10]
    ldp     x21, x22, [sp, #0x20]
    ldp     x29, x30, [sp], #0x30
    ret

    .p2align 2
gxr_table:                      // struct gxr_sq_table (gxr_sq_abi.h); function offsets are table-relative
    .word   1                   // abi
    .word   40                  // size
    .word   new_plt - gxr_table
    .word   delete_plt - gxr_table
    .word   throwlen_plt - gxr_table
    .word   refspace_plt - gxr_table
    .word   fov_fn - gxr_table
    .word   CTX_TYPE_OFF
    .word   NEXT_BASE
    .word   NEXT_FOVEA
s_dlopen:   .asciz "dlopen"
s_entry:    .asciz "gxr_sq_entry"
s_lib:      .asciz "libgxr_quad_native.so"
s_tag:      .asciz "GXRSq"
s_fail:     .asciz "native quad helper load failed"
s_noentry:  .asciz "native quad helper entry missing"
    .p2align 2

// ------------------------------------------------------------------------------------------
// Region B: replaces the legacy matrix->pose helper (unused once its six callers are gone)
// ------------------------------------------------------------------------------------------
    .section .regionB, "ax"
    .macro SETUP_THUNK name, fam
    .globl \name
\name:                          // (ctx=x0, XRQSwapchain*=x1, eye=x2); x19 = renderer
    // No stack frame, no callee-saved register touched: a pure tail call. The helper reads the
    // swapchain handle/extent straight from the XRQSwapchain; XRQCreateProjectionViewLayer is never called.
    mov     w9, #SV
    add     x9, x19, x9
    ldp     x5, x10, [x9]       // state, entry
    cbz     x10, 1f
    mov     x4, x1              // swapchain
    mov     x3, x2              // eye
    mov     x1, x5              // state
    mov     w2, #\fam
    mov     w0, #3              // GXR_SQ_SWAPCHAIN
    br      x10
1:  ret
    .endm
    SETUP_THUNK t_setup_base, 0
    SETUP_THUNK t_setup_fovea, 1

    // FlipFrame compares the frame size with the size cached by the old per-eye block (a view extent
    // inside the abandoned projection storage). That cache is no longer written, so the two loads are
    // redirected to the helper's staged size of eye 0 (PEND_W0/PEND_H0 are asserted in gxr_sq.c).
    // Without a helper they report the current size (w24/w23) = "unchanged": no per-frame swapchain churn.
    .globl t_dim_w
t_dim_w:                        // replaces `ldr w8, [x19, #old width cache]`; clobbers only x8/x9/x10
    mov     w9, #SV
    add     x9, x19, x9
    ldp     x9, x10, [x9]
    cbz     x10, 1f
    ldr     w8, [x9, #PEND_W0]
    ret
1:  mov     w8, w24
    ret

    .globl t_dim_h
t_dim_h:                        // replaces `ldr w9, [x19, #old height cache]`; clobbers only x9/x10
    mov     w9, #SV
    add     x9, x19, x9
    ldp     x9, x10, [x9]
    cbz     x10, 1f
    ldr     w9, [x9, #PEND_H0]
    ret
1:  mov     w9, w23
    ret

    .globl t_frame
t_frame:                        // (metadata = x0); x19 = renderer; tail-calls the helper
    mov     w9, #SV
    add     x9, x19, x9
    ldp     x1, x10, [x9]
    cbz     x10, 1f
    mov     x2, x0
    mov     w0, #7              // GXR_SQ_FRAME
    br      x10
1:  ret

// ------------------------------------------------------------------------------------------
// In-place replacements
// ------------------------------------------------------------------------------------------
    .section .p_init, "ax"      // Init: replaces the projection header writes + three XRQGetReferenceSpace calls
    .globl p_init
p_init:                         // x21 = renderer, x19 = XRQContext
    ldr     x8, [x23, #0x28]    // the four instructions of the original prologue that must survive
    mov     x19, x1
    mov     x21, x0
    stur    x8, [x29, #-8]
    mov     w9, #SV
    add     x9, x21, x9
    ldp     x1, x10, [x9]
    cbz     x10, 1f
    mov     w0, #2              // GXR_SQ_INIT
    mov     x2, x19
    blr     x10
1:  b       init_ret

    .section .p_flip_eye, "ax"  // FlipFrame per-eye block (rect/size changed); x19 renderer x20 metadata x21 eye
    .globl p_flip_eye
p_flip_eye:
    mov     w9, #FLIP_CACHE_OFF
    add     CACHE_REG, x8, x9   // x8 = renderer + eye*8: keeps the cache pointer the code after the block needs
    mov     w9, #SV
    add     x9, x19, x9
    ldp     x1, x10, [x9]
    cbz     x10, 1f
    mov     w0, #6              // GXR_SQ_FRAME_EYE
    mov     x2, x20
    mov     w3, EYE_W
    mov     w4, w24             // width
    mov     w5, w23             // height
    blr     x10
1:  b       flip_eye_ret
