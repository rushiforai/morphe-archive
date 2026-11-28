#!/usr/bin/env python3
"""Generate `depairip_methods.tsv` for adidas (14.4.0) from the DEX alone.

Background
----------
adidas 14.4.0 ships PairIP in its **method-extraction** form: the real body of a method
stays in the dex as a synthetic `<originalName>$NNN` static, and the original method becomes
a three-instruction reflective trampoline:

    const/4     v2, 0x1
    new-array   v1, v2, [Ljava/lang/Object;
    const/4     v2, 0x0
    aput-object p0, v1, v2
    sget-object v0, Lti/kb/JYGl;->OAPZZJZQfdxpc:Ljava/lang/reflect/Method;
    const/4     v3, 0x0
    invoke-virtual {v0, v3, v1}, Ljava/lang/reflect/Method;->invoke(...)Ljava/lang/Object;
    move-result-object v0
    return-void

The `Method` static is populated at runtime by PairIP's native startup program — which is
also the tamper check that SIGSEGVs any re-signed build. So the patched app finds the field
null and dies with `NullPointerException … Method.invoke on a null object reference`.

The fix does **not** need the VM or a heap dump: the target body is discoverable statically.
For every trampoline we emit, into the holder's `<clinit>`, an assignment

    <holder>.<FIELD> = <ClassName>.class.getDeclaredMethod("<name>$NNN", <param types>)

which is exactly what the native startup program would have written, and which the existing
`restorePairIpHolders` machinery already knows how to bake (see shared/PairIp.kt).

Output format (TSV, one line per holder class):
    <holder-class>\t<register-count>\t<base64(smali body)>

Usage:
    gen_methods_from_dex.py <decoded-apktool-dir> <out.tsv> [--dry-run]
"""

import base64
import os
import re
import sys

METHOD_HDR = re.compile(r"^\.method\s+(?P<rest>.*?)\s*(?P<name>[^\s(]+)(?P<desc>\([^)]*\)[^\s]+)\s*$")
CLASS_HDR = re.compile(r"^\.class\s+.*?(?P<type>L[^;\s]+;)\s*$")
SUPER_HDR = re.compile(r"^\.super\s+(?P<type>L[^;]+;)")
SGET_METHOD = re.compile(
    r"sget-object\s+(?P<reg>[vp]\d+),\s*(?P<holder>L[^;]+;)->(?P<field>[A-Za-z0-9_$]+):Ljava/lang/reflect/Method;"
)
APUT = re.compile(r"aput-object\s+(?P<src>[vp]\d+),\s*(?P<arr>[vp]\d+),\s*(?P<idx>[vp0-9x]+)")
NEWARRAY = re.compile(r"new-array\s+(?P<arr>[vp]\d+),\s*(?P<reg>[vp]\d+),\s*\[Ljava/lang/Object;")


def parse_descriptor_params(desc: str):
    """Return the list of parameter type descriptors of a method descriptor."""
    inner = desc[desc.index("(") + 1: desc.index(")")]
    out, i = [], 0
    while i < len(inner):
        c = inner[i]
        if c == "[":
            j = i + 1
            while j < len(inner) and inner[j] == "[":
                j += 1
            if inner[j] == "L":
                j = inner.index(";", j) + 1
            else:
                j += 1
            out.append(inner[i:j])
            i = j
        elif c == "L":
            j = inner.index(";", i) + 1
            out.append(inner[i:j])
            i = j
        else:
            out.append(c)
            i += 1
    return out


def scan(decoded_root):
    """Collect class metadata and the trampolines."""
    classes = {}      # type -> {"file": path, "super": type|None, "methods": {name+desc: flags}}
    trampolines = []  # dicts

    for dirpath, _, filenames in os.walk(decoded_root):
        rel = os.path.relpath(dirpath, decoded_root)
        if not any(part.startswith("smali") for part in rel.split(os.sep)):
            continue
        for fn in filenames:
            if not fn.endswith(".smali"):
                continue
            path = os.path.join(dirpath, fn)
            cur_class = None
            cur_super = None
            cur_method = None
            args = []       # registers pushed into the Object[] in index order
            field = None
            want_n = None
            with open(path, "r", errors="ignore") as fh:
                for line in fh:
                    line = line.strip()
                    if cur_class is None:
                        m = CLASS_HDR.match(line)
                        if m:
                            cur_class = m.group("type")
                            classes.setdefault(cur_class, {"file": path, "super": None, "methods": {}})
                            continue
                    if cur_super is None:
                        m = SUPER_HDR.match(line)
                        if m:
                            cur_super = m.group("type")
                            if cur_class:
                                classes[cur_class]["super"] = cur_super
                            continue
                    m = METHOD_HDR.match(line)
                    if m:
                        cur_method = (m.group("name"), m.group("desc"), m.group("rest") or "")
                        args, field, want_n = [], None, None
                        if cur_class:
                            classes[cur_class]["methods"][
                                m.group("name") + m.group("desc")
                            ] = m.group("rest") or ""
                        continue
                    if line.startswith(".end method"):
                        if field is not None and cur_method is not None and cur_class:
                            trampolines.append(
                                {"class": cur_class, "super": cur_super, "name": cur_method[0],
                                 "desc": cur_method[1], "flags": cur_method[2],
                                 "holder": holder, "field": field, "regs": list(args)}
                            )
                        cur_method, field, holder, args = None, None, None, []
                        continue
                    if cur_method is None:
                        continue
                    m = NEWARRAY.search(line)
                    if m:
                        want_n = True
                        continue
                    m = APUT.search(line)
                    if m:
                        args.append(m.group("src"))
                        continue
                    m = SGET_METHOD.search(line)
                    if m:
                        holder = m.group("holder")
                        field = m.group("field")
                        continue
    return classes, trampolines


