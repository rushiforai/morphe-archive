#!/usr/bin/env python3
"""Inspect a REAL rebuilt APK, then execute the patched ARM blocks with Unity calls stubbed.

Requires androguard==4.1.4 and unicorn==2.1.4 in a separate Python environment.
Usage: python verify_offlinegames.py ORIGINAL.apks PATCHED.apk [--fast-startup]
Run with all three Offline Games patches enabled.
"""
import hashlib
import argparse
import io
import struct
import sys
import zipfile

from loguru import logger
logger.disable("androguard")
from androguard.core.dex import DEX
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_CODE
from unicorn.arm_const import UC_ARM_REG_PC, UC_ARM_REG_LR, UC_ARM_REG_CPSR
from unicorn.arm_const import UC_ARM_REG_R0, UC_ARM_REG_R1, UC_ARM_REG_R4, UC_ARM_REG_R6, UC_ARM_REG_R9

LIBRARY = "lib/armeabi-v7a/libil2cpp.so"
MANIFEST = "assets/patchlab/offlinegames-native.properties"
ORIGINAL_HASH = "dd619f322538d339137e30a8c53e913ddecb59e78296ba86a79f058853ba0512"


def original_library(path, library_path=LIBRARY, expected_hash=ORIGINAL_HASH):
    candidates = []
    with zipfile.ZipFile(path) as archive:
        if library_path in archive.namelist():
            candidates.append(archive.read(library_path))
        for name in archive.namelist():
            if name.endswith(".apk"):
                with zipfile.ZipFile(io.BytesIO(archive.read(name))) as split:
                    if library_path in split.namelist():
                        data = split.read(library_path)
                        candidates.append(data)
                        print("INPUT", name, hashlib.sha256(data).hexdigest())
    # The supplied APKS has a legacy-patched copy in base.apk AND a stock copy
    # in the ARM split. Inspect every entry instead of silently choosing the first.
    for data in candidates:
        if hashlib.sha256(data).hexdigest() == expected_hash:
            return data
    raise AssertionError("Input has no verified original " + library_path)


def check(condition, message):
    assert condition, message
    print("PASS", message)


def execute_ui_blocks(library):
    """Native instructions execute in Unicorn; engine boundaries are deterministic stubs."""
    u = Uc(UC_ARCH_ARM, UC_MODE_ARM)
    u.mem_map(0, 0x4800000)
    u.mem_write(0, library)
    u.mem_map(0x10000000, 0x10000)
    base, wrapper, button, callback, state = [0x10000000 + n * 0x100 for n in range(5)]
    def word(address, value):
        u.mem_write(address, struct.pack('<I', value))
    calls = []
    def hook(uc, address, size, _):
        if address == 0x21A27DC:  # GameObject.SetActive
            calls.append((uc.reg_read(UC_ARM_REG_R0), uc.reg_read(UC_ARM_REG_R1)))
            uc.reg_write(UC_ARM_REG_PC, uc.reg_read(UC_ARM_REG_LR))
        elif address == 0x11031B8:
            raise AssertionError("Unexpected null dereference")
    u.hook_add(UC_HOOK_CODE, hook)
    word(base + 0x38, wrapper)
    word(base + 0x40, button)
    # Exercise opening even if another caller supplied a nonzero duration.
    for counter in (0, 1, 3, 15, 60):
        word(base + 0x4c, counter)
        u.reg_write(UC_ARM_REG_R9, base)
        calls.clear()
        u.emu_start(0x15B6E94, 0x15B6EE8, count=100)
        check(calls == [(wrapper, 0), (button, 1)], f"Open(counter={counter}) hides countdown and shows close")

    # The callback that writes the incoming countdown initializes it as complete.
    word(callback + 8, 15)
    u.reg_write(UC_ARM_REG_R0, callback)
    u.emu_start(0x15B78AC, 0x15B78B0, count=1)
    u.reg_write(UC_ARM_REG_R4, base + 0x50)
    u.emu_start(0x15B78D0, 0x15B78D4, count=1)
    check(struct.unpack('<I', u.mem_read(base + 0x4c, 4))[0] == 0, "Open callback writes counter=0")

    # Fresh coroutine now reaches its normal finished block without the countdown wait.
    word(state + 8, 0)
    word(state + 0x10, base)
    u.reg_write(UC_ARM_REG_R4, state)
    u.emu_start(0x15B7918, 0x15B7A28, count=40)
    check(u.reg_read(UC_ARM_REG_PC) == 0x15B7A28, "Fresh countdown reaches normal completion block")

    u.reg_write(UC_ARM_REG_LR, 0x10008000)
    u.emu_start(0x15B77AC, 0x10008000, count=1)
    check(u.reg_read(UC_ARM_REG_PC) == 0x10008000, "OpenStorePage returns before URL resolution")
    u.reg_write(UC_ARM_REG_LR, 0x10008000)
    u.emu_start(0x12A22F8, 0x10008000, count=1)
    check(u.reg_read(UC_ARM_REG_PC) == 0x10008000, "Rewarded download adapter returns before SDK call")
    u.emu_start(0x16F47E8, 0x16F4924, count=1)
    check(u.reg_read(UC_ARM_REG_PC) == 0x16F4924, "Rewarded decision enters existing house-ad path")


