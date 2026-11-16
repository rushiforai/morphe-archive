"""Retain all eligible scrolling comments, preferring collision-free lanes.

Only last-resort lane selection changes; fixed comments are untouched.
"""
import importlib.util
from pathlib import Path
ROOT=Path(__file__).resolve().parent
PREVIOUS=ROOT.parent/"v2.0.5-dev.3/patch_224.py"
spec=importlib.util.spec_from_file_location("_nicoid_previous_dev",PREVIOUS)
previous=importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES=previous.OVERRIDES
def stage(base,destination):
    return previous.stage(base,destination)
