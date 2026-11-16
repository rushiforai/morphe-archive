"""v2.0.5-dev.15: reuse validated v2.0.5-dev.14 staging."""
from pathlib import Path
import importlib.util
ROOT=Path(__file__).resolve().parent
PREVIOUS=ROOT.parent/"v2.0.5-dev.14/patch_235.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev14",PREVIOUS)
previous=importlib.util.module_from_spec(spec);spec.loader.exec_module(previous)
OVERRIDES=previous.OVERRIDES
def stage(base,destination):return previous.stage(base,destination)
