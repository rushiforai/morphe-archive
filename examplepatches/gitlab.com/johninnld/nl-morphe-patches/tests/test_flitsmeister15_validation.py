"""Focused version routing, selector wiring and emitted-oracle negative controls."""
import importlib.util
from pathlib import Path
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import Mock, patch
import zipfile

import verify_flitsmeister15 as oracle
from verify_flitsmeister import NAMES

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('flitsmeister_validation_targets', ROOT / 'scripts/validate_targets.py')
targets = importlib.util.module_from_spec(spec)
spec.loader.exec_module(targets)


class RoutingTests(unittest.TestCase):
    def test_apk_forwarded_without_changing_public_selections(self):
        decoded = Path('/decoded/filename-14.17')
        apk = Path('/patched.apk')
        self.assertEqual(set(targets.APPS['flitsmeister']), NAMES)
        selections = targets.patch_selections(targets.APPS['flitsmeister'], None)
        self.assertEqual(len(selections), 10)
        self.assertEqual({selection[0] for selection in selections[:-1]}, NAMES)
        self.assertEqual(set(selections[-1]), NAMES)
        for selected in [set(), *({name} for name in NAMES), set(NAMES)]:
            command = targets.verifier_command('flitsmeister', decoded, selected, apk=apk)
            self.assertEqual(command[:3], [targets.sys.executable, 'tests/verify_flitsmeister.py', str(decoded)])
            self.assertEqual(command[3:5], ['--apk', str(apk)])
            self.assertEqual(command[5:], [part for name in sorted(selected) for part in ('-e', name)])
        self.assertNotIn('--apk', targets.verifier_command('flitsmeister', decoded, set()))

    def test_profile_uses_decoded_package_and_version(self):
        with tempfile.TemporaryDirectory(prefix='misleading-14.17-') as directory:
            root = Path(directory)
            (root / 'AndroidManifest.xml').write_text('<manifest package="nl.flitsmeister"/>')
            (root / 'apktool.yml').write_text("versionInfo:\n  versionName: '15.0'\n  versionCode: '1289'\n")
            self.assertEqual(oracle.decoded_profile(root), ('15.0', '1289'))
            (root / 'AndroidManifest.xml').write_text('<manifest package="wrong.package"/>')
            with self.assertRaisesRegex(AssertionError, 'package'):
                oracle.decoded_profile(root)

    def test_manifest_and_apktool_version_disagreement_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / 'AndroidManifest.xml').write_text(
                '<manifest xmlns:android="http://schemas.android.com/apk/res/android" '
                'package="nl.flitsmeister" android:versionName="14.17"/>')
            (root / 'apktool.yml').write_text('versionInfo:\n  versionName: 15.0\n')
            with self.assertRaisesRegex(AssertionError, 'Conflicting decoded versionName'):
                oracle.decoded_profile(root)

    def test_both_sdk_variants_and_only_selected_permission_removals(self):
        import xml.etree.ElementTree as ET
        for minimum in (29, 32):
            for selected in (set(), {'Fix PairIP startup'}, {'Disable tracking'}, set(NAMES)):
                with tempfile.TemporaryDirectory() as directory:
                    root = Path(directory)
                    manifest = ET.Element('manifest', {'package': 'nl.flitsmeister'})
                    removed = {'com.android.vending.CHECK_LICENSE'} if selected else set()
                    if 'Disable tracking' in selected:
                        removed |= {'com.google.android.gms.permission.AD_ID',
                                    'android.permission.ACCESS_ADSERVICES_AD_ID',
                                    'android.permission.ACCESS_ADSERVICES_ATTRIBUTION'}
                    for tag, attributes in oracle.PERMISSIONS:
                        if dict(attributes).get(oracle.A + 'name') not in removed:
                            ET.SubElement(manifest, tag, dict(attributes))
                    app = ET.SubElement(manifest, 'application')
                    if not selected:
                        ET.SubElement(app, 'activity', {oracle.A + 'name': 'com.pairip.licensecheck.LicenseActivity'})
                    ET.ElementTree(manifest).write(root / 'AndroidManifest.xml')
                    (root / 'apktool.yml').write_text(
                        f'sdkInfo:\n  minSdkVersion: {minimum}\nversionInfo:\n  versionName: 15.0\n  versionCode: 1289\n')
                    self.assertEqual(oracle.verify_manifest(root, selected), minimum)
                    # Removing any unrelated retained permission must fail.
                    manifest.remove(manifest[0])
                    ET.ElementTree(manifest).write(root / 'AndroidManifest.xml')
                    with self.assertRaisesRegex(AssertionError, 'permissions may change'):
                        oracle.verify_manifest(root, selected)

    def test_all_nine_individual_and_combined_leaf_flags(self):
        for selected in [set(), *({name} for name in NAMES), set(NAMES)]:
            calls = {}
            def load(name):
                calls[name] = Mock()
                return SimpleNamespace(verify=calls[name])
            with patch.object(oracle.importlib, 'import_module', side_effect=load):
                self.assertEqual(oracle.verify_leaves(Path('/decoded'), selected), 7)
            unlock, notices, ads, tracking, partner, guest, navigation = [name in selected for name in (
                'Unlock Pro', 'Hide Pro notices', 'Hide ads', 'Disable tracking',
                'Disable partner services', 'Guest mode', 'Broadcast navigation data')]
            wanted = {
                'verify_flitsmeister15_features': (unlock, notices, ads),
                'verify_flitsmeister15_ads': (ads, unlock, partner),
                'verify_flitsmeister15_tracking': (tracking,),
                'verify_flitsmeister15_telemetry_leaves': (tracking,),
                'verify_flitsmeister15_partner_leaves': (partner, notices, ads),
                'verify_flitsmeister15_guest': (guest,),
                'verify_flitsmeister_navigation15': (navigation,),
            }
            self.assertEqual(set(calls), set(wanted))
            for name, flags in wanted.items():
                calls[name].assert_called_once_with(Path('/decoded'), *flags)


