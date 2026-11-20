#!/usr/bin/env python3
"""Stable v2.1.2 release contract against the validated dev.14 source."""
from pathlib import Path
import json,re,subprocess,sys
ROOT=Path(__file__).resolve().parents[3]
REV=Path(__file__).resolve().parent
sys.path.insert(0,str(REV))
from stage_candidate import CANDIDATE_VERSION,REVIEWED_VERSION,VERSION_OWNERS,verify_dev8_contracts
assert re.search(r'(?m)^version\s*=\s*2\.1\.2$',(ROOT/'gradle.properties').read_text())
assert CANDIDATE_VERSION=='2.1.2' and REVIEWED_VERSION=='2.1.0-dev.28'
assert len(VERSION_OWNERS)==2
# The approved backup feature is an incremental patch, not a 2.2.0 minor release.
release_config=json.loads((ROOT/'.releaserc').read_text())
release_rules=release_config['plugins'][0][1]['releaseRules']
assert {'type':'feat','subject':'back up local playlists and edited video titles with settings','release':'patch'} in release_rules
assert 'project.version.toString() != "2.1.2"' in (ROOT/'patches/build.gradle.kts').read_text()
notes=(ROOT/'.github/release-notes/v2.1.2.md').read_text()
assert notes.startswith('## 2.1.2')
assert all(header in notes for header in ('### ✨ New Features','### 🐛 Bug Fixes','### 🔧 Improvements'))
assert 'issues/139' not in notes and 'issues/141' not in notes
assert 'authentication credentials, session tokens' not in notes
assert 'Add explanatory descriptions to **Export settings** and **Import settings**' in notes
assert all(json.loads((ROOT/name).read_text())['version'] in ('2.1.1','2.1.2') for name in ('patches-list.json','patches-bundle.json'))
for path,needle in [
  ('.github/workflows/release.yml','stage-v2.1.2-mpp.sh'),
  ('.github/workflows/verify-main.yml','stage-v2.1.2-mpp.sh'),
  ('.releaserc','stage-v2.1.2-mpp.sh'),
  ('.github/scripts/stage-v2.1.2-mpp.sh','stage_candidate.py'),
  ('.github/scripts/verify-release-mpp.py','V212_MARKERS')
]:
    assert needle in (ROOT/path).read_text(),path
src=ROOT/'porting/revisions/v2.1.2-dev.14'
assert (src/'PlaylistBackup213.java').is_file()
verify_dev8_contracts()
subprocess.run([sys.executable,str(src/'tests/test_backup_playlist.py')],check=True)
print('PASS: v2.1.2 stable release source matches verified dev.14 and required immutability gate')
