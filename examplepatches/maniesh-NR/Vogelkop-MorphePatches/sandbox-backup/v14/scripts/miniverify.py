#!/usr/bin/env python3
"""miniverify.py — a conservative Dalvik register-type checker for patched
smali classes (the gate that would have caught the v11/v12/v13 bo3
VerifyError before shipping).

Parses baksmali output (disassemble WITH --code-offsets so offsets are
available), builds the CFG of every method and runs a worklist dataflow
analysis over a register-type lattice:

    I / F / J / D        exact primitive categories
    IC  (int-or-float)   from 32-bit const instructions
    JC  (long-or-double) from const-wide / wide loads
    ZERO                 const 0 (int, float or null)
    NULL                 null
    REF <type>           reference with static type
    UNINIT <type>        new-instance, not yet initialized
    UNK                  unknown / any (lenient)
    CONF                 conflict -> report like ART does

Errors are reported ART-style:
    <file>::<method>: [0xOFFSET] register vN has type X but expected Y

Modeling is deliberately conservative where ART is lenient: exception
handler entries start with UNK everywhere; unreachable blocks are skipped;
unresolvable class hierarchies warn instead of failing. It is NOT a full
ART verifier; it exists to catch the patch-induced register-type flow
breakage class (deleted/misplaced definitions, clobbered live registers,
wrong-category invoke arguments).

Usage:
  python3 miniverify.py --tree <smali-tree-root> file.smali [file2.smali ...]
Exit code 0 = clean, 1 = conflicts found.
"""
import os
import re
import sys

# ---------------------------------------------------------------- lattice --
CONF = ('CONF',)
UNK = ('UNK',)

FRAMEWORK_SUPER = {
    'Ljava/lang/Object;': None,
    'Landroid/view/View;': 'Ljava/lang/Object;',
    'Landroid/view/ViewGroup;': 'Landroid/view/View;',
    'Landroid/view/ViewManager;': 'Ljava/lang/Object;',
    'Landroid/view/WindowManager;': 'Landroid/view/ViewManager;',
    'Landroid/view/SurfaceView;': 'Landroid/view/View;',
    'Landroid/view/TextureView;': 'Landroid/view/View;',
    'Landroid/view/ViewStub;': 'Landroid/view/View;',
    'Landroid/widget/LinearLayout;': 'Landroid/view/ViewGroup;',
    'Landroid/widget/FrameLayout;': 'Landroid/view/ViewGroup;',
    'Landroid/widget/RelativeLayout;': 'Landroid/view/ViewGroup;',
    'Landroid/widget/TextView;': 'Landroid/view/View;',
    'Landroid/widget/ImageView;': 'Landroid/view/View;',
    'Landroid/widget/ImageButton;': 'Landroid/widget/ImageView;',
    'Landroid/widget/ProgressBar;': 'Landroid/view/View;',
    'Landroid/widget/AbsSeekBar;': 'Landroid/widget/ProgressBar;',
    'Landroid/widget/SeekBar;': 'Landroid/widget/AbsSeekBar;',
    'Landroid/widget/CompoundButton;': 'Landroid/widget/TextView;',
    'Landroid/widget/CheckBox;': 'Landroid/widget/CompoundButton;',
    'Landroid/widget/RadioButton;': 'Landroid/widget/CompoundButton;',
    'Landroid/widget/Switch;': 'Landroid/widget/CompoundButton;',
    'Landroid/widget/Button;': 'Landroid/widget/TextView;',
    'Landroid/widget/EditText;': 'Landroid/widget/TextView;',
    'Landroid/widget/ScrollView;': 'Landroid/widget/FrameLayout;',
    'Landroid/widget/Toolbar;': 'Landroid/view/ViewGroup;',
    'Landroid/widget/RecyclerView;': 'Landroid/view/ViewGroup;',
    'Landroid/app/Activity;': 'Landroid/content/Context;',
    'Landroid/app/Application;': 'Landroid/content/Context;',
    'Landroid/content/Context;': 'Ljava/lang/Object;',
    'Landroid/content/ContextWrapper;': 'Landroid/content/Context;',
    'Landroid/os/Bundle;': 'Ljava/lang/Object;',
    'Ljava/lang/String;': 'Ljava/lang/Object;',
    'Ljava/lang/Enum;': 'Ljava/lang/Object;',
    'Ljava/lang/Number;': 'Ljava/lang/Object;',
    'Ljava/lang/Integer;': 'Ljava/lang/Number;',
    'Ljava/lang/Float;': 'Ljava/lang/Number;',
    'Ljava/lang/Long;': 'Ljava/lang/Number;',
    'Ljava/lang/Double;': 'Ljava/lang/Number;',
    'Ljava/lang/Boolean;': 'Ljava/lang/Number;',
    'Ljava/lang/Throwable;': 'Ljava/lang/Object;',
    'Ljava/lang/Exception;': 'Ljava/lang/Throwable;',
    'Ljava/lang/RuntimeException;': 'Ljava/lang/Exception;',
    'Ljava/lang/Error;': 'Ljava/lang/Throwable;',
    'Lkotlin/Unit;': 'Ljava/lang/Object;',
    'Ljava/util/Calendar;': 'Ljava/lang/Object;',
    'Ljava/util/GregorianCalendar;': 'Ljava/util/Calendar;',
}


