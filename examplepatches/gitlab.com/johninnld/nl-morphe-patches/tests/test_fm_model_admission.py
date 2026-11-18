"""Exercise model-runner admission with fixture ADB; never contact a device."""
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / 'scripts/navigation-alerts/run_fm_model_probe.py'


class FmModelAdmissionTest(unittest.TestCase):
    def invoke(self, version='15.0', code='1289', serial='emulator-5590',
               avd='native_warnings_ui_api34', sdk='34', uid='0'):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            apk = root / 'fixture.apk'
            apk.write_bytes(b'fixture-only model target')
            adb = root / 'adb'
            log = root / 'commands.jsonl'
            adb.write_text('''#!/usr/bin/env python3
import json,os,sys
args=sys.argv[1:]
with open(os.environ['ADB_FIXTURE_LOG'],'a') as stream:stream.write(json.dumps(args)+'\\n')
command=tuple(args[2:])
answers={('shell','getprop','ro.kernel.qemu'):'1',
('emu','avd','name'):os.environ['FIXTURE_AVD']+'\\nOK',
('shell','getprop','ro.build.version.sdk'):os.environ['FIXTURE_SDK'],
('shell','id','-u'):os.environ['FIXTURE_UID'],
('shell','pm','path','nl.flitsmeister'):'package:/fixture/base.apk',
('shell','sha256sum','/fixture/base.apk'):os.environ['FIXTURE_HASH']+' /fixture/base.apk',
('shell','dumpsys','package','nl.flitsmeister'):'versionName='+os.environ['FIXTURE_VERSION']+'\\nversionCode='+os.environ['FIXTURE_CODE']}
if command in answers:print(answers[command]);sys.exit(0)
if command and command[0]=='install':print('FIXTURE_ADMISSION_COMPLETE');sys.exit(97)
sys.exit(98)
''')
            adb.chmod(0o755)
            env = {key: os.environ[key] for key in ['PATH', 'LANG'] if key in os.environ}
            env.update(HOME=str(root), ADB_FIXTURE_LOG=str(log), FIXTURE_AVD=avd,
                       FIXTURE_SDK=sdk, FIXTURE_UID=uid, FIXTURE_VERSION=version,
                       FIXTURE_CODE=code, FIXTURE_HASH=hashlib.sha256(apk.read_bytes()).hexdigest())
            result = subprocess.run([sys.executable, str(SCRIPT), '--adb', str(adb),
                                     '--serial', serial, '--target-apk', str(apk),
                                     '--probe-apk', str(apk), '--output', str(root / 'output')],
                                    env=env, capture_output=True, text=True)
            calls = [json.loads(line)[2:] for line in log.read_text().splitlines()] if log.exists() else []
            return result, calls

    def test_each_pinned_version_reaches_only_fixture_probe_install(self):
        for version, code in [('14.17', '1287'), ('15.0', '1289')]:
            with self.subTest(version=version):
                result, calls = self.invoke(version=version, code=code)
                self.assertNotEqual(0, result.returncode)
                self.assertEqual(1, sum(call[0] == 'install' for call in calls))
                self.assertIn('exit status 97', result.stderr)

    def test_shared_devices_and_physical_phone_are_refused_before_adb(self):
        for serial in ['emulator-5580', 'emulator-5584', 'phone-serial']:
            with self.subTest(serial=serial):
                result, calls = self.invoke(serial=serial)
                self.assertNotEqual(0, result.returncode)
                self.assertEqual([], calls)

    def test_unpinned_versions_and_wrong_device_state_cannot_install(self):
        for changes in [dict(code='1290'), dict(version='16.0'),
                        dict(version='14.17', code='1289'), dict(avd='shared'),
                        dict(sdk='35'), dict(uid='2000')]:
            with self.subTest(changes=changes):
                result, calls = self.invoke(**changes)
                self.assertNotEqual(0, result.returncode)
                self.assertFalse(any(call[0] == 'install' for call in calls))


if __name__ == '__main__':
    unittest.main()
