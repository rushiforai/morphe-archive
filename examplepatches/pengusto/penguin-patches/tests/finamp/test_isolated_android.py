"""Independent acceptance runs cannot accidentally select shared/physical targets."""
import json
from pathlib import Path
import tempfile
import unittest

from isolated_android import validate_target, target_lock


class IsolationTests(unittest.TestCase):
    def test_overlapping_controller_is_rejected_and_lock_is_released(self):
        with tempfile.TemporaryDirectory() as directory:
            descriptor = Path(directory) / 'target.json'
            with target_lock(descriptor):
                with self.assertRaises(RuntimeError), target_lock(descriptor):
                    pass
            with target_lock(descriptor):
                pass

    def test_explicit_owned_emulator_and_fixture_are_accepted(self):
        self.check({})

    def test_physical_shared_and_escaping_targets_are_rejected(self):
        for changes in ({'serial': 'physical-phone'}, {'serial': 'emulator-5587'},
                        {'avd': 'penguin'}, {'avd_directory': '/tmp/foreign.avd'},
                        {'fixture_port': 18961}, {'disposable': False}):
            with self.subTest(changes=changes), self.assertRaises(ValueError):
                self.check(changes)

    def check(self, changes):
        with tempfile.TemporaryDirectory() as directory:
            repo = Path(directory)
            owned = repo / '.scratch/isolated'
            avd = owned / 'avds/finamp-isolated-test.avd'
            avd.mkdir(parents=True)
            (avd / 'config.ini').write_text('abi.type=arm64-v8a\n')
            target = {'schema': 1, 'disposable': True, 'serial': 'emulator-5586',
                      'avd': 'finamp-isolated-test', 'avd_directory': str(avd),
                      'fixture_port': 18966, **changes}
            descriptor = owned / 'target.json'
            descriptor.write_text(json.dumps(target))
            self.assertEqual(validate_target(descriptor, repo), target)
