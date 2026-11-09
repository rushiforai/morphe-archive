#!/usr/bin/env python3
"""Find callers of beta kfo.d0(Activity,int) - the welcome_init_failure dialog -
across all beta base dexes, and map the error-code branch structure."""
import re
import zipfile
from androguard.core.bytecodes.dvm import DalvikVMFormat

BASE = "/tmp/opera/beta_apkm/base.apk"
TARGET = ("Lkfo;", "d0", "(Landroid/app/Activity;I)V")

z = zipfile.ZipFile(BASE)
dex_names = sorted(n for n in z.namelist() if re.match(r"classes\d*\.dex$", n))

all_callers = []
for name in dex_names:
    d = DalvikVMFormat(z.read(name))
    for m in d.get_methods():
        code = m.get_code()
        if not code:
            continue
        for ins in code.get_bc().get_instructions():
            if not ins.get_name().startswith("invoke"):
                continue
            try:
                operands = ins.get_operands()
                txts = [t for _k, _v, t in operands if isinstance(t, str)]
                if not txts:
                    continue
                blob = " ".join(txts)
                if f"{TARGET[0]}->{TARGET[1]}{TARGET[2]}" in blob:
                    all_callers.append((name, m.get_class_name(), m.get_name(), m.get_descriptor()))
                    break
            except Exception:
                pass
    print(f"scanned {name}: {len(all_callers)} hits so far", flush=True)

for name, cls, meth, desc in all_callers:
    print(f"CALLER  {name}  {cls}->{meth}{desc}")
