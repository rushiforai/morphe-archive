"""Execute original/verified Dart machine code with explicit, pinned VM boundaries.

This is a bounded CPU harness, not a Dart runtime or Android UI simulator. Code
outside declared function ranges and typed helper callbacks is always rejected.
"""
from dataclasses import dataclass
import hashlib
import struct
from typing import Callable

from tvgids_native_contracts import executable_offset, native_layout


@dataclass(frozen=True)
class FunctionRange:
    name: str
    address: int
    size: int
    sha256: str


@dataclass(frozen=True)
class Boundary:
    function: FunctionRange
    complete: Callable


class DartMachine:
    STACK = 0x70000000
    POOL = 0x30000000
    THREAD = 0x31000000
    EXIT = 0x0f000000

    def __init__(self, abi, image, owned, boundaries=()):
        import unicorn as u
        from unicorn import arm_const as arm, arm64_const as arm64, x86_const as x86
        self.abi, self.layout = abi, native_layout(image, abi)
        self.owned, self.boundaries = tuple(owned), {b.function.address: b for b in boundaries}
        assert len(self.boundaries) == len(boundaries), 'Ambiguous native boundary'
        for function in (*self.owned, *(b.function for b in boundaries)):
            offset = executable_offset(self.layout, function.address, function.size)
            assert hashlib.sha256(image[offset:offset+function.size]).hexdigest() == function.sha256, f'Native function hash changed: {function.name}'
        self.word = 4 if abi == 'armeabi-v7a' else 8
        self.heap = 0x20000000 if self.word == 4 else 0x200000000
        self.null = self.heap+0x101
        self.calls, self.trace, self.objects = [], [], {self.null: 'Null'}
        self.fault, self.finished = None, False
        if abi == 'arm64-v8a':
            self.uc = u.Uc(u.UC_ARCH_ARM64, u.UC_MODE_ARM)
            self.regs = {f'x{i}': getattr(arm64, f'UC_ARM64_REG_X{i}') for i in range(31)}
            self.regs.update(sp=arm64.UC_ARM64_REG_X15, fp=arm64.UC_ARM64_REG_X29,
                             pc=arm64.UC_ARM64_REG_PC, lr=arm64.UC_ARM64_REG_X30, result=arm64.UC_ARM64_REG_X0)
        elif abi == 'armeabi-v7a':
            self.uc = u.Uc(u.UC_ARCH_ARM, u.UC_MODE_ARM)
            self.uc.reg_write(arm.UC_ARM_REG_C1_C0_2, 0xf << 20)
            self.uc.reg_write(arm.UC_ARM_REG_FPEXC, 1 << 30)
            self.regs = {f'r{i}': getattr(arm, f'UC_ARM_REG_R{i}') for i in range(13)}
            self.regs.update(sp=arm.UC_ARM_REG_SP, fp=arm.UC_ARM_REG_R11, pc=arm.UC_ARM_REG_PC,
                             lr=arm.UC_ARM_REG_LR, result=arm.UC_ARM_REG_R0)
        else:
            self.uc = u.Uc(u.UC_ARCH_X86, u.UC_MODE_64)
            self.regs = {n: getattr(x86, 'UC_X86_REG_'+n.upper()) for n in
                         ('rax', 'rbx', 'rcx', 'rdx', 'rdi', 'rsi', 'rbp', 'rsp',
                          'r8', 'r9', 'r10', 'r11', 'r12', 'r13', 'r14', 'r15', 'rip')}
            self.regs.update(sp=x86.UC_X86_REG_RSP, fp=x86.UC_X86_REG_RBP,
                             pc=x86.UC_X86_REG_RIP, result=x86.UC_X86_REG_RAX)
        end = max(s.address+s.memory_size for s in self.layout.segments)
        self.uc.mem_map(0, (end+4095)//4096*4096)
        for segment in self.layout.segments:
            if segment.file_size:
                self.uc.mem_write(segment.address, bytes(image[segment.offset:segment.offset+segment.file_size]))
        for base, size in [(self.STACK, 0x10000), (self.POOL, 0x100000),
                           (self.THREAD, 0x10000), (self.heap, 0x100000), (self.EXIT, 4096)]:
            self.uc.mem_map(base, size)
        self.initial_sp = self.STACK+0x8000
        self.register('sp', self.initial_sp)
        if abi == 'arm64-v8a':
            self.uc.reg_write(arm64.UC_ARM64_REG_SP, self.STACK+0xf000)
            for name, value in [('x22', self.null), ('x26', self.THREAD), ('x27', self.POOL), ('x28', self.heap >> 32)]:
                self.register(name, value)
            self.register('lr', self.EXIT)
        elif abi == 'armeabi-v7a':
            self.register('r5', self.POOL+1)
            self.register('r10', self.THREAD)
            self.register('lr', self.EXIT)
            self.pointer(self.THREAD+0x40, self.null)
        else:
            self.register('r14', self.THREAD)
            self.register('r15', self.POOL+1)
            self.pointer(self.THREAD+0x58, self.heap)
            self.pointer(self.THREAD+0x88, self.null)
            self.pointer(self.initial_sp, self.EXIT)
        self.uc.hook_add(u.UC_HOOK_CODE, self._instruction)

    def register(self, name, value=None):
        register = self.regs[name]
        if value is None:
            return self.uc.reg_read(register)
        self.uc.reg_write(register, value)

    def pointer(self, address, value=None, size=None):
        size = self.word if size is None else size
        if value is None:
            return int.from_bytes(self.uc.mem_read(address, size), 'little')
        self.uc.mem_write(address, (value & ((1 << size*8)-1)).to_bytes(size, 'little'))

    def pool(self, offset, value):
        self.pointer(self.POOL+offset, value)

    def return_call(self, result):
        self.register('result', result)
        if self.abi == 'x86_64':
            sp = self.register('sp')
            target = self.pointer(sp)
            self.register('sp', sp+8)
        else:
            target = self.register('lr')
        self.register('pc', target)

    def _instruction(self, uc, address, size, _):
        try:
            if address == self.EXIT:
                self.finished = True
                uc.emu_stop()
                return
            assert 0 < size <= (15 if self.abi == 'x86_64' else 4), 'Unsupported native CPU instruction'
            self.trace.append(address)
            if address in self.boundaries:
                boundary = self.boundaries[address]
                self.calls.append(boundary.function.name)
                boundary.complete(self)
                assert self.register('pc') != address, f'Native boundary did not complete: {boundary.function.name}'
            else:
                assert any(f.address <= address and address+size <= f.address+f.size for f in self.owned), f'Unmodeled native entry: {address:#x}'
        except Exception as error:
            self.fault = error
            uc.emu_stop()

    def run(self, entry, limit=1000):
        from unicorn import UcError
        try:
            self.uc.emu_start(entry, 0, count=limit)
        except UcError as error:
            raise AssertionError(f'Unsupported native CPU execution: {error}') from error
        if self.fault:
            raise self.fault
        assert self.finished, 'Native instruction budget exhausted without completion'
        expected_sp = self.initial_sp+(8 if self.abi == 'x86_64' else 0)
        assert self.register('sp') == expected_sp, 'Dart frame/stack did not restore'
        return self.register('result')