def cat_of_desc(d):
    if d.startswith('L') or d.startswith('['):
        return ('REF', d)
    return {'I': ('I',), 'Z': ('I',), 'B': ('I',), 'C': ('I',), 'S': ('I',),
            'F': ('F',), 'J': ('J',), 'D': ('D',)}[d[0]]


def t_str(t):
    try:
        k = t[0]
        return {'I': 'Integer', 'F': 'Float', 'J': 'Long', 'D': 'Double',
                'IC': 'Integer/Float-const', 'JC': 'Long/Double-const',
                'ZERO': 'Zero', 'NULL': 'Null',
                'REF': 'Reference: ' + t[1], 'UNINIT': 'Uninitialized: ' + t[1],
                'UNK': 'unknown', 'CONF': 'CONFLICT'}[k]
    except Exception:
        return repr(t)


def cat_ok(t, want):
    if t[0] in ('UNK', 'CONF'):
        return True  # CONF is reported at the consumer; UNK is lenient
    k = t[0]
    if want in ('I', 'F') and k in ('I', 'F', 'IC', 'ZERO'):
        return True
    if want in ('J', 'D') and k in ('J', 'D', 'JC'):
        return True
    if want == 'REF' and k in ('REF', 'NULL', 'ZERO', 'UNINIT'):
        return True
    return False


def merge(a, b):
    if a is None:
        return b
    if b is None:
        return a
    if a[0] == 'UNK':
        return b
    if b[0] == 'UNK':
        return a
    if a == b:
        return a
    ka, kb = a[0], b[0]
    if ka == 'ZERO' and kb in ('I', 'F', 'IC'):
        return ('IC',)
    if kb == 'ZERO' and ka in ('I', 'F', 'IC'):
        return ('IC',)
    if ka == 'ZERO' and kb in ('REF', 'NULL'):
        return b
    if kb == 'ZERO' and ka in ('REF', 'NULL'):
        return a
    if ka == 'IC' and kb in ('I', 'F'):
        return (kb,)
    if kb == 'IC' and ka in ('I', 'F'):
        return (ka,)
    if ka == 'JC' and kb in ('J', 'D'):
        return (kb,)
    if kb == 'JC' and ka in ('J', 'D'):
        return (ka,)
    if ka == 'NULL' and kb == 'REF':
        return b
    if kb == 'NULL' and ka == 'REF':
        return a
    if ka == 'REF' and kb == 'REF':
        return a if a[1] == b[1] else ('REF', 'Ljava/lang/Object;')
    if 'UNINIT' in (ka, kb):
        return UNK
    return CONF


