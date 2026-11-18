"""Accepted real-run baselines must reject changed speaker language offline."""
import copy
import gzip
import importlib.util
import json
from pathlib import Path
import sys
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]


def load(name):
    spec = importlib.util.spec_from_file_location(name, ROOT / 'scripts/navigation-alerts' / (name + '.py'))
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


MOVING = load('verify_moving_camera_evidence')
with patch.dict(sys.modules, {'verify_moving_camera_evidence': MOVING}):
    DELAYED = load('verify_delayed_passage_evidence')
BASELINES = json.loads(gzip.decompress((ROOT / 'tests/fixtures/navigation-warnings/evidence-auditor-baselines.json.gz').read_bytes()))


def verify(data):
    folder = Path('/offline-accepted-evidence') / data['name']
    files = {str(folder / 'result.json'): data['record'],
             str(folder / 'seed-receiver-result.json'): data['receiver'],
             data['record']['warning_suite_source_result']: data['source']}

    def read_text(path, *args, **kwargs):
        return json.dumps(files[str(path)])

    def read_bytes(path, *args, **kwargs):
        return read_text(path).encode()

    module = MOVING if data['kind'] == 'moving' else DELAYED
    with patch.object(Path, 'read_text', new=read_text), patch.object(Path, 'read_bytes', new=read_bytes):
        return module.verify(folder)


class WarningEvidenceSemanticsTest(unittest.TestCase):
    def test_accepted_real_runs_remain_verifiable_without_device_or_local_analysis(self):
        for baseline in BASELINES:
            with self.subTest(run=baseline['name']):
                self.assertTrue(verify(baseline)['exact_cleanup_verified'])

    def test_changed_spoken_language_is_rejected_for_both_receivers_and_auditors(self):
        for baseline in BASELINES:
            with self.subTest(run=baseline['name']):
                data = copy.deepcopy(baseline)
                for attempt in data['receiver']['actual_speaker_attempts']:
                    attempt['payload']['language_tag'] = 'zz-ZZ'
                with self.assertRaises(AssertionError):
                    verify(data)


if __name__ == '__main__':
    unittest.main()
