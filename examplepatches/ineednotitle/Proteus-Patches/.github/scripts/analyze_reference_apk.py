#!/usr/bin/env python3
"""Reference APK analyzer (MereFrame 0.8.4 / libunnamed_raw.so).

Produces a text report covering:
  * the five known ARM64 integrity-gate prologues (validation),
  * the JNI RegisterNatives table (name, signature, function offset),
  * the n72c9e116bb85d91fbf8a15b2 / nd2cccb916f63efbcf8b5b19b functions,
  * code references to "Protected operation unavailable",
  * the DEX body of the p(...) wrapper and its callers.

Usage: analyze_reference_apk.py <report.md> <extracted-dir/>
Every section is best-effort: partial output beats no output.
"""

import sys
import struct

KNOWN_GATES = [0x23F3D8, 0x2A5ECC, 0x2BF304, 0x2E5FB0, 0x2E1B54]
KNOWN_PRO = [0x242048, 0x244680]
NATIVE_OF_P = b"n72c9e116bb85d91fbf8a15b2"
NATIVE_OF_D = b"nd2cccb916f63efbcf8b5b19b"
THROW_MSG = b"Protected operation unavailable"
INTEGRITY_MSG = b"app integrity check failed"


def out(report, text=""):
    report.write(text + "\n")
    report.flush()


def find_all(hay, needle):
    hits = []
    start = 0
    while True:
        i = hay.find(needle, start)
        if i < 0:
            return hits
        hits.append(i)
        start = i + 1


def va_of(elf, file_off):
    for seg in elf.iter_segments():
        if seg["p_type"] != "PT_LOAD":
            continue
        off, va, fsz = seg["p_offset"], seg["p_vaddr"], seg["p_filesz"]
        if off <= file_off < off + fsz:
            return va + (file_off - off)
    return None


def off_of(elf, va):
    for seg in elf.iter_segments():
        if seg["p_type"] != "PT_LOAD":
            continue
        off, vaddr, fsz = seg["p_offset"], seg["p_vaddr"], seg["p_filesz"]
        if vaddr <= va < vaddr + fsz:
            return off + (va - vaddr)
    return None


def analyze_so(report, so_path):
    from elftools.elf.elffile import ELFFile

    out(report, "# libunnamed_raw.so analysis")
    out(report)
    with open(so_path, "rb") as f:
        data = f.read()
        f.seek(0)
        elf = ELFFile(f)

        out(report, "## Sections")
        for s in elf.iter_sections():
            out(report, f"- {s.name:24s} off=0x{s['sh_offset']:x} size=0x{s['sh_size']:x} flags={s['sh_flags']}")
        out(report)

        def disasm(va, count, title):
            from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM
            o = off_of(elf, va)
            if o is None:
                out(report, f"{title}: VA 0x{va:x} not in file")
                return
            md = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
            md.detail = False
            out(report, f"{title} (VA 0x{va:x}, file 0x{o:x}):")
            body = data[o:o + count * 4]
            for ins in md.disasm(body, va):
                out(report, f"    0x{ins.address:x}: {ins.mnemonic:8s} {ins.op_str}")
            out(report)

        out(report, "## Known gate prologues (validation)")
        for g in KNOWN_GATES:
            o = off_of(elf, g)
            if o is None:
                out(report, f"- gate 0x{g:x}: NOT IN FILE")
                continue
            out(report, f"- gate 0x{g:x}: first 32 bytes = {data[o:o+32].hex()}")
            disasm(g, 6, f"  gate 0x{g:x}")
        out(report)
        out(report, "## Known Pro-capture natives (validation)")
        for g in KNOWN_PRO:
            o = off_of(elf, g)
            out(report, f"- 0x{g:x}: {'NOT IN FILE' if o is None else data[o:o+32].hex()}")
        out(report)

        # ---- relocations: RegisterNatives-style triples -------------------
        out(report, "## String table hits")
        str_va = {}
        for label, needle in (("n72c(p)", NATIVE_OF_P), ("nd2cc(d)", NATIVE_OF_D),
                              ("throw msg", THROW_MSG), ("integrity msg", INTEGRITY_MSG)):
            for h in find_all(data, needle):
                v = va_of(elf, h)
                out(report, f"- {label}: file 0x{h:x} VA {'0x%x' % v if v else '?'}")
                str_va[label] = (h, v)
        out(report)

        out(report, "## RegisterNatives-style relocation triples")
        relas = []
        for sec in elf.iter_sections():
            if sec.name not in (".rela.dyn", ".rela.plt"):
                continue
            for r in sec.iter_relocations():
                relas.append((r["r_offset"], r["r_addend"]))
        relas.sort()
        addend_off = {a: off_of(elf, a) for _, a in relas}
        triples = []
        for i in range(len(relas) - 2):
            (o1, a1), (o2, a2), (o3, a3) = relas[i], relas[i + 1], relas[i + 2]
            if o2 != o1 + 8 or o3 != o1 + 16:
                continue
            f1, f2 = addend_off.get(a1), addend_off.get(a2)
            if f1 is None or f2 is None:
                continue
            name = data[f1:data.find(b"\x00", f1)]
            sig = data[f2:data.find(b"\x00", f2)]
            if not name or not sig:
                continue
            try:
                if not name.decode("ascii").replace("_", "").isalnum():
                    continue
                sig.decode("ascii")
            except Exception:
                continue
            if not sig.startswith(b"("):
                continue
            triples.append((name.decode(), sig.decode(), a3))
        for name, sig, fn in triples:
            out(report, f"- {name}{sig} -> fn VA 0x{fn:x}")
        out(report, f"({len(triples)} natives)")
        out(report)

        interesting = {}
        for name, sig, fn in triples:
            if name in (NATIVE_OF_P.decode(), NATIVE_OF_D.decode()):
                interesting[name] = (sig, fn)
        for name, (sig, fn) in interesting.items():
            out(report, f"## Native {name}{sig} @ 0x{fn:x}")
            disasm(fn, 48, f"prologue of {name}")
            out(report)

        # ---- xref scan for the throw message ------------------------------
        if "throw msg" in str_va:
            tva = str_va["throw msg"][1]
            if tva:
                out(report, "## Code references to the throw message")
                from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM
                md = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
                fn_by_va = {fn: name for name, _, fn in triples}
                count = 0
                for seg in elf.iter_segments():
                    if seg["p_type"] != "PT_LOAD" or not (seg["p_flags"] & 1):
                        continue
                    base, size = seg["p_vaddr"], seg["p_filesz"]
                    blob = data[seg["p_offset"]:seg["p_offset"] + size]
                    adrp_pages = {}
                    prev = None
                    for ins in md.disasm(blob, base):
                        if ins.mnemonic == "adrp":
                            parts = ins.op_str.split(", ")
                            if len(parts) == 2:
                                try:
                                    adrp_pages[parts[0]] = int(parts[1], 0)
                                except ValueError:
                                    pass
                        elif ins.mnemonic in ("add", "ldr"):
                            parts = ins.op_str.split(", ")
                            if len(parts) >= 3 and parts[1] in adrp_pages:
                                try:
                                    imm = int(parts[2].split(" #")[-1], 0)
                                except ValueError:
                                    imm = None
                                if imm is not None and adrp_pages[parts[1]] + imm == tva:
                                    owner = "unknown"
                                    for fv, fname in fn_by_va.items():
                                        if fv <= ins.address < fv + 0x400:
                                            owner = f"{fname}+0x{ins.address - fv:x}"
                                            break
                                    out(report, f"- 0x{ins.address:x} ({owner}): {ins.mnemonic} {ins.op_str}")
                                    count += 1
                        prev = ins
                out(report, f"({count} references)")
                out(report)


