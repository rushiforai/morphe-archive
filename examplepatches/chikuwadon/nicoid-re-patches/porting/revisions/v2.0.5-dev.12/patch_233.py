"""v2.0.5-dev.12: preserve the verified previous native hooks and refine settings/player helpers."""
from pathlib import Path
import importlib.util
ROOT=Path(__file__).resolve().parent
PREVIOUS=ROOT.parent/"v2.0.5-dev.11/patch_232.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev11",PREVIOUS)
previous=importlib.util.module_from_spec(spec);spec.loader.exec_module(previous)
OVERRIDES=previous.OVERRIDES
def stage(base,destination):
    return previous.stage(base,destination)
