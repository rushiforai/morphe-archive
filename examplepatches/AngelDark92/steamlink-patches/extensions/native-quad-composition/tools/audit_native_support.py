"""Shared decoding helper (resumes after undecodable words so a scan never ends early)."""


def decode_all(s):
    t = s.elf.get_section_by_name('.text')
    base, n = t['sh_addr'], t['sh_size']
    code = s.read(base, n)
    out, pos = [], 0
    while pos < n:
        got = list(s.cs.disasm(code[pos:], base + pos))
        out.extend(got)
        pos = pos + 4 if not got else got[-1].address + 4 - base
    return out
