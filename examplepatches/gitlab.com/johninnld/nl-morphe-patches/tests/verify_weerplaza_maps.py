"""Verify the Maps credential change independently, without printing credentials."""
import argparse
import hashlib
import os
from pathlib import Path
import re
import xml.etree.ElementTree as ET

ANDROID = '{http://schemas.android.com/apk/res/android}'
ORIGINAL_MAPS = 'b9cf7662fdd322dee6a8491e5e6ce574a750cf08b5cc80b0ce923f6aa92cc1f7'
ORIGINAL_FIREBASE = 'bcb4498b9c6a6303bf66eef929383f0fe0f6a6cd3c974d4fed109349d057f6b2'


def resource(root: Path, path: str) -> Path:
    direct = root / path
    return direct if direct.exists() else root / 'apktool' / path


def expected_community_key() -> str:
    key = os.environ.get('SHARED_MAPS_API_KEY', '').strip()
    if not key:
        source = Path(__file__).resolve().parents[1] / '.community-maps-api-key'
        assert source.is_file(), 'Supply explicit community Maps configuration through SHARED_MAPS_API_KEY or .community-maps-api-key'
        key = source.read_text().strip()
    assert re.fullmatch(r'AIza[0-9A-Za-z_-]{35}', key), 'Invalid community Maps configuration'
    return key


def verify_maps(root: Path, enabled: bool) -> None:
    manifest = ET.parse(resource(root, 'AndroidManifest.xml'))
    entries = [e for e in manifest.iter('meta-data')
               if e.get(ANDROID + 'name') == 'com.google.android.geo.API_KEY']
    assert len(entries) == 1, 'Expected one Maps API-key entry'
    value = entries[0].get(ANDROID + 'value', '')
    if enabled:
        assert value == expected_community_key(), 'Community Maps key was not applied'
    else:
        assert hashlib.sha256(value.encode()).hexdigest() == ORIGINAL_MAPS, 'Original Maps configuration changed'
    strings = ET.parse(resource(root, 'res/values/strings.xml'))
    firebase = [e.text or '' for e in strings.iter('string') if e.get('name') == 'google_api_key']
    assert len(firebase) == 1, 'Expected one Firebase API-key resource'
    assert hashlib.sha256(firebase[0].encode()).hexdigest() == ORIGINAL_FIREBASE, 'Firebase configuration changed'


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded', type=Path)
    parser.add_argument('--patched', action='store_true')
    args = parser.parse_args()
    verify_maps(args.decoded, args.patched)
    print('PASS: Maps credential and unchanged Firebase configuration')
