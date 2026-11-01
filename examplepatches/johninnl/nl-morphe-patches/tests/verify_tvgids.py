"""Verify TVgids original machine-code baselines in the isolated CPU environment."""
import argparse
import hashlib
from pathlib import Path
import zipfile
try:
    from tvgids_android_contracts import verify_android_baseline
except ModuleNotFoundError:
    verify_android_baseline = None

try:
    from tvgids_ads_vm import run_app_runner, run_slot
except ModuleNotFoundError:
    run_app_runner = run_slot = None
try:
    from tvgids_tracking_vm import run_empty_set
except ModuleNotFoundError:
    run_empty_set = None


from tvgids_native_contracts import ORIGINAL_SHA, NATIVE_SHA


def verify_original_native(apk, expect_ads_disabled=False):
    assert run_slot is not None, 'TVgids real instruction-path fixtures are missing'
    assert run_empty_set is not None, 'TVgids original async completion fixture is missing'
    assertions = 0
    with zipfile.ZipFile(apk) as original:
        for abi, digest in NATIVE_SHA.items():
            image = original.read(f'lib/{abi}/libapp.so')
            assert hashlib.sha256(image).hexdigest() == digest, f'Unexpected original image: {abi}'
            absent = run_slot(abi, image, has_widget=False)
            assert absent['widget'] == 'SizedBox' and absent['width'] == 0 and absent['height'] == 0, (abi, absent)
            assert absent['calls'] == ['context'], (abi, absent)
            configured = run_slot(abi, image, has_widget=True)
            if expect_ads_disabled:
                assert configured['widget'] == 'SizedBox', f'{abi}: configured slot still creates {configured["widget"]}'
            else:
                assert configured['widget'] == 'Consumer<AdsProvider>', (abi, configured)
                assert configured['calls'] == ['context', 'closure', 'consumer'], (abi, configured)
            runner = run_app_runner(abi, image)
            assert runner['calls'] == ['runApp'] and runner['returned_null'], (abi, runner)
            future = run_empty_set(abi, image)
            assert future['completed'] and future['completion_count'] == 1 and future['value_is_null'], (abi, future)
            assert future['calls'] == ['initAsync', 'closure', 'delayed', 'returnAsync'], (abi, future)
            assert future['delays'] == [500000], (abi, future)
            assertions += 9
            print(f'PASS {abi}: real widget paths, app-runner and async completion')
    print(f'SUCCESS TVgids original native behavioral assertions={assertions}')