class Hierarchy:
    def __init__(self, tree_roots):
        self.roots = tree_roots if isinstance(tree_roots, (list, tuple)) else [tree_roots]
        self.cache = {}
        self.iface_cache = {}
        self.missing = set()

    def _smali_paths(self, cls):
        rel = cls[1:-1] + '.smali'
        return [os.path.join(r, rel) for r in self.roots if r]

    def super_of(self, cls):
        if cls in FRAMEWORK_SUPER:
            return FRAMEWORK_SUPER[cls]
        if cls in self.cache:
            return self.cache[cls]
        if cls in self.missing:
            return None
        sup = None
        for path in self._smali_paths(cls):
            if os.path.isfile(path):
                try:
                    with open(path, encoding='utf-8') as f:
                        for line in f:
                            m = re.match(r'^\.super\s+(\S+)', line)
                            if m:
                                sup = m.group(1)
                                break
                except OSError:
                    pass
                break
        if sup is None:
            self.missing.add(cls)
            return None
        self.cache[cls] = sup
        return sup

    def is_interface(self, cls):
        if cls in self.iface_cache:
            return self.iface_cache[cls]
        ans = False
        for path in self._smali_paths(cls):
            if os.path.isfile(path):
                try:
                    with open(path, encoding='utf-8') as f:
                        head = f.read(4096)
                    ans = re.search(r'^\.class[^\n]*\binterface\b', head, re.M) is not None
                except OSError:
                    ans = False
                break
        self.iface_cache[cls] = ans
        return ans

    def implements_chain(self, t):
        """All interfaces implemented by t (transitively, incl. interfaces
        extending interfaces via their own .implements)."""
        out = set()
        frontier = [t]
        seen_cls = set()
        while frontier:
            cur = frontier.pop()
            c, seen = cur, set()
            while c and c not in seen:
                seen.add(c)
                for path in self._smali_paths(c):
                    if os.path.isfile(path):
                        try:
                            with open(path, encoding='utf-8') as f:
                                for line in f:
                                    m = re.match(r'^\.implements\s+(\S+)', line)
                                    if m:
                                        itf = m.group(1)
                                        if itf not in out:
                                            out.add(itf)
                                            frontier.append(itf)  # walk its supers too
                        except OSError:
                            pass
                        break
                c = self.super_of(c)
                if c in seen_cls:
                    break
                seen_cls.add(c)
        return out

    def in_app_trees(self, cls):
        return any(os.path.isfile(p) for p in self._smali_paths(cls))

    def chain_complete(self, cls):
        """True if the whole super chain resolves (trees + framework table)."""
        cur, seen = cls, set()
        while cur and cur not in seen:
            seen.add(cur)
            if cur in FRAMEWORK_SUPER:
                return True
            nxt = self.super_of(cur)
            if nxt is None:
                return False
            cur = nxt
        return True

    def is_subtype(self, t, target):
        if t == target:
            return True
        seen = set()
        cur = t
        while cur and cur not in seen:
            seen.add(cur)
            if cur == target:
                return True
            cur = self.super_of(cur)
        return False

    def resolvable(self, cls):
        if cls in self.missing and cls not in FRAMEWORK_SUPER:
            return False
        cur = cls
        seen = set()
        while cur and cur not in seen:
            if cur in FRAMEWORK_SUPER:
                return True
            seen.add(cur)
            cur = self.super_of(cur)
        return cur is None


# ------------------------------------------------------------- parsing ------
LABEL_RE = re.compile(r'^\s*:(\w+)\s*$')
OFFSET_RE = re.compile(r'^\s*#@([0-9a-fA-F]+)\s*$')
METHOD_RE = re.compile(r'^\.method\s+(.*?)\s+([\w$<>]+)\((.*?)\)(\S+)\s*$')
CATCH_RE = re.compile(r'^\.catch\s+(\S+)\s+\{:([\w]+)\s+\.\.\s+:([\w]+)\}\s+:([\w]+)')
REG_RE = re.compile(r'^[vp](\d+)$')
MREF_RE = re.compile(r'^(\S+->[\w$<>]+)\((.*?)\)(\S+)$')

BRANCHES = {'if-eq', 'if-ne', 'if-lt', 'if-ge', 'if-gt', 'if-le',
            'if-eqz', 'if-nez', 'if-ltz', 'if-gez', 'if-gtz', 'if-lez'}


def parse_descriptor(desc):
    params, i, slots = [], 0, 0
    while i < len(desc):
        c = desc[i]
        if c == 'L':
            j = desc.index(';', i)
            params.append(desc[i:j + 1])
            i = j + 1
            slots += 1
        elif c == '[':
            j = i
            while desc[j] == '[':
                j += 1
            if desc[j] == 'L':
                j = desc.index(';', j)
            params.append(desc[i:j + 1])
            i = j + 1
            slots += 1
        else:
            params.append(c)
            i += 1
            slots += 2 if c in 'JD' else 1
    return params, slots


def reg_num(tok):
    m = REG_RE.match(tok)
    return int(m.group(1)) if m else None


def invoke_regs(arg0):
    """Expand an invoke register operand '{v1, v2}' / '{v1 .. v7}' -> [regs]."""
    inner = arg0.strip('{}').strip()
    if not inner:
        return []
    if '..' in inner:
        lo, hi = [x.strip() for x in inner.split('..')]
        l, h = reg_num(lo), reg_num(hi)
        if l is None or h is None:
            return []
        return list(range(l, h + 1))
    return [reg_num(x) for x in inner.split(',')]


class Insn:
    __slots__ = ('op', 'args', 'offset', 'text')

    def __init__(self, op, args, offset, text=''):
        self.op = op
        self.args = args
        self.offset = offset
        self.text = text


