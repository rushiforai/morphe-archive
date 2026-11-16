"""v2.0.5-dev.11: preserve dev.9 native edits; update compiled panel and settings helpers."""
from pathlib import Path
import importlib.util

ROOT=Path(__file__).resolve().parent
PREVIOUS=ROOT.parent/"v2.0.5-dev.10/patch_231.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev10",PREVIOUS)
previous=importlib.util.module_from_spec(spec);spec.loader.exec_module(previous)
OVERRIDES=previous.OVERRIDES

def stage(base,destination):
    return previous.stage(base,destination)
