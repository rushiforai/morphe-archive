#!/usr/bin/env python3
"""Guard the reviewed development staging and optional runtime composition."""
from __future__ import annotations
import ast
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parents[1]
ROOT = HERE.parents[2]
BASE = HERE / "compat"
stage = (HERE / "stage_candidate.py").read_text(encoding="utf-8")
assert "version = 2.1.7-dev.2" in (ROOT / "gradle.properties").read_text()
assert '2.1.7-dev.2' in (ROOT / '.github/workflows/private-build.yml').read_text()
ast.parse(stage)
assert "PREVIOUS_SOURCE_SHA" in stage and "make_candidate(interim, output)" in stage
expected = {
    "patch_rules.py", "bundle_overlay.py", "state_items.py", "scene_weather.py",
    "airborne_rules.py", "terrain_profiles.py", "history_actions.py",
    "shape_library.py", "version_order.py", "version_binding.py",
    "terrain_mask.py", "relocate_legacy.py",
}
assert all((BASE / filename).is_file() for filename in expected), "Missing source component"
for filename in expected:
    ast.parse((BASE / filename).read_text(encoding="utf-8"), filename=filename)
core = (BASE / "patch_rules.py").read_text(encoding="utf-8")
container = (BASE / "bundle_overlay.py").read_text(encoding="utf-8")
selector = (BASE / "entry/e/e/a/BikeRunSelector.smali").read_text(encoding="utf-8")
assert 'v1.5.0' in core and '"1.5.0"' in core, "Stable internal version missing"
assert '"1.5.0-dev' not in core and '1.5.0-dev' not in selector
assert 'v1.5.0' in selector
assert "46 new classes" in container
assert 'original[modern].count(ANCHOR.encode("ascii")) == 1' in container
assert 'Unrelated base class changed' in container
assert 'Non-game MPP entry changed' in container
assert 'clipOutRect(FFFF)Z' in container
assert "nicoid/helpers.mpe" in container
assert (BASE / "tools/smali/pom.xml").is_file()
source = ROOT / 'porting/revisions/v2.1.7-dev.1/stage_candidate.py'
blob = source.read_bytes()
git_sha = hashlib.sha1(b'blob ' + str(len(blob)).encode() + bytes([0]) + blob).hexdigest()
assert git_sha == '958ef611d59568a368a73fcd16ec2085ce905e0d'
assert 'nicoid/method-delta.dex' in stage
assert 'validate_mpp(output, VERSION)' in stage
legacy = list((ROOT / 'porting/revisions/v1.10.1/helpers/e/e/a').glob('BikeRun*.smali'))
assert len(legacy) == 22, 'Legacy class inventory changed'
print('PASS: reviewed staging, data preservation, bounded runtime injection and version source')
