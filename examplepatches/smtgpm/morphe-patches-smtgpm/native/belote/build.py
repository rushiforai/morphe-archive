"""Build the Belote ARM64 hook payload and regenerate NativeData.kt.

Usage: python3 build.py   (needs clang-18 and ld.lld)

Compiles hooks.c + hooks.S, links them at the cave address from link.ld, and writes
patches/.../belote/shared/NativeData.kt with the payload, the hook branches and every
instruction edit together with the original instruction the patch expects.

Copyright 2026 smtgpm. https://github.com/smtgpm/morphe-patches-smtgpm
"""
import pathlib, struct, subprocess, tempfile, base64, re
here = pathlib.Path(__file__).resolve().parent
out = here.parents[1] / 'patches/src/main/kotlin/app/smtgpm/patches/belote/shared/NativeData.kt'
CFLAGS = ['--target=aarch64-linux-android', '-O2', '-ffreestanding', '-fno-builtin', '-fno-stack-protector',
          '-fno-pic', '-mcmodel=small', '-fno-unwind-tables', '-fno-asynchronous-unwind-tables',
          '-Wall', '-Wextra', '-Werror', '-Wno-unused-parameter']
ins = lambda w: struct.pack('<I', w)
def b_to(src, dst):
    off = dst - src
    assert off % 4 == 0 and -(1 << 27) <= off < (1 << 27)
    return 0x14000000 | ((off >> 2) & 0x3ffffff)

with tempfile.TemporaryDirectory() as t:
    t = pathlib.Path(t)
    for src in ('hooks.c', 'hooks.S'):
        subprocess.run(['clang-18', *CFLAGS, '-c', str(here / src), '-o', str(t / (src + '.o'))], check=True)
    subprocess.run(['ld.lld-17', '-T', str(here / 'link.ld'), '--no-relax', '-static',
                    str(t / 'hooks.c.o'), str(t / 'hooks.S.o'), '-o', str(t / 'payload.elf')], check=True)
    elf = (t / 'payload.elf').read_bytes()
    shoff, = struct.unpack_from('<Q', elf, 0x28); shent, shnum, shstr = struct.unpack_from('<HHH', elf, 0x3a)
    secs = [struct.unpack_from('<IIQQQQIIQQ', elf, shoff + i * shent) for i in range(shnum)]
    names_off = secs[shstr][4]
    name = lambda s: elf[names_off + s[0]: elf.index(b'\0', names_off + s[0])].decode()
    payload, base = None, None
    for s in secs:
        if s[2] & 2 and s[5]:  # SHF_ALLOC with size
            assert name(s) == '.text' and payload is None, f'unexpected allocated section {name(s)}'
            payload, base = elf[s[4]:s[4] + s[5]], s[3]
    syms = {}
    for line in subprocess.run(['llvm-nm-17', str(t / 'payload.elf')], capture_output=True, text=True, check=True).stdout.splitlines():
        a, _, n = line.split()
        syms[n] = int(a, 16)
    dis = subprocess.run(['llvm-objdump-18', '-d', '--no-show-raw-insn', str(t / 'payload.elf')], capture_output=True, text=True).stdout

