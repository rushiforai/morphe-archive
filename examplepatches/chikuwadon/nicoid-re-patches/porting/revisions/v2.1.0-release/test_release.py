#!/usr/bin/env python3
"""Stable 2.1.0 source provenance and protected publication route."""
from pathlib import Path
import json
import re
from verify_dev28 import verify
ROOT=Path(__file__).resolve().parents[3]
version=(ROOT/'gradle.properties').read_text()
assert re.search(r'(?m)^version\s*=\s*2\.1\.0$',version),'Gradle release version is not 2.1.0'
notes=(ROOT/'.github/release-notes/v2.1.0.md').read_text()
assert notes.startswith('## 2.1.0')
assert all(s in notes for s in ('### ✨ New Features','### 🐛 Bug Fixes','### 🔧 Improvements','[#162]','[#122]'))
release=(ROOT/'.github/workflows/release.yml').read_text()
main=(ROOT/'.github/workflows/verify-main.yml').read_text()
prepare=(ROOT/'.releaserc').read_text()
script=(ROOT/'.github/scripts/stage-v2.1.0-mpp.sh').read_text()
assert 'stage-v2.1.0-mpp.sh' in release and 'stage-v2.1.0-mpp.sh' in main
assert 'stage-v2.1.0-mpp.sh' in prepare
assert 'workflow_dispatch' in release and "inputs.release_confirmation == 'APPROVE'" in release
assert 'NICOID_OFFICIAL_RELEASE_APPROVED' in script and 'refs/heads/main' in script
assert 'stage_verified.py' in script and 'verify_dev28.py' in script
assert json.loads((ROOT/'patches-list.json').read_text())['version']=='2.0.6','Do not prematurely rewrite published metadata'
print('PASS: approved v2.1.0 release notes and manual gating')
verify()
print('PASS: approved v2.1.0 source and immutable reviewed dev28 MPP')
