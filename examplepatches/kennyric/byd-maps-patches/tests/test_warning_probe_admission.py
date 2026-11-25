"""Probe CLI admission must fail before contacting even a fake device."""
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
SCRIPTS = ROOT / 'scripts/navigation-alerts'


class WarningProbeAdmissionTest(unittest.TestCase):
    def test_reused_integrated_output_is_rejected_before_adb(self):
        for name in ['run_integrated_maps_probe.py', 'run_integrated_vela_probe.py']:
            with self.subTest(script=name), tempfile.TemporaryDirectory() as temporary:
                root = Path(temporary)
                output = root / 'evidence'
                output.mkdir()
                (output / 'sentinel.txt').write_text('retain this run')
                marker = root / 'adb-called'
                adb = root / 'sdk/platform-tools/adb'
                adb.parent.mkdir(parents=True)
                adb.write_text('#!/usr/bin/env python3\nfrom pathlib import Path\nPath(' + repr(str(marker)) + ').touch()\n')
                adb.chmod(0o700)
                command = [sys.executable, str(SCRIPTS / name), '--sdk', str(root / 'sdk'),
                           '--source-apk', 'unused.apk', '--source-probe', 'unused.apk',
                           '--receiver-apk', 'unused.apk', '--receiver-probe', 'unused.apk',
                           '--output', str(output), '--native-id', 'probe-admission', '--mode', 'VOICE',
                           '--reviewed-synthetic-choices']
                result = subprocess.run(command, capture_output=True, text=True, timeout=10)
                self.assertNotEqual(0, result.returncode)
                self.assertIn('fresh output directory', result.stderr)
                self.assertFalse(marker.exists())
                self.assertEqual('retain this run', (output / 'sentinel.txt').read_text())

    def test_optimized_python_cannot_disable_device_or_evidence_guards(self):
        for name in ['run_provider_restart_probe.py', 'run_integrated_ownership_probe.py',
                     'verify_moving_camera_evidence.py', 'verify_delayed_passage_evidence.py',
                     'verify_concurrent_warning_evidence.py']:
            with self.subTest(script=name):
                result = subprocess.run([sys.executable, '-O', str(SCRIPTS / name), '--help'],
                                        capture_output=True, text=True, timeout=10)
                self.assertNotEqual(0, result.returncode)
                self.assertIn('without -O or PYTHONOPTIMIZE', result.stderr)


if __name__ == '__main__':
    unittest.main()
