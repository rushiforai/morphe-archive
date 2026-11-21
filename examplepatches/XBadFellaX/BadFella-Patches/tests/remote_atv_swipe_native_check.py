"""Run the shipped swipe helpers and existing Dart applyTo bodies with Unicorn 2.1.4.

Usage: python tests/remote_atv_swipe_native_check.py PATH_TO_STOCK_NATIVE_LIB_DIRECTORY
Requires optional unicorn; APK inputs and dependencies remain outside the repository.
This verifies native control flow, not Android gestures or a physical TV.
"""
from pathlib import Path
import sys
import hashlib
from unicorn import *
from unicorn.arm64_const import *
from unicorn.arm_const import *
from unicorn.x86_const import *
root = Path(__file__).resolve().parents[1]
libraries = Path(sys.argv[1])
stock_hashes = {'arm64-v8a': 'fe43c9e6d1ac7e6794697f97cfcaa93fbb3bfcd4b6317d11dee696bc395c11bd', 'armeabi-v7a': '7a27158a9c846f723b8d59d5061d0479b4500f90a672f65a1d5956a1eecaeefa', 'x86_64': '6f1f7b661bc7cc855ea3b7c90c147657767e5342ee161cab4ac67c70c7523dae'}

def patched_code(abi):
    b = bytearray((libraries / abi / 'libapp.so').read_bytes())
    assert hashlib.sha256(b).hexdigest() == stock_hashes[abi], 'Unreviewed native input'
    spec = root / f'patches/src/main/resources/remoteatv/swipes-6.1.0-{abi}.tsv'
    lines = [line.split('\t') for line in spec.read_text().splitlines() if line and (not line.startswith('#'))]
    for position, old, new in lines[1:]:
        off = int(position, 16)
        old, new = (bytes.fromhex(old), bytes.fromhex(new))
        assert b[off:off + len(old)] == old
        b[off:off + len(new)] = new
    return bytes(b)
# Snapshot addresses and class IDs are pinned to the three reviewed 6.1.0 inputs.
cfg = {
    'arm64-v8a': dict(
        arch=UC_ARCH_ARM64, mode=UC_MODE_ARM, cave=0x8038d0, apply=0x803908,
        resume=0x4697e0, ret=0x4ccc70,
        alloc={0x7cc14c: 1571, 0x7cce10: 1565},
        returns=[0x4694a0, 0x46cf8c, 0x46ebf0]),
    'armeabi-v7a': dict(
        arch=UC_ARCH_ARM, mode=UC_MODE_ARM, cave=0x8e75c8, apply=0x8e75fc,
        resume=0x5f3640, ret=0x652b9c,
        alloc={0x8b8c58: 1571, 0x8b9934: 1565},
        returns=[0x5f3278, 0x5f64e8, 0x5f8410]),
    'x86_64': dict(
        arch=UC_ARCH_X86, mode=UC_MODE_64, cave=0x8100f0, apply=0x810127,
        resume=0x575c90, ret=0x5d1cef,
        alloc={0x7e06f8: 1571, 0x7e1424: 1565},
        returns=[0x57594b, 0x5787a1, 0x57a5ee]),
}


