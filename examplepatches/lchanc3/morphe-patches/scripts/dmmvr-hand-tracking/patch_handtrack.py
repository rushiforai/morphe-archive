"""Inject OVRPlugin hand tracking into DMM VR 9.0.0 libil2cpp.so.
usage: patch_handtrack.py IN_SO OUT_SO [NativeCode.kt]
  IN_SO is lib/arm64-v8a/libil2cpp.so of the original APK; OUT_SO gets the patched copy, and
  NativeCode.kt the table the Morphe patch writes. Needs capstone to check the assembly.

caveB (per frame, hooked into InputSystemInputSubjectImpl.<.ctor>b__15_13):
  for each hand: ovrp_GetHandState(Render, hand, &st); if tracked, write PointerPose (Z-flipped to Unity)
  into the ControllerRig pointer+grip pose and set IsEnable; keep pose, tracked flag and pinch bits in G.
  Picks the active hand: the last hand whose index pinch started; falls back to the other tracked hand.
  Logs "DMMHT" to logcat whenever result/status/pinch changes.
caveA (hooked after Func<bool> in InputActionStream.UpdateState):
  OR index pinch into IndexTrigger / HandPoseClick streams (left, right, any).
caveC (hooked at XRBaseController.ApplyControllerState entry):
  while the active hand is tracked, every XRI controller gets that hand's pose; in the Dynamic phase the
  first controller each frame gets select / uiPress from the index pinch (with proper frame edges),
  the others are released, so overlapping controllers never double-click.
Input must be the ORIGINAL libil2cpp.so (no test7 diagnostic edits).
"""
import struct, sys
from a64 import Asm

IN, OUT = sys.argv[1], sys.argv[2]
d = bytearray(open(IN, 'rb').read())

CAVE = 0x3d95630          # zero padding after .note.android.ident, inside the RX PT_LOAD page
CAVE_END = 0x3d959e8      # start of RW segment's file bytes
G = 0x44d7f80             # tail of the last .bss page (zero, RW), 0x80 bytes
# G layout
G_KEY = 0x00     # [hand] last log key
G_PINCH = 0x08   # [hand] pinch bits (0 when untracked)
G_ACTIVE = 0x10  # active hand XOR 1 (zero-init => right hand)
G_TRK = 0x14     # [hand] tracked flag
G_PREV = 0x1c    # [hand] index pinch last frame
G_POSE = 0x28    # [hand] 7 floats (pos xyz, rot xyzw) Unity space, stride 0x1c
G_CLAIM = 0x60   # XRI controller that owns the pinch this frame (cleared by caveB)
GET_HAND_STATE = 0x263ac48  # OVRPlugin.OVRP_1_44_0$$ovrp_GetHandState (pinvoke wrapper)
LOG_PRINT = 0xab8f40        # __android_log_print PLT
HOOK_B = 0xE71D34           # ldr x20, [x19, #0x30]
HOOK_A = 0xE72024           # ldr w8, [x19, #0x20]
HOOK_C = 0x2CB2450          # str x20, [sp, #-0x20]!   (XRBaseController.ApplyControllerState)

assert d[HOOK_B:HOOK_B + 4] == bytes.fromhex('741a40f9'), d[HOOK_B:HOOK_B + 4].hex()
assert d[HOOK_A:HOOK_A + 4] == bytes.fromhex('682240b9'), d[HOOK_A:HOOK_A + 4].hex()
assert d[HOOK_C:HOOK_C + 8] == bytes.fromhex('f40f1ef8f37b01a9'), d[HOOK_C:HOOK_C + 8].hex()
assert not any(d[CAVE:CAVE_END])

