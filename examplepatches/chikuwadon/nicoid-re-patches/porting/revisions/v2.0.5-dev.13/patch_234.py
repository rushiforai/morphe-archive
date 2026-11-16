"""v2.0.5-dev.13: preserve earlier stable native patches and update return/UI helpers."""
from pathlib import Path
import importlib.util
ROOT=Path(__file__).resolve().parent
PREVIOUS=ROOT.parent/"v2.0.5-dev.12/patch_233.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev12",PREVIOUS)
previous=importlib.util.module_from_spec(spec);spec.loader.exec_module(previous)
OVERRIDES=previous.OVERRIDES
def stage(base,destination):
    return previous.stage(base,destination)
