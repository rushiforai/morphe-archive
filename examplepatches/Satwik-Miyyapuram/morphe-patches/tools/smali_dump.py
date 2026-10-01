import logging, sys; logging.disable(logging.CRITICAL)
from loguru import logger; logger.remove()
from androguard.misc import AnalyzeAPK
import pickle
a, d, dx = AnalyzeAPK("mmc.apk")
targets = [l.strip() for l in open(sys.argv[1]) if l.strip()]
for c in dx.get_classes():
    if c.is_external(): continue
    cls = c.get_vm_class()
    for m in cls.get_methods():
        key = f"{c.name}->{m.get_name()}{m.get_descriptor().replace(' ','')}"
        for t in targets:
            if key.startswith(t):
                print("=====", key, m.get_access_flags_string(), "regs", m.get_code().get_registers_size() if m.get_code() else None)
                if m.get_code():
                    for ins in m.get_instructions():
                        print("   ", ins.get_name(), ins.get_output())
