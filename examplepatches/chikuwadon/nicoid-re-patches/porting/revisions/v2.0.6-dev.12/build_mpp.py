"""Build dev.12 with the dev.11 settings logic and remove its obsolete DEX call."""
from pathlib import Path
import importlib.util
import sys

VERSION = "2.0.6-dev.12"
ROOT = Path(__file__).resolve().parent
DEV11 = ROOT.parent / "v2.0.6-dev.11" / "build_mpp.py"
sys.path.insert(0, str(ROOT))
source = DEV11.read_text(encoding="utf-8")
old_overlay = "from overlay_270 import apply as overlay_settings_270"
new_overlay = "from overlay_272 import apply as overlay_settings_270"
if source.count(old_overlay) != 1:
    raise RuntimeError("Missing settings overlay import")
source = source.replace(old_overlay, new_overlay)
spec = importlib.util.spec_from_file_location("nicoid_v206_dev11", DEV11)
module = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = module
exec(compile(source, str(DEV11), "exec"), module.__dict__)
module.module.builder.VERSION = VERSION

if __name__ == "__main__":
    module.module.builder.main()
