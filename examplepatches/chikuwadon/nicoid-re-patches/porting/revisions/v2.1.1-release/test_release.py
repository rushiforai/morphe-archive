#!/usr/bin/env python3
"""Prepublish source contract for the user-verified v2.1.1 candidate."""
from pathlib import Path
import json,re,sys
ROOT=Path(__file__).resolve().parents[3]
REV=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT/'porting/revisions/v2.1.0-release'))
from verify_dev28 import verify
sys.path.insert(0,str(REV))
from stage_candidate import verify_dev8_contracts, CANDIDATE_VERSION, REVIEWED_VERSION
assert re.search(r'(?m)^version\s*=\s*2\.1\.1$',(ROOT/'gradle.properties').read_text())
assert CANDIDATE_VERSION == '2.1.1' and REVIEWED_VERSION == '2.1.0-dev.28'
notes=(ROOT/'.github/release-notes/v2.1.1.md').read_text()
assert notes.startswith('## 2.1.1') and all(x in notes for x in ('### ✨ New Features','### 🐛 Bug Fixes','### 🔧 Improvements'))
release=(ROOT/'.github/workflows/release.yml').read_text()
main=(ROOT/'.github/workflows/verify-main.yml').read_text()
prepare=(ROOT/'.releaserc').read_text()
script=(ROOT/'.github/scripts/stage-v2.1.1-mpp.sh').read_text()
assert 'stage-v2.1.1-mpp.sh' in release and 'stage-v2.1.1-mpp.sh' in main and 'stage-v2.1.1-mpp.sh' in prepare
assert 'workflow_dispatch' in release and "inputs.release_confirmation == 'APPROVE'" in release
assert 'NICOID_OFFICIAL_RELEASE_APPROVED' in script and 'refs/heads/main' in script
assert 'stage_candidate.py' in script and 'verify_dev28.py' in script
assert json.loads((ROOT/'patches-list.json').read_text())['version'] in ('2.1.0','2.1.1'), 'Unexpected release metadata'
assert json.loads((ROOT/'patches-bundle.json').read_text())['version'] in ('2.1.0','2.1.1'), 'Unexpected bundle metadata'
verify_dev8_contracts()
print('PASS: v2.1.1 staging, manual gating, metadata, unchanged user-facing configuration')
print('PASS: immutable Media3 baseline',verify())
