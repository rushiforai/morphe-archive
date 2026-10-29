"""Independent RTL Nieuws12.7.1 original and selected-output verifier."""
import argparse
import hashlib
from pathlib import Path
import re
import xml.etree.ElementTree as ET

from dex_declarations import DexDeclarations
from rtl_contracts import CONTRACTS, ADS_EDITS, TRACKING_POLICIES, SWITCH_ROUTES
from rtl_vm import parse
from rtl_ads_contracts import ADS_CONTRACTS
from rtl_tracking_contracts import TRACKING_CONTRACTS
from rtl_tracking_effects import restore_tracking, HELPERS
from rtl_startup_contracts import STARTUP_CONTRACTS
from rtl_campaign_contracts import CAMPAIGN_CONTRACTS
from rtl_expert_contracts import EXPERT_NAME, EXPERT_CONTRACTS, EXPERT_HELPER
from verify_dumpert import Smali, canonicalize, absolute_registers, audit_call, smali_declarations
from verify_parool import sdk_classes

NAMES = {'Hide ads', 'Disable tracking', 'Skip consent screens', EXPERT_NAME}
BASE_SHA256 = '85aacb2b5785c338a9801a57fe71f57f41d47bae1ada56ef19fee9b8520299e4'
CONTRACTS = CONTRACTS + ADS_CONTRACTS + TRACKING_CONTRACTS


def restore_owned_edits(code, edits, locals_, enabled):
    """Restore only independently pinned edits; every other original bytecode stays."""
    result = list(code)
    if not enabled:
        return result
    prefixes = [edit for edit in edits if edit['index'] == 0 and edit['remove_count'] == 0]
    assert len(prefixes) <= 1, 'Ambiguous RTL entry prefix'
    if prefixes:
        expected = prefixes[0]['replacement']
        assert [absolute_registers(x, locals_) for x in result[:len(expected)]] == [absolute_registers(x, locals_) for x in expected], 'Missing owned RTL entry prefix'
        result = [re.sub(r'@(\d+)', lambda m: '@' + str(int(m[1]) - len(expected)), line) for line in result[len(expected):]]
    for edit in edits:
        if edit in prefixes:
            continue
        index, count, expected = edit['index'], edit['remove_count'], edit['replacement']
        assert count == len(expected), 'RTL indexed edits preserve instruction count'
        actual = result[index:index + count]
        assert [absolute_registers(x, locals_) for x in actual] == [absolute_registers(x, locals_) for x in expected], 'Missing owned RTL edit at ' + str(index)
        result[index:index + count] = edit['original']
    return result


def verify(root: Path, selected: set[str], apk: Path | None = None):
    assert selected <= NAMES, 'Unknown RTL control'
    expert = EXPERT_NAME in selected
    tracking = bool(selected & {'Disable tracking', 'Skip consent screens', EXPERT_NAME})
    ads = tracking or 'Hide ads' in selected
    consent = bool(selected & {'Skip consent screens', EXPERT_NAME})
    source = Smali(root)
    declarations = DexDeclarations.from_apk(apk) if apk else smali_declarations(root)
    if not selected and apk:
        assert declarations.source_sha256 == BASE_SHA256, 'Expected inspected RTL original APK'
    edits = {}
    for edit in ADS_EDITS:
        edits.setdefault((edit['owner'], edit['signature']), []).append(edit)
    sdk_read, sdk_archive = sdk_classes()
    try:
        for (owner, signature), locals_ in HELPERS.items():
            present = signature in declarations.classes[owner].methods
            assert present == tracking, 'RTL queued helper selection: ' + owner + signature
            if present:
                assert declarations.classes[owner].methods[signature].access_flags == 0x9
                body = source.body(owner, signature)
                assert int(re.search(r'\.locals (\d+)', body)[1]) == locals_, 'RTL queued helper register contract'
                for line in canonicalize(body):
                    audit_call(line, owner, declarations, sdk_read)
        for owner, signature, flags, locals_, count, digest in CONTRACTS:
            declaration = declarations.classes[owner].methods.get(signature)
            assert declaration and declaration.access_flags == flags, 'RTL original access contract: ' + owner + signature
            body = source.body(owner, signature)
            if not flags & (0x100 | 0x400):
                match = re.search(r'\.locals (\d+)', body)
                assert match and int(match[1]) == locals_, 'RTL register contract: ' + owner + signature
            code, position = restore_tracking(body, owner, signature, locals_, tracking, consent)
            if (owner, signature) in SWITCH_ROUTES:
                actual = [{key: position(target) for key, target in table.items()}
                          for table in parse(body).switches.values()]
                assert actual == SWITCH_ROUTES[(owner, signature)], 'Preserve complete RTL merged-discriminator routing'
            owned = edits.get((owner, signature), [])
            if ads:
                for edit in owned:
                    for line in edit['replacement']:
                        audit_call(line, owner, declarations, sdk_read)
            code = restore_owned_edits(code, owned, locals_, ads)
            assert len(code) == count and hashlib.sha256('\n'.join(code).encode()).hexdigest() == digest, 'Preserve RTL original body: ' + owner + signature
        if ads:
            from verify_rtl_ads import verify_ads
            verify_ads(source, declarations, sdk_read)
        if tracking:
            from verify_rtl_tracking import verify_tracking
            verify_tracking(source, declarations, sdk_read, consent)
        from verify_rtl_startup import verify_startup
        verify_startup(source, declarations, sdk_read, consent)
        from verify_rtl_campaigns import verify_campaigns
        verify_campaigns(source, declarations, sdk_read, ads)
        from verify_rtl_expert import verify_expert
        verify_expert(source, declarations, sdk_read, expert)
        for owner, cls in declarations.classes.items():
            for signature in cls.methods:
                if signature.startswith('morphe'):
                    assert (owner, signature) in set(HELPERS) | ({EXPERT_HELPER} if expert else set()), 'Unknown RTL emitted helper: ' + owner + signature
    finally:
        sdk_archive.close()
    manifest = ET.parse(root / 'AndroidManifest.xml').getroot()
    assert manifest.get('package') == 'nl.rtl.rtlnieuws', 'RTL package identity'
    from verify_rtl_resources import verify_resources
    verify_resources(root, tracking, expert)
    print('PASS RTL:', ', '.join(sorted(selected)) or 'original', f'({len(CONTRACTS) + len(STARTUP_CONTRACTS) + len(CAMPAIGN_CONTRACTS) + len(EXPERT_CONTRACTS)} method contracts)')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('root', type=Path)
    parser.add_argument('--apk', type=Path)
    parser.add_argument('-e', action='append', default=[], choices=sorted(NAMES))
    args = parser.parse_args()
    verify(args.root, set(args.e), args.apk)
