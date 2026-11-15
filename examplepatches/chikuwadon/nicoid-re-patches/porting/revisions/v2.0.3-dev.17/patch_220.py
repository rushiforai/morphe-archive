"""v2.0.3-dev.17: repair lost settings hook after late Dev111 overlay.

All functional playback/MP3/media fixes from dev.16 are preserved.
"""
from pathlib import Path
import importlib.util

ROOT=Path(__file__).resolve().parent
PREV=ROOT.parent/"v2.0.3-dev.16/patch_219.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev16",PREV)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=previous.OVERRIDES

def stage(base,destination):
    return previous.stage(base,destination)
