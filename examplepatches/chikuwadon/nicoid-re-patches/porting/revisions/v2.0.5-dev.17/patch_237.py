"""v2.0.5-dev.17: preserve the verified v2.0.5-dev.15 native staging."""
from pathlib import Path
import importlib.util
ROOT=Path(__file__).resolve().parent
PREVIOUS=ROOT.parent/"v2.0.5-dev.15/patch_236.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev15",PREVIOUS)
previous=importlib.util.module_from_spec(spec);spec.loader.exec_module(previous)
OVERRIDES=previous.OVERRIDES
def stage(base,destination):return previous.stage(base,destination)
