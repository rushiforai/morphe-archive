"""Admission/report checks for the already-installed Vela adapter probe runner."""
import copy
import importlib.util
import json
from pathlib import Path
import sys
import unittest
from unittest import mock

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'scripts/navigation-alerts'))
try:
    spec = importlib.util.spec_from_file_location('vela_production_probe', ROOT / 'scripts/navigation-alerts/run_vela_production_probe.py')
    api = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(api)
finally:
    sys.path.pop(0)


class VelaProductionProbeTests(unittest.TestCase):
    def test_device_profiles_cannot_claim_each_others_or_physical_targets(self):
        api.verify_device('vela', 'emulator-5582', '1', 'native_warnings_vela_api34\nOK', '34', '1')
        api.verify_device('shared', 'emulator-5580', '1', 'native_warnings_api34\nOK', '34', '1')
        for profile, serial, qemu, avd, sdk, boot in [
                ('vela', 'emulator-5580', '1', 'native_warnings_vela_api34', '34', '1'),
                ('vela', 'emulator-5582', '1', 'native_warnings_api34', '34', '1'),
                ('shared', 'emulator-5582', '1', 'native_warnings_api34', '34', '1'),
                ('vela', 'emulator-5570', '1', 'native_warnings_vela_api34', '34', '1'),
                ('vela', 'usb-device', '1', 'native_warnings_vela_api34', '34', '1'),
                ('vela', 'emulator-5582', '0', 'native_warnings_vela_api34', '34', '1'),
                ('vela', 'emulator-5582', '1', 'native_warnings_vela_api34', '35', '1'),
                ('vela', 'emulator-5582', '1', 'native_warnings_vela_api34', '34', '0')]:
            with self.subTest(profile=profile, serial=serial), self.assertRaises(ValueError):
                api.verify_device(profile, serial, qemu, avd, sdk, boot)

    def report(self, scenario='adapter_all'):
        names = api.SYSTEM_CASES if scenario == 'adapter_system' else api.NEURAL_CASES if scenario == 'adapter_neural' else api.TONE_CASES if scenario == 'adapter_tone' else api.SYSTEM_CASES | api.NEURAL_CASES | api.TONE_CASES
        cases = []
        for name in sorted(names):
            if name == 'tone_without_tts':
                cases.append(dict(name=name, system_engine_absent=True, neural_engine_absent=True, speech_initialized=False, tone_ready=True))
            elif name == 'tone_native_mute_caps':
                cases.append(dict(name=name, alerts_only_voice_cap='TONE', fully_muted_cap='SILENT', fully_muted_rejected=True, fully_muted_started=False, voice_on_cap='VOICE'))
            elif name == 'tone_focus_balance':
                cases.append(dict(name=name, native_count=0, native_focus_held=False, speech_engine_still_absent=True))
            elif 'regenerate_' in name:
                cases.append(dict(name=name, original_nav_session_used=True, synthetic_route=True,
                                  fresh_fix_only_native_session_call=True, held_text_started=False,
                                  regenerated_text='Synthetic native route fixture', native_tts_id='vela-123'))
            else:
                cases.append(dict(name=name, accepted=True, quiescent=True,
                                  terminal='CANCELLED' if 'cancel_' in name else 'COMPLETED',
                                  started='cancel_pending' not in name))
        return dict(probe_completed=True, probe_status='passed', scenario=scenario, process_uid=10123,
                    target_uid=10123, target_package='app.vela', cases=cases)

    def frame(self, report, complete=True):
        return 'INSTRUMENTATION_RESULT: native_warning_result=' + json.dumps(report) + ('\nINSTRUMENTATION_CODE: -1\n' if complete else '')

    def test_exact_version_and_unique_app_uid_are_required(self):
        valid = 'userId=10123\nversionCode=46210 minSdk=26 targetSdk=35\nversionName=0.5.2621\n'
        self.assertEqual(api.verify_version(valid), 10123)
        for broken in [valid.replace('0.5.2621', '0.5.26210'), valid.replace('0.5.2621', '0.5.2621-dev'),
                       valid.replace('46210', '462100'), valid.replace('10123', '9999'),
                       valid.replace('userId=10123', ''), valid + 'appId=10124\n']:
            with self.subTest(broken=broken), self.assertRaises(ValueError):
                api.verify_version(broken)

    def test_only_the_exact_probe_manifest_target_is_accepted(self):
        xml = '''  E: manifest (line=1)
    A: package="nl.johninnl.warningprobe.vela"
      E: application (line=1)
      E: instrumentation (line=1)
        A: android:name(0x01010003)="nl.johninnl.warningprobe.NativeWarningProbe"
        A: android:targetPackage(0x01010021)="app.vela"
'''
        api.verify_probe_manifest(xml)
        for broken in [xml.replace('app.vela', 'com.google.android.apps.maps'),
                       xml.replace('NativeWarningProbe', 'AnotherProbe'),
                       xml.replace('warningprobe.vela', 'warningprobe.maps'),
                       xml + '      E: instrumentation (line=1)\n']:
            with self.subTest(broken=broken), self.assertRaises(ValueError):
                api.verify_probe_manifest(broken)

    def test_reports_require_all_requested_cases_and_actual_success(self):
        for scenario in ['adapter_system', 'adapter_neural', 'adapter_tone', 'adapter_all']:
            report = self.report(scenario)
            self.assertEqual(api.verify_report(self.frame(report), scenario, 10123), report)
        report = self.report()
        variants = [dict(report, probe_status='inconclusive'), dict(report, probe_status='failed'),
                    dict(report, probe_status='observations_collected'), dict(report, target_uid=10124),
                    dict(report, cases=report['cases'][:-1]), dict(report, cases=report['cases'][:-1] + [report['cases'][0]]),
                    dict(report, scenario='adapter_system')]
        for broken in variants:
            with self.subTest(broken=broken), self.assertRaises(ValueError):
                api.verify_report(self.frame(broken), 'adapter_all', 10123)
        with self.assertRaises(ValueError):
            api.verify_report(self.frame(report, complete=False), 'adapter_all', 10123)
        with self.assertRaises(ValueError):
            api.verify_report(self.frame(report), 'adapter_all', 10125)

    def test_enqueue_or_unfenced_cancellation_is_not_native_output_acceptance(self):
        report = self.report('adapter_system')
        for name, key, value in [('system_baseline', 'started', False), ('system_baseline', 'terminal', 'QUEUED'),
                                 ('system_cancel_pending', 'started', True), ('system_cancel_active', 'quiescent', False),
                                 ('system_regenerate_current_step', 'held_text_started', True),
                                 ('system_regenerate_after_passage', 'fresh_fix_only_native_session_call', False)]:
            broken = copy.deepcopy(report)
            next(case for case in broken['cases'] if case['name'] == name)[key] = value
            with self.subTest(name=name, key=key), self.assertRaises(ValueError):
                api.verify_report(self.frame(broken), 'adapter_system', 10123)

    def test_tone_requires_real_mute_focus_and_engine_independence_evidence(self):
        for name, key, value in [('tone_without_tts', 'speech_initialized', True),
                                 ('tone_native_mute_caps', 'fully_muted_started', True),
                                 ('tone_focus_balance', 'native_count', 1),
                                 ('tone_focus_balance', 'native_focus_held', True)]:
            report = self.report('adapter_tone')
            next(case for case in report['cases'] if case['name'] == name)[key] = value
            with self.subTest(name=name), self.assertRaises(ValueError):
                api.verify_report(self.frame(report), 'adapter_tone', 10123)

    def test_signed_apks_require_exactly_one_verified_signer(self):
        certificate = 'a' * 64
        with mock.patch.object(api.subprocess, 'check_output', return_value='Signer #1 certificate SHA-256 digest: ' + certificate + '\n'):
            self.assertEqual(api.signer_certificate(Path('apksigner'), Path('probe.apk')), certificate)
        for text in ['', 'Signer #1 certificate SHA-256 digest: bad\n',
                     'Signer #1 certificate SHA-256 digest: ' + certificate + '\nSigner #2 certificate SHA-256 digest: ' + certificate + '\n']:
            with self.subTest(text=text), mock.patch.object(api.subprocess, 'check_output', return_value=text), self.assertRaises(ValueError):
                api.signer_certificate(Path('apksigner'), Path('probe.apk'))


if __name__ == '__main__':
    unittest.main()