assert base == 0x1cf6d54 and len(payload) < 39844
# Hook entries: target address, its original first instruction, and the branch into the cave.
HOOKS = {
    # name: (target symbol in link.ld, original first instruction word)
    'wheel_show':                 (0x1e10ba0, 0xa9be57fe),  # stp x30, x21, [sp, #-0x20]!
    'wheel_free_spin_completed':  (0x1e126f4, 0xf81b0ffe),  # str x30, [sp, #-0x50]!
    'wheel_collect_done':         (0x1e15934, 0xa9bf4ffe),  # stp x30, x19, [sp, #-0x10]!
    'menu_show':                  (0x1e27204, 0xf81d0ffe),  # str x30, [sp, #-0x30]!
    'menu_refresh_daily_bonus':   (0x1e1ffe0, 0xf81d0ffe),  # str x30, [sp, #-0x30]!
    'menu_refresh_shop':          (0x1e21404, 0xf81d0ffe),  # str x30, [sp, #-0x30]!
}
hooks = {k: {'address': a, 'original': o, 'patched': b_to(a, syms['hook_' + k])} for k, (a, o) in HOOKS.items()}
# Plain instruction edits: (address, original word, replacement word).
FMOV_S0_ZERO, FMOV_S1_ZERO = 0x1e2703e0, 0x1e2703e1
FMOV_S3_EIGHTH = 0x1e281003  # fmov s3, #0.125
EDITS = {
    # CollectionManager.IsDebugAutoPackOpeningActive() -> return true
    'auto_open_packs': [(0x1c3abc0, 0xa9be57fe, 0x52800020),   # mov w0, #1
                        (0x1c3abc4, 0xa9014ff4, 0xd65f03c0),   # ret
                        # CollectionManager..ctor: debugAutoPackOpeningDelay 3.0f -> 0.25f
                        (0x1c3d9d0, 0x52a80808, 0x52a7d008)],
    'remove_interstitial_ads': [
        # InterstitialAdTask.Load() -> return: no interstitial is ever requested or downloaded
        (0x1b99ba8, 0xf81d0ffe, 0xd65f03c0),   # ret
        # MenuUIViewController.OnTableTileTraining: "if interstitial loaded, show it first"
        # -> always start the Solo game directly
        (0x1e2af6c, 0x36000300, 0x14000018),   # tbz w0, #0, +0x60 -> b +0x60
    ],
    'fast_pack_opening': [
        # <ShowGrantedItems>d__19: 0.35 s between cards -> 0
        (0x1dfd348, 0xbd47a100, FMOV_S0_ZERO),
        # <ContAnim>d__22: pack opening stage waits -> 0
        (0x1dfafa8, 0x1e2c1000, FMOV_S0_ZERO),   # 0.5 s before the open trigger
        (0x1dfb008, 0xbd480d20, FMOV_S0_ZERO),   # opening animation (center pack)
        (0x1dfb014, 0x1e2c1001, FMOV_S1_ZERO),   # opening animation (other packs, 0.5 s)
        (0x1dfb11c, 0xbd47a100, FMOV_S0_ZERO),   # cards x 0.35 s reveal wait
        (0x1dfb1ac, 0xbd49bd00, FMOV_S0_ZERO),   # 0.4 s after rewards view
        # <ShowPackOpening>d__19: 0.1 s before the pack animation
        (0x1dfb634, 0xbd484500, FMOV_S0_ZERO),
        # <ShowGrantedItems>d__19: 0.1 s before the first card, 0.5 s before the album hand-over
        (0x1dfd220, 0xbd484500, FMOV_S0_ZERO),
        (0x1dfd384, 0x1e2c1000, FMOV_S0_ZERO),
        # CollectionUIViewController <DistributePackRewards>d__32: cards flying into the album
        (0x1e03dbc, 0xbd49bd00, FMOV_S0_ZERO),   # 0.4 s before distributing
        (0x1e04224, 0x1e2a1000, FMOV_S0_ZERO),   # 0.25 s
        (0x1e04370, 0x1e2c1003, FMOV_S3_EIGHTH), # DOMove card flight 0.5 s -> 0.125 s
        (0x1e043e4, 0xbd484500, FMOV_S0_ZERO),   # 0.1 s per card
        (0x1e0448c, 0x1e2c1003, FMOV_S3_EIGHTH), # DOMove duplicate flight 0.5 s -> 0.125 s
        (0x1e04508, 0xbd49f100, FMOV_S0_ZERO),   # 0.2 s per duplicate
        (0x1e04570, 0x1e2e1000, FMOV_S0_ZERO),   # 1 s before duplicates screen
        (0x1e045b0, 0x1e2e1000, FMOV_S0_ZERO),   # 1 s before album finished screen
        (0x1e045e0, 0x1e2e1000, FMOV_S0_ZERO),   # 1 s before collection complete screen
        (0x1e04624, 0x1e2e1000, FMOV_S0_ZERO),   # 1 s before returning to My packs
        # Star pack (duplicates exchange). CollectionDuplicatesUIView <ShowRewards>d__53:
        (0x1dd138c, 0xbd480d00, FMOV_S0_ZERO),   # 0.8 s before the rewards
        (0x1dd170c, 0x1e2c1000, FMOV_S0_ZERO),   # 0.5 s after the fade-in
        (0x1dd1a78, 0xbd480d00, FMOV_S0_ZERO),   # 0.8 s
        (0x1dd1aa8, 0xbd49bd00, FMOV_S0_ZERO),   # 0.4 s
        # CollectionDuplicatesUIView <AnimateNewPacksToIcon>d__59: new pack flying to My packs
        (0x1dd0cfc, 0xbd4a9900, FMOV_S0_ZERO),   # 0.3 s
        (0x1dd0dbc, 0xbd49bd00, FMOV_S0_ZERO),   # 0.4 s
        (0x1dd0f04, 0xbd482d03, FMOV_S3_EIGHTH), # DOMove pack flight 0.6 s -> 0.125 s
        (0x1dd0f30, 0xbd49f100, FMOV_S0_ZERO),   # 0.2 s
        (0x1dd0f6c, 0x1e2c1000, FMOV_S0_ZERO),   # 0.5 s
        # CollectionDuplicatesUIViewController <ContAnim>d__39: opening the star pack
        (0x1df9ab4, 0x1e2c1000, FMOV_S0_ZERO),   # 0.5 s before the open trigger
        (0x1df9b10, 0x1e2c1000, FMOV_S0_ZERO),   # 0.5 s opening animation
        (0x1df9c08, 0xbd47a100, FMOV_S0_ZERO),   # cards x 0.35 s reveal wait
        (0x1df9c9c, 0xbd49bd00, FMOV_S0_ZERO),   # 0.4 s after rewards view
    ],
}
edits = {k: [{'address': a, 'original': o, 'patched': n} for a, o, n in v] for k, v in EDITS.items()}
def kt_edits(items):
    return ',\n'.join(f'        NativeEdit(0x{e["address"]:x}, 0x{e["original"]:08x}u, 0x{e["patched"]:08x}u)' for e in items)
