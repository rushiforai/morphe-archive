"""Exercise the real coordinator CLI with a recording device boundary only."""
import contextlib
import copy
import hashlib
import io
import json
from pathlib import Path
import runpy
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
RUNNER = ROOT / 'scripts/navigation-alerts/run_provider_restart_probe.py'
PREFIX = 'android.permission.'
REVIEWED = [PREFIX + name for name in (
    'ACCESS_FINE_LOCATION', 'ACCESS_COARSE_LOCATION', 'POST_NOTIFICATIONS')]
FLAGS = 'USER_SET|USER_SENSITIVE_WHEN_GRANTED|USER_SENSITIVE_WHEN_DENIED'


class RecordingDevice:
    def __init__(self, digest, receiver, missing=(), fixed=None, grant_failure=None):
        self.digest = digest
        self.receiver = receiver
        self.calls = []
        self.settings = {}
        self.grant_failure = grant_failure
        self.permissions = {
            'nl.flitsmeister': {
                PREFIX + name: {'granted': True, 'flags': FLAGS}
                for name in ('ACCESS_FINE_LOCATION', 'ACCESS_COARSE_LOCATION',
                             'ACCESS_BACKGROUND_LOCATION')},
            receiver: {name: {'granted': False, 'flags': FLAGS}
                       for name in REVIEWED if name not in missing},
        }
        if fixed:
            self.permissions[receiver][fixed]['flags'] += '|USER_FIXED'
        self.before = copy.deepcopy(self.permissions)

    def run(self, command, **options):
        args = list(map(str, command))[3:]
        self.calls.append(args)
        result = ''
        code = 0
        if args == ['emu', 'avd', 'name']:
            result = 'native_warnings_ui_api34\nOK\n'
        elif args[:2] == ['shell', 'getprop']:
            result = '34' if args[2] == 'ro.build.version.sdk' else '1'
        elif args == ['shell', 'id', '-u']:
            result = '0'
        elif args[:3] == ['shell', 'pm', 'path']:
            result = 'package:/data/app/' + args[3] + '/base.apk'
        elif args[:2] == ['shell', 'sha256sum']:
            result = self.digest + '  ' + args[2]
        elif args[:3] == ['shell', 'dumpsys', 'package']:
            result = '\n'.join(name + ': granted=' + str(value['granted']).lower()
                               + ', flags=[' + value['flags'] + ']'
                               for name, value in self.permissions[args[3]].items())
        elif args[:3] in (['shell', 'pm', 'grant'], ['shell', 'pm', 'revoke']):
            package, permission = args[3:]
            if args[2] == 'grant' and permission == self.grant_failure:
                raise subprocess.CalledProcessError(1, command, stderr='injected grant failure')
            assert permission in self.permissions[package], 'Phantom permission requested'
            self.permissions[package][permission]['granted'] = args[2] == 'grant'
        elif args[:3] == ['shell', 'settings', 'get']:
            result = self.settings.get(args[4], 'null')
        elif args[:3] == ['shell', 'settings', 'put']:
            self.settings[args[4]] = args[5]
        elif args[:3] == ['shell', 'settings', 'delete']:
            self.settings.pop(args[4], None)
        elif args[:4] == ['shell', 'dumpsys', 'window', 'displays']:
            result = 'Display: mDisplayId=0\n mCurrentFocus=Window{ app.vela/.Launcher }\n'
        elif args[:1] == ['pull']:
            destination = Path(args[2])
            label = 'Get started' if destination.name == 'onboarding-initial.xml' else 'Settings'
            destination.write_text('<hierarchy><node package="app.vela" text="' + label
                                   + '" enabled="true" clickable="true" bounds="[0,0][100,100]"/></hierarchy>')
        elif args[:3] == ['shell', 'test', '-d']:
            code = 1  # All preference directories were absent before this isolated run.
        elif (args[:3] == ['shell', 'pm', 'install']
              or args[:1] == ['install']
              or args[:3] == ['shell', 'am', 'force-stop']
              or args[:3] == ['shell', 'am', 'start']
              or args[:3] == ['shell', 'uiautomator', 'dump']
              or args[:3] == ['shell', 'input', 'tap']
              or args[:3] == ['shell', 'ps', '-A']
              or args[:3] == ['shell', 'dumpsys', 'location']
              or args[:3] == ['emu', 'geo', 'fix']):
            pass
        else:
            raise AssertionError('Unreviewed device operation: ' + repr(args))
        return subprocess.CompletedProcess(command, code, stdout=result, stderr='')


