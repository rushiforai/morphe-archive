"""Execute the actual Coffee version gate against an isolated JNI fixture.

This proves control flow, not real Android toast display or backend compatibility.
"""
import argparse
import json
import struct
from pathlib import Path
from elftools.elf.elffile import ELFFile
from unicorn import Uc, UC_ARCH_ARM64, UC_MODE_ARM, UC_HOOK_CODE
from unicorn.arm64_const import UC_ARM64_REG_X0, UC_ARM64_REG_X1, UC_ARM64_REG_X2, UC_ARM64_REG_X3, UC_ARM64_REG_SP, UC_ARM64_REG_LR, UC_ARM64_REG_PC, UC_ARM64_REG_X19, UC_ARM64_REG_X20, UC_ARM64_REG_X21, UC_ARM64_REG_X22, UC_ARM64_REG_X23

ROOT = Path(__file__).resolve().parents[1]
LAYOUT = json.loads((ROOT/'native/coffeebusiness/update-1260.json').read_text(encoding='utf-8'))


def verify(library, status, signer_blocked, missing_helper=False, missing_vm=False):
    addr = lambda name: int(LAYOUT[name], 0)
    machine = Uc(UC_ARCH_ARM64, UC_MODE_ARM)
    machine.mem_map(0, 0x4000000)
    with library.open('rb') as source:
        for segment in ELFFile(source).iter_segments():
            if segment['p_type'] == 'PT_LOAD':
                machine.mem_write(segment['p_vaddr'], segment.data())
    data, api = 0x6000000, 0x7000000
    machine.mem_map(data, 0x20000)
    machine.mem_map(api, 0x10000)
    write64 = lambda at, value: machine.mem_write(at, struct.pack('<Q', value))
    vm, vm_table, env, env_table = data, data+0x1000, data+0x2000, data+0x3000
    obj, owner, stop = data+0x4000, data+0x5000, api+0xfff0
    write64(vm, vm_table)
    write64(env, env_table)
    write64(addr('java_vm'), 0 if missing_vm else vm)
    write64(obj+0x20, owner)
    machine.mem_write(owner+0xc0, struct.pack('<i', status))
    machine.mem_write(addr('initialized'), b'\1')
    write64(vm_table+6*8, api+0x800)  # GetEnv
    for index in (6, 17, 19, 20, 33, 36, 113, 116, 143, 167):
        write64(env_table+index*8, api+index*4)
    calls, methods = [], {}
    blocked = []

    def string(pointer):
        return bytes(machine.mem_read(pointer, 180)).split(b'\0')[0].decode('utf-8')

    def callback(uc, pc, size, _):
        x0, x1, x2 = [uc.reg_read(r) for r in (UC_ARM64_REG_X0, UC_ARM64_REG_X1, UC_ARM64_REG_X2)]
        if pc in (0x181d020, 0x181d110, 0x181d210):
            blocked.append('original update dialog/wait')
            uc.emu_stop()
            return
        if pc == addr('signer_check'):
            result = int(signer_blocked)
        elif pc == api+0x800:
            write64(x1, env)
            result = 0
        elif api <= pc < api+0x800:
            index = (pc-api)//4
            calls.append(index)
            result = 0
            if index == 6: result = data+0x6000
            elif index in (33, 113):
                name = string(x2)
                result = 0xdead0000 + len(methods)*8
                methods[result] = name
            elif index == 116: result = data+0x6100
            elif index == 36:
                result = 0 if missing_helper and methods[x2] == 'loadClass' else data+0x6200
            elif index == 167:
                assert string(x1) == 'pl.dudek.extension.coffeebusiness.CoffeeUpdateNotice'
                result = data+0x6300
            elif index == 143:
                assert methods[x2] == 'show'
        else:
            return
        uc.reg_write(UC_ARM64_REG_X0, result)
        uc.reg_write(UC_ARM64_REG_PC, uc.reg_read(UC_ARM64_REG_LR))

    machine.hook_add(UC_HOOK_CODE, callback)
    guards = [(reg, 0x12340000+index) for index, reg in enumerate((UC_ARM64_REG_X19, UC_ARM64_REG_X20, UC_ARM64_REG_X21, UC_ARM64_REG_X22, UC_ARM64_REG_X23))]
    for reg, value in guards: machine.reg_write(reg, value)
    stack = data+0x18000
    machine.reg_write(UC_ARM64_REG_SP, stack)
    machine.reg_write(UC_ARM64_REG_LR, stop)
    machine.reg_write(UC_ARM64_REG_X0, obj)
    before = bytes(machine.mem_read(owner, 0x200))
    machine.emu_start(addr('move_next'), stop, count=3000)
    assert not blocked, 'Version gate blocked on an update dialog instead of continuing'
    assert machine.reg_read(UC_ARM64_REG_PC) == stop, 'Version gate did not finish'
    assert machine.reg_read(UC_ARM64_REG_X0) == 0, 'Gate must complete rather than wait for input'
    assert bytes(machine.mem_read(owner, 0x200)) == before, 'Server status or other loading state changed'
    expected = (status in (0, 1) or signer_blocked) and not missing_helper and not missing_vm
    assert calls.count(143) == int(expected), 'Expected one short-notice request only when the original gate warns'
    assert machine.reg_read(UC_ARM64_REG_SP) == stack
    for reg, value in guards: assert machine.reg_read(reg) == value, 'Saved register changed'
    # An already completed iterator must remain completed without another notice.
    machine.reg_write(UC_ARM64_REG_X0, obj)
    machine.reg_write(UC_ARM64_REG_LR, stop)
    machine.emu_start(addr('move_next'), stop, count=3000)
    assert calls.count(143) == int(expected), 'Repeated MoveNext displayed another notice'


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--library', required=True, type=Path)
    args = parser.parse_args()
    for status in (0, 1, 2, -1, -2):
        for blocked in (False, True): verify(args.library, status, blocked)
    verify(args.library, 0, False, missing_helper=True)
    verify(args.library, 0, False, missing_vm=True)
    print('PASS: actual ARM64 gate completes; one notice for update/signer warning; active/failure statuses preserved; helper failure stays non-blocking; repeated iterator stays complete; saved registers preserved')