class OracleTests(unittest.TestCase):
    def test_payload_and_handler_regions_are_counted_and_hashed(self):
        body = '''.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.locals 2
:begin
const/4 v0, 0x0
packed-switch v0, :data
return-void
:end
:handler
move-exception v1
throw v1
.catchall {:begin .. :end} :handler
:data
.packed-switch 0x0
    :end
.end packed-switch
.end method'''
        self.assertEqual(oracle.shape(body), [5, 6, 1, 1, 1])
        self.assertNotEqual(oracle.body_hash(body), oracle.body_hash(body.replace(':begin .. :end', ':begin .. :data')))
        self.assertNotEqual(oracle.body_hash(body), oracle.body_hash(body.replace('const/4 v0, 0x0', 'const/4 v0, 0x1')))

    def test_frozen_inventory_distinguishes_twenty_bodies_and_two_dispatchers(self):
        self.assertEqual(len(oracle.WRAPPERS), 22)
        functional = {name for name, value in oracle.WRAPPERS.items() if 'restored' in value}
        self.assertEqual(len(functional), 20)
        self.assertEqual(len({program for value in oracle.WRAPPERS.values() for program in value['programs']}), 20)
        self.assertEqual(len(oracle.HOLDERS), 32)
        self.assertEqual(sum(value[0] for value in oracle.HOLDERS.values()), 1421)
        self.assertNotEqual(oracle.PROTECTED_MAPLIBRE, oracle.STOCK_MAPLIBRE)
        self.assertTrue(all(oracle.WRAPPERS[name]['restored'][1][1] > 50 for name in functional))

    def test_selected_requires_actual_native_payload(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            with self.assertRaisesRegex(AssertionError, 'needs native library'):
                oracle.verify_native(root, True)
            apk = root / 'wrong.apk'
            with zipfile.ZipFile(apk, 'w') as archive:
                archive.writestr('lib/arm64-v8a/libmaplibre.so', b'protected-or-wrong-library')
            with self.assertRaisesRegex(AssertionError, 'Actual APK arm64'):
                oracle.verify_native(root, True, apk)
            self.assertEqual(oracle.verify_native(root, False), ['unavailable in base-only publisher input'])

class PreferenceTests(unittest.TestCase):
    CATALOG = '''.method static constructor <clinit>()V
.locals 5
new-instance v0, Ltuh;
const-wide/16 v1, -0x1
invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
move-result-object v1
const-string v3, "pref_user_updated_to_version"
iput-object v3, v0, Ltuh;->a:Ljava/lang/String;
iput-object v1, v0, Ltuh;->b:Ljava/lang/Object;
sput-object v0, Lt28;->M:Ltuh;
new-instance v0, Ltuh;
sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
const-string v3, "pref_show_vehicle_profile_bottom_sheet"
iput-object v3, v0, Ltuh;->a:Ljava/lang/String;
iput-object v1, v0, Ltuh;->b:Ljava/lang/Object;
sput-object v0, Lt28;->N:Ltuh;
return-void
.end method'''

    @staticmethod
    def launcher(first='M'):
        return ('sget-object v0, Lt28;->' + first + ':Ltuh;\n'
                'invoke-static {v0, p0}, Lnl/flitsmeister/launcher/presentation/LauncherActivity;->d$007(Ltuh;Landroid/content/Context;)J\n'
                'move-result-wide v1\n' +
                '\n'.join('sget-object v0, Lt28;->' + field + ':Ltuh;' for field in ('M', 'D0', 'D0', 'D0', 'D0')))

    def test_literal_key_decoder_distinguishes_boxed_long_and_boolean(self):
        bindings = oracle.preference_bindings(self.CATALOG)
        self.assertEqual(bindings['M'], ('pref_user_updated_to_version', 'Long', -1))
        self.assertEqual(bindings['N'], ('pref_show_vehicle_profile_bottom_sheet', 'Boolean', True))
        bindings['D0'] = ('pref_fm_payment_mandate', 'String', '')
        oracle.verify_preference_sites(self.launcher(), 'Launcher', bindings)
        with self.assertRaisesRegex(AssertionError, 'expected Long pref_user_updated_to_version'):
            oracle.verify_preference_sites(self.launcher('N'), 'Launcher', bindings)

    def test_long_default_value_and_same_typed_wrong_key_are_rejected(self):
        bindings = dict(oracle.PREFERENCE_BINDINGS)
        bindings['M'] = ('pref_user_updated_to_version', 'Long', 0)
        with self.assertRaisesRegex(AssertionError, 'default=-1'):
            oracle.verify_preference_sites(self.launcher(), 'Launcher', bindings)
        bindings = dict(oracle.PREFERENCE_BINDINGS)
        bindings['D0'] = ('unrelated_string_preference', 'String', '')
        with self.assertRaisesRegex(AssertionError, 'pref_fm_payment_mandate'):
            oracle.verify_preference_sites(self.launcher(), 'Launcher', bindings)

    def test_each_main_preference_uses_its_stored_key(self):
        fields = ('u1', 'w1', 'H1', 'G1', 'P0')
        body = '\n'.join('sget-object v0, Lt28;->' + field + ':Ltuh;' for field in fields)
        oracle.verify_preference_sites(body, 'Main', oracle.PREFERENCE_BINDINGS)
        for field, wrong in zip(fields, ('v1', 'x1', 'I1', 'H1')):
            with self.assertRaisesRegex(AssertionError, 'Main preference site'):
                oracle.verify_preference_sites(body.replace('->' + field + ':', '->' + wrong + ':'),
                                               'Main', oracle.PREFERENCE_BINDINGS)


class ApplicationJobTests(unittest.TestCase):
    @staticmethod
    def instructions(tracking=False):
        instructions = ['nop'] * 230
        instructions[92:100] = oracle.APPLICATION_JOB
        instructions[100:109] = oracle.APPLICATION_COUNTRY
        if tracking:
            instructions[92] = 'goto @100'
        return instructions

    def test_job_runs_without_tracking_control_and_is_skipped_only_when_selected(self):
        for tracking in (False, True):
            oracle.verify_application_job_instructions(self.instructions(tracking), tracking)
        with self.assertRaisesRegex(AssertionError, 'skip only when Disable tracking'):
            oracle.verify_application_job_instructions(self.instructions(True), False)
        with self.assertRaisesRegex(AssertionError, 'skip only when Disable tracking'):
            oracle.verify_application_job_instructions(self.instructions(False), True)

    def test_wrong_map_runnable_or_constructor_is_rejected(self):
        for tracking in (False, True):
            for index, replacement in (
                (97, 'new-instance v6, Lm85;'),
                (98, 'invoke-direct {v6, v0, v4}, Lm85;-><init>(Lq85;Ljava/util/Map;)V'),
            ):
                instructions = self.instructions(tracking)
                instructions[index] = replacement
                with self.assertRaisesRegex(AssertionError, 'exact h85/q85/String'):
                    oracle.verify_application_job_instructions(instructions, tracking)

    def test_lost_job_and_changed_country_continuation_are_rejected(self):
        instructions = self.instructions()
        del instructions[92:100]
        with self.assertRaisesRegex(AssertionError, 'Application String user-ID job'):
            oracle.verify_application_job_instructions(instructions, False)
        for tracking in (False, True):
            instructions = self.instructions(tracking)
            instructions[108] = 'return-void'
            with self.assertRaisesRegex(AssertionError, 'country-report continuation'):
                oracle.verify_application_job_instructions(instructions, tracking)

    def test_application_whole_body_selection_profiles_are_distinct(self):
        descriptor = 'Lnl/flitsmeister/FlitsmeisterApplication;->onCreate()V'
        original = oracle.WRAPPERS[descriptor]
        self.assertEqual(original['original'][1], [6, 8, 0, 0, 0])
        self.assertEqual(original['restored'][1], [21, 230, 1, 0, 0])
        for selected in [set(), *({name} for name in NAMES), set(NAMES)]:
            expected = (oracle.VARIANTS['application-tracking'] if 'Disable tracking' in selected
                        else original['restored'][0])
            self.assertEqual(oracle.expected_restored_hash(descriptor, selected), expected)
        self.assertNotEqual(original['restored'][0], oracle.VARIANTS['application-tracking'])



if __name__ == '__main__':
    unittest.main()
