"""Source failure cancels the real receiver contract and restores both permission sets."""
import contextlib
import hashlib
import importlib.util
import io
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import threading
import unittest
from unittest.mock import patch

ROOT=Path(__file__).resolve().parents[1]
SPEC=importlib.util.spec_from_file_location('maps_failure',ROOT/'scripts/navigation-alerts/run_integrated_maps_probe.py')
MODULE=importlib.util.module_from_spec(SPEC);SPEC.loader.exec_module(MODULE)

class Source:
    pid=999991
    returncode=1
    def __init__(self):self.stdout=io.StringIO('INSTRUMENTATION_STATUS: fm_capture_stage=production_endpoint_ready\n')
    def poll(self):return self.returncode
    def wait(self,**kwargs):return self.returncode

class Receiver:
    pid=999992
    returncode=None
    def __init__(self,cancelled):self.cancelled=cancelled;self.stdout=self.output()
    def output(self):
        self.cancelled.wait(.2)
        self.returncode=0
        report={'status':'blocked','controller_cancelled':self.cancelled.is_set(),'partial':True,'cleanup_output_quiescent':True,'preferences_restored_exactly':True}
        yield 'INSTRUMENTATION_RESULT: integrated_receiver_result='+json.dumps(report)+'\n'
    def poll(self):return self.returncode
    def wait(self,**kwargs):self.cancelled.wait(.2);self.returncode=0;return 0
    def kill(self):self.returncode=-9

class MapsFailureCleanupTest(unittest.TestCase):
    def exercise(self,fixed=False,revoke_fault=False,cancel_fault=False):
        with tempfile.TemporaryDirectory() as temporary:
            root=Path(temporary);apk=root/'input.apk';apk.write_bytes(b'fixture-only APK');digest=hashlib.sha256(apk.read_bytes()).hexdigest()
            names={'nl.flitsmeister':['ACCESS_COARSE_LOCATION','ACCESS_FINE_LOCATION','ACCESS_BACKGROUND_LOCATION'],'org.ungoogled.android.apps.maps':['ACCESS_COARSE_LOCATION','ACCESS_FINE_LOCATION','POST_NOTIFICATIONS']}
            granted={pkg:{'android.permission.'+name:False for name in values} for pkg,values in names.items()};cancelled=threading.Event();grants=[];revokes=[];popen=[]
            def adb(command,**kwargs):
                args=list(map(str,command[3:]));output=''
                if args[:2]==['shell','getprop']:output='34' if args[-1]=='ro.build.version.sdk' else '1'
                elif args==['emu','avd','name']:output='native_warnings_ui_api34\nOK'
                elif args[:3]==['shell','id','-u']:output='0'
                elif args[:3]==['shell','pm','path']:output='package:/private/input.apk'
                elif args[:2]==['shell','sha256sum']:output=digest+' /private/input.apk'
                elif args[:3]==['shell','dumpsys','package']:
                    pkg=args[3]
                    output='\n'.join(name+': granted='+str(value).lower()+', flags=['+('USER_FIXED' if fixed and pkg.endswith('.maps') and name.endswith('FINE_LOCATION') else '')+']' for name,value in granted[pkg].items())
                elif args[:3]==['shell','pm','grant']:
                    pkg,name=args[-2:];granted[pkg][name]=True;grants.append((pkg,name))
                elif args[:3]==['shell','pm','revoke']:
                    pkg,name=args[-2:];revokes.append((pkg,name))
                    if revoke_fault and name.endswith('POST_NOTIFICATIONS'):raise subprocess.CalledProcessError(1,command)
                    granted[pkg][name]=False
                elif args[:2]==['shell','touch']:
                    if cancel_fault:raise subprocess.CalledProcessError(1,command)
                    cancelled.set()
                return subprocess.CompletedProcess(command,0,output+'\n','')
            def launch(command,**kwargs):
                popen.append(command)
                return Source() if len(popen)==1 else Receiver(cancelled)
            argv=['probe','--sdk',str(root/'sdk'),'--source-apk',str(apk),'--source-probe',str(apk),'--receiver-apk',str(apk),'--receiver-probe',str(apk),'--output',str(root/'run'),'--native-id','fixture','--mode','VOICE','--reviewed-synthetic-choices']
            with patch.object(sys,'argv',argv),patch.object(MODULE.subprocess,'run',side_effect=adb),patch.object(MODULE.subprocess,'check_output',return_value='Signer #1 certificate SHA-256 digest: '+'a'*64),patch.object(MODULE.subprocess,'Popen',side_effect=launch),contextlib.redirect_stdout(io.StringIO()):
                with self.assertRaises(SystemExit):MODULE.main()
            result=json.loads((root/'run/result.json').read_text())
            self.assertFalse(result['probe_completed'])
            self.assertFalse((root/'run/receiver-helper.apk').exists());self.assertFalse((root/'run/source-helper.apk').exists())
            if fixed:
                self.assertIn('fixed receiver permission',result['failure']);self.assertFalse(popen)
            else:
                self.assertEqual(not cancel_fault,cancelled.is_set(),'Source failure must promptly request receiver cancellation')
                self.assertEqual(not cancel_fault,result['private_cancellation_signal_created'])
                if cancel_fault:self.assertIn('private_cancellation_error',result)
                partial=json.loads((root/'run/receiver-result.json').read_text());self.assertTrue(partial['partial']);self.assertEqual(not cancel_fault,partial['controller_cancelled'])
                self.assertIn('Source runner exited unsuccessfully',result['failure'])
                self.assertEqual(6,len(revokes),'One restore failure must not prevent other permission restores')
            self.assertTrue(result['permissions_restored_exactly'])
            self.assertEqual(revoke_fault,result['cleanup_required'])
            if not revoke_fault:self.assertTrue(result['receiver_permissions_restored_exactly'])
            if not fixed:self.assertTrue(all(result['receiver_permissions_during'][x]['granted'] for x in granted['org.ungoogled.android.apps.maps']))
    def test_failed_source_cancels_and_retains_partial_receiver_evidence(self):self.exercise()
    def test_fixed_receiver_permission_is_not_overridden(self):self.exercise(fixed=True)
    def test_one_receiver_restore_failure_does_not_skip_source_cleanup(self):self.exercise(revoke_fault=True)
    def test_failed_cancellation_signal_does_not_skip_other_cleanup(self):self.exercise(cancel_fault=True)

if __name__=='__main__':unittest.main()