GLO = G & 0xfff
ST = 0x40                 # HandStateInternal on stack
a = Asm(CAVE)
a(f'''
caveB:
  sub sp, sp, #0x240
  stp x29, x30, [sp]
  stp x21, x22, [sp, #0x10]
  stp x23, x24, [sp, #0x20]
  adrp x23, {G:#x}
  add x23, x23, #{GLO:#x}
  str xzr, [x23, #{G_CLAIM:#x}]
  mov x21, #0
loopB:
  mov w0, #-1
  mov w1, w21
  add x2, sp, #{ST:#x}
  mov x3, xzr
  bl {GET_HAND_STATE:#x}
  ldr w8, [sp, #{ST:#x}]
  ldr w9, [sp, #{ST + 0x1A0:#x}]
  mov w24, w8
  add x15, x23, x21, lsl #2
  str wzr, [x15, #{G_TRK:#x}]
  cbz w0, okB
  mov w8, #0
okB:
  tbnz w8, #6, notrB
  tbz w8, #0, notrB
  mov w10, #1
  str w10, [x15, #{G_TRK:#x}]
  add x10, sp, #{ST + 0x1B8:#x}
  ldp s0, s1, [x10]
  ldp s2, s3, [x10, #8]
  ldp s4, s5, [x10, #0x10]
  ldr s6, [x10, #0x18]
  fneg s0, s0
  fneg s1, s1
  fneg s6, s6
  add x10, x23, #{G_POSE:#x}
  cbz x21, poseB
  add x10, x10, #0x1c
poseB:
  stp s4, s5, [x10]
  str s6, [x10, #8]
  stp s0, s1, [x10, #0xc]
  stp s2, s3, [x10, #0x14]
  add x10, x19, #0x10
  ldr x22, [x10, x21, lsl #3]
  cbz x22, storeB
  stp s4, s5, [x22, #0x18]
  str s6, [x22, #0x20]
  stp s0, s1, [x22, #0x24]
  stp s2, s3, [x22, #0x2c]
  stp s4, s5, [x22, #0x34]
  str s6, [x22, #0x3c]
  stp s0, s1, [x22, #0x40]
  stp s2, s3, [x22, #0x48]
  mov w10, #1
  strb w10, [x22, #0x14]
  b storeB
notrB:
  mov w9, #0
storeB:
  add x10, x23, x21, lsl #2
  str w9, [x10, #{G_PINCH:#x}]
  ; active hand: index pinch rising edge selects this hand
  ubfx w12, w9, #1, #1
  ldr w13, [x10, #{G_PREV:#x}]
  str w12, [x10, #{G_PREV:#x}]
  bic w12, w12, w13
  cbz w12, logB
  mov w12, #1
  eor w12, w21, w12
  str w12, [x23, #{G_ACTIVE:#x}]
logB:
  orr w11, w0, w24, lsl #8
  orr w11, w11, w9, lsl #24
  mov w13, #0x8000
  orr w11, w11, w13, lsl #16
  ldr w12, [x10]
  cmp w11, w12
  b.eq nextB
  str w11, [x10]
  mov w3, w21
  mov w4, w0
  mov w5, w24
  mov w6, w9
  mov w0, #4
  adr x1, tag
  adr x2, fmt
  bl {LOG_PRINT:#x}
nextB:
  add x21, x21, #1
  cmp x21, #2
  b.ne loopB
  ; fall back to the other hand when the active one is not tracked
  ldr w8, [x23, #{G_ACTIVE:#x}]
  mov w9, #1
  eor w9, w8, w9
  add x10, x23, x9, lsl #2
  ldr w11, [x10, #{G_TRK:#x}]
  cbnz w11, doneB
  add x10, x23, x8, lsl #2
  ldr w11, [x10, #{G_TRK:#x}]
  cbz w11, doneB
  str w9, [x23, #{G_ACTIVE:#x}]
doneB:
  ldp x23, x24, [sp, #0x20]
  ldp x21, x22, [sp, #0x10]
  ldp x29, x30, [sp]
  add sp, sp, #0x240
  ldr x20, [x19, #0x30]
  ret

caveA:
  ldr w8, [x19, #0x10]
  adrp x9, {G:#x}
  add x9, x9, #{GLO:#x}
  ldr w10, [x9, #{G_PINCH:#x}]
  ldr w11, [x9, #{G_PINCH + 4:#x}]
  cmp w8, #107
  b.eq leftA
  cmp w8, #400
  b.eq leftA
  cmp w8, #207
  b.eq pickA
  cmp w8, #500
  b.eq pickA
  cmp w8, #7
  b.eq anyA
  cmp w8, #300
  b.eq anyA
  b doneA
leftA:
  mov w11, w10
  b pickA
anyA:
  orr w11, w11, w10
pickA:
  ubfx w11, w11, #1, #1
  orr w0, w0, w11
doneA:
  ldr w8, [x19, #0x20]
  ret

caveC:
  mov x17, x30
  cbz x2, origC
  adrp x9, {G:#x}
  add x9, x9, #{GLO:#x}
  ldr w10, [x9, #{G_ACTIVE:#x}]
  mov w11, #1
  eor w10, w10, w11
  add x11, x9, x10, lsl #2
  ldr w12, [x11, #{G_TRK:#x}]
  cbz w12, origC
  ldr w13, [x11, #{G_PINCH:#x}]
  ubfx w13, w13, #1, #1
  add x11, x9, #{G_POSE:#x}
  cbz w10, poseC
  add x11, x11, #0x1c
poseC:
  ldp s0, s1, [x11]
  ldr s2, [x11, #8]
  ldp s3, s4, [x11, #0xc]
  ldp s5, s6, [x11, #0x14]
  stp s0, s1, [x2, #0x1c]
  str s2, [x2, #0x24]
  stp s3, s4, [x2, #0x28]
  stp s5, s6, [x2, #0x30]
  mov w12, #3
  str w12, [x2, #0x18]
  cmp w1, #1
  b.ne origC
  ; only one XRI controller per frame gets the pinch (no double clicks)
  ldr x12, [x9, #{G_CLAIM:#x}]
  cbnz x12, chkC
  str x0, [x9, #{G_CLAIM:#x}]
  mov x12, x0
chkC:
  cmp x12, x0
  b.eq pressC
  mov w13, #0
pressC:
  ; select (0x38) and uiPress (0x48): value, active, activatedThisFrame, deactivatedThisFrame
  add x11, x2, #0x38
  bl stateC
  add x11, x2, #0x48
  bl stateC
  b origC
stateC:
  ldrb w14, [x11, #4]
  ldrb w15, [x11, #6]
  orr w14, w14, w15
  movz w15, #0x3f80, lsl #16
  cmp w13, #0
  b.ne valC
  mov w15, #0
valC:
  str w15, [x11]
  strb w13, [x11, #4]
  bic w15, w13, w14
  strb w15, [x11, #5]
  bic w15, w14, w13
  strb w15, [x11, #6]
  ret
origC:
  mov x30, x17
''')
# original first instruction (str x20, [sp, #-0x20]!) then jump back
a.raw(struct.unpack_from('<I', d, HOOK_C)[0])
a(f'b {HOOK_C + 4:#x}')
a('tag:')
a.data(b'DMMHT\0')
a.label('fmt')
a.data(b'hand%d res=%d status=0x%x pinch=0x%x\0')
code = a.assemble()
bad = a.verify()
assert bad == 0, bad
assert CAVE + len(code) <= CAVE_END, hex(CAVE + len(code))
d[CAVE:CAVE + len(code)] = code

