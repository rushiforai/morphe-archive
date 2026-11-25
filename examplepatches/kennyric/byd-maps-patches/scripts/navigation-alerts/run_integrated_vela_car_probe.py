#!/usr/bin/env python3
"""Coordinate real FM and host-bound Vela car processes on the owned AVD; never emits warning packets."""
import argparse
import hashlib
import json
from pathlib import Path
import queue
import re
import shutil
import subprocess
import sys
import threading
import time
import uuid


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--sdk',type=Path,required=True)
    parser.add_argument('--source-apk',type=Path,required=True)
    parser.add_argument('--source-probe',type=Path,required=True)
    parser.add_argument('--receiver-apk',type=Path,required=True,help='Already test-signed current Vela APK')
    parser.add_argument('--receiver-probe',type=Path,required=True)
    parser.add_argument('--output',type=Path,required=True)
    parser.add_argument('--native-id',required=True)
    parser.add_argument('--mode',choices=['VOICE','TONE','SILENT'],required=True)
    parser.add_argument('--host-package',choices=['app.johninnl.drivedeck','app.johninnl.drivedeck.dev'],default='app.johninnl.drivedeck')
    parser.add_argument('--reviewed-synthetic-choices',action='store_true',required=True)
    args=parser.parse_args();cancel_token=uuid.uuid4().hex;serial='emulator-5584';adb_path=args.sdk/'platform-tools/adb';args.output.mkdir(parents=True,exist_ok=True)
    if args.mode!='VOICE':parser.error('This car acceptance scenario requires one actual VOICE warning')
    def adb(*command,check=True):return subprocess.run([str(adb_path),'-s',serial,*map(str,command)],capture_output=True,text=True,check=check,timeout=60)
    def sha(path):return hashlib.file_digest(path.open('rb'),'sha256').hexdigest()
    if (adb('shell','getprop','ro.kernel.qemu').stdout.strip()!='1' or adb('emu','avd','name').stdout.splitlines()[0].strip()!='native_warnings_car_api34'
            or adb('shell','getprop','ro.build.version.sdk').stdout.strip()!='34' or adb('shell','getprop','sys.boot_completed').stdout.strip()!='1'):raise ValueError('Wrong/unbooted owned car AVD')
    if adb('shell','id','-u').stdout.strip()!='0':raise ValueError('Owned AVD adbd must already be root for the source UID network fence')
    inputs={};certs=[]
    for package,apk in [('nl.flitsmeister',args.source_apk),('app.vela',args.receiver_apk),('nl.johninnl.warningprobe.integration.vela.car',args.receiver_probe)]:
        path=adb('shell','pm','path',package).stdout.strip().removeprefix('package:');actual=adb('shell','sha256sum',path).stdout.split()[0]
        if actual!=sha(apk):raise ValueError('Installed bytes differ: '+package)
        inputs[package]=actual
    for apk in [args.source_apk,args.source_probe,args.receiver_apk,args.receiver_probe]:
        text=subprocess.check_output([str(args.sdk/'build-tools/36.0.0/apksigner'),'verify','--print-certs',str(apk)],text=True)
        certs.append(re.search(r'Signer #1 certificate SHA-256 digest: ([0-9a-f]+)',text).group(1))
    if len(set(certs))!=1:raise ValueError('Source/receiver/helper signing mismatch')
    # Freeze helpers so another agent's rebuild cannot change an in-flight run's input.
    shutil.copyfile(args.receiver_probe,args.output/'receiver-helper.apk')
    shutil.copyfile(args.source_probe,args.output/'source-helper.apk')
    args.receiver_probe=args.output/'receiver-helper.apk'
    args.source_probe=args.output/'source-helper.apk'
    def permissions():
        text=adb('shell','dumpsys','package','nl.flitsmeister').stdout;out={}
        for name in ['ACCESS_COARSE_LOCATION','ACCESS_FINE_LOCATION','ACCESS_BACKGROUND_LOCATION']:
            permission='android.permission.'+name
            found=re.search(re.escape(permission)+r': granted=(true|false), flags=\[([^\]]*)\]',text)
            if found:out[permission]={'granted':found.group(1)=='true','flags':found.group(2).strip()}
        return out
    before=permissions();changed=[];events=queue.Queue();processes={};threads=[];failure=None;receiver=None;source=None
    record={'serial':serial,'qemu':'1','avd':'native_warnings_car_api34','installed_sha256':inputs,'source_probe_sha256':sha(args.source_probe),'signer_sha256':certs[0],'permissions_before':before,'native_id':args.native_id,'mode':args.mode}
    cancel_requested=False
    def request_cancel(reason):
        nonlocal cancel_requested
        if receiver is None or receiver.poll() is not None or cancel_requested:return
        path='/sdcard/Android/data/app.vela/files/native-warning-car/cancel-'+cancel_token+'.request'
        adb('shell','mkdir','-p','/sdcard/Android/data/app.vela/files/native-warning-car',check=False)
        result=adb('shell','touch',path,check=False);cancel_requested=result.returncode==0;record['private_cancellation_requested']=reason;record['private_cancellation_signal_created']=cancel_requested
    def launch(name,command):
        process=subprocess.Popen(list(map(str,command)),stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,bufsize=1);processes[name]=process
        record[name+'_host_pid']=process.pid
        def drain():
            with (args.output/(name+'-output.txt')).open('w') as log:
                for line in process.stdout:log.write(line);log.flush();events.put((name,line));print(name+': '+line.rstrip(),flush=True)
            events.put((name,None))
        thread=threading.Thread(target=drain,daemon=True);thread.start();threads.append(thread);return process
    try:
        if not {'android.permission.ACCESS_FINE_LOCATION','android.permission.ACCESS_COARSE_LOCATION'}<=before.keys():raise ValueError('Source manifest/runtime location permission state is missing')
        for permission,value in before.items():
            if not value['granted']:
                if any(flag in value['flags'] for flag in ['POLICY_FIXED','SYSTEM_FIXED','USER_FIXED']):raise ValueError('Refuse to override a fixed source permission')
                adb('shell','pm','grant','nl.flitsmeister',permission);changed.append(permission)
        record['permissions_during']=permissions()
        source_command=[sys.executable,'-u',Path(__file__).with_name('run_fm_capture_probe.py'),'--adb',adb_path,'--serial',serial,'--target-apk',args.source_apk,'--probe-apk',args.source_probe,'--output',args.output/'source','--scenarios','integrated_trigger','--receiver-package','app.vela','--native-id',args.native_id,'--hold-seconds','20','--confirm-wait-seconds','120']
        source=launch('source',source_command)
        deadline=time.monotonic()+190
        while time.monotonic()<deadline:
            try:name,line=events.get(timeout=.2)
            except queue.Empty:
                if all(p.poll() is not None for p in processes.values()):break
                continue
            if name=='source' and line and 'INSTRUMENTATION_STATUS: fm_capture_stage=production_endpoint_ready' in line and receiver is None:
                record['receiver_launch_after_source_ready_monotonic_ns']=time.monotonic_ns()
                receiver_command=[adb_path,'-s',serial,'shell','am','instrument','-w','-r','-e','reviewed_synthetic_choices','true','-e','mode',args.mode,'-e','cancel_token',cancel_token,'-e','host_package',args.host_package,'-e','expected_warning_id','SpeedCam:'+args.native_id,'nl.johninnl.warningprobe.integration.vela.car/nl.johninnl.warningprobe.integration.VelaCarReceiverProbe']
                receiver=launch('receiver',receiver_command)
            if name=='receiver' and line and 'INSTRUMENTATION_STATUS: stage=CAR_AUDIO_STARTED' in line:
                for label,command in [('audio',('shell','dumpsys','audio')),('car-service',('shell','dumpsys','activity','services','app.vela')),('activities',('shell','dumpsys','activity','activities')),('window',('shell','dumpsys','window','windows')),('displays',('shell','dumpsys','display'))]:
                    snapshot=adb(*command);(args.output/('actual-'+label+'.txt')).write_text(snapshot.stdout)
            if name=='source' and line and ('fm_capture_error=' in line or 'fm_capture_cleanup_error=' in line):request_cancel('Source instrumentation reported terminal failure')
            if line is None and name=='source':
                if receiver is None:raise RuntimeError('Source ended before production endpoint ready')
                source.wait(timeout=5)
                if source.returncode:request_cancel('Source runner EOF/failure before receiver completion')
            if receiver is not None and source.poll() is not None and receiver.poll() is not None:break
        if any(p.poll() is None for p in processes.values()):raise TimeoutError('Integrated processes did not terminate within bounded run')
        if receiver is None:raise RuntimeError('Receiver was never launched')
        for thread in threads:thread.join(timeout=5)
        text=(args.output/'receiver-output.txt').read_text();match=re.search(r'^INSTRUMENTATION_RESULT: vela_car_receiver_result=(.+)$',text,re.M)
        if not match:raise RuntimeError('No complete actual receiver result')
        result=json.loads(match.group(1))
        if result.get('report_file'):
            remote=result['report_file']
            if not re.fullmatch(r'/storage/emulated/0/Android/data/app\.vela/files/native-warning-integrated/[A-Za-z0-9._-]+',remote):raise ValueError('Unexpected full report path')
            full=args.output/'receiver-full-report.json';adb('pull',remote,full)
            if sha(full)!=result['report_sha256']:raise ValueError('Full receiver report hash mismatch')
            (args.output/'receiver-manifest.json').write_text(json.dumps(result,indent=2)+'\n');result=json.loads(full.read_text())
        (args.output/'receiver-result.json').write_text(json.dumps(result,indent=2)+'\n')
        if result.get('status')!='observed' or not result.get('preferences_restored_exactly') or not result.get('cleanup_output_quiescent'):raise RuntimeError('Receiver did not prove output and exact restoration')
        source_results=list((args.output/'source').glob('*/result.json'))
        if len(source_results)!=1:raise RuntimeError('Expected exactly one source result')
        source_result=json.loads(source_results[0].read_text())
        if not source_result.get('probe_completed') or not source_result.get('network_and_lease_restored'):raise RuntimeError('Source or its cleanup failed')
        record['source_result']=str(source_results[0]);record['receiver_result']=str(args.output/'receiver-result.json')
        remote=result.get('actual_host_frame',{}).get('screenshot')
        if remote:
            image=args.output/'vela-car-warning.png';adb('pull',remote,image);record['screenshot_sha256']=sha(image)
        record['host_package']=args.host_package;record['car_scenario']=True;record['host_preferences_restore']='Coordinated separately from pre-UI immutable snapshot'
    except Exception as error:failure=repr(error)
    finally:
        # Leave source runner alive long enough to execute its verified force-stop/firewall/lease rollback.
        if any(p.poll() is None for p in processes.values()):
            request_cancel('Coordinator leaving failed/incomplete run')
            if receiver is not None:
                try:receiver.wait(timeout=20)
                except subprocess.TimeoutExpired:failure=(failure or '')+'; receiver still live, bounded finally/prefs restoration pending'
            if source is not None:
                try:source.wait(timeout=65)
                except subprocess.TimeoutExpired:failure=(failure or '')+'; source runner still live, manual verified rollback required'
        for permission in reversed(changed):adb('shell','pm','revoke','nl.flitsmeister',permission)
        record['permissions_after']=permissions();record['permissions_restored_exactly']=record['permissions_after']==before
        if not record['permissions_restored_exactly']:failure=(failure or '')+'; permission grants/flags differ from baseline'
        record['failure']=failure;record['probe_completed']=failure is None;record['process_exit_codes']={name:p.poll() for name,p in processes.items()}
        (args.output/'result.json').write_text(json.dumps(record,indent=2)+'\n')
    print(json.dumps({'probe_completed':record['probe_completed'],'failure':failure,'result':str(args.output/'result.json')}),flush=True)
    if failure:raise SystemExit(1)


if __name__=='__main__':main()
