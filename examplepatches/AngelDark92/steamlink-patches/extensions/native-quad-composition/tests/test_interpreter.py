"""Portable instruction-model regressions; no decoded APK or helper required."""
import math
import os
import struct
import sys
import unittest

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'tools'))
from a64emu import Cpu
from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM
import liveness


class InstructionTests(unittest.TestCase):
    def ins(self, word):
        cs = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
        cs.detail = True
        return cs, next(cs.disasm(struct.pack('<I', word), 0x1000))

    def test_fused_nonfinite_values_and_finite_single_rounding(self):
        for opcode in (0x1f020c20, 0x1f028c20, 0x1f220c20, 0x1f228c20):
            _, ins = self.ins(opcode)  # s0 <- fused s1*s2 +/- s3
            self.assertIn(ins.mnemonic, ('fmadd', 'fmsub', 'fnmadd', 'fnmsub'))
            for values in ((math.nan, 1, 2), (math.inf, 0, 1), (1, 2, math.nan)):
                cpu = Cpu()
                for i, value in enumerate(values, 1):
                    cpu.ws('s%d' % i, value)
                cpu.fp_op(ins)
                self.assertTrue(math.isnan(cpu.rs('s0')), (ins.mnemonic, values))
            cpu = Cpu()
            cpu.ws('s1', math.inf)
            cpu.ws('s2', 2)
            cpu.ws('s3', 1)
            cpu.fp_op(ins)
            expected = -math.inf if ins.mnemonic in ('fmsub', 'fnmadd') else math.inf
            self.assertEqual(cpu.rs('s0'), expected)
        _, ins = self.ins(0x1f020c20)
        cpu = Cpu()
        for i, value in enumerate((1 + 2**-23, 1 - 2**-23, -1), 1):
            cpu.ws('s%d' % i, value)
        cpu.fp_op(ins)
        self.assertEqual(cpu.rs('s0'), -(2**-46))

    def test_alias_register_and_flag_dependencies(self):
        cases = ((0xf100029f, {'x20'}, {'nzcv'}),  # cmp x20, #0
                 (0xb4000020, {'x0'}, set()),       # cbz x0, +4
                 (0xd37df34a, {'x26'}, {'x10'}))   # lsl x10, x26, #3
        for opcode, reads, writes in cases:
            cs, ins = self.ins(opcode)
            self.assertEqual(liveness.rw(cs, ins), (reads, writes), ins.op_str)


if __name__ == '__main__':
    unittest.main()
