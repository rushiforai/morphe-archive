"""v2.0.6-dev.9: correct fullscreen setting option initialization.

Retain the verified v2.0.6-dev.8 scrolling-comment renderer byte-for-byte.
Only replace FullscreenOptions262 and FullscreenOptions265 classes.
"""
from pathlib import Path
import importlib.util
import sys

VERSION = "2.0.6-dev.9"

ROOT=Path(__file__).resolve().parent
DEV8=ROOT.parent/"v2.0.6-dev.8"/"build_mpp.py"
SOURCE=DEV8.read_text(encoding="utf-8")
old_version='VERSION = "2.0.6-dev.8"'
assert SOURCE.count(old_version)==1
SOURCE=SOURCE.replace(old_version,'VERSION = "2.0.6-dev.9"')
old_sources='    \'        *sorted((ROOT.parent / "v2.0.6-dev.8/java").rglob("*.java")),\''
new_sources=(
 '    \'        *sorted(p for p in (ROOT.parent / "v2.0.6-dev.8/java").rglob("*.java")\'\n'
 '    \' if p.name not in ("FullscreenOptions262.java", "FullscreenOptions265.java")),\\n\'\n'
 '    \'        *sorted((ROOT.parent / "v2.0.6-dev.9/java").rglob("*.java")),\''
)
assert SOURCE.count(old_sources)==1
SOURCE=SOURCE.replace(old_sources,new_sources)
spec=importlib.util.spec_from_file_location("nicoid_v206_dev9_base",DEV8)
module=importlib.util.module_from_spec(spec)
sys.modules[spec.name]=module
exec(compile(SOURCE,str(DEV8),"exec"),module.__dict__)
module.builder.VERSION=VERSION
if __name__=="__main__":
    module.builder.main()