def split_insns(body_lines):
    insns, labels, pending, offset = [], [], [], None
    for raw in body_lines:
        line = raw.rstrip('\n')
        mo = OFFSET_RE.match(line)
        if mo:
            offset = int(mo.group(1), 16)
            continue
        ml = LABEL_RE.match(line)
        if ml:
            pending.append(ml.group(1))
            continue
        s = line.strip()
        if not s or s.startswith('#'):
            continue
        if s.startswith('.'):
            continue  # directives (incl. switch/array payloads) handled elsewhere
        parts = s.split(None, 1)
        op = parts[0]
        args = []
        if len(parts) > 1:
            rest = parts[1]
            cur, depth = '', 0
            for ch in rest:
                if ch == '{':
                    depth += 1
                elif ch == '}':
                    depth -= 1
                if ch == ',' and depth == 0:
                    if cur.strip():
                        args.append(cur.strip())
                    cur = ''
                else:
                    cur += ch
            if cur.strip():
                args.append(cur.strip())
        insns.append(Insn(op, args, offset, s))
        for lbl in pending:
            labels.append((lbl, len(insns) - 1))
        pending = []
        offset = None
    for lbl in pending:
        labels.append((lbl, len(insns)))
    return labels, insns


def collect_switch_payloads(body_lines):
    payloads, cur = [], None
    for raw in body_lines:
        s = raw.strip()
        mm = re.match(r'^\.(packed|sparse)-switch\s+(0x[0-9a-fA-F]+|-?\d+)$', s)
        if mm:
            cur = []
            payloads.append(cur)
            continue
        if cur is not None:
            if s.startswith('.end'):
                cur = None
            else:
                mt = re.match(r'^:(\w+)$', s)
                if mt:
                    cur.append(mt.group(1))
    return payloads


def collect_handlers(body_lines):
    h = set()
    for raw in body_lines:
        mc = CATCH_RE.match(raw.strip())
        if mc:
            h.add(mc.group(4))
    return h


