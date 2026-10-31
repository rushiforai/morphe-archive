"""Independent full DEX and manifest contracts for Videoland Android 1.116.4/1627."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import xml.etree.ElementTree as ET
import io
import zipfile

from atv_smali import classes, graph, methods
from verify_videoland_atv import declaration_shape, remove_insertion, verify_manifest

CONTRACTS = json.loads(Path(__file__).with_name('videoland_mobile_contracts.json').read_text())
CONSENT_CONTRACTS = json.loads(Path(__file__).with_name('videoland_mobile_consent_contracts.json').read_text())
CONFIG_KEYS = ('activateTealium', 'playerNPAWv7Enabled', 'playerSnowplowMediaTrackingEnabled')


def config_code():
    rows = []
    for key in CONFIG_KEYS:
        rows += [f'const-string v0, "{key}"',
                 'invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z',
                 'move-result v0', 'if-nez v0, :disabled']
    return '\n'.join(rows + ['goto :original', ':disabled', 'const/4 v0, 0x0',
                             'return v0', ':original', 'nop'])


def edited_graph(original, edits):
    result = list(original)
    for edit in sorted(edits, key=lambda e: e['index'], reverse=True):
        start, removed = edit['index'], edit['remove']
        effect = graph(edit['effect'])
        delta = len(effect) - removed
        def shift(row):
            parts = re.split(r'("(?:\\.|[^"\\])*")', row)
            return ''.join(part if i % 2 else re.sub(r'@(\d+)',
                lambda m: '@' + str(int(m[1]) + (delta if int(m[1]) >= start + removed else 0)), part)
                for i, part in enumerate(parts))
        result = [shift(row) for row in result]
        effect = [re.sub(r'@(\d+)', lambda m: '@' + str(int(m[1]) + start), row) for row in effect]
        result = result[:start] + effect + result[start + removed:]
    return result


def verify_methods(before, after, ads, tracking, consent=False):
    assert before, 'Empty original method inventory'
    assert before.keys() == after.keys(), 'Original method inventory changed'
    tracking = tracking or consent
    selected = {c['owner'] + '->' + c['signature']: c for c in CONTRACTS + CONSENT_CONTRACTS
                if (ads and c['selection'] == 'ads') or (tracking and c['selection'] == 'tracking') or
                (consent and c['selection'] == 'consent')}
    assert selected.keys() <= before.keys(), 'Missing selected method contracts'
    for key, original in before.items():
        current = after[key]
        if key not in selected:
            assert current == original, 'Unrelated method changed: ' + key
            continue
        contract = selected[key]
        assert hashlib.sha256('\n'.join(original).encode()).hexdigest() == contract['graph_sha256'], 'Changed original contract: ' + key
        if 'edits' in contract:
            assert current == edited_graph(original, contract['edits']), 'Incorrect consent effect or original tail: ' + key
            continue
        start = contract['insertion']
        effect = graph(contract['effect'] if contract['effect'] is not None else config_code())
        effect = [re.sub(r'@(\d+)', lambda m: '@' + str(int(m[1]) + start), row) for row in effect]
        assert current[start:start + len(effect)] == effect, 'Missing/incorrect effect: ' + key
        assert remove_insertion(current, start, len(effect)) == original, 'Original tail changed: ' + key
    return len(before)


def verify(original, patched, ads, tracking, consent=False):
    original, patched = Path(original), Path(patched)
    verify_manifest(ET.parse(original / 'AndroidManifest.xml').getroot(),
                    ET.parse(patched / 'AndroidManifest.xml').getroot(), tracking or consent)
    old, new = classes(original), classes(patched)
    assert old.keys() == new.keys(), 'APK class inventory changed'
    # JADX reports 29,621 parsed names; DEX includes 37,941 classes including
    # synthetic/R8 classes. Pin the independent baksmali inventory here.
    assert len(old) == 37941, 'Incomplete or unsupported original class inventory'
    for owner, path in old.items():
        assert declaration_shape(path.read_text()) == declaration_shape(new[owner].read_text()), 'Original class declaration changed: ' + owner
    before = methods(original)
    assert len(before) == 161557, 'Incomplete or unsupported original method inventory'
    return verify_methods(before, methods(patched), ads, tracking, consent)


def verify_payload(original_apks, patched_apk):
    """Require the whole three-APK input and preserve non-DEX packaged payloads."""
    payload = {}
    # APKS merging drops resource API qualifiers already implied by minSdk24.
    def merged_name(name):
        return re.sub(r'-v(\d+)(?=/)', lambda m: '' if int(m[1]) <= 24 else m[0], name)
    with zipfile.ZipFile(original_apks) as package:
        assert set(package.namelist()) == {'base.apk', 'split_config.arm64_v8a.apk', 'split_config.xxxhdpi.apk'}, 'Changed split inventory'
        for member in package.namelist():
            data = package.read(member)
            if member == 'base.apk':
                assert hashlib.sha256(data).hexdigest() == 'c990c0339ac1b8c79031aabccba0046f63ca005266031a18c35051c8b7a73810', 'Unsupported original base APK'
            with zipfile.ZipFile(io.BytesIO(data)) as archive:
                for name in archive.namelist():
                    if name.startswith(('res/', 'assets/', 'lib/')) and not name.endswith('/'):
                        if name == 'res/xml/splits0.xml':
                            # Removed with com.android.vending.splits by the APKS merger.
                            continue
                        blob = archive.read(name)
                        name = merged_name(name)
                        assert name not in payload or payload[name] == blob, 'Conflicting split payload: ' + name
                        payload[name] = blob
    with zipfile.ZipFile(patched_apk) as archive:
        for name, blob in payload.items():
            assert archive.read(name) == blob, 'Packaged payload changed: ' + name
        actual = {name for name in archive.namelist() if name.startswith(('res/', 'assets/', 'lib/')) and not name.endswith('/')}
        assert actual == payload.keys(), 'Resource, asset or native inventory changed'
    return len(payload)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('original')
    parser.add_argument('patched')
    parser.add_argument('--ads', action='store_true')
    parser.add_argument('--tracking', action='store_true')
    parser.add_argument('--consent', action='store_true')
    parser.add_argument('--original-apks', type=Path)
    parser.add_argument('--patched-apk', type=Path)
    args = parser.parse_args()
    print(f'PASS: {verify(args.original, args.patched, args.ads, args.tracking, args.consent)} original Videoland mobile methods and selected effects')
    if args.original_apks or args.patched_apk:
        assert args.original_apks and args.patched_apk, 'Provide both archive arguments'
        print(f'PASS: {verify_payload(args.original_apks, args.patched_apk)} original split resources/assets/native payloads')
