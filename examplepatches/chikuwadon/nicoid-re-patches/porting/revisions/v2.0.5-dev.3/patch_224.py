"""Enhance comment entrance timing and multiline overlap avoidance.

The previous staged menu, localization and playback changes stay unchanged.
"""
from pathlib import Path
import importlib.util

ROOT=Path(__file__).resolve().parent
PREVIOUS=ROOT.parent/"v2.0.5-dev.2/patch_223.py"
spec=importlib.util.spec_from_file_location("_nicoid_previous_dev",PREVIOUS)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=previous.OVERRIDES

def stage(base,destination):
    return previous.stage(base,destination)
