"""dev.15 - hide and reposition the native queue controls before first reveal.

Issue #132 (external-link Back behavior) is design-only in this release.
"""
from pathlib import Path
import importlib.util
ROOT=Path(__file__).resolve().parent
PREV=ROOT.parent/"v2.0.3-dev.14/patch_217.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev14_patch",PREV)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=previous.OVERRIDES

def stage(base,dest):
    result=previous.stage(base,dest)
    icons=Path(dest)/"PlayerIcons.java"
    content=icons.read_text(encoding="utf-8")
    source="PlayerStart211.install(root)"
    if content.count(source)!=1:
        raise AssertionError("Native control install anchor changed")
    icons.write_text(content.replace(source,"PlayerStart215.install(root)"),encoding="utf-8")
    return result
