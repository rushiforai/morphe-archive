"""A cleanup failure must retain the run report and attempt other restores."""
import contextlib
import hashlib
import importlib.util
import io
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location('vela_cleanup', ROOT / 'scripts/navigation-alerts/run_integrated_vela_probe.py')
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)


class FinishedSource:
    def __init__(self):
        self.pid = 999999
        self.stdout = io.StringIO('')

    def poll(self):
        return 0

    def wait(self, **kwargs):
        return 0


class IntegratedVelaCleanupTest(unittest.TestCase):
    def exercise(self, fault):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            apk = root / 'test.apk'
            apk.write_bytes(b'private fixture')
            digest = hashlib.sha256(apk.read_bytes()).hexdigest()
            permissions = {f'android.permission.{name}': False for name in
                           ['ACCESS_COARSE_LOCATION', 'ACCESS_FINE_LOCATION', 'ACCESS_BACKGROUND_LOCATION']}
            revoked = []
            policy_restored = []
            state = {'location_mode': '3', 'hidden_api_policy': 'null'}

            def adb(command, **kwargs):
                args = list(map(str, command[3:]))
                output = ''
                if args[:2] == ['shell', 'getprop']:
                    output = '34' if args[-1] == 'ro.build.version.sdk' else '1'
                elif args == ['emu', 'avd', 'name']:
                    output = 'native_warnings_ui_api34\nOK'
                elif args[:3] == ['shell', 'id', '-u']:
                    output = '0'
                elif args[:3] == ['shell', 'pm', 'path']:
                    output = 'package:/private/test.apk'
                elif args[:2] == ['shell', 'sha256sum']:
                    output = digest + '  /private/test.apk'
                elif args[:3] == ['shell', 'dumpsys', 'package']:
                    output = '\n'.join(f'{name}: granted={str(value).lower()}, flags=[]' for name, value in permissions.items())
                elif args[:3] == ['shell', 'pm', 'grant']:
                    permissions[args[-1]] = True
                elif args[:3] == ['shell', 'pm', 'revoke']:
                    revoked.append(args[-1])
                    if fault == 'permission' and len(revoked) == 1:
                        raise subprocess.CalledProcessError(1, command)
                    permissions[args[-1]] = False
                elif args[:3] == ['shell', 'settings', 'get']:
                    output = state[args[-1]]
                elif args[:3] == ['shell', 'settings', 'put']:
                    if fault == 'location' and args[-2:] == ['location_mode', '3']:
                        raise subprocess.CalledProcessError(1, command)
                    state[args[-2]] = args[-1]
                elif args[:3] == ['shell', 'settings', 'delete']:
                    state[args[-1]] = 'null'
                    policy_restored.append(args[-1])
                elif args[:3] == ['shell', 'cmd', 'location']:
                    output = 'false'
                return subprocess.CompletedProcess(command, 0, output + '\n', '')

            argv = ['probe', '--sdk', str(root / 'unused-sdk'), '--source-apk', str(apk),
                    '--source-probe', str(apk), '--receiver-apk', str(apk), '--receiver-probe', str(apk),
                    '--output', str(root / 'output'), '--native-id', 'probe-cleanup', '--mode', 'VOICE',
                    '--reviewed-synthetic-choices']
            argv += (['--matrix', '--trigger-family', 'p0', '--post-warmup-no-gps-delay-ms', '5000',
                      '--disable-location-for-no-speed'] if fault == 'location' else ['--capture-pcm'])
            certificate = 'Signer #1 certificate SHA-256 digest: ' + 'a' * 64
            with patch.object(sys, 'argv', argv), patch.object(MODULE.subprocess, 'run', side_effect=adb), \
                 patch.object(MODULE.subprocess, 'check_output', return_value=certificate), \
                 patch.object(MODULE.subprocess, 'Popen', side_effect=lambda *a, **k: FinishedSource()), \
                 contextlib.redirect_stdout(io.StringIO()):
                try:
                    MODULE.main()
                except (SystemExit, subprocess.CalledProcessError):
                    pass
            report = root / 'output/result.json'
            self.assertTrue(report.exists(), 'Failed cleanup lost the structured run result')
            result = json.loads(report.read_text())
            self.assertFalse(result['probe_completed'])
            self.assertIn('Source ended before production endpoint ready', result['failure'])
            self.assertTrue(result['cleanup_errors'])
            self.assertEqual(set(permissions), set(revoked))
            if fault == 'permission':
                self.assertIn('hidden_api_policy', policy_restored)

    def test_location_restore_failure_still_revokes_permissions_and_writes_result(self):
        self.exercise('location')

    def test_one_permission_failure_still_restores_policy_and_writes_result(self):
        self.exercise('permission')


if __name__ == '__main__':
    unittest.main()
