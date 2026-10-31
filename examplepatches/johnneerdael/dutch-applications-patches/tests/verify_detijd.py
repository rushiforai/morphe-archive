"""Verify emitted De Tijd native controls and authenticated Hermes edit ranges."""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import zipfile

from detijd_native import verify_native
from detijd_navigation import verify_account_tabs, verify_moments_gate

SHA256 = 'e14787df25e9b2529bd18ee6860332ace0742646282bf4471043070cd8bb8c35'
EDITS = json.loads(Path(__file__).with_name('detijd_hermes_edits.json').read_text())
GROUPS = {
    'Hide ads': 'ads', 'Disable tracking': 'tracking',
    'Hide Premium banner': 'premium', 'Skip consent screens': 'consent',
    'Skip onboarding': 'onboarding', 'Read full articles': 'articles',
    'Hide Mijn Tijd (expert)': 'accountTabs',
}


def header(data, index):
    first, second = struct.unpack_from('<II', data, 128 + index * 12)
    at = 128 + index * 12
    if data[at + 11] & 32:
        large = (((second >> 14) & 255) << 24) | (first & 0x1ffffff)
        offset, params, _, size, _, _, _, frame = struct.unpack_from('<8I', data, large)
        return offset, size, frame, params
    return first & 0x1ffffff, second & 0x3fff, data[at + 8], (first >> 25) & 31


def verify_hermes(data, selected):
    assert len(data) == 9112324 and data[:8] == bytes.fromhex('c61fbc03c103191f')
    assert struct.unpack_from('<I', data, 8)[0] == 98
    assert struct.unpack_from('<I', data, 40)[0] == 39206
    assert data[-20:] == hashlib.sha1(data[:-20]).digest(), 'Hermes SHA-1 footer'
    groups = {GROUPS[name] for name in selected}
    if 'consent' in groups:
        groups |= {'ads', 'tracking'}
    if 'tracking' in groups or 'articles' in groups:
        groups.add('ads')
    canonical = bytearray(data)
    for edit in EDITS:
        offset, size = edit['offset'], edit['size']
        assert header(data, edit['id']) == (offset, size, edit['frame'], edit['params'])
        before, after = bytes.fromhex(edit['before']), bytes.fromhex(edit['after'])
        expected = after if edit['group'] in groups else before
        assert data[offset:offset + len(expected)] == expected, (edit['id'], edit['group'], 'selected entry')
        canonical[offset:offset + len(before)] = before
    canonical[-20:] = hashlib.sha1(canonical[:-20]).digest()
    # Authenticate the whole restored bundle, including all API, account,
    # paywall/fullbump, UUID, gift-token, TTS and push code outside these ranges.
    assert hashlib.sha256(canonical).hexdigest() == SHA256, 'Unexpected unowned Hermes mutation'
    for edit in EDITS:
        assert hashlib.sha256(canonical[edit['offset']:edit['offset'] + edit['size']]).hexdigest() == edit['function_sha256']
    print(f'PASS Hermes: {len(EDITS)} function contracts; complete original reconstruction; valid footer')
    return groups


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('root', type=Path)
    parser.add_argument('-e', '--enable', action='append', default=[])
    parser.add_argument('--apk', type=Path)
    args = parser.parse_args()
    selected = set(args.enable)
    assert selected <= GROUPS.keys(), selected - GROUPS.keys()
    data = (args.root / 'assets/index.android.bundle').read_bytes()
    groups = verify_hermes(data, selected)
    print(f'PASS navigation: {verify_account_tabs(data, "accountTabs" in groups)} route/index/label/descriptor cases')
    print(f'PASS Moments: {verify_moments_gate(data, "articles" in groups)} login/offer/feed/weekend cases')
    count = verify_native(args.root, 'ads' in groups, 'tracking' in groups, 'premium' in groups)
    print(f'PASS native: {count} original/retained method contracts and functional manifest state')
    if args.apk:
        with zipfile.ZipFile(args.apk) as archive:
            info = archive.getinfo('assets/index.android.bundle')
            assert archive.read(info) == data, 'APK writer changed Hermes bytes'
    print('PASS De Tijd: ' + (', '.join(sorted(selected)) or 'original'))


if __name__ == '__main__':
    main()
