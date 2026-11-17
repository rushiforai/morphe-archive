"""Build dev.13 with corrected ambient geometry and video menu preferences."""
from pathlib import Path
import importlib.util
import sys
from shutil import copy2

VERSION = "2.0.6-dev.13"
ROOT = Path(__file__).resolve().parent
DEV11 = ROOT.parent / "v2.0.6-dev.11" / "build_mpp.py"
sys.path.insert(0, str(ROOT))
sys.path.insert(0, str(ROOT.parent / "v2.0.6-dev.12"))
source = DEV11.read_text(encoding="utf-8")
old_overlay = "from overlay_270 import apply as overlay_settings_270"
new_overlay = "from overlay_274 import apply as overlay_settings_270"
if source.count(old_overlay) != 1:
    raise RuntimeError("Missing settings overlay import")
source = source.replace(old_overlay, new_overlay)
spec = importlib.util.spec_from_file_location("nicoid_v206_dev11", DEV11)
module = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = module
exec(compile(source, str(DEV11), "exec"), module.__dict__)
builder = module.module.builder
builder.VERSION = VERSION
from stage_274 import apply as stage_274

stage_existing = builder.stage
def stage(base, destination):
    stage_existing(base, destination)
    stage_274(destination)
    copy2(ROOT / "java/e/e/a/VideoMenu274.java", destination)

builder.stage = stage

if __name__ == "__main__":
    builder.main()
