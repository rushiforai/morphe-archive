"""Ownership coordinator admission uses a recording ADB, never a real device."""
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / 'scripts/navigation-alerts/run_integrated_ownership_probe.py'


class OwnershipAdmissionTest(unittest.TestCase):
    script = SCRIPT
    def invoke(self, serial='emulator-5590', avd='native_warnings_ui_api34'):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            adb = root / 'sdk/platform-tools/adb'
            adb.parent.mkdir(parents=True)
            log = root / 'calls.jsonl'
            adb.write_text('''#!/usr/bin/env python3
import json,os,sys
a=sys.argv[1:]
with open(os.environ['FIXTURE_LOG'],'a') as f:f.write(json.dumps(a)+'\\n')
c=tuple(a[2:])
answers={('emu','avd','name'):os.environ['FIXTURE_AVD']+'\\nOK',
('shell','getprop','ro.kernel.qemu'):'1',('shell','getprop','ro.build.version.sdk'):'34',
('shell','getprop','sys.boot_completed'):'1',('shell','id','-u'):'0',
('shell','pm','path','nl.flitsmeister'):'package:/fixture/base.apk',
('shell','sha256sum','/fixture/base.apk'):'0'*64+' /fixture/base.apk'}
if c not in answers:sys.exit(97)
print(answers[c])
''')
            adb.chmod(0o755)
            apk = root / 'fixture.apk'
            apk.write_bytes(b'fixture-only APK')
            command = [sys.executable, str(self.script), '--sdk', str(root / 'sdk'),
                       '--serial', serial, '--maps-package', 'org.ungoogled.android.apps.maps',
                       '--output', str(root / 'output'), '--reviewed-synthetic-choices']
            for name in ['source-apk', 'maps-apk', 'vela-apk', 'source-probe', 'maps-probe', 'vela-probe']:
                command += ['--' + name, str(apk)]
            env = {key: os.environ[key] for key in ['PATH', 'LANG'] if key in os.environ}
            env.update(HOME=str(root), FIXTURE_LOG=str(log), FIXTURE_AVD=avd)
            result = subprocess.run(command, env=env, capture_output=True, text=True)
            calls = [json.loads(line) for line in log.read_text().splitlines()] if log.exists() else []
            self.assertNotEqual(0, result.returncode)
            self.assertFalse(any(token in call for call in calls for token in ['install', 'uninstall', 'push', 'force-stop', 'iptables']))
            return result, calls

    def test_owned_ui_avd_reaches_only_artifact_identity_check(self):
        _, calls = self.invoke()
        self.assertIn(['-s', 'emulator-5590', 'shell', 'pm', 'path', 'nl.flitsmeister'], calls)
        self.assertTrue(all(call[:2] == ['-s', 'emulator-5590'] for call in calls))

    def test_shared_or_physical_device_is_refused_before_adb(self):
        for serial in ['emulator-5580', 'emulator-5584', 'physical-phone']:
            with self.subTest(serial=serial):
                _, calls = self.invoke(serial=serial)
                self.assertEqual([], calls)

    def test_wrong_avd_cannot_reach_package_or_mutations(self):
        _, calls = self.invoke(avd='shared-avd')
        self.assertTrue(calls)
        self.assertFalse(any('path' in call for call in calls))


class ProviderRestartAdmissionTest(OwnershipAdmissionTest):
    script = ROOT / 'scripts/navigation-alerts/run_provider_restart_probe.py'


if __name__ == '__main__':
    unittest.main()
