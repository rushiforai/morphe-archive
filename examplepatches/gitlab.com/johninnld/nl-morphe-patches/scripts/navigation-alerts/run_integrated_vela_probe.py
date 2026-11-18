#!/usr/bin/env python3
"""Coordinate real FM/Vela app processes on the owned AVD; never emits warning packets."""
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


def verify_emulator_profile(serial,qemu,avd_name,sdk):
    """Admit only the current task-owned emulator, never a phone/shared cohort."""
    names=[line.strip() for line in avd_name.splitlines() if line.strip() and line.strip()!='OK']
    if serial!='emulator-5590' or qemu.strip()!='1' or names!=['native_warnings_ui_api34'] or sdk.strip()!='34':
        raise ValueError('Only owned emulator-5590/native_warnings_ui_api34/API34 is authorized for this cohort')
    return names[0]


def prepare_output(path):
    if path.exists() and any(path.iterdir()):
        raise ValueError("Use a fresh output directory; existing evidence must be retained")
    path.mkdir(parents=True,exist_ok=True)


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--sdk',type=Path,required=True)
    parser.add_argument('--serial',choices=['emulator-5590'],default='emulator-5590')
    parser.add_argument('--source-apk',type=Path,required=True)
    parser.add_argument('--source-probe',type=Path,required=True)
    parser.add_argument('--receiver-apk',type=Path,required=True,help='Already test-signed current Vela APK')
    parser.add_argument('--receiver-probe',type=Path,required=True)
    parser.add_argument('--output',type=Path,required=True)
    parser.add_argument('--native-id',required=True)
    parser.add_argument('--mode',choices=['VOICE','TONE','SILENT'],required=True)
    parser.add_argument('--capture-pcm',action='store_true')
    parser.add_argument('--matrix',action='store_true')
    parser.add_argument('--post-warmup-no-gps-delay-ms',type=int,choices=range(0,12001),default=0)
    parser.add_argument('--disable-location-for-no-speed',action='store_true')
    parser.add_argument('--trigger-family',choices=['ordinary','p0'],default='ordinary')
    parser.add_argument('--trigger-pattern',choices=['single','update','clear','repeat'],default='single')
    parser.add_argument('--event-count',type=int,choices=range(1,101),default=1)
    parser.add_argument('--matrix-timeout-seconds',type=int,choices=range(60,901),default=600)
    parser.add_argument('--reviewed-synthetic-choices',action='store_true',required=True)
    args=parser.parse_args();cancel_token=uuid.uuid4().hex;serial=args.serial;adb_path=args.sdk/'platform-tools/adb';prepare_output(args.output)
    if args.disable_location_for_no_speed and (not args.matrix or args.trigger_family!='p0' or args.post_warmup_no_gps_delay_ms<5000):parser.error('Location-off witness requires genuine P0 matrix and >=5 seconds of expiry')
    if args.capture_pcm and (args.matrix or args.mode!='VOICE'):parser.error('PCM observation is a separate single-event actual system Voice run')
    if args.matrix and args.mode=='SILENT':parser.error('Current genuine native matrix warmup requires completed audio; use the single scenario for Silent intent')
    def adb(*command,check=True):return subprocess.run([str(adb_path),'-s',serial,*map(str,command)],capture_output=True,text=True,check=check,timeout=60)
    def sha(path):
        with path.open('rb') as stream:return hashlib.file_digest(stream,'sha256').hexdigest()
    avd=verify_emulator_profile(serial,adb('shell','getprop','ro.kernel.qemu').stdout,adb('emu','avd','name').stdout,adb('shell','getprop','ro.build.version.sdk').stdout)
    if adb('shell','getprop','sys.boot_completed').stdout.strip()!='1':raise ValueError('Owned Vela AVD is not booted')
    if adb('shell','id','-u').stdout.strip()!='0':raise ValueError('Owned AVD adbd must already be root for the source UID network fence')
    inputs={};certs=[]
    for package,apk in [('nl.flitsmeister',args.source_apk),('app.vela',args.receiver_apk),('nl.johninnl.warningprobe.integration.vela',args.receiver_probe)]:
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
    observer_policy_before=adb('shell','settings','get','global','hidden_api_policy').stdout.strip() if args.capture_pcm else None
    location_mode_before=adb('shell','settings','get','secure','location_mode').stdout.strip() if args.disable_location_for_no_speed else None
    before=permissions();changed=[];events=queue.Queue();processes={};threads=[];failure=None;receiver=None;source=None
    record={'serial':serial,'qemu':'1','avd':avd,'installed_sha256':inputs,'source_probe_sha256':sha(args.source_probe),'signer_sha256':certs[0],'permissions_before':before,'native_id':args.native_id,'mode':args.mode}
    cancel_requested=False
    def request_cancel(reason):
        nonlocal cancel_requested
        if receiver is None or receiver.poll() is not None or cancel_requested:return
        path='/sdcard/Android/data/app.vela/files/native-warning-integrated/cancel-'+cancel_token+'.request'
        adb('shell','mkdir','-p','/sdcard/Android/data/app.vela/files/native-warning-integrated',check=False)
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
        if args.disable_location_for_no_speed:
            record['location_mode_before']=location_mode_before;adb('shell','settings','put','secure','location_mode','0');record['location_enabled_during']=adb('shell','cmd','location','is-location-enabled','--user','0').stdout.strip()
            if record['location_enabled_during']!='false':raise RuntimeError('Owned AVD actual location service did not turn off')
        if args.capture_pcm:adb('shell','settings','put','global','hidden_api_policy','1');adb('shell','am','force-stop','app.vela')
        if not {'android.permission.ACCESS_FINE_LOCATION','android.permission.ACCESS_COARSE_LOCATION'}<=before.keys():raise ValueError('Source manifest/runtime location permission state is missing')
        for permission,value in before.items():
            if not value['granted']:
                if any(flag in value['flags'] for flag in ['POLICY_FIXED','SYSTEM_FIXED','USER_FIXED']):raise ValueError('Refuse to override a fixed source permission')
                adb('shell','pm','grant','nl.flitsmeister',permission);changed.append(permission)
        record['permissions_during']=permissions()
        source_command=[sys.executable,'-u',Path(__file__).with_name('run_fm_capture_probe.py'),'--adb',adb_path,'--serial',serial,'--target-apk',args.source_apk,'--probe-apk',args.source_probe,'--output',args.output/'source','--scenarios','integrated_matrix' if args.matrix else 'integrated_trigger','--receiver-package','app.vela','--native-id',args.native_id,'--hold-seconds','20','--confirm-wait-seconds','120']
        if args.post_warmup_no_gps_delay_ms:source_command+=['--post-warmup-no-gps-delay-ms',args.post_warmup_no_gps_delay_ms]
        if args.matrix:source_command+=['--trigger-family',args.trigger_family,'--trigger-pattern',args.trigger_pattern,'--event-count',args.event_count,'--matrix-timeout-seconds',args.matrix_timeout_seconds]
        source=launch('source',source_command)
        deadline=time.monotonic()+(args.matrix_timeout_seconds+170 if args.matrix else 190)
        while time.monotonic()<deadline:
            try:name,line=events.get(timeout=.2)
            except queue.Empty:
                if all(p.poll() is not None for p in processes.values()):break
                continue
            if name=='source' and line and 'INSTRUMENTATION_STATUS: fm_capture_stage=production_endpoint_ready' in line and receiver is None:
                record['receiver_launch_after_source_ready_monotonic_ns']=time.monotonic_ns()
                native_type='INCIDENT' if args.matrix and args.trigger_family=='p0' else 'SPEED_CAM'
                subtype='AMBULANCE' if native_type=='INCIDENT' else 'SPEED_50'
                prefix='early/AMBULANCE:' if native_type=='INCIDENT' else 'SpeedCam:'
                receiver_command=[adb_path,'-s',serial,'shell','am','instrument','-w','-r','-e','reviewed_synthetic_choices','true','-e','mode',args.mode,'-e','cancel_token',cancel_token,'-e','expected_native_type',native_type,'-e','expected_native_subtype',subtype]
                if args.capture_pcm:receiver_command+=['-e','capture_pcm','true']
                if args.post_warmup_no_gps_delay_ms:receiver_command+=['-e','require_no_speed','true']
                if args.matrix:
                    measured=args.event_count*(2 if args.trigger_pattern=='repeat' else 1)
                    receiver_command+=['-e','expected_event_count',str(measured),'-e','expected_terminal','SCHEDULER_CANCELLED' if args.trigger_pattern=='clear' else 'SCHEDULER_COMPLETED','-e','exclude_warning_id','SpeedCam:'+args.native_id+'-warmup']
                receiver_command+=['-e','expected_warning_id_prefix' if args.matrix and args.event_count>1 else 'expected_warning_id',prefix+args.native_id,'nl.johninnl.warningprobe.integration.vela/nl.johninnl.warningprobe.integration.IntegratedVelaReceiverProbe']
                receiver=launch('receiver',receiver_command)
            if name=='source' and line and ('fm_capture_error=' in line or 'fm_capture_cleanup_error=' in line):request_cancel('Source instrumentation reported terminal failure')
            if line is None and name=='source':
                if receiver is None:raise RuntimeError('Source ended before production endpoint ready')
                source.wait(timeout=5)
                if source.returncode:request_cancel('Source runner EOF/failure before receiver completion')
            if receiver is not None and source.poll() is not None and receiver.poll() is not None:break
        if any(p.poll() is None for p in processes.values()):raise TimeoutError('Integrated processes did not terminate within bounded run')
        if receiver is None:raise RuntimeError('Receiver was never launched')
        for thread in threads:thread.join(timeout=5)
        text=(args.output/'receiver-output.txt').read_text();match=re.search(r'^INSTRUMENTATION_RESULT: integrated_receiver_result=(.+)$',text,re.M)
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
        # Preserve the actual frame even if later source/cleanup verification fails.
        # The containing job still fails; diagnostic export never changes its outcome.
        remote=result.get('ui',{}).get('screenshot')
        if remote!='/storage/emulated/0/Android/data/app.vela/files/native-warning-integrated/integrated-warning.png':raise ValueError('Expected the actual owned warning UI screenshot')
        image=args.output/'integrated-warning.png';adb('pull',remote,image);record['screenshot_sha256']=sha(image)
        source_results=list((args.output/'source').glob('*/result.json'))
        if len(source_results)!=1:raise RuntimeError('Expected exactly one source result')
        source_result=json.loads(source_results[0].read_text())
        if not source_result.get('probe_completed') or not source_result.get('network_and_lease_restored'):raise RuntimeError('Source or its cleanup failed')
        record['source_result']=str(source_results[0]);record['receiver_result']=str(args.output/'receiver-result.json')
        if args.capture_pcm:
            signals=result.get('pcm_signals',[])
            if not any(row.get('started') and row.get('done') and not row.get('stopped') and not row.get('failed') and row.get('nonzero_samples',0)>1000 for row in signals):raise RuntimeError('No completed non-silent actual warning PCM signal')
            for index,row in enumerate(signals):
                pcm=args.output/('warning-'+str(index)+'.pcm');adb('pull',row['pcm_file'],pcm)
                if sha(pcm)!=row['pcm_sha256']:raise ValueError('PCM hash differs from actual callback capture')
            record['pcm_observation']=True
        record['matrix']=args.matrix;record['event_count']=args.event_count;record['trigger_family']=args.trigger_family;record['trigger_pattern']=args.trigger_pattern;record['post_warmup_no_gps_delay_ms']=args.post_warmup_no_gps_delay_ms
    except Exception as error:failure=repr(error)
    finally:
        cleanup_errors=[]
        def cleanup(label,action):
            try:action()
            except Exception as error:cleanup_errors.append(label+': '+repr(error))
        try:
            # Preserve the original failure and attempt every independent restoration.
            def finish_processes():
                if any(p.poll() is None for p in processes.values()):
                    cleanup('receiver cancellation',lambda:request_cancel('Coordinator leaving failed/incomplete run'))
                    if receiver is not None:cleanup('receiver termination',lambda:receiver.wait(timeout=20))
                    if source is not None:cleanup('source rollback',lambda:source.wait(timeout=65))
            cleanup('process cleanup',finish_processes)
            if args.disable_location_for_no_speed:
                def restore_location():
                    if location_mode_before=='null':adb('shell','settings','delete','secure','location_mode')
                    else:adb('shell','settings','put','secure','location_mode',location_mode_before)
                    record['location_mode_after']=adb('shell','settings','get','secure','location_mode').stdout.strip();record['location_mode_restored_exactly']=record['location_mode_after']==location_mode_before
                    if not record['location_mode_restored_exactly']:raise RuntimeError('Location mode not restored')
                cleanup('location restore',restore_location)
            for permission in reversed(changed):cleanup('permission restore '+permission,lambda permission=permission:adb('shell','pm','revoke','nl.flitsmeister',permission))
            if args.capture_pcm:
                def restore_policy():
                    if observer_policy_before=='null':adb('shell','settings','delete','global','hidden_api_policy')
                    else:adb('shell','settings','put','global','hidden_api_policy',observer_policy_before)
                    record['observer_policy_before']=observer_policy_before;record['observer_policy_after']=adb('shell','settings','get','global','hidden_api_policy').stdout.strip()
                    if record['observer_policy_after']!=observer_policy_before:raise RuntimeError('Observer policy not restored')
                cleanup('observer policy restore',restore_policy)
            def verify_permissions():
                record['permissions_after']=permissions();record['permissions_restored_exactly']=record['permissions_after']==before
                if not record['permissions_restored_exactly']:raise RuntimeError('Permission grants/flags differ from baseline')
            cleanup('permission verification',verify_permissions)
        finally:
            if cleanup_errors:failure=(failure or '')+'; cleanup: '+'; '.join(cleanup_errors)
            record['cleanup_errors']=cleanup_errors;record['failure']=failure;record['probe_completed']=failure is None;record['process_exit_codes']={name:p.poll() for name,p in processes.items()}
            (args.output/'result.json').write_text(json.dumps(record,indent=2)+'\n')
    print(json.dumps({'probe_completed':record['probe_completed'],'failure':failure,'result':str(args.output/'result.json')}),flush=True)
    if failure:raise SystemExit(1)


if __name__=='__main__':main()