def analyze_dex(report, dex_dir):
    out(report, "# DEX analysis")
    out(report)
    try:
        from androguard.core.dex import DEX
    except Exception as e:
        out(report, f"androguard unavailable: {e}")
        return
    import glob, os
    bridge = "Lapp/unnamed/rawrecording/b/B1e6ad8077f6880e309d8da4b;"
    targets = []
    callers = []
    for path in sorted(glob.glob(os.path.join(dex_dir, "classes*.dex"))):
        out(report, f"## {os.path.basename(path)}")
        d = DEX(open(path, "rb").read())
        for cls in d.get_classes():
            cname = cls.get_name()
            for m in cls.get_methods():
                mname = m.get_name()
                desc = f"{cname}->{mname}{m.get_descriptor()}"
                if cname == bridge and mname in ("p", "d", "n72c9e116bb85d91fbf8a15b2",
                                                 "nd2cccb916f63efbcf8b5b19b"):
                    targets.append((desc, m))
                try:
                    ins = list(m.get_instructions())
                except Exception:
                    continue
                for i in ins:
                    o = i.get_output()
                    if "B1e6ad8077f6880e309d8da4b;->p(" in o or "B1e6ad8077f6880e309d8da4b;->n72c" in o:
                        callers.append((desc, m))
                        break
        out(report)
    for label, items in (("pinned bridge methods", targets), ("callers of p", callers)):
        out(report, f"## {label}")
        seen = set()
        for desc, m in items:
            if desc in seen:
                continue
            seen.add(desc)
            out(report, f"### {desc}  (registers={m.get_code().get_registers_size() if m.get_code() else '?'})")
            try:
                for i in m.get_instructions():
                    out(report, f"    {i.get_name():22s} {i.get_output()}")
            except Exception as e:
                out(report, f"    [dump failed: {e}]")
            out(report)


def main():
    report_path, root = sys.argv[1], sys.argv[2]
    import glob, os
    with open(report_path, "w") as report:
        out(report, "# Reference analysis report")
        out(report)
        sos = glob.glob(os.path.join(root, "**", "libunnamed_raw.so"), recursive=True)
        if sos:
            try:
                analyze_so(report, sos[0])
            except Exception as e:
                out(report, f"SO analysis failed: {e}")
        else:
            out(report, "libunnamed_raw.so not found in extraction")
        out(report)
        try:
            analyze_dex(report, root)
        except Exception as e:
            out(report, f"DEX analysis failed: {e}")


if __name__ == "__main__":
    main()