# ------------------------------------------------------------- the checker --
def check_method(path, cls_desc, name, proto, static, regs, body_lines,
                 hier, errors):
    sig = f"({proto})"

    def E(insn, msg):
        off = '0x%X' % insn.offset if insn.offset is not None else '??'
        errors.append(f"{os.path.basename(path)}::{name}{sig}: [{off}] {msg} | {insn.text}")

    labels, insns = split_insns(body_lines)
    if not insns:
        return
    label_idx = {}
    for lbl, idx in labels:
        label_idx.setdefault(lbl, idx)

    payloads = collect_switch_payloads(body_lines)
    handlers = collect_handlers(body_lines)

    # pN -> vN  (baksmali's pN is SLOT-indexed: a wide param occupies two p-slots)
    params, slots = parse_descriptor(proto)
    if not static:
        slots += 1
    base = regs - slots
    param_reg = {i: base + i for i in range(slots)}
    # pre-convert pN in args (including tokens inside {..} register lists)
    def _conv(tok):
        if REG_RE.match(tok) and tok[0] == 'p' and int(tok[1:]) in param_reg:
            return f"v{param_reg[int(tok[1:])]}"
        return tok

    def _conv_list(x):
        s = x.strip()
        if not (s.startswith('{') and s.endswith('}')):
            return _conv(x)
        inner = s[1:-1].strip()
        if not inner:
            return x
        if '..' in inner:
            lo, hi = [t.strip() for t in inner.split('..')]
            return '{' + _conv(lo) + ' .. ' + _conv(hi) + '}'
        return '{' + ', '.join(_conv(t.strip()) for t in inner.split(',')) + '}'

    for insn in insns:
        insn.args = [_conv_list(x) for x in insn.args]

    # CFG
    n = len(insns)
    succs = [[] for _ in range(n)]
    switch_insns = []
    for i, insn in enumerate(insns):
        op = insn.op
        nxt = i + 1
        if op.startswith('goto'):
            lbl = insn.args[0].lstrip(':')
            if lbl in label_idx:
                succs[i].append(label_idx[lbl])
            continue
        if op.startswith('return') or op == 'throw':
            continue
        if op in BRANCHES:
            lbl = insn.args[-1].lstrip(':')
            if lbl in label_idx:
                succs[i].append(label_idx[lbl])
            if nxt < n:
                succs[i].append(nxt)
            continue
        if op in ('packed-switch', 'sparse-switch'):
            switch_insns.append(i)
            if nxt < n:
                succs[i].append(nxt)  # default fall-through
            continue
        if nxt < n:
            succs[i].append(nxt)
    for k, i in enumerate(switch_insns):
        tgts = payloads[k] if k < len(payloads) else []
        for lbl in tgts:
            if lbl in label_idx:
                succs[i].append(label_idx[lbl])

    reach = set()
    stack = [0]
    while stack:
        x = stack.pop()
        if x in reach:
            continue
        reach.add(x)
        stack.extend(succs[x])

    # entry state (type every slot; wide params type both halves)
    st0 = {}
    o = 0
    if not static:
        st0[base] = ('REF', cls_desc)
        o = 1
    for p in params:
        t = cat_of_desc(p)
        st0[base + o] = t
        if p in ('J', 'D'):
            st0[base + o + 1] = ('JC',)  # high half (often reused as scratch)
        o += 2 if p in ('J', 'D') else 1
    for r in range(regs):
        st0.setdefault(r, UNK)

    states = [None] * n
    work = []
    if 0 in reach:
        states[0] = st0
        work.append(0)
    for lbl, idx in labels:
        if lbl in handlers and 0 < idx < n and idx in reach and states[idx] is None:
            states[idx] = {r: UNK for r in range(regs)}
            work.append(idx)

    # ---- transfer ----
    def t_of(st, r):
        return st.get(r, UNK)

    def consume(st, insn, r, want, what):
        if r is None:
            return False
        t = t_of(st, r)
        if t[0] == 'CONF':
            E(insn, f"register v{r} has type CONFLICT (merged incompatible types) "
                    f"but expected {want} ({what})")
            return False
        if not cat_ok(t, want):
            E(insn, f"register v{r} has type {t_str(t)} but expected {want} ({what})")
            return False
        return True

    pending = [None]

    def R(k, insn):
        return reg_num(insn.args[k]) if k < len(insn.args) else None

    def field_desc(insn):
        m2 = re.search(r':(\S+)$', insn.args[-1])
        return m2.group(1) if m2 else 'Ljava/lang/Object;'

    def transfer(st, insn):
        op, a = insn.op, insn.args

        # ---- consts ----
        if op in ('const', 'const/4', 'const/16', 'const/high16'):
            r = R(0, insn)
            try:
                v = int(a[1].split('#')[0].strip(), 0)
            except ValueError:
                v = 1
            st[r] = ('ZERO',) if v == 0 else ('IC',)
            return
        if op.startswith('const-wide'):
            r = R(0, insn)
            st[r] = ('JC',)
            st[r + 1] = ('JC',)  # high half of the pair
            return
        if op.startswith('const-string'):
            st[R(0, insn)] = ('REF', 'Ljava/lang/String;')
            return
        if op == 'const-class':
            st[R(0, insn)] = ('REF', 'Ljava/lang/Class;')
            return
        if op == 'const/jumbo' or op.startswith('const-method'):
            st[R(0, insn)] = UNK
            return

        # ---- moves ----
        if op in ('move', 'move/from16', 'move/16'):
            src, dst = R(1, insn), R(0, insn)
            consume(st, insn, src, 'I', 'move (non-object)')
            st[dst] = t_of(st, src)
            return
        if op.startswith('move-object'):
            src, dst = R(1, insn), R(0, insn)
            consume(st, insn, src, 'REF', 'move-object')
            st[dst] = t_of(st, src)
            return
        if op.startswith('move-wide'):
            src, dst = R(1, insn), R(0, insn)
            t = t_of(st, src)
            if t[0] in ('I', 'F', 'IC', 'REF', 'NULL', 'UNINIT'):
                E(insn, f"register v{src} has type {t_str(t)} but expected Long/Double (move-wide)")
            st[dst] = t
            st[dst + 1] = t  # high half of the pair
            return
        if op == 'move-result':
            p = pending[0]
            if p and p[0] not in ('I', 'F', 'IC', 'UNK', None):
                E(insn, f"move-result expects int/float but previous call returned {t_str(p)}")
            st[R(0, insn)] = p if (p and p[0] in ('I', 'F', 'IC')) else ('I',)
            pending[0] = None
            return
        if op == 'move-result-wide':
            p = pending[0]
            if p and p[0] not in ('J', 'D', 'JC', 'UNK', None):
                E(insn, f"move-result-wide expects long/double but previous call returned {t_str(p)}")
            r = R(0, insn)
            st[r] = ('JC',)
            st[r + 1] = ('JC',)  # high half of the pair
            pending[0] = None
            return
        if op == 'move-result-object':
            p = pending[0]
            if p and p[0] not in ('REF', 'UNK', None):
                E(insn, f"move-result-object expects a reference but previous call returned {t_str(p)}")
            st[R(0, insn)] = p if (p and p[0] == 'REF') else ('REF', 'Ljava/lang/Object;')
            pending[0] = None
            return
        if op == 'move-exception':
            st[R(0, insn)] = ('REF', 'Ljava/lang/Throwable;')
            return

        # ---- object ops ----
        if op == 'new-instance':
            st[R(0, insn)] = ('UNINIT', a[1])
            return
        if op == 'check-cast':
            r = R(0, insn)
            consume(st, insn, r, 'REF', 'check-cast')
            st[r] = ('REF', a[1])
            return
        if op == 'instance-of':
            consume(st, insn, R(1, insn), 'REF', 'instance-of')
            st[R(0, insn)] = ('I',)
            return
        if op == 'array-length':
            consume(st, insn, R(1, insn), 'REF', 'array-length')
            st[R(0, insn)] = ('I',)
            return
        if op == 'new-array':
            consume(st, insn, R(1, insn), 'I', 'new-array size')
            st[R(0, insn)] = ('REF', a[2])
            return
        if op == 'fill-array-data':
            consume(st, insn, R(0, insn), 'REF', 'fill-array-data')
            return
        if op.startswith('filled-new-array'):
            comp = a[-1]
            want = cat_of_desc(comp if comp.startswith('[') else '[' + comp)[0]
            for rr in invoke_regs(a[0]):
                consume(st, insn, rr, want, 'filled-new-array component')
            pending[0] = ('REF', comp if comp.startswith('[') else '[' + comp)
            return

        # ---- array access ----
        if op.startswith('aget'):
            arr, idx = R(1, insn), R(2, insn)
            consume(st, insn, arr, 'REF', 'aget array')
            consume(st, insn, idx, 'I', 'aget index')
            if op == 'aget-object':
                at = t_of(st, arr)
                st[R(0, insn)] = ('REF', at[1][1:]) if at[0] == 'REF' and at[1].startswith('[') \
                    else ('REF', 'Ljava/lang/Object;')
            elif op == 'aget-wide':
                r = R(0, insn)
                st[r] = ('JC',)
                st[r + 1] = ('JC',)  # high half of the pair
            else:
                st[R(0, insn)] = ('I',)
            return
        if op.startswith('aput'):
            arr, idx, val = R(1, insn), R(2, insn), R(0, insn)
            consume(st, insn, arr, 'REF', 'aput array')
            consume(st, insn, idx, 'I', 'aput index')
            want = 'REF' if op == 'aput-object' else ('J' if op == 'aput-wide' else 'I')
            consume(st, insn, val, want, 'aput value')
            return

        # ---- field access ----
        if op.startswith('iget') or op.startswith('sget'):
            fdesc = field_desc(insn)
            if op.endswith('-wide'):
                t = ('JC',)
            elif op.endswith('-object'):
                t = ('REF', fdesc)
            else:
                t = cat_of_desc(fdesc)
                if t[0] == 'REF':
                    t = ('REF', fdesc)
            if op[0] == 'i':
                consume(st, insn, R(1, insn), 'REF', 'iget object')
            r = R(0, insn)
            st[r] = t
            if op.endswith('-wide'):
                st[r + 1] = t  # high half of the pair
            return
        if op.startswith('iput') or op.startswith('sput'):
            fdesc = field_desc(insn)
            want = cat_of_desc(fdesc)[0] if not op.endswith('-wide') else 'J'
            consume(st, insn, R(0, insn), want, f'{op} value ({fdesc})')
            if op[0] == 'i':
                consume(st, insn, R(1, insn), 'REF', 'iput object')
            return

        # ---- invokes ----
        if op.startswith('invoke-'):
            mi = MREF_RE.match(a[-1])
            if not mi:
                pending[0] = UNK
                return
            mref, pdesc, rdesc = mi.groups()
            cls = mref.split('->')[0]
            mname = mref.split('->')[1]
            plist, _sl = parse_descriptor(pdesc)
            regs = invoke_regs(a[0])
            pi = 0 if op.startswith('invoke-static') else 1  # regs[0] is the receiver
            for p in plist:
                if pi >= len(regs):
                    break
                want = cat_of_desc(p)[0]
                consume(st, insn, regs[pi], want, f'invoke arg {pi + 1} of {mref}')
                pi += 2 if p in ('J', 'D') else 1
            if not op.startswith('invoke-static') and regs:
                recv_t = t_of(st, regs[0])
                if recv_t[0] == 'UNINIT':
                    if mname.startswith('<init>'):
                        # constructor call initializes the receiver; it keeps
                        # its own (new-instance or `this`) type
                        st[regs[0]] = ('REF', recv_t[1])
                    else:
                        E(insn, f"receiver v{regs[0]} is uninitialized when calling {mref}")
                elif recv_t[0] == 'REF':
                    if recv_t[1] == cls:
                        pass  # exact type (incl. a receiver typed as the interface itself)
                    elif hier.is_interface(cls):
                        # interface method: only check receivers we can fully resolve
                        # (app classes with .implements info in our trees)
                        if hier.in_app_trees(recv_t[1]):
                            if cls not in hier.implements_chain(recv_t[1]):
                                E(insn, f"receiver v{regs[0]} has type {recv_t[1]} which does not "
                                        f"appear to implement {cls} (calling {mref})")
                    else:
                        strict = ((cls.startswith('Landroid/view/') or cls.startswith('Landroid/widget/'))
                                  and hier.chain_complete(recv_t[1])) \
                                 or (hier.chain_complete(cls) and hier.chain_complete(recv_t[1])
                                     and not cls.startswith(('Ljava/', 'Landroid/', 'Lkotlin/')))
                        if strict and not hier.is_subtype(recv_t[1], cls):
                            E(insn, f"receiver v{regs[0]} has type {recv_t[1]} which is not a "
                                    f"subtype of {cls} (calling {mref})")
            pending[0] = None if rdesc == 'V' else cat_of_desc(rdesc)
            return

        # ---- returns ----
        if op == 'return':
            consume(st, insn, R(0, insn), 'I', 'return')
            return
        if op == 'return-wide':
            consume(st, insn, R(0, insn), 'J', 'return-wide')
            return
        if op == 'return-object':
            consume(st, insn, R(0, insn), 'REF', 'return-object')
            return
        if op == 'return-void':
            return
        if op == 'throw':
            consume(st, insn, R(0, insn), 'REF', 'throw')
            return
        if op.startswith('monitor'):
            consume(st, insn, R(0, insn), 'REF', op)
            return

        # ---- branches ----
        if op in ('packed-switch', 'sparse-switch'):
            consume(st, insn, R(0, insn), 'I', op)
            return
        if op in ('if-eq', 'if-ne'):
            r1, r2 = R(0, insn), R(1, insn)
            t1, t2 = t_of(st, r1), t_of(st, r2)
            ok_ref = cat_ok(t1, 'REF') and cat_ok(t2, 'REF')
            ok_num = (cat_ok(t1, 'I') or cat_ok(t1, 'F')) and (cat_ok(t2, 'I') or cat_ok(t2, 'F'))
            if not (ok_ref or ok_num):
                E(insn, f"if-eq/ne compares v{r1} ({t_str(t1)}) with v{r2} ({t_str(t2)})"
                        f" - mixed categories")
            return
        if op in ('if-lt', 'if-ge', 'if-gt', 'if-le', 'if-ltz', 'if-gez', 'if-gtz', 'if-lez'):
            r = R(0, insn)
            t = t_of(st, r)
            if not (cat_ok(t, 'I') or cat_ok(t, 'F')):
                E(insn, f"register v{r} has type {t_str(t)} but expected Integer/Float ({op})")
            return
        if op in ('if-eqz', 'if-nez'):
            return

        # ---- arithmetic / conversions ----
        if re.match(r'^(add|sub|mul|div|rem|and|or|xor|shl|shr|ushr|neg|not|rsub)', op) or \
           '-to-' in op or op.startswith(('cmp', 'cmpl', 'cmpg')):
            handle_arith(st, insn, consume, E, t_of)
            return

        # unknown opcode: lenient
        return

    # ---- worklist ----
    def merge_state(x, y):
        out = {}
        for r in set(x) | set(y):
            out[r] = merge(x.get(r, UNK), y.get(r, UNK))
        return out

    while work:
        i = work.pop()
        st = dict(states[i])
        if os.environ.get('MV_TRACE'):
            ins = insns[i]
            print(f"TRACE blk#{i} @{ins.offset if ins.offset is not None else '?'} "
                  f"in={ {k: v for k, v in sorted(states[i].items()) if v != ('UNK',)} }",
                  file=sys.stderr)
        transfer(st, insns[i])
        if os.environ.get('MV_TRACE'):
            print(f"TRACE blk#{i} out={ {k: v for k, v in sorted(st.items()) if v != ('UNK',)} }",
                  file=sys.stderr)
        for s_ in succs[i]:
            if s_ not in reach:
                continue
            if states[s_] is None:
                states[s_] = dict(st)
                work.append(s_)
            else:
                new = merge_state(states[s_], st)
                if new != states[s_]:
                    states[s_] = new
                    work.append(s_)