def execute_startup_blocks(original, patched):
    def emulator(data):
        u = Uc(UC_ARCH_ARM, UC_MODE_ARM)
        u.mem_map(0, 0x4800000)
        u.mem_write(0, data)
        u.mem_map(0x10000000, 0x10000)
        return u

    # In stock code, pending + before-deadline returns to the yield path.
    # No comparison flag may keep the patched branch waiting.
    for offset, target, label in ((0x128526C, 0x128528C, "Firebase/Remote Config"),
                                  (0x12859DC, 0x1285DB0, "country lookup")):
        u = emulator(patched)
        for flags in range(16):
            u.reg_write(UC_ARM_REG_CPSR, 0x10 | (flags << 28))
            u.emu_start(offset, target, count=1)
            check(u.reg_read(UC_ARM_REG_PC) == target, f"{label}: continuation taken with NZCV={flags:x}")
        stock = emulator(original)
        # N=1,V=0 makes GE false; Z=0 makes EQ false.
        stock.reg_write(UC_ARM_REG_CPSR, 0x80000010)
        stock.emu_start(offset, offset + 4, count=1)
        check(stock.reg_read(UC_ARM_REG_PC) == offset + 4, f"Stock {label} can enter blocking path")

    # Test the actual timeout continuation's log + return-value path, not just a branch address.
    u = emulator(patched)
    view = 0x10000000
    u.reg_write(UC_ARM_REG_R6, view)
    u.reg_write(UC_ARM_REG_R4, view + 0x100)
    logs = []
    def hook(uc, address, size, _):
        if address == 0x12830F4:
            logs.append(address)
            uc.reg_write(UC_ARM_REG_PC, uc.reg_read(UC_ARM_REG_LR))
        elif address == 0x11031B8:
            raise AssertionError("Unexpected null dereference in timeout path")
    u.hook_add(UC_HOOK_CODE, hook)
    u.emu_start(0x128528C, 0x12852B0, count=100)
    check(u.reg_read(UC_ARM_REG_R0) == 0 and len(logs) == 1,
          "Firebase pending path returns false/completed through existing timeout continuation")

    # Ads enumerator in r1 must survive dispatch into StartCoroutine, even if the
    # configuration requested sequential initialization (r6=0).
    for parallel in (0, 1):
        u = emulator(patched)
        u.reg_write(UC_ARM_REG_R6, parallel)
        u.reg_write(UC_ARM_REG_R9, view)
        u.reg_write(UC_ARM_REG_R1, view + 0x200)
        u.emu_start(0x1286A20, 0x21A277C, count=10)
        check(u.reg_read(UC_ARM_REG_PC) == 0x21A277C and
              u.reg_read(UC_ARM_REG_R0) == view and u.reg_read(UC_ARM_REG_R1) == view + 0x200,
              f"Ads use existing StartCoroutine with preserved enumerator (parallel={parallel})")

    # The requests, ready/failure callbacks, consent and local scene-loading code
    # must remain byte-identical outside the three explicitly approved sites.
    expected = bytearray(original)
    for offset, value in {0x128526C: '060000ea', 0x12859DC: 'f30000ea', 0x1286A24: '00f020e3'}.items():
        expected[offset:offset+4] = bytes.fromhex(value)
    for start, end in ((0x1284F04, 0x12853C0), (0x1285418, 0x1287070),
                       (0x1283F5C, 0x128404C), (0x12846B4, 0x1284E3C)):
        check(patched[start:end] == expected[start:end], f"Startup function {start:#x}: only intended wait edits")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('original')
    parser.add_argument('patched')
    parser.add_argument('--fast-startup', action='store_true')
    args = parser.parse_args()
    with zipfile.ZipFile(args.patched) as apk:
        manifest = dict(line.split('=', 1) for line in apk.read(MANIFEST).decode().splitlines() if '=' in line)
    if manifest.get('abi') == 'arm64-v8a':
        from verify_offlinegames_arm64 import verify
        verify(args)
        return
    original = original_library(args.original)
    check(hashlib.sha256(original).hexdigest() == ORIGINAL_HASH, "Original input library verified")
    with zipfile.ZipFile(args.patched) as apk:
        library = apk.read(LIBRARY)
        manifest = dict(line.split('=', 1) for line in apk.read(MANIFEST).decode().splitlines() if '=' in line)
        check(manifest['format'] == '1', "Native loader manifest present")
        for name in ('libmain.so', 'libunity.so', 'libil2cpp.so'):
            check(hashlib.sha256(apk.read('lib/armeabi-v7a/' + name)).hexdigest() == manifest[name],
                  f"Final APK {name} matches loader manifest")

        expected = bytearray(original)
        for offset, replacement in {
            0x16F47E8: '4d0000ea', 0x12A22F8: '1eff2fe1',
            0x15B6EB0: '0010a0e3', 0x15B6EDC: '0110a0e3',
            0x15B78AC: '0060a0e3', 0x15B77AC: '1eff2fe1',
        }.items():
            expected[offset:offset+4] = bytes.fromhex(replacement)
        if args.fast_startup:
            for offset, value in {0x128526C: '060000ea', 0x12859DC: 'f30000ea', 0x1286A24: '00f020e3'}.items():
                expected[offset:offset+4] = bytes.fromhex(value)
        check(library == bytes(expected), "Final library contains exactly the selected edits; obsolete edits restored")
        check(library[0x15B7750:0x15B77AC] == original[0x15B7750:0x15B77AC],
              "ClosePressed reward callback is byte-for-byte unchanged")

        classes = {}
        for name in apk.namelist():
            if name.startswith('classes') and name.endswith('.dex'):
                for cls in DEX(apk.read(name)).get_classes():
                    check(cls.get_name() not in classes, "No duplicate Unity/extension class") if (
                        cls.get_name().startswith(('Lcom/unity3d/player/UnityPlayer;',
                                                   'Lapp/patchlab/extension/offlinegames/'))) else None
                    classes[cls.get_name()] = cls
        player = classes['Lcom/unity3d/player/UnityPlayer;']
        method = next(m for m in player.get_methods() if m.get_name() == 'getUnityNativeLibraryPath')
        instructions = list(method.get_instructions())
        check([i.get_name() for i in instructions] == ['invoke-static', 'move-result-object', 'return-object'],
              "Actual output DEX replaces Unity's nativeLibraryDir lookup")
        check('NativeLibraries;->directory' in instructions[0].get_output(), "Resolver calls mounted-APK helper")
        for name in ('NativeLibraries', 'NativeLibraryStore'):
            check('Lapp/patchlab/extension/offlinegames/' + name + ';' in classes, f"{name} extension present")
        load = next(m for m in player.get_methods() if m.get_name() == 'loadNative')
        calls = list(load.get_instructions())
        call = next(i for i, ins in enumerate(calls) if 'NativeLoader;->load(' in ins.get_output())
        if args.fast_startup:
            check([i.get_name() for i in calls[call:call+4]] ==
                  ['invoke-static', 'move-result', 'if-eqz', 'invoke-static'] and
                  'NativeLibraries;->verifyLoaded()' in calls[call+3].get_output(),
                  "Actual mapped-library diagnostic runs only after NativeLoader success")
    execute_ui_blocks(library)
    if args.fast_startup:
        execute_startup_blocks(original, library)
    print('OUTPUT SHA-256', hashlib.sha256(library).hexdigest())
    print('Engine calls were stubbed; Android linker and full UI still require device verification.')


if __name__ == '__main__':
    main()
