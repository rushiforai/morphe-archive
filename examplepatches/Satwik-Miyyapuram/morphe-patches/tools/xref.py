import logging, sys; logging.disable(logging.CRITICAL)
from loguru import logger; logger.remove()
from androguard.misc import AnalyzeAPK
a, d, dx = AnalyzeAPK("mmc.apk")
pats = sys.argv[1:]
for c in dx.get_classes():
    if c.is_external() or not c.name.startswith(("Lcom/appsomniacs/","Lorg/cocos2dx/")): continue
    for m in c.get_vm_class().get_methods():
        if not m.get_code(): continue
        for ins in m.get_instructions():
            o = ins.get_output()
            if any(p in o for p in pats):
                print(f"{c.name}->{m.get_name()}{m.get_descriptor()}  ::  {ins.get_name()} {o}")