kt = [
    '/*',
    ' * Copyright 2026 smtgpm.',
    ' * https://github.com/smtgpm/morphe-patches-smtgpm',
    ' *',
    ' * See the included NOTICE file for GPLv3 Section 7 terms.',
    ' */',
    '',
    '// GENERATED by native/belote/build.py from hooks.c, hooks.S and link.ld. Do not edit by hand.',
    '',
    'package app.smtgpm.patches.belote.shared',
    '',
    'internal object NativeData {',
    f'    const val CAVE_ADDRESS = 0x{base:x}L',
    f'    /** hooks.c + hooks.S linked at CAVE_ADDRESS ({len(payload)} bytes). */',
    f'    const val PAYLOAD_BASE64 = "{base64.b64encode(payload).decode()}"',
    '',
    '    /** Branches from each hooked game method into the payload. */',
]
for k, h in hooks.items():
    name = ''.join(w.capitalize() for w in k.split('_'))
    kt.append(f'    val HOOK_{k.upper()} = NativeEdit(0x{h["address"]:x}, 0x{h["original"]:08x}u, 0x{h["patched"]:08x}u)')
for k, v in edits.items():
    kt.append('')
    kt.append(f'    val {k.upper()} = listOf(\n{kt_edits(v)},\n    )')
kt.append('}')
out.parent.mkdir(parents=True, exist_ok=True)
out.write_text('\n'.join(kt) + '\n')
print(dis)
print(f'payload {len(payload)} bytes at {base:#x} -> {out}')