def run(abi, c, caller, relocate):
    u = Uc(c['arch'], c['mode'])
    b = patched_code(abi)
    base = relocate
    u.mem_map(base, 9437184)
    u.mem_write(base, b[:9437184])
    heap = 4294967296 if abi != 'armeabi-v7a' else 268435456
    u.mem_map(heap, 1048576)
    stack = 536870912
    u.mem_map(stack, 65536)
    fp = stack + 32768
    thread = heap + 65536
    null = heap + 4097
    true = null + 32
    false = null + 48
    state = heap + 8193
    widget = heap + 12289
    physics = heap + 16385
    ancestor = heap + 20481
    result = heap + 24577

    def write(a, v, n=4):
        u.mem_write(a, int(v & (1 << n * 8) - 1).to_bytes(n, 'little'))

    def reg(r, v):
        u.reg_write(r, v)

    def read(a, n=4):
        return int.from_bytes(u.mem_read(a, n), 'little')
    if abi == 'arm64-v8a':
        reg(UC_ARM64_REG_X29, fp)
        reg(UC_ARM64_REG_X22, null)
        reg(UC_ARM64_REG_X28, heap >> 32)
        reg(UC_ARM64_REG_X26, thread)
        reg(UC_ARM64_REG_X3, widget)
        reg(UC_ARM64_REG_X7, true)
        reg(UC_ARM64_REG_X8, false)
        write(fp + 8, base + caller, 8)
        flag = 35
        reg(UC_ARM64_REG_X15, fp - 256)
    elif abi == 'armeabi-v7a':
        reg(UC_ARM_REG_FP, fp)
        reg(UC_ARM_REG_R10, thread)
        reg(UC_ARM_REG_R3, widget)
        reg(UC_ARM_REG_R9, true)
        reg(UC_ARM_REG_R1, false)
        write(fp + 4, base + caller)
        write(thread + 60, true)
        write(thread + 64, false)
        write(thread + 56, null)
        flag = 31
        reg(UC_ARM_REG_SP, fp - 256)
    else:
        reg(UC_X86_REG_RBP, fp)
        reg(UC_X86_REG_R14, thread)
        reg(UC_X86_REG_RDI, widget)
        reg(UC_X86_REG_R9, true)
        reg(UC_X86_REG_R10, false)
        reg(UC_X86_REG_R8, 4660)
        write(fp + 8, base + caller, 8)
        write(thread + 128, true, 8)
        write(thread + 136, false, 8)
        write(thread + 120, null, 8)
        write(thread + 72, heap, 8)
        flag = 35
        reg(UC_X86_REG_RSP, fp - 256)
    u.emu_start(base + c['cave'], base + c['resume'], count=100)
    expected = caller != c['returns'][0]
    assert read(widget + flag) == (false if expected else true) & 4294967295, (abi, 'constructor flag')
    if abi == 'x86_64':
        assert read(widget + 47) == 4660
    # Execute original Dart methods, intercepting only the allocator stubs.
    write(fp - (4 if abi == 'armeabi-v7a' else 8), state, 4 if abi == 'armeabi-v7a' else 8)
    write(state + (7 if abi == 'armeabi-v7a' else 11), widget)
    write(physics + (3 if abi == 'armeabi-v7a' else 7), null)
    allocations = []
    if abi == 'arm64-v8a':
        reg(UC_ARM64_REG_X1, physics)
        reg(UC_ARM64_REG_X2, ancestor)
        reg(UC_ARM64_REG_X30, base + c['ret'])
        reg(UC_ARM64_REG_X15, fp - 256)
    elif abi == 'armeabi-v7a':
        reg(UC_ARM_REG_R1, physics)
        reg(UC_ARM_REG_R2, ancestor)
        reg(UC_ARM_REG_LR, base + c['ret'])
        reg(UC_ARM_REG_SP, fp - 256)
    else:
        reg(UC_X86_REG_RDI, physics)
        reg(UC_X86_REG_RSI, ancestor)
        sp = fp - 264
        reg(UC_X86_REG_RSP, sp)
        write(sp, base + c['ret'], 8)

    def hook(u, address, size, data):
        if address - base not in c['alloc']:
            return
        cid = c['alloc'][address - base]
        allocations.append(cid)
        write(result - 1, cid << 12)
        write(result + (3 if abi == 'armeabi-v7a' else 7), null)
        if abi == 'arm64-v8a':
            reg(UC_ARM64_REG_X0, result)
            reg(UC_ARM64_REG_PC, u.reg_read(UC_ARM64_REG_X30))
        elif abi == 'armeabi-v7a':
            reg(UC_ARM_REG_R0, result)
            reg(UC_ARM_REG_PC, u.reg_read(UC_ARM_REG_LR))
        else:
            sp = u.reg_read(UC_X86_REG_RSP)
            target = read(sp, 8)
            reg(UC_X86_REG_RAX, result)
            reg(UC_X86_REG_RSP, sp + 8)
            reg(UC_X86_REG_RIP, target)
    u.hook_add(UC_HOOK_CODE, hook)
    u.emu_start(base + c['apply'], base + c['ret'], count=200)
    assert allocations == [1565 if expected else 1571], (abi, allocations, expected)
    assert read(result + (3 if abi == 'armeabi-v7a' else 7)) == ancestor & 4294967295, (abi, 'ancestor lost')
    print('PASS', abi, hex(relocate), 'remote' if expected else 'setup', 'NeverScrollable' if expected else 'original physics')
for abi, c in cfg.items():
    for relocate in [0, 1073741824, 1073745920]:
        for caller in c['returns']:
            run(abi, c, caller, relocate)
