#!/usr/bin/env python3
"""ARM64 audit helper for libcocos2dcpp.so (pip install capstone pyelftools).
usage: native_disasm.py LIB.so dis SYMBOL_SUBSTR... [--full]
       native_disasm.py LIB.so callers SYMBOL_SUBSTR...
"""
import bisect, re, subprocess, sys
from capstone import CS_ARCH_ARM64, CS_MODE_ARM, Cs
from elftools.elf.elffile import ELFFile
from elftools.elf.relocation import RelocationSection
SO = sys.argv[1]
raw = open(SO, "rb").read(); elf = ELFFile(open(SO, "rb"))
syms, a2s = {}, {}
for sec in elf.iter_sections():
    if sec.name in (".dynsym", ".symtab"):
        for s in sec.iter_symbols():
            if s["st_value"] and s.name and s["st_info"]["type"] == "STT_FUNC":
                syms[s.name] = (s["st_value"], s["st_size"]); a2s.setdefault(s["st_value"], s.name)
got = {}
for sec in elf.iter_sections():
    if isinstance(sec, RelocationSection):
        st = elf.get_section(sec["sh_link"])
        for r in sec.iter_relocations():
            if r["r_info_sym"]:
                got[r["r_offset"]] = st.get_symbol(r["r_info_sym"]).name
md = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
plt = {}
_p = elf.get_section_by_name(".plt")
if _p:
    _ins = list(md.disasm(_p.data(), _p["sh_addr"]))
    for i in range(len(_ins) - 2):
        if _ins[i].mnemonic == "adrp" and _ins[i + 1].mnemonic == "ldr":
            page = int(_ins[i].op_str.split("#")[-1], 16)
            m = re.search(r"#(0x[0-9a-f]+)\]", _ins[i + 1].op_str)
            if m and (page + int(m.group(1), 16)) in got:
                plt[_ins[i].address] = got[page + int(m.group(1), 16)]
def off(va):
    for seg in elf.iter_segments():
        if seg["p_type"] == "PT_LOAD" and seg["p_vaddr"] <= va < seg["p_vaddr"] + seg["p_filesz"]:
            return va - seg["p_vaddr"] + seg["p_offset"]
def cstr(va):
    o = off(va)
    if o is None:
        return None
    e = raw.find(b"\0", o, o + 200); s = raw[o:e]
    return s.decode("latin1") if len(s) >= 2 and all(32 <= c < 127 or c in (9, 10) for c in s) else None
def dm(n):
    return subprocess.run(["c++filt", n], capture_output=True, text=True).stdout.strip() or n
def target(i):
    if i.mnemonic in ("bl", "b") and i.op_str.startswith("#"):
        t = int(i.op_str[1:], 16)
        return t, (plt.get(t) or a2s.get(t))
    return None, None
def dis(name, full=False):
    a, sz = syms[name]; o = off(a); code = raw[o:o + (sz or 400)]
    print(f"===== {dm(name)} @0x{a:x} size {sz}")
    regs = {}
    for i in md.disasm(code, a):
        note = ""
        if i.mnemonic == "adrp":
            regs[i.op_str.split(",")[0]] = int(i.op_str.split("#")[-1], 16)
        elif i.mnemonic == "add" and "#" in i.op_str:
            ops = [x.strip() for x in i.op_str.split(",")]
            if ops[1] in regs:
                s = cstr(regs[ops[1]] + int(ops[2].lstrip("#"), 16))
                if s:
                    note = f'  ; "{s[:90]}"'
        t, n = target(i)
        if n:
            note = f"  ; -> {dm(n)[:100]}"
        if full or note or i.mnemonic in ("ret", "cbz", "cbnz", "tbz", "tbnz", "cmp") or i.mnemonic.startswith("b."):
            print(f"  {i.address:x}: {i.mnemonic:6} {i.op_str}{note}")
def callers(names):
    want = {syms[n][0] for n in names}; starts = sorted(a2s); out = {}
    text = elf.get_section_by_name(".text"); base = text["sh_addr"]; data = text.data()
    for k in range(0, len(data), 4):
        w = int.from_bytes(data[k:k + 4], "little")
        if (w >> 26) in (0x25, 0x05):
            imm = w & 0x3FFFFFF
            if imm & 0x2000000:
                imm -= 1 << 26
            t = base + k + imm * 4
            if t in want or plt.get(t) in names:
                src = starts[bisect.bisect_right(starts, base + k) - 1]
                out.setdefault(dm(a2s[src])[:110], set()).add(dm(a2s.get(t) or plt.get(t))[:60])
    for c, ts in sorted(out.items()):
        print(f"  {c}  ->  {sorted(ts)}")
if __name__ == "__main__":
    mode = sys.argv[2]; pats = [x for x in sys.argv[3:] if not x.startswith("--")]
    names = [n for n in syms if any(p in n for p in pats)]
    if mode == "dis":
        for n in names:
            dis(n, "--full" in sys.argv)
    else:
        print("callers of", [dm(n)[:60] for n in names]); callers(set(names))