for at, ins in ((HOOK_B, f'bl {a.labels["caveB"]:#x}'), (HOOK_A, f'bl {a.labels["caveA"]:#x}'),
                (HOOK_C, f'b {a.labels["caveC"]:#x}')):
    h = Asm(at); h(ins); d[at:at + 4] = h.assemble()

# grow the RX PT_LOAD so the cave is formally part of the mapped text
phoff = struct.unpack_from('<Q', d, 0x20)[0]
assert struct.unpack_from('<II', d, phoff) == (1, 5)
struct.pack_into('<QQ', d, phoff + 32, CAVE_END, CAVE_END)   # p_filesz, p_memsz
open(OUT, 'wb').write(d)
print(f'cave {CAVE:#x}..{CAVE + len(code):#x} ({len(code)} bytes) ' +
      ' '.join(f'{k}={v:#x}' for k, v in a.labels.items() if k.startswith('cave')))

# --- optional: emit the Kotlin table used by the Morphe patch -------------------------------
if len(sys.argv) > 3:
    import hashlib
    src = {pc: s for pc, _, s in a.listing}
    at_label = {}
    for k, v in a.labels.items():
        at_label.setdefault(v, []).append(k)
    lines = []
    for off in range(0, len(code), 4):
        pc = CAVE + off
        w = struct.unpack_from('<I', code, off)[0]
        if pc in src:
            note = src[pc] if src[pc] != '.word' else 'str x20, [sp, #-0x20]!  (the instruction hook C replaced)'
        else:
            note = 'data ' + repr(code[off:off + 4].decode('latin1'))
        lab = ''.join(f'{n}: ' for n in at_label.get(pc, []))
        lines.append(f'    0x{w:08X}L, // {lab}{note}')
    hooks = []
    for at, name in ((HOOK_B, 'caveB'), (HOOK_A, 'caveA'), (HOOK_C, 'caveC')):
        hooks.append((at, struct.unpack_from('<I', bytes(open(IN, 'rb').read(at + 4)[at:at + 4]))[0],
                      struct.unpack_from('<I', d, at)[0], name))
    orig_sha = hashlib.sha256(open(IN, 'rb').read()).hexdigest()
    orig_bytes = open(IN, 'rb').read()
    orig_text_size = struct.unpack_from('<Q', orig_bytes, struct.unpack_from('<Q', orig_bytes, 0x20)[0] + 32)[0]
    kt = f'''package app.lchanc3.patches.dmmvr.handtracking

// Generated by scripts/dmmvr-hand-tracking/patch_handtrack.py; edit that, not this file.

/** SHA-256 of `lib/arm64-v8a/libil2cpp.so` in DMM VR 9.0.0, the only build the offsets below fit. */
internal const val LIBIL2CPP_SHA256 = "{orig_sha}"

/**
 * Where the code goes: zero padding after `.note.android.ident`, still inside the executable
 * page of the first PT_LOAD. Its file size is grown to [CAVE_END] so the padding is formally text.
 */
internal const val CAVE_OFFSET = 0x{CAVE:X}
internal const val CAVE_END = 0x{CAVE_END:X}

/** `p_filesz` and `p_memsz` of the first PT_LOAD before the patch grew it to [CAVE_END]. */
internal const val ORIGINAL_TEXT_SIZE = 0x{orig_text_size:X}

/** Branches into the code, as (file offset, original instruction, replacement). */
internal val HOOKS = listOf(
''' + ''.join(f'    Triple(0x{at:X}, 0x{o:08X}L, 0x{n:08X}L), // -> {name}\n' for at, o, n, name in hooks) + f''')

/**
 * caveB, every frame from InputSystemInputSubjectImpl's update: reads both hands from OVRPlugin
 * (`ovrp_GetHandState`), writes the aim pose into DMM's ControllerRig, and keeps pose, tracking
 * and pinch state in the spare tail of `.bss` (0x{G:X}). The active hand is the last one to pinch.
 * caveA, InputActionStream.UpdateState: an index pinch counts as the trigger of that hand.
 * caveC, XRBaseController.ApplyControllerState: the XR Interaction Toolkit ray follows the active
 * hand, and one controller per frame gets select / UI press from the pinch.
 */
internal val CAVE_CODE = longArrayOf(
''' + '\n'.join(lines) + '''
)
'''
    open(sys.argv[3], 'w', encoding='utf-8', newline='\n').write(kt)
    print('wrote', sys.argv[3])
