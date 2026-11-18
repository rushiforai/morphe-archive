"""Execute Pizza's emitted update-UI hook; Android/game inputs remain private."""
import argparse
import json
from pathlib import Path
import struct

from elftools.elf.elffile import ELFFile
from unicorn import Uc, UC_ARCH_ARM64, UC_MODE_ARM, UC_HOOK_CODE
from unicorn import arm64_const as registers

ROOT = Path(__file__).resolve().parents[1]


def verify(library, layout_path):
    layout = json.loads(layout_path.read_text(encoding='utf-8'))
    address = lambda name: int(layout[name], 0)
    scenarios = 0
    # The hook executes after the original 0/1 handling. Unknown values retain
    # their original path; only the two update-UI outcomes use the continuation.
    for status in (2, 3, 4, 0xffffffff):
        for lookup, helper_throws, has_callback in (
                (True, False, True), (False, False, True),
                (True, True, True), (True, False, False)):
            machine = Uc(UC_ARCH_ARM64, UC_MODE_ARM)
            machine.mem_map(0, 0x4000000)
            with library.open('rb') as stream:
                for segment in ELFFile(stream).iter_segments():
                    if segment['p_type'] == 'PT_LOAD':
                        machine.mem_write(segment['p_vaddr'], segment.data())
            heap, callback, table, env, env_table, sentinel = (
                0x5000000, 0x5001000, 0x5002000,
                0x5003000, 0x5004000, 0x5010000)
            machine.mem_map(heap, 0x20000)
            stack = heap + 0x1f000
            # Original owner members must not be touched by the UI replacement.
            machine.mem_write(heap, b'\xa5' * 0x1000)
            put64 = lambda at, value: machine.mem_write(at, struct.pack('<Q', value))
            put64(heap + 0x10, 0x12340000)
            put64(heap + 0x40, callback if has_callback else 0)
            put64(callback, table)
            put64(table + 0x30, sentinel)
            put64(env, env_table)
            put64(env_table + 0x478, sentinel + 4)  # CallStaticVoidMethodA
            put64(env_table + 0x88, sentinel + 8)  # ExceptionClear
            put64(env_table + 0xb8, sentinel + 12)  # DeleteLocalRef
            expected_state = bytes(machine.mem_read(heap, 0x1000))
            callee_saved = {}
            for number in range(19, 30):
                value = heap if number == 22 else 0x11000000 + number
                register = getattr(registers, f'UC_ARM64_REG_X{number}')
                machine.reg_write(register, value)
                callee_saved[register] = value
            machine.reg_write(registers.UC_ARM64_REG_X8, status)
            machine.reg_write(registers.UC_ARM64_REG_SP, stack)
            machine.reg_write(registers.UC_ARM64_REG_LR, sentinel + 0x80)
            events = []
            pending_exception = [False]

            def return_from_stub():
                machine.reg_write(registers.UC_ARM64_REG_PC,
                                  machine.reg_read(registers.UC_ARM64_REG_LR))

            def trace(uc, pc, size, _):
                if pc == address('jni_method_info'):
                    info = uc.reg_read(registers.UC_ARM64_REG_X0)
                    def cstring(register):
                        at = uc.reg_read(register)
                        return bytes(uc.mem_read(at, 100)).split(b'\0')[0]
                    assert cstring(registers.UC_ARM64_REG_X1) == b'pl/dudek/extension/pizzabusiness/PizzaUpdateNotice'
                    assert cstring(registers.UC_ARM64_REG_X2) == b'show'
                    assert cstring(registers.UC_ARM64_REG_X3) == b'()V'
                    events.append('lookup')
                    if lookup:
                        put64(info, env)
                        put64(info + 8, 0x12345000)
                        put64(info + 16, 0x12346000)
                    uc.reg_write(registers.UC_ARM64_REG_X0, int(lookup))
                    return_from_stub()
                elif pc == sentinel:
                    assert uc.reg_read(registers.UC_ARM64_REG_X0) == callback
                    assert not pending_exception[0], 'Pending Java exception leaked into game continuation'
                    events.append('continue')
                    return_from_stub()
                elif pc == sentinel + 4:
                    assert uc.reg_read(registers.UC_ARM64_REG_X0) == env
                    assert uc.reg_read(registers.UC_ARM64_REG_X1) == 0x12345000
                    assert uc.reg_read(registers.UC_ARM64_REG_X2) == 0x12346000
                    assert uc.reg_read(registers.UC_ARM64_REG_X3) == 0
                    events.append('show')
                    pending_exception[0] = helper_throws
                    return_from_stub()
                elif pc == sentinel + 8:
                    pending_exception[0] = False
                    events.append('clear')
                    return_from_stub()
                elif pc == sentinel + 12:
                    assert uc.reg_read(registers.UC_ARM64_REG_X1) == 0x12345000
                    events.append('delete')
                    return_from_stub()
                elif pc in (address('original_resume'), address('cleanup'), address('missing_callback')):
                    events.append({address('original_resume'): 'original',
                                   address('cleanup'): 'cleanup',
                                   address('missing_callback'): 'missing_callback'}[pc])
                    uc.emu_stop()

            machine.hook_add(UC_HOOK_CODE, trace)
            for _ in range(2):
                events.clear()
                machine.reg_write(registers.UC_ARM64_REG_X8, status)
                machine.emu_start(address('hook'), 0, count=400)
                if status in (2, 3):
                    assert 'original' not in events, 'Blocking update UI was retained'
                    expected = ['lookup']
                    if lookup:
                        expected += ['show', 'clear', 'delete']
                    expected += ['continue', 'cleanup'] if has_callback else ['missing_callback']
                    assert events == expected, (status, events, expected)
                    assert machine.reg_read(registers.UC_ARM64_REG_SP) == stack
                    for register, value in callee_saved.items():
                        assert machine.reg_read(register) == value, 'Live callee-saved state changed'
                else:
                    assert events == ['original'], (status, events)
                    assert machine.reg_read(registers.UC_ARM64_REG_X20) == 0x12340000
                assert bytes(machine.mem_read(heap, 0x1000)) == expected_state, 'Original game/account state changed'
            scenarios += 1
    print(f'PASS: {scenarios} ARM64 update UI/failure scenarios, each repeated; real continuation, JNI cleanup and original state preserved')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--library', type=Path, required=True)
    parser.add_argument('--layout', type=Path,
                        default=ROOT / 'native/pizzabusiness/update-5592.json')
    args = parser.parse_args()
    verify(args.library, args.layout)