def verify(root, apk, original, selected):
    assert selected <= {'Hide ads', 'Disable tracking', 'Skip consent screens'}, 'Unknown TVgids selection'
    assert hashlib.sha256(original.read_bytes()).hexdigest() == ORIGINAL_SHA, 'Unexpected trusted original APK'
    from tvgids_ad_edits import AD_VIEW_EDITS
    from tvgids_osb_edits import OSB_EDITS
    from tvgids_comscore_edits import COMSCORE_EDITS
    from tvgids_sentry_edits import SENTRY_EDITS
    from tvgids_facebook_edits import FB_EDITS
    from tvgids_firebase_edits import FIREBASE_EDITS
    from tvgids_persisted_edits import PERSISTED_EDITS
    from tvgids_android_vm import verify_ad_views
    from tvgids_osb_vm import OsbFixture, verify_osb
    from tvgids_comscore_android_vm import ComscoreFixture, verify_comscore_android
    from tvgids_sentry_android_vm import SentryFixture, verify_sentry_android
    from tvgids_sdk_vm import SdkFixture, verify_facebook
    from tvgids_firebase_vm import FirebaseFixture, verify_firebase
    from tvgids_persisted_vm import PersistedFixture, verify_persisted
    from tvgids_consent_vm import ConsentFixture, verify_consent
    from tvgids_comscore_vm import verify_comscore_callers
    from tvgids_sentry_vm import verify_sentry_callers
    from tvgids_tracking_vm import run_background_continuation, BackgroundIdentifierAdmission
    from tvgids_consent_native_vm import verify_consent_callers
    from verify_dumpert import Smali
    from dex_declarations import DexDeclarations
    from verify_parool import sdk_classes
    consent = 'Skip consent screens' in selected
    tracking = consent or 'Disable tracking' in selected
    ads = tracking or 'Hide ads' in selected
    edits = list(AD_VIEW_EDITS) if ads else []
    if tracking:
        edits += OSB_EDITS+COMSCORE_EDITS+SENTRY_EDITS+FB_EDITS+FIREBASE_EDITS+PERSISTED_EDITS
    verify_android_baseline(root, apk, edits, ads=ads, tracking=tracking, consent=consent, original_apk=original)
    source = Smali(root)
    declarations = DexDeclarations.from_apk(apk)
    for owner, signature in [('La83;', 'morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;'),
            ('Luj1;', 'morpheEndOfStream()V')]:
        assert (signature in declarations.classes[owner].methods) == tracking, 'Unexpected tracking helper selection'
    sdk, archive = sdk_classes()
    try:
        verify_ad_views(source, declarations, sdk, ads)
        for group in ('ids', 'events', 'location', 'queue', 'late', 'channel'):
            verify_osb(OsbFixture(source, declarations, sdk), tracking, group)
        for group in ('channels', 'stream', 'late', 'cancel'):
            verify_comscore_android(ComscoreFixture(source, declarations, sdk), tracking, group)
        for group in ('config', 'init', 'providers'):
            verify_sentry_android(SentryFixture(source, declarations, sdk), tracking, group)
        for group in ('flags', 'guid', 'events', 'queues', 'install', 'timers', 'logger'):
            verify_facebook(SdkFixture(source, declarations, sdk), tracking, group)
        for group in ('flags', 'received', 'events', 'export', 'functional'):
            verify_firebase(FirebaseFixture(source, declarations, sdk), tracking, group)
        verify_persisted(PersistedFixture(source, declarations, sdk), tracking)
        verify_consent(ConsentFixture(source, declarations, sdk), tracking)
    finally:
        archive.close()
    if ads:
        from verify_tvgids_boxes import verify_native_ad_paths
        verify_native_ad_paths(original, apk, tracking=tracking, consent=consent)
    else:
        verify_original_native(apk)
    with zipfile.ZipFile(original) as before, zipfile.ZipFile(apk) as after:
        for abi in NATIVE_SHA:
            name = f'lib/{abi}/libapp.so'
            original_image, output = before.read(name), after.read(name)
            try:
                background = run_background_continuation(abi, original_image, output)
            except BackgroundIdentifierAdmission:
                assert not tracking, 'Background device identifier admission remains'
                background = 'original identifier admission'
            else:
                assert tracking, 'Unselected background behavior changed'
            comscore = verify_comscore_callers(abi, original_image, output, tracking)
            sentry = verify_sentry_callers(abi, original_image, output, tracking)
            consent_checks = verify_consent_callers(abi, original_image, output, consent)
            print(f'PASS {abi}: background={background}; Comscore={comscore}; Sentry={sentry}; consent={consent_checks}')
    print('PASS TVgids: '+(', '.join(sorted(selected)) or 'original'))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('root', nargs='?', type=Path)
    parser.add_argument('--apk', type=Path)
    parser.add_argument('--original', required=True, type=Path)
    parser.add_argument('--decoded', type=Path, help='Legacy original-baseline decoded tree')
    parser.add_argument('--expect-ads-disabled', action='store_true', help='Original-baseline negative probe')
    parser.add_argument('-e', choices=['Hide ads', 'Disable tracking', 'Skip consent screens'], action='append', default=[])
    args = parser.parse_args()
    assert hashlib.sha256(args.original.read_bytes()).hexdigest() == ORIGINAL_SHA, 'Unexpected original APK'
    if args.root is not None:
        if args.apk is None:
            parser.error('--apk is required with a decoded tree')
        verify(args.root, args.apk, args.original, set(args.e))
    else:
        if args.decoded:
            verify_android_baseline(args.decoded, args.original)
        verify_original_native(args.original, args.expect_ads_disabled)


if __name__ == '__main__':
    main()
