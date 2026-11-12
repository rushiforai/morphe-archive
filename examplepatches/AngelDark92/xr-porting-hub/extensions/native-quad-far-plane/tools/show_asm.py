"""python -B -I tools/show_asm.py <base> <hexaddr> <hexsize>  |  <base> sym:<substring>  - disassemble with PLT names."""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from scene_lib import Scene

s = Scene(int(sys.argv[1]))
if sys.argv[2].startswith('sym:'):
    n, v = s.find_one(sys.argv[2][4:])
    start, size = v, (s.sizes[n] if len(sys.argv) < 4 else int(sys.argv[3], 16))
else:
    start, size = int(sys.argv[2], 16), int(sys.argv[3], 16)
for i in s.dis(start, size):
    extra = ''
    if i.mnemonic in ('bl', 'b'):
        t = i.operands[0].imm
        extra = s.plt_stub_name(t) or ''
        if not extra:
            extra = next((n[:50] for n, v in s.syms.items() if v == t), '')
    print('%x: %-7s %s  %s' % (i.address, i.mnemonic, i.op_str, ('; ' + extra) if extra else ''))
