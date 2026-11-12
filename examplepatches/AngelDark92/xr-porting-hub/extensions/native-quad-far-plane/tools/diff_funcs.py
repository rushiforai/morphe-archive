"""python -B -I tools/diff_funcs.py <refbase> <tgtbase> <func-key> - align two normalised streams with difflib."""
import difflib
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from scene_lib import Scene
import nq_sites

ref, tgt = Scene(int(sys.argv[1])), Scene(int(sys.argv[2]))
key = sys.argv[3]
rs, rz = nq_sites.func_range(ref, key)
ts, tz = nq_sites.func_range(tgt, key)
a = nq_sites.norm_stream(ref, rs, rz)
b = nq_sites.norm_stream(tgt, ts, tz)
sm = difflib.SequenceMatcher(None, a, b, autojunk=False)
ra = ref.dis(rs, rz)
tb = tgt.dis(ts, tz)
for tag, i1, i2, j1, j2 in sm.get_opcodes():
    if tag == 'equal':
        continue
    print(tag, 'ref[%d:%d] @%#x..%#x' % (i1, i2, ra[i1].address if i1 < len(ra) else 0, ra[i2 - 1].address if i2 > i1 else 0),
          'tgt[%d:%d] @%#x..%#x' % (j1, j2, tb[j1].address if j1 < len(tb) else 0, tb[j2 - 1].address if j2 > j1 else 0))
    for x in a[i1:i2]:
        print('   - ', x)
    for x in b[j1:j2]:
        print('   + ', x)
