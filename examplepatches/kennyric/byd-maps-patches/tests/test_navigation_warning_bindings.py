"""The warning coverage gate must reject drift and incomplete native support."""
import copy
import importlib.util
import hashlib
import re
import json
from pathlib import Path
import unittest
from unittest import mock

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / 'scripts/navigation-alerts/inspect_bindings.py'


class WarningBindingTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        if not SCRIPT.exists():
            cls.api = None
            return
        spec = importlib.util.spec_from_file_location('warning_bindings', SCRIPT)
        cls.api = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(cls.api)

    def require_api(self):
        self.assertIsNotNone(self.api, 'Native warning binding verifier is not implemented')
        return self.api

    def sample(self):
        return {'format': 1, 'artifact_sha256': 'a' * 64,
            'warning_entry_points': ['Lspeaker;->speak(Ljava/lang/String;)V'], 'methods': {
            'Lspeaker;->speak(Ljava/lang/String;)V': {
                'access_flags': 17, 'register_count': 3, 'instruction_count': 2,
                'code_units': 4, 'body_sha256': 'b' * 64,
                'references': ['Lengine;->speak(Ljava/lang/String;)V']}},
            'enums': {'LWarningType;': ['CAMERA', 'EMERGENCY']}}

    def test_frozen_capture_digest_matches_advertised_profile_and_policy_annex(self):
        folder = ROOT / 'tests/fixtures/navigation-warnings'
        raw = (folder / 'flitsmeister-coverage.json').read_bytes()
        digest = hashlib.sha256(raw).hexdigest()
        source = (ROOT / 'support/navigation-alerts/src/main/java/nl/johninnl/navigation/alerts/FlitsmeisterWarningTypes.java').read_text()
        self.assertEqual(re.search(r'MANIFEST_DIGEST = "([0-9a-f]{64})"', source)[1], digest)
        policy = json.loads((folder / 'flitsmeister-warning-policy.json').read_text())
        self.assertEqual(policy['capture_manifest_sha256'], digest)
        self.assertEqual(policy['native_original_sha256'], json.loads(raw)['artifact_sha256'])

    def test_fm15_advertisement_joins_its_own_complete_artifact_and_runtime_audits(self):
        folder = ROOT / 'tests/fixtures/navigation-warnings'
        raw = (folder / 'flitsmeister15-coverage.json').read_bytes()
        manifest = json.loads(raw)
        contract = json.loads((folder / 'flitsmeister15-contract.json').read_text())
        self.require_api().verify_manifest(contract, manifest, require_complete=True)
        source = (ROOT / 'support/navigation-alerts/src/main/java/nl/johninnl/navigation/alerts/FlitsmeisterWarningTypes.java').read_text()
        self.assertEqual(re.search(r'MANIFEST_DIGEST_15 = "([0-9a-f]{64})"', source)[1], hashlib.sha256(raw).hexdigest())
        producer = json.loads((folder / manifest['completion_evidence']).read_text())
        self.assertEqual(producer['source_version'], '15.0/1289')
        self.assertTrue(producer['producer_capture_complete'])
        self.assertFalse(producer['native_detection_quality_claimed'])
        self.assertEqual(producer['original_base_sha256'], contract['artifact_sha256'])
        self.assertEqual(set(producer['callback_roots']), set(contract['warning_entry_points']))
        self.assertEqual(len(producer['scenarios']), 8)
        self.assertTrue(all(row['probe_completed'] and row['managed_mute_verified']
                            and row['max_active_playbacks'] == 0 for row in producer['scenarios'].values()))
        self.assertEqual(set(producer['model_languages']), {'en', 'nl'})
        self.assertTrue(all(row['adapter_calls'] == 170 and row['inventory_members'] == 159
                            for row in producer['model_languages'].values()))
        scope_raw = (folder / producer['nonwarning_scope']).read_bytes()
        self.assertEqual(hashlib.sha256(scope_raw).hexdigest(), producer['nonwarning_scope_sha256'])
        scope = json.loads(scope_raw)
        self.assertEqual(scope['blockers'], [])
        self.assertEqual(set(scope['members']), {'BASEREPORT', 'CITS_PARKING', 'ENVIRONMENTAL_ZONE',
                                               'FM_OFFICE', 'LBA', 'PARKED_LOCATION', 'TOLLING'})

    def test_exact_contract_accepts_same_artifact_and_body(self):
        api = self.require_api()
        api.verify_contract(self.sample(), copy.deepcopy(self.sample()))

    def test_body_abi_and_enum_drift_are_rejected(self):
        api = self.require_api()
        expected = self.sample()
        signature = next(iter(expected['methods']))
        for field, value in [('body_sha256', 'c' * 64), ('register_count', 4),
                             ('access_flags', 9), ('references', []),
                             ('instruction_count', 3), ('code_units', 5)]:
            actual = copy.deepcopy(expected)
            actual['methods'][signature][field] = value
            with self.subTest(field=field), self.assertRaises(ValueError):
                api.verify_contract(actual, expected)
        for field in ['artifact_sha256', 'methods', 'enums']:
            actual = copy.deepcopy(expected)
            actual[field] = 'wrong' if field == 'artifact_sha256' else {}
            with self.subTest(field=field), self.assertRaises(ValueError):
                api.verify_contract(actual, expected)

    def test_coverage_inventory_requires_every_actual_enum_value(self):
        api = self.require_api()
        contract = self.sample()
        coverage = {'LWarningType;': {
            'CAMERA': {'status': 'unsupported', 'reason': 'capture pending'},
            'EMERGENCY': {'status': 'unsupported', 'reason': 'capture pending'}}}
        api.verify_coverage(contract, coverage, require_complete=False)
        del coverage['LWarningType;']['EMERGENCY']
        with self.assertRaisesRegex(ValueError, 'EMERGENCY'):
            api.verify_coverage(contract, coverage, require_complete=False)

    def test_inventory_is_not_a_complete_support_claim(self):
        api = self.require_api()
        contract = self.sample()
        coverage = {'LWarningType;': {
            'CAMERA': {'status': 'exported', 'evidence': ['native-camera-probe']},
            'EMERGENCY': {'status': 'unsupported', 'reason': 'speech binding pending'}}}
        with self.assertRaisesRegex(ValueError, 'EMERGENCY'):
            api.verify_coverage(contract, coverage, require_complete=True)
        coverage['LWarningType;']['EMERGENCY'] = {'status': 'excluded', 'reason': ''}
        with self.assertRaises(ValueError):
            api.verify_coverage(contract, coverage, require_complete=True)

    def test_exported_requires_evidence_and_unknown_status_is_rejected(self):
        api = self.require_api()
        for row in [{'status': 'exported'}, {'status': 'planned'}, {'status': 'excluded', 'reason': ' '}]:
            coverage = {'LWarningType;': {'CAMERA': row,
                'EMERGENCY': {'status': 'unsupported', 'reason': 'pending'}}}
            with self.subTest(row=row), self.assertRaises(ValueError):
                api.verify_coverage(self.sample(), coverage, require_complete=False)

    def test_manifest_checks_identity_and_entry_points_as_well_as_enums(self):
        api = self.require_api()
        self.assertTrue(hasattr(api, 'verify_manifest'), 'Manifest wrapper is not implemented')
        contract = self.sample()
        manifest = {'format': 1, 'artifact_sha256': contract['artifact_sha256'],
                    'enums': {'LWarningType;': {value: {'status': 'exported', 'evidence': ['probe']}
                                              for value in ['CAMERA', 'EMERGENCY']}},
                    'entry_points': [{'method': next(iter(contract['methods'])),
                                      'status': 'unsupported', 'reason': 'native hook pending'}]}
        api.verify_manifest(contract, manifest, require_complete=False)
        with self.assertRaisesRegex(ValueError, 'speak'):
            api.verify_manifest(contract, manifest, require_complete=True)
        for field, value in [('artifact_sha256', 'wrong'), ('entry_points', []), ('format', 2)]:
            broken = copy.deepcopy(manifest)
            broken[field] = value
            with self.subTest(field=field), self.assertRaises(ValueError):
                api.verify_manifest(contract, broken, require_complete=False)
        manifest['entry_points'][0]['method'] = 'Lmissing;->speak()V'
        with self.assertRaises(ValueError):
            api.verify_manifest(contract, manifest, require_complete=False)

    def test_native_inspector_diagnostic_survives_wrapper(self):
        api = self.require_api()
        failed = api.subprocess.CalledProcessError(1, ['java'], stderr='Missing methods [Lsource;->capture]')
        with mock.patch.object(api.subprocess, 'run', side_effect=[None, failed]):
            with self.assertRaisesRegex(ValueError, 'Missing methods'):
                api.inspect(Path('original.apk'), Path('selection.json'), classpath='explicit-jars')

    def test_removing_unsupported_bypass_cannot_turn_manifest_green(self):
        api = self.require_api()
        contract = self.sample()
        bypass = 'Lcits;->announce()V'
        contract['methods'][bypass] = copy.deepcopy(next(iter(contract['methods'].values())))
        contract['warning_entry_points'].append(bypass)
        manifest = {'format': 1, 'artifact_sha256': contract['artifact_sha256'],
                    'enums': {'LWarningType;': {value: {'status': 'exported', 'evidence': ['probe']}
                                              for value in ['CAMERA', 'EMERGENCY']}},
                    'entry_points': [{'method': contract['warning_entry_points'][0],
                                      'status': 'exported', 'evidence': ['probe']}]}
        with self.assertRaisesRegex(ValueError, 'entry point'):
            api.verify_manifest(contract, manifest, require_complete=True)


if __name__ == '__main__':
    unittest.main()