def is_subtype(classes, sub, sup):
    seen = set()
    while sub and sub not in seen:
        if sub == sup:
            return True
        seen.add(sub)
        sub = classes.get(sub, {}).get("super")
    return False


def pick_target(classes, t):
    """Find the extracted `<name>$NNN` body whose parameters match the trampoline call."""
    cands = []
    for key, flags in classes.get(t["class"], {}).get("methods", {}).items():
        m = re.match(r"^([^\(]+?)\$(\d{3})(\(.*)$", key)
        if not m:
            continue
        base, _num, desc = m.groups()
        if base != t["name"]:
            continue
        params = parse_descriptor_params(desc)
        # The trampoline hands `this` (as args[0]) plus any real parameters, so the body
        # takes the receiver as its first parameter. Accept an exact count match.
        if len(params) != len(t["regs"]):
            continue
        # param[0] must be the trampoline's own class or one of its supertypes.
        if params and not is_subtype(classes, t["class"], params[0]):
            continue
        cands.append((key, desc, params))
    if not cands:
        return None
    # Prefer the lowest $NNN (stable choice when several overloads match).
    cands.sort(key=lambda c: int(re.search(r"\$(\d{3})", c[0]).group(1)))
    return cands[0]


def smali_body(bindings):
    """Build the <clinit> body assigning each holder field via getDeclaredMethod."""
    lines = []
    for b in bindings:
        lines.append(f'    const-class v0, {b["class"]}')
        lines.append(f'    const-string v1, "{b["target_name"]}"')
        params = b["params"]
        lines.append(f"    const/4 v2, 0x{len(params):x}")
        lines.append(f"    new-array v2, v2, [Ljava/lang/Class;")
        for i, p in enumerate(params):
            lines.append(f"    const/4 v3, 0x{i:x}")
            lines.append(f"    const-class v4, {p}")
            lines.append(f"    aput-object v4, v2, v3")
        lines.append(
            "    invoke-virtual {v0, v1, v2}, "
            "Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)"
            "Ljava/lang/reflect/Method;"
        )
        lines.append("    move-result-object v0")
        lines.append(f'    sput-object v0, {b["holder"]}->{b["field"]}:Ljava/lang/reflect/Method;')
    lines.append("    return-void")
    return "\n".join(lines) + "\n"


def main():
    decoded, out = sys.argv[1], sys.argv[2]
    dry = "--dry-run" in sys.argv
    classes, tramps = scan(decoded)
    print(f"classes={len(classes)} trampolines={len(tramps)}")

    by_holder: dict[str, list] = {}
    unresolved = []
    for t in tramps:
        target = pick_target(classes, t)
        if not target:
            unresolved.append(t)
            continue
        key, desc, params = target
        name = re.match(r"^([^\(]+)", key).group(1)
        by_holder.setdefault(t["holder"], []).append(
            {"class": t["class"], "holder": t["holder"], "field": t["field"],
             "target_name": name, "params": params}
        )
        print(f"  {t['class']}.{t['name']}{t['desc']} -> {t['holder']}->{t['field']} = {name}{desc}")

    if unresolved:
        print(f"\nUNRESOLVED ({len(unresolved)}):")
        for t in unresolved:
            print(f"  {t['class']}.{t['name']}{t['desc']} (args={len(t['regs'])})")

    if dry:
        print("\n--- dry run, nothing written ---")
        return

    # All bindings are baked into ONE holder's <clinit>: it keeps a single resource line and
    # avoids "already has <clinit>" collisions with the strings TSV (which bakes the other
    # holders). Writing to another class's static field is perfectly legal in smali.
    target_holder = "Lti/kb/JYGl;"
    flat = [b for binds in by_holder.values() for b in binds]
    lines = [f"{target_holder}\t6\t{base64.b64encode(smali_body(flat).encode()).decode()}"]
    with open(out, "w") as fh:
        fh.write("\n".join(lines) + ("\n" if lines else ""))
    print(f"\nwrote {out}: {len(lines)} holder(s), {sum(len(v) for v in by_holder.values())} binding(s)")


if __name__ == "__main__":
    main()