CATMAP = {'int': 'I', 'float': 'F', 'long': 'J', 'double': 'D',
          'byte': 'I', 'char': 'I', 'short': 'I'}


def handle_arith(st, insn, consume, E, t_of):
    op, a = insn.op, insn.args
    regs = [reg_num(x) for x in a if REG_RE.match(x)]

    def setdst(r, t):
        if r is not None:
            st[r] = t
            if t[0] in ('J', 'D', 'JC'):
                st[r + 1] = t  # high half of the wide pair

    if '-to-' in op:  # conversions: <src>-to-<dst> vDst, vSrc
        src, dst = op.split('-to-')
        swant = CATMAP.get(src, 'I')
        dwant = CATMAP.get(dst, 'I')
        if len(regs) >= 2 and regs[1] is not None:
            consume(st, insn, regs[1], swant, op)
        setdst(regs[0], (dwant,))
        return

    if op.startswith(('cmp', 'cmpl', 'cmpg')):  # result is always int
        suffix = op.rsplit('-', 1)[-1]
        owant = CATMAP.get(suffix, 'J')
        for r in regs[1:]:
            if r is not None:
                consume(st, insn, r, owant, op)
        if regs and regs[0] is not None:
            st[regs[0]] = ('I',)
        return

    # plain arithmetic: category from opcode suffix
    dwant = 'I'
    for c in ('double', 'long', 'float', 'int'):
        if c in op:
            dwant = CATMAP[c]
            break
    is_shift = op.startswith(('shl', 'shr', 'ushr'))
    # regs[0] is the destination; it is also a source only in /2addr form
    if regs and regs[0] is not None and '/2addr' in op:
        consume(st, insn, regs[0], dwant, op)
    for k, r in enumerate(regs[1:], start=1):
        if r is None:
            continue
        # the shift amount is always an int, even for shl-long/shr-long
        want = 'I' if (is_shift and k == len(regs) - 1) else dwant
        consume(st, insn, r, want, op)
    setdst(regs[0], (dwant,))


