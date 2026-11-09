#!/usr/bin/env python3
"""Locate the beta welcome_init_failure dialog method and its callers.

Step 1: raw-scan each classes*.dex in the beta base.apk for the resource-id
        constants of interest (welcome_init_failure 0x7f1415a5 etc.).
Step 2: decode the dex(es) that hit with androguard and resolve the methods
        that reference those ids, plus callers of the dialog method.
"""
import re
import zipfile
from androguard.core.bytecodes.dvm import DalvikVMFormat

BASE = "/tmp/opera/beta_apkm/base.apk"

IDS = {
    0x7F1415A5: "welcome_init_failure",
    0x7F1415A0: "welcome_init_emulated_arm(beta)",
    0x7F1415A4: "welcome_play_store(beta)",
    0x7F1415A6: "welcome_init_?(beta)",
}

def raw_scan(data, needle):
    return data.count(needle)

def method_refs(d, res_id):
    hits = []
    for m in d.get_methods():
        code = m.get_code()
        if not code:
            continue
        for ins in code.get_bc().get_instructions():
            op = ins.get_name()
            if op.startswith("const") and "jumbo" not in op and "string" not in op:
                try:
                    for _k, val, _t in ins.get_operands():
                        if isinstance(val, int) and val == res_id:
                            hits.append((m.get_class_name(), m.get_name(), m.get_descriptor()))
                            break
                except Exception:
                    pass
            if hits and hits[-1][0] == m.get_class_name():
                break
    seen = set()
    out = []
    for h in hits:
        if h[0] not in seen:
            seen.add(h[0])
            out.append(h)
    return out

def find_callers(d, cls, name, desc):
    callers = []
    target = f"{cls}->{name}{desc}"
    for m in d.get_methods():
        code = m.get_code()
        if not code:
            continue
        for ins in code.get_bc().get_instructions():
            if "invoke" not in ins.get_name():
                continue
            try:
                for _k, val, txt in ins.get_operands():
                    if isinstance(val, str) and txt and target in txt:
                        callers.append((m.get_class_name(), m.get_name(), m.get_descriptor()))
                        break
            except Exception:
                pass
            if callers and callers[-1][0] == m.get_class_name():
                break
    seen = set()
    out = []
    for h in callers:
        if h[0] not in seen:
            seen.add(h[0])
            out.append(h)
    return out

def main():
    z = zipfile.ZipFile(BASE)
    dex_names = sorted(n for n in z.namelist() if re.match(r"classes\d*\.dex$", n))
    print("dexes:", dex_names)
    for name in dex_names:
        data = z.read(name)
        found = []
        for rid, label in IDS.items():
            cnt = raw_scan(data, rid.to_bytes(4, "little"))
            if cnt:
                found.append((label, hex(rid), cnt))
        print(f"{name}: {found}")

if __name__ == "__main__":
    main()
