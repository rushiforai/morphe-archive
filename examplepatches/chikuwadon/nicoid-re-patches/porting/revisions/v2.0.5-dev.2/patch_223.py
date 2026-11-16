"""v2.0.5-dev.2: extends prior tested menu and issue changes, adds translations."""
import importlib.util
from pathlib import Path
ROOT=Path(__file__).resolve().parent
PREVIOUS=ROOT.parent/"v2.0.5-dev.1/patch_222.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev1",PREVIOUS)
previous=importlib.util.module_from_spec(spec);spec.loader.exec_module(previous)
OVERRIDES=previous.OVERRIDES
def stage(base,destination):
    return previous.stage(base,destination)
