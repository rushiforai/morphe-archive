import logging, sys, json; logging.disable(logging.CRITICAL)
from loguru import logger; logger.remove()
from androguard.misc import AnalyzeAPK
a, d, dx = AnalyzeAPK(sys.argv[1])
print("package", a.get_package(), a.get_androidversion_name(), "| signed v1/v2/v3:", a.is_signed_v1(), a.is_signed_v2(), a.is_signed_v3())
print("providers:", a.get_providers())
P="Lcom/appsomniacs/"
targets = json.load(open(__import__("os").path.join(__import__("os").path.dirname(__file__), "..", "..", "src", "data", "analysis.json") if len(sys.argv) < 3 else sys.argv[2]))["methods"]
want = {t["method"]: t for t in targets}
found = {}
for c in dx.get_classes():
    if c.is_external(): continue
    for m in c.get_vm_class().get_methods():
        key=f"{c.name}->{m.get_name()}{m.get_descriptor().replace(' ','')}"
        if key in want:
            ins=[f"{i.get_name()} {i.get_output()}".strip() for i in m.get_instructions()][:2] if m.get_code() else ["<abstract>"]
            found[key]=ins
ok=bad=0
for k,t in want.items():
    ins=found.get(k)
    first=ins[0] if ins else "MISSING"
    good = (t["stub"].startswith("SKIP") and first=="<abstract>") or (t["ret"]=="V" and first=="return-void") or (t["ret"]=="Z" and first.startswith("const/4 v0, 0") and ins[1].startswith("return v0"))
    ok+=good; bad+=not good
    print(("OK  " if good else "FAIL"), k.split("/")[-1], "=>", " ; ".join(ins or []))
print(f"\n{ok} OK, {bad} FAIL")
