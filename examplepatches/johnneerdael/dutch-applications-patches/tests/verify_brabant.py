"""Verify Omroep Brabant11.1.0 against independently bound original contracts."""
import argparse
from pathlib import Path
import re
import xml.etree.ElementTree as ET

from brabant_contracts import CONTRACTS, BASE_SHA256
from brabant_ads_contracts import ADS_CONTRACTS
from brabant_tracking_contracts import TRACKING_CONTRACTS
from brabant_startup_contracts import STARTUP_CONTRACTS
from verify_brabant_startup import STARTUP_EDITS
from brabant_smali import canonical
from brabant_ads_edits import ADS_EDITS, ADS_COMPONENTS
from brabant_tracking_edits import TRACKING_EDITS, CONSENT_EDITS, HELPERS
from brabant_effects import restore_edits, restore_alignment
from dex_declarations import DexDeclarations
from verify_dumpert import Smali, smali_declarations, audit_call
from verify_parool import sdk_classes

NAMES = {'Hide ads', 'Disable tracking', 'Skip consent screens'}
CONTRACTS = CONTRACTS + ADS_CONTRACTS + TRACKING_CONTRACTS + STARTUP_CONTRACTS


def check_original(body, row, access_flags, value=None):
    owner, signature, flags, locals_, count, digest = row
    assert access_flags == flags, 'Brabant original access: ' + owner + signature
    if not flags & (0x100 | 0x400):
        match = re.search(r'\.locals (\d+)', body)
        assert match and int(match[1]) == locals_, 'Brabant original register: ' + owner + signature
    value = value or canonical(body)
    assert len(value.code) == count and value.digest() == digest, 'Brabant original body: ' + owner + signature


def verify(root: Path, selected: set[str], apk: Path | None = None):
    assert selected <= NAMES, 'Unknown Brabant control'
    source = Smali(root)
    declarations = DexDeclarations.from_apk(apk) if apk else smali_declarations(root)
    if not selected and apk:
        assert declarations.source_sha256 == BASE_SHA256, 'Expected inspected Brabant original APK'
    assert len(CONTRACTS) >= 36, 'Missing independently inspected Brabant contracts'
    ads = bool(selected)
    tracking = bool(selected & {'Disable tracking', 'Skip consent screens'})
    consent = 'Skip consent screens' in selected
    edits = {}
    for edit in ((TRACKING_EDITS if tracking else []) + (CONSENT_EDITS + STARTUP_EDITS if consent else []) + (ADS_EDITS if ads else [])):
        edits.setdefault((edit['owner'], edit['signature']), []).append(edit)
    sdk_read, sdk_archive = sdk_classes()
    try:
        for row in CONTRACTS:
            owner, signature = row[:2]
            declaration = declarations.classes[owner].methods.get(signature)
            assert declaration, 'Missing Brabant original method: ' + owner + signature
            body = source.body(owner, signature)
            value = canonical(body)
            if (owner, signature) in edits:
                owned = edits[owner, signature]
                # All dependency effects are one original-index coordinate space.
                value = restore_edits(value, owned, row[3])
                value = restore_alignment(value, row[4])
                for edit in owned:
                    for line in edit['replacement']:
                        audit_call(line, owner, declarations, sdk_read)
            check_original(body, row, declaration.access_flags, value)
        if ads:
            from verify_brabant_ads import verify_ads
            verify_ads(source, declarations, sdk_read)
        for key, locals_ in HELPERS.items():
            owner, signature = key
            declaration = declarations.classes[owner].methods.get(signature)
            assert bool(declaration) == tracking, 'Brabant helper selection: ' + str(key)
            if not tracking:
                continue
            body = source.body(*key)
            assert declaration.access_flags == 9 and re.search(r'\.locals (\d+)', body)[1] == str(locals_), 'Brabant helper header'
            value = canonical(body)
            assert not value.handlers and not value.switches and not value.arrays, 'Brabant helper graph'
            for line in value.code:
                audit_call(line, owner, declarations, sdk_read)
        for owner in {key[0] for key in HELPERS}:
            actual = {(owner, signature) for signature in declarations.classes[owner].methods if signature.startswith('morphe')}
            expected = {key for key in HELPERS if key[0] == owner} if tracking else set()
            assert actual == expected, 'Unexpected Brabant policy helper: ' + owner
        if tracking:
            from verify_brabant_tracking import verify_tracking
            verify_tracking(source, declarations, sdk_read, consent)
        from verify_brabant_startup import verify_startup
        verify_startup(source, declarations, sdk_read, consent)
    finally:
        sdk_archive.close()
    from verify_brabant_startup import verify_resources as verify_startup_resources
    verify_startup_resources(root, consent)
    manifest = ET.parse(root / 'AndroidManifest.xml').getroot()
    assert manifest.get('package') == 'nl.omroepbrabant.android', 'Brabant package identity'
    app = manifest.find('application')
    android = '{http://schemas.android.com/apk/res/android}'
    for tag, name in ADS_COMPONENTS:
        nodes = [node for node in app.findall(tag) if node.get(android + 'name') == name]
        assert len(nodes) == 1 and (nodes[0].get(android + 'enabled') == 'false') == ads, 'Brabant ad job component: ' + name
    from brabant_resources import verify_resources
    verify_resources(root, ads, tracking)
    print('PASS Brabant:', ', '.join(sorted(selected)) or 'original', f'({len(CONTRACTS)} method contracts)')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('root', type=Path)
    parser.add_argument('--apk', type=Path)
    parser.add_argument('-e', action='append', default=[], choices=sorted(NAMES))
    args = parser.parse_args()
    verify(args.root, set(args.e), args.apk)
