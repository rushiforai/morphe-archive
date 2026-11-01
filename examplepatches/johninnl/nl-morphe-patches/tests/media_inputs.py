"""Pinned public streaming/Medium inputs and preservation of their complete payloads."""
import argparse
import hashlib
import io
import json
from pathlib import Path
import re
import zipfile

PROFILES = json.loads(Path(__file__).with_name('media_input_profiles.json').read_text())


def apk_members(path):
    """Ignore container metadata, never omit an APK split or trust its filename."""
    path = Path(path)
    with zipfile.ZipFile(path) as archive:
        if 'AndroidManifest.xml' in archive.namelist():
            return {'base.apk': path.read_bytes()}
        names = [n for n in archive.namelist() if n.lower().endswith('.apk')]
        assert len(names) == len(set(names)), 'Duplicate APK members'
        assert names, 'Container has no APKs'
        return {n: archive.read(n) for n in names}


def normalized_members(members, base):
    return {('base.apk' if name == base else name): digest for name, digest in members.items()}


def verify_input(path):
    members = apk_members(path)
    digests = {name: hashlib.sha256(data).hexdigest() for name, data in members.items()}
    # The staging pipeline may rename a publisher's package-named base to base.apk.
    matches = []
    for profile in PROFILES:
        expected = normalized_members(profile['members'], profile['base_member'])
        actual = normalized_members(digests, profile['base_member'])
        if actual == expected:
            matches.append(profile)
    assert len(matches) == 1, 'Unsupported or incomplete public media APK/split profile'
    profile = matches[0]
    base_name = profile['base_member'] if profile['base_member'] in members else 'base.apk'
    with zipfile.ZipFile(io.BytesIO(members[base_name])) as base:
        dex = {n: hashlib.sha256(base.read(n)).hexdigest() for n in base.namelist()
               if re.fullmatch(r'classes(?:\d+)?\.dex', n)}
    assert dex == profile['dex_sha256'], 'Changed public media bytecode inventory'
    return profile, members


def verify_payload(original, patched, allowed_changes=()):
    """Preserve every ABI and asset, allowing only explicitly owned resource paths."""
    profile, members = verify_input(original)
    payload = {}
    versions = {}
    floor = profile.get('resource_api_floor', profile['min_sdk'])
    for data in members.values():
        with zipfile.ZipFile(io.BytesIO(data)) as archive:
            for name in archive.namelist():
                if not name.startswith(('res/', 'assets/', 'lib/')) or name.endswith('/'):
                    continue
                if name == 'res/xml/splits0.xml':
                    continue  # Removed with vending split metadata by the merger.
                name_in_archive = name
                qualifier = re.search(r'-v(\d+)(?=/)', name)
                version = int(qualifier[1]) if qualifier and int(qualifier[1]) <= floor else 0
                name = re.sub(r'-v(\d+)(?=/)',
                              lambda m: '' if int(m[1]) <= floor else m[0], name)
                blob = archive.read(name_in_archive)
                # The merger resolves redundant SDK-qualified resources to the
                # newest applicable definition before dropping that qualifier.
                if name in versions and versions[name] > version:
                    continue
                if name in versions and versions[name] < version:
                    del payload[name]
                assert name not in payload or payload[name] == blob, 'Conflicting split payload: ' + name
                payload[name] = blob
                versions[name] = version
    with zipfile.ZipFile(patched) as archive:
        actual = {name for name in archive.namelist()
                  if name.startswith(('res/', 'assets/', 'lib/')) and not name.endswith('/')}
        allowed = set(allowed_changes)
        assert all(name.startswith('res/') for name in allowed), 'Only owned resource edits may be allowed'
        assert actual == payload.keys(), 'Resource, asset or native inventory changed'
        assert allowed <= payload.keys(), 'Unknown allowed resource edit'
        for name, blob in payload.items():
            if name not in allowed:
                assert archive.read(name) == blob, 'Packaged payload changed: ' + name
    return len(payload)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('original', type=Path)
    parser.add_argument('--patched', type=Path)
    parser.add_argument('--allow-resource', action='append', default=[])
    args = parser.parse_args()
    profile, _ = verify_input(args.original)
    print('PASS: publisher input profile ' + profile['filename'])
    if args.patched:
        print(f'PASS: {verify_payload(args.original, args.patched, args.allow_resource)} complete payload entries')
