"""Run device admission against a recording ADB stub; never contacts a real AVD."""
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT=Path(__file__).resolve().parents[1]
SOURCE=ROOT/'scripts/navigation-alerts/run_fm_capture_probe.py'
CAR=ROOT/'scripts/navigation-alerts/run_integrated_vela_car_probe.py'

class FmCaptureAdmissionTest(unittest.TestCase):
    def invoke(self,serial='emulator-5584',qemu='1',avd='native_warnings_car_api34',api='34',uid='0',car=False):
        with tempfile.TemporaryDirectory() as folder:
            root=Path(folder);adb=root/'sdk/platform-tools/adb';adb.parent.mkdir(parents=True);log=root/'commands.jsonl'
            adb.write_text('#!/usr/bin/env python3\nimport json,os,sys\na=sys.argv[1:]\nwith open(os.environ["ADB_STUB_LOG"],"a") as f:f.write(json.dumps(a)+"\\n")\nc=tuple(a[2:])\noutputs={("shell","getprop","ro.kernel.qemu"):os.environ["STUB_QEMU"],("emu","avd","name"):os.environ["STUB_AVD"]+"\\nOK",("shell","getprop","ro.build.version.sdk"):os.environ["STUB_API"],("shell","id","-u"):os.environ["STUB_UID"],("shell","getprop","sys.boot_completed"):"1",("shell","pm","path","nl.flitsmeister"):"package:/test/base.apk",("shell","sha256sum","/test/base.apk"):"0"*64+" /test/base.apk"}\nif c not in outputs:sys.exit(97)\nprint(outputs[c])\n')
            adb.chmod(0o755);apk=root/'input.apk';apk.write_bytes(b'private dummy artifact')
            env=dict(os.environ,ADB_STUB_LOG=str(log),STUB_QEMU=qemu,STUB_AVD=avd,STUB_API=api,STUB_UID=uid)
            if car:command=[sys.executable,str(CAR),'--sdk',str(root/'sdk'),'--source-apk',str(apk),'--source-probe',str(apk),'--receiver-apk',str(apk),'--receiver-probe',str(apk),'--output',str(root/'output'),'--native-id','car-admission','--mode','VOICE','--reviewed-synthetic-choices']
            else:command=[sys.executable,str(SOURCE),'--adb',str(adb),'--serial',serial,'--target-apk',str(apk),'--probe-apk',str(apk),'--output',str(root/'output')]
            result=subprocess.run(command,env=env,capture_output=True,text=True)
            calls=[json.loads(line) for line in log.read_text().splitlines()] if log.exists() else []
            self.assertNotEqual(0,result.returncode)
            self.assertFalse(any(any(token in call for token in ['install','uninstall','force-stop','push','iptables','ip6tables']) for call in calls),calls)
            return result,calls
    def test_shared_5580_usb_and_unknown_serial_are_rejected_before_adb(self):
        for serial in ['emulator-5580','USB-serial','emulator-5598']:
            with self.subTest(serial=serial):
                result,calls=self.invoke(serial=serial);self.assertEqual([],calls);self.assertIn('invalid choice',result.stderr)
    def test_wrong_qemu_name_api_and_uid_never_reach_mutations(self):
        for changes in [dict(qemu='0'),dict(avd='native_warnings_api34'),dict(api='35'),dict(uid='2000')]:
            with self.subTest(changes=changes):
                result,calls=self.invoke(**changes);self.assertTrue(calls);self.assertNotIn(['-s','emulator-5584','shell','pm','path','nl.flitsmeister'],calls)
    def test_exact_car_profile_reaches_only_read_only_artifact_verification(self):
        result,calls=self.invoke();self.assertIn(['-s','emulator-5584','shell','pm','path','nl.flitsmeister'],calls);self.assertIn('Target bytes differ',result.stderr)
    def test_car_coordinator_has_only_exact_5584_admission(self):
        result,calls=self.invoke(car=True,avd='native_warnings_api34');self.assertTrue(calls);self.assertTrue(all(call[:2]==['-s','emulator-5584'] for call in calls));self.assertIn('Wrong/unbooted owned car AVD',result.stderr)

if __name__=='__main__':unittest.main()
