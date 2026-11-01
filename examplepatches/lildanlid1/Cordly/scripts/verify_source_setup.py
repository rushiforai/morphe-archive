#!/usr/bin/env python3
"""Validate that Cordly's Morphe source configuration matches the live repository."""
from pathlib import Path
import json
import re
import sys
from urllib.parse import parse_qs, urlparse

ROOT = Path(__file__).resolve().parents[1]
REPO = 'lildanlid1/Cordly'
LINK = f'https://morphe.software/add-source?github={REPO}'
README = (ROOT / 'README.md').read_text(encoding='utf-8')
WORKFLOW = (ROOT / '.github/workflows/build.yml').read_text(encoding='utf-8')
VERSION = dict(line.split('=',1) for line in (ROOT/'gradle.properties').read_text().splitlines() if '=' in line and not line.lstrip().startswith('#'))
VERSION = {key.strip():value.strip() for key,value in VERSION.items()}
assert VERSION['releaseTag'] == f"v{VERSION['version']}"
assert VERSION['releaseAsset'] == f"patches-{VERSION['version']}.mpp"
assert LINK in README
assert 'assets/add-to-morphe.svg' in README
assert (ROOT/'.github/assets/add-to-morphe.svg').is_file()
assert "python3 scripts/build.py --metadata-only" in WORKFLOW
assert "git add patches-bundle.json patches-list.json" in WORKFLOW
assert (ROOT/'patches/src/main/kotlin/app/venus/patches/BrandingPatches.kt').exists() is False
assert 'Source: https://github.com/lildanlid1/Cordly' in (ROOT/'scripts/build.py').read_text()
if '--published' in sys.argv:
    manifest = json.loads((ROOT/'patches-bundle.json').read_text())
    patches = json.loads((ROOT/'patches-list.json').read_text())
    assert manifest['version'] == VERSION['version']
    assert manifest['download_url'] == f'https://github.com/{REPO}/releases/download/{VERSION["releaseTag"]}/{VERSION["releaseAsset"]}'
    assert patches['version'] == VERSION['version']
    assert isinstance(patches['patches'],list) and patches['patches']
print('Cordly source configuration valid' + (' (published metadata)' if '--published' in sys.argv else ''))
