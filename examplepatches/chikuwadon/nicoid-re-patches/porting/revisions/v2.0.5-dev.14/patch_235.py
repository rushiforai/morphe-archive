"""v2.0.5-dev.14: retain the verified native staging and use narrow runtime hooks.

Do not recompile the complete legacy Dev111/AmbientLight classes here: they
have stable nested helpers and would collide during live-dex merge.
"""
from pathlib import Path
import importlib.util
ROOT=Path(__file__).resolve().parent
PREVIOUS=ROOT.parent/"v2.0.5-dev.13/patch_234.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev13",PREVIOUS)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=previous.OVERRIDES
def stage(base,destination):
    return previous.stage(base,destination)