# ------------------------------------------------------------------- main --
def class_desc_from_path(path, tree_roots):
    p = os.path.abspath(path)
    for tree_root in tree_roots:
        root = os.path.abspath(tree_root)
        try:
            rel = os.path.relpath(p, root)
            if not rel.startswith('..'):
                rel = rel.replace(os.sep, '/')
                if rel.endswith('.smali'):
                    return 'L' + rel[:-6] + ';'
        except ValueError:
            pass
    return 'Ljava/lang/Object;'


def check_file(path, hier, errors):
    with open(path, encoding='utf-8') as f:
        lines = f.read().split('\n')
    cls_desc = class_desc_from_path(path, hier.roots)
    i, n_methods = 0, 0
    while i < len(lines):
        mm = METHOD_RE.match(lines[i])
        if mm:
            flags, name, proto, _ret = mm.groups()
            static = 'static' in flags.split()
            j = i + 1
            regs = None
            body = []
            while j < len(lines) and not lines[j].startswith('.end method'):
                s = lines[j].strip()
                mr = re.match(r'^\.registers\s+(\d+)$', s)
                ml = re.match(r'^\.locals\s+(\d+)$', s)
                if mr:
                    regs = int(mr.group(1))
                elif ml:
                    _p, slots = parse_descriptor(proto)
                    if not static:
                        slots += 1
                    regs = int(ml.group(1)) + slots
                else:
                    body.append(lines[j])
                j += 1
            if regs is None:
                _p, slots = parse_descriptor(proto)
                regs = slots + (0 if static else 1) + 2  # conservative default
            n_methods += 1
            check_method(path, cls_desc, name, proto, static, regs, body,
                         hier, errors)
            i = j + 1
        else:
            i += 1
    return n_methods


def main():
    args = sys.argv[1:]
    trees, files = [], []
    i = 0
    while i < len(args):
        if args[i] == '--tree':
            trees.append(args[i + 1])
            i += 2
        else:
            files.append(args[i])
            i += 1
    if not files:
        print(__doc__)
        sys.exit(2)
    hier = Hierarchy(trees)
    errors, total = [], 0
    for f in files:
        total += check_file(f, hier, errors)
    if errors:
        for e in errors:
            print("VERIFY-ERROR", e)
        print(f"\nminiverify: {len(errors)} error(s) in {total} methods across "
              f"{len(files)} files -> REJECT")
        sys.exit(1)
    print(f"miniverify: OK - {total} methods across {len(files)} files, "
          f"no register-type conflicts")
    sys.exit(0)


if __name__ == '__main__':
    main()
