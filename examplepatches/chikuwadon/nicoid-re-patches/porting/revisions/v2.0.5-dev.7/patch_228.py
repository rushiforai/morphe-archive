"""Preserve prior dev changes; fix locale-safe settings reorganization."""
from pathlib import Path
import importlib.util
ROOT=Path(__file__).resolve().parent
PREVIOUS=ROOT.parent/"v2.0.5-dev.6/patch_227.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev6",PREVIOUS)
previous=importlib.util.module_from_spec(spec);spec.loader.exec_module(previous)
OVERRIDES=previous.OVERRIDES
def stage(base,destination):
    return previous.stage(base,destination)
