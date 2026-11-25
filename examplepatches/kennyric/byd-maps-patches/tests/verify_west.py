"""Verify West 20.1 original and emitted selections against original DEX graphs."""
import argparse
from pathlib import Path
import re

from brabant_effects import restore_alignment, restore_edits
from brabant_smali import canonical
from dex_declarations import DexDeclarations
from verify_dumpert import Smali, audit_call
from verify_parool import sdk_classes
from west_ads_contracts import ADS_CONTRACTS, ADS_EDITS
from west_ads_verify import verify_ads
from west_consent import verify_consent, verify_resources as verify_consent_resources
from west_consent_contracts import CONSENT_CONTRACTS
from west_consent_edits import CONSENT_EDITS
from west_resources import BASE_SHA256, verify_resources
from west_retained_contracts import RETAINED_CONTRACTS
from west_tracking_edits import TRACKING_CONTRACTS, TRACKING_EDITS, HELPERS, prepare_edits
from west_startup_feed_contracts import STARTUP_FEED_CONTRACTS
from west_startup_feed import STARTUP_HELPERS, verify_startup_feed

NAMES = {'Hide ads', 'Disable tracking', 'Skip consent screens'}


def contracts():
    rows = {}
    for row in RETAINED_CONTRACTS + tuple(ADS_CONTRACTS) + tuple(TRACKING_CONTRACTS) + tuple(CONSENT_CONTRACTS) + STARTUP_FEED_CONTRACTS:
        key = row[:2]
        assert key not in rows or rows[key] == row, 'Conflicting original West contract: ' + str(key)
        rows[key] = row
    return rows


def check_original(body, row, flags, value=None):
    owner, signature, expected_flags, locals_, count, digest = row
    assert flags == expected_flags, 'West original access: ' + owner + signature
    if not flags & (0x100 | 0x400):
        match = re.search(r'\.locals (\d+)', body)
        assert match and int(match[1]) == locals_, 'West original registers: ' + owner + signature
    value = value or canonical(body)
    assert len(value.code) == count and value.digest() == digest, 'West original graph: ' + owner + signature


def verify(root: Path, selected: set[str], apk: Path):
    assert selected <= NAMES, 'Unknown West control'
    declarations = DexDeclarations.from_apk(apk)
    if not selected:
        assert declarations.source_sha256 == BASE_SHA256, 'Expected inspected original West base APK'
    source = Smali(root)
    rows = contracts()
    ads = bool(selected)
    tracking = bool(selected & {'Disable tracking', 'Skip consent screens'})
    consent = 'Skip consent screens' in selected
    edits = prepare_edits((ADS_EDITS if ads else []) + (TRACKING_EDITS if tracking else []) +
                          (CONSENT_EDITS if consent else []))
    by_method = {}
    for edit in edits:
        key = edit['owner'], edit['signature']
        assert key in rows, 'Unbound West mutation: ' + str(key)
        by_method.setdefault(key, []).append(edit)
    sdk_read, sdk_archive = sdk_classes()
    try:
        for key, row in rows.items():
            owner, signature = key
            declaration = declarations.classes[owner].methods.get(signature)
            assert declaration, 'Missing original West declaration: ' + str(key)
            body = source.body(*key)
            value = canonical(body)
            if key in by_method:
                value = restore_edits(value, by_method[key], row[3])
                for edit in by_method[key]:
                    for line in edit['replacement']:
                        audit_call(line, owner, declarations, sdk_read)
            value = restore_alignment(value, row[4])
            check_original(body, row, declaration.access_flags, value)

        helper_selection = {key: (locals_, tracking) for key, locals_ in HELPERS.items()}
        helper_selection.update({key: (locals_, consent) for key, locals_ in STARTUP_HELPERS.items()})
        for key, (locals_, enabled) in helper_selection.items():
            owner, signature = key
            declaration = declarations.classes[owner].methods.get(signature)
            assert bool(declaration) == enabled, 'West helper selection: ' + str(key)
            if not enabled:
                continue
            body = source.body(*key)
            assert declaration.access_flags == 9 and int(re.search(r'\.locals (\d+)', body)[1]) == locals_, 'West helper header'
            value = canonical(body)
            assert not value.handlers and not value.switches and not value.arrays, 'Unexpected helper control data'
            for line in value.code:
                audit_call(line, owner, declarations, sdk_read)
        for owner in {key[0] for key in helper_selection}:
            actual = {(owner, sig) for sig in declarations.classes[owner].methods if sig.startswith('morphe')}
            expected = {key for key, (_, enabled) in helper_selection.items() if key[0] == owner and enabled}
            assert actual == expected, 'Unexpected West helper inventory'

        if ads:
            verify_ads(source, declarations, sdk_read, verify_graphs=False)
        if tracking:
            from west_tracking_effects import verify_tracking
            verify_tracking(root, declarations, sdk_read)
        verify_consent(source, declarations, sdk_read, consent)
        verify_startup_feed(source, declarations, sdk_read, ads, consent)
    finally:
        sdk_archive.close()
    verify_resources(root, ads, tracking)
    verify_consent_resources(root, consent)
    print('PASS West:', ', '.join(sorted(selected)) or 'original', f'({len(rows)} original method graphs)')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('root', type=Path)
    parser.add_argument('--apk', type=Path, required=True)
    parser.add_argument('-e', action='append', default=[], choices=sorted(NAMES))
    args = parser.parse_args()
    verify(args.root, set(args.e), args.apk)