class WarningReceiverPermissionsTest(unittest.TestCase):
    def run_failed_cli(self, case, receiver='maps', missing=(), fixed=None, grant_failure=None):
        with tempfile.TemporaryDirectory() as directory:
            folder = Path(directory)
            apk = folder / 'fixture.apk'
            apk.write_bytes(b'offline fixture APK; never installed on a device')
            digest = hashlib.sha256(apk.read_bytes()).hexdigest()
            package = 'org.ungoogled.android.apps.maps' if receiver == 'maps' else 'app.vela'
            device = RecordingDevice(digest, package, missing, fixed, grant_failure)
            command = [str(RUNNER), '--sdk', str(folder / 'sdk'), '--output', str(folder / 'run'),
                       '--serial', 'emulator-5590', '--maps-package', 'org.ungoogled.android.apps.maps',
                       '--receiver', receiver, '--warning-suite', '--warning-suite-cases', case,
                       '--reviewed-synthetic-choices']
            if receiver == 'vela':
                command.append('--prepare-vela-ui')
            for name in ('source-apk', 'maps-apk', 'vela-apk'):
                command.extend(['--' + name, str(apk)])
            for kind, target in [('source', 'nl.flitsmeister'),
                                 ('maps', 'org.ungoogled.android.apps.maps'), ('vela', 'app.vela')]:
                helper = folder / kind / 'probe.apk'
                helper.parent.mkdir()
                helper.write_bytes(apk.read_bytes())
                (helper.parent / 'build-report.json').write_text(json.dumps({'target_package': target}))
                command.extend(['--' + kind + '-probe', str(helper)])
            signer = 'Signer #1 certificate SHA-256 digest: ' + 'a' * 64 + '\n'
            with (patch.object(sys, 'argv', command),
                  patch('subprocess.run', side_effect=device.run),
                  patch('subprocess.check_output', side_effect=lambda command, **kwargs:
                        signer if 'apksigner' in str(command[0]) else b'owned screenshot fixture'),
                  patch('subprocess.Popen', side_effect=RuntimeError('injected source launch failure')),
                  patch('time.sleep'),
                  contextlib.redirect_stdout(io.StringIO())):
                with self.assertRaises(SystemExit) as failure:
                    runpy.run_path(str(RUNNER), run_name='__main__')
                self.assertEqual(1, failure.exception.code)
            receipt = json.loads((folder / 'run/result.json').read_text())
            return device, receipt

    def test_each_warning_case_prepares_receiver_and_restores_after_source_failure(self):
        for receiver, cases in [('maps', ['all', 'concurrent', 'road-service', 'native-guidance',
                                         'moving-camera', 'delayed-passage']),
                                ('vela', ['all', 'concurrent', 'road-service', 'native-guidance',
                                          'moving-camera', 'delayed-passage'])]:
            for case in cases:
                with self.subTest(receiver=receiver, case=case):
                    device, receipt = self.run_failed_cli(case, receiver)
                    grants = [call[4] for call in device.calls
                              if call[:4] == ['shell', 'pm', 'grant', device.receiver]]
                    self.assertEqual(REVIEWED, grants)
                    self.assertEqual(device.before, device.permissions)
                    self.assertFalse(receipt['probe_completed'])
                    self.assertIn('injected source launch failure', receipt['failure'])
                    self.assertTrue(receipt['route_permissions_restored_exactly'])
                    self.assertEqual(receipt['route_permissions_before'], receipt['route_permissions_after'])
                    if receiver == 'vela':
                        self.assertTrue(receipt['vela_permissions_restored_exactly'])
                    self.assertFalse(any(call[:4] == ['shell', 'pm', 'grant', 'nl.flitsmeister']
                                         for call in device.calls))
                    spatial = case in {'native-guidance', 'moving-camera', 'delayed-passage'}
                    self.assertEqual(spatial, any(call[:3] == ['emu', 'geo', 'fix'] for call in device.calls))

    def test_undeclared_notification_permission_is_never_requested(self):
        device, receipt = self.run_failed_cli('all', missing=[PREFIX + 'POST_NOTIFICATIONS'])
        self.assertIn('route_permissions_before', receipt)
        self.assertNotIn(PREFIX + 'POST_NOTIFICATIONS', receipt['route_permissions_before'])
        self.assertFalse(any(call[:3] == ['shell', 'pm', 'grant'] and call[-1].endswith('POST_NOTIFICATIONS')
                             for call in device.calls))
        self.assertEqual(device.before, device.permissions)

    def test_fixed_denial_or_grant_failure_rolls_back_earlier_grants_and_flags(self):
        permission = PREFIX + 'ACCESS_COARSE_LOCATION'
        for options in [{'fixed': permission}, {'grant_failure': permission}]:
            with self.subTest(options=options):
                device, receipt = self.run_failed_cli('concurrent', **options)
                self.assertEqual(device.before, device.permissions)
                self.assertIn('route_permissions_restored_exactly', receipt)
                self.assertTrue(receipt['route_permissions_restored_exactly'])
                self.assertFalse(receipt['probe_completed'])
                self.assertEqual([PREFIX + 'ACCESS_FINE_LOCATION'],
                                 [call[4] for call in device.calls
                                  if call[:4] == ['shell', 'pm', 'revoke', device.receiver]])
                self.assertFalse(any('permission-flags' in part for call in device.calls for part in call))


if __name__ == '__main__':
    unittest.main()
