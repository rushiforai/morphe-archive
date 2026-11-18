#!/usr/bin/env python3
"""Coordinate real FM/Maps app processes on the owned AVD; never emits warning packets."""
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
    """Admit only the current task-owned UI emulator; shared cohorts stay excluded."""
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
    parser.add_argument('--maps-package',choices=['com.google.android.apps.maps','org.ungoogled.android.apps.maps'],default='org.ungoogled.android.apps.maps')
    parser.add_argument('--source-apk',type=Path,required=True)
    parser.add_argument('--source-probe',type=Path,required=True)
    parser.add_argument('--receiver-apk',type=Path,required=True,help='Already test-signed current Maps APK')
    parser.add_argument('--receiver-probe',type=Path,required=True)
    parser.add_argument('--output',type=Path,required=True)
    parser.add_argument('--native-id',required=True)
    parser.add_argument('--mode',choices=['VOICE','TONE','SILENT'],required=True)
    parser.add_argument('--reviewed-synthetic-choices',action='store_true',required=True)
    parser.add_argument('--matrix-count',type=int,choices=range(1,101))
    parser.add_argument('--trigger-family',choices=['ordinary','p0'],default='ordinary')
    parser.add_argument('--trigger-pattern',choices=['single','update','clear','repeat'],default='single')
    parser.add_argument('--matrix-timeout-seconds',type=int,choices=range(60,901),default=900)
    parser.add_argument('--observe-pcm',action='store_true',help='Private observer for one integrated VOICE case only; never timing100')
    parser.add_argument('--diagnostic-hidden-api-policy',action='store_true',help='Owned5590 only: temporarily allow private listener identity observation and restore exact prestate')
    parser.add_argument('--trace-token',help='32-hex owned Frida observation barrier/coverage token')
    parser.add_argument('--permission-fixture',choices=['prepared','original-denied-negative-control'],default='prepared')
    args=parser.parse_args()
    if args.trace_token and not re.fullmatch(r'[a-f0-9]{32}',args.trace_token):parser.error('Invalid Frida trace token')
    if args.permission_fixture!='prepared' and not args.trace_token:parser.error('Permission negative control requires an attached Frida trace')
    cancel_token=args.trace_token or uuid.uuid4().hex;serial=args.serial;adb_path=args.sdk/'platform-tools/adb';prepare_output(args.output)
    if args.observe_pcm and (args.mode!='VOICE' or args.matrix_count!=1):parser.error('PCM observation is limited to one reviewed integrated VOICE case')
    if args.diagnostic_hidden_api_policy and not args.observe_pcm:parser.error('Diagnostic policy is allowed only for the private PCM observer')
    def adb(*command,check=True,timeout=60):return subprocess.run([str(adb_path),'-s',serial,*map(str,command)],capture_output=True,text=True,check=check,timeout=timeout)
    def sha(path):
        with path.open('rb') as stream:return hashlib.file_digest(stream,'sha256').hexdigest()
    avd=verify_emulator_profile(serial,adb('shell','getprop','ro.kernel.qemu').stdout,adb('emu','avd','name').stdout,adb('shell','getprop','ro.build.version.sdk').stdout)
    if adb('shell','id','-u').stdout.strip()!='0':raise ValueError('Owned AVD adbd must already be root for the source UID network fence')
    inputs={};certs=[]
    for package,apk in [('nl.flitsmeister',args.source_apk),(args.maps_package,args.receiver_apk),('nl.johninnl.warningprobe.integration.maps',args.receiver_probe)]:
        path=adb('shell','pm','path',package).stdout.strip().removeprefix('package:');actual=adb('shell','sha256sum',path).stdout.split()[0]
        if actual!=sha(apk):raise ValueError('Installed bytes differ: '+package)
        inputs[package]=actual
    for apk in [args.source_apk,args.source_probe,args.receiver_apk,args.receiver_probe]:
        text=subprocess.check_output([str(args.sdk/'build-tools/36.0.0/apksigner'),'verify','--print-certs',str(apk)],text=True)
        certs.append(re.search(r'Signer #1 certificate SHA-256 digest: ([0-9a-f]+)',text).group(1))
    if len(set(certs))!=1:raise ValueError('Source/receiver/helper signing mismatch')
    shutil.copyfile(args.receiver_probe,args.output/'receiver-helper.apk')
    shutil.copyfile(args.source_probe,args.output/'source-helper.apk')
    build_report=args.source_probe.parent/'build-report.json'
    if build_report.exists():shutil.copyfile(build_report,args.output/'build-report.json')
    args.receiver_probe=args.output/'receiver-helper.apk';args.source_probe=args.output/'source-helper.apk'
    def permissions(package='nl.flitsmeister',receiver=False):
        text=adb('shell','dumpsys','package',package).stdout;out={}
        names=['ACCESS_COARSE_LOCATION','ACCESS_FINE_LOCATION','POST_NOTIFICATIONS'] if receiver else ['ACCESS_COARSE_LOCATION','ACCESS_FINE_LOCATION','ACCESS_BACKGROUND_LOCATION']
        for name in names:
            permission='android.permission.'+name
            found=re.search(re.escape(permission)+r': granted=(true|false), flags=\[([^\]]*)\]',text)
            if found:out[permission]={'granted':found.group(1)=='true','flags':found.group(2).strip()}
        return out
    before=permissions();receiver_before=permissions(args.maps_package,True);changed=[];receiver_changed=[];events=queue.Queue();processes={};threads=[];failure=None;receiver=None;source=None;source_failure=None;source_failure_at=None
    policy_before=adb('shell','settings','get','global','hidden_api_policy').stdout.strip() if args.diagnostic_hidden_api_policy else None
    record={'maps_package':args.maps_package,'serial':serial,'qemu':'1','avd':avd,'android_sdk':34,'installed_sha256':inputs,'source_probe_sha256':sha(args.source_probe),'signer_sha256':certs[0],'permissions_before':before,'native_id':args.native_id,'mode':args.mode,'diagnostic_hidden_api_policy_before':policy_before,'diagnostic_policy_is_not_production_requirement':True}
    record['receiver_permissions_before']=receiver_before
    record['permission_fixture']=args.permission_fixture;record['required_trace_token_present']=bool(args.trace_token)
    cancel_requested=False
    def request_cancel(reason):
        nonlocal cancel_requested
        if receiver is None or receiver.poll() is not None or cancel_requested:return
        try:
            context=adb('shell','dumpsys','window','displays',check=False,timeout=2)
            (args.output/'source-failure-window.txt').write_text(context.stdout)
        except Exception as error:record['failure_window_capture_error']=repr(error)
        folder='/sdcard/Android/data/'+args.maps_package+'/files/native-warning-integrated'
        try:
            adb('shell','mkdir','-p',folder,check=False,timeout=2)
            result=adb('shell','touch',folder+'/cancel-'+cancel_token+'.request',check=False,timeout=2)
            cancel_requested=result.returncode==0
        except Exception as error:record['private_cancellation_error']=repr(error)
        record['private_cancellation_requested']=reason;record['private_cancellation_signal_created']=cancel_requested
    def launch(name,command):
        process=subprocess.Popen(list(map(str,command)),stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,bufsize=1);processes[name]=process
        record[name+'_host_pid']=process.pid
        def drain():
            with (args.output/(name+'-output.txt')).open('w') as log:
                for line in process.stdout:log.write(line);log.flush();events.put((name,line));print(name+': '+line.rstrip(),flush=True)
            events.put((name,None))
        thread=threading.Thread(target=drain,daemon=True);thread.start();threads.append(thread);return process
    try:
        if args.diagnostic_hidden_api_policy:adb('shell','settings','put','global','hidden_api_policy','1')
        if not {'android.permission.ACCESS_FINE_LOCATION','android.permission.ACCESS_COARSE_LOCATION'}<=before.keys():raise ValueError('Source manifest/runtime location permission state is missing')
        for permission,value in before.items():
            if not value['granted']:
                if any(flag in value['flags'] for flag in ['POLICY_FIXED','SYSTEM_FIXED','USER_FIXED']):raise ValueError('Refuse to override a fixed source permission')
                adb('shell','pm','grant','nl.flitsmeister',permission);changed.append(permission)
        record['permissions_during']=permissions()
        if not {'android.permission.ACCESS_FINE_LOCATION','android.permission.ACCESS_COARSE_LOCATION'}<=receiver_before.keys():raise ValueError('Receiver manifest/runtime location permission state is missing')
        if args.permission_fixture=='prepared':
            for permission,value in receiver_before.items():
                if not value['granted']:
                    if any(flag in value['flags'] for flag in ['POLICY_FIXED','SYSTEM_FIXED','USER_FIXED']):raise ValueError('Refuse to override a fixed receiver permission')
                    adb('shell','pm','grant',args.maps_package,permission);receiver_changed.append(permission)
        elif any(value['granted'] for value in receiver_before.values()):raise ValueError('Original denied-permission negative control does not match the captured baseline')
        record['receiver_permissions_during']=permissions(args.maps_package,True)
        adb('emu','geo','fix','5','52')
        source_command=[sys.executable,'-u',Path(__file__).with_name('run_fm_capture_probe.py'),'--adb',adb_path,'--serial',serial,'--target-apk',args.source_apk,'--probe-apk',args.source_probe,'--output',args.output/'source','--scenarios','integrated_matrix' if args.matrix_count else 'integrated_trigger','--receiver-package',args.maps_package,'--native-id',args.native_id,'--hold-seconds','20','--confirm-wait-seconds','120']
        if args.matrix_count:source_command+=['--trigger-family',args.trigger_family,'--trigger-pattern',args.trigger_pattern,'--event-count',str(args.matrix_count),'--matrix-timeout-seconds',str(args.matrix_timeout_seconds),'--native-spacing-ms','1000']
        if args.trace_token:source_command+=['--trace-token',args.trace_token]
        source=launch('source',source_command)
        deadline=time.monotonic()+(args.matrix_timeout_seconds+220 if args.matrix_count else 190)
        while time.monotonic()<deadline:
            if source_failure_at is not None and receiver is not None and receiver.poll() is None and time.monotonic()-source_failure_at>=25:
                raise RuntimeError(source_failure+'; receiver did not terminate after bounded cancellation')
            try:name,line=events.get(timeout=.2)
            except queue.Empty:
                if all(p.poll() is not None for p in processes.values()):break
                continue
            if name=='source' and line and 'INSTRUMENTATION_STATUS: fm_capture_stage=production_endpoint_ready' in line and receiver is None:
                record['receiver_launch_after_source_ready_monotonic_ns']=time.monotonic_ns()
                receiver_command=[adb_path,'-s',serial,'shell','am','instrument','-w','-r','-e','reviewed_synthetic_choices','true','-e','mode',args.mode,'-e','cancel_token',cancel_token,'-e','expected_native_type','INCIDENT' if args.trigger_family=='p0' else 'SPEED_CAM','-e','expected_native_subtype','AMBULANCE' if args.trigger_family=='p0' else 'SPEED_50']
                if args.matrix_count:receiver_command+=['-e','matrix_count',str(args.matrix_count),'-e','matrix_pattern',args.trigger_pattern,'-e','matrix_warning_base',('early/AMBULANCE:' if args.trigger_family=='p0' else 'SpeedCam:')+args.native_id,'-e','matrix_timeout_seconds',str(args.matrix_timeout_seconds)]
                else:receiver_command+=['-e','expected_warning_id','SpeedCam:'+args.native_id]
                if args.observe_pcm:receiver_command+=['-e','observe_pcm','true']
                receiver_command+=['nl.johninnl.warningprobe.integration.maps/nl.johninnl.warningprobe.integration.IntegratedMapsReceiverProbe'];receiver=launch('receiver',receiver_command)
            if line is None and name=='source' and receiver is None:raise RuntimeError('Source ended before production endpoint ready')
            if name=='source' and line and ('fm_capture_error=' in line or 'fm_capture_cleanup_error=' in line):
                source_failure='Source instrumentation reported terminal failure';source_failure_at=source_failure_at or time.monotonic();request_cancel(source_failure)
            if name=='source' and line is None:
                source.wait(timeout=5)
                if source.returncode:
                    source_failure=source_failure or 'Source runner exited unsuccessfully';source_failure_at=source_failure_at or time.monotonic();request_cancel(source_failure)
            if receiver is not None and source.poll() is not None and receiver.poll() is not None:break
        if any(p.poll() is None for p in processes.values()):raise TimeoutError('Integrated processes did not terminate within bounded run')
        if receiver is None:raise RuntimeError('Receiver was never launched')
        for thread in threads:thread.join(timeout=5)
        text=(args.output/'receiver-output.txt').read_text();match=re.search(r'^INSTRUMENTATION_RESULT: integrated_receiver_result=(.+)$',text,re.M)
        if match:result=json.loads(match.group(1))
        else:
            manifest=re.search(r'^INSTRUMENTATION_RESULT: integrated_receiver_manifest=(.+)$',text,re.M)
            if not manifest:raise RuntimeError('No complete actual receiver result')
            manifest=json.loads(manifest.group(1));remote=manifest['file']
            if remote!='/storage/emulated/0/Android/data/'+args.maps_package+'/files/native-warning-integrated/matrix-result.json':raise RuntimeError('Unexpected private matrix report path')
            local=args.output/'receiver-full-report.json';adb('pull',remote,local)
            if sha(local)!=manifest['sha256']:raise RuntimeError('Private matrix report bytes differ')
            result=json.loads(local.read_text());record['receiver_manifest']=manifest
        (args.output/'receiver-result.json').write_text(json.dumps(result,indent=2)+'\n')
        if source_failure:raise RuntimeError(source_failure)
        if result.get('status')!='observed' or not result.get('preferences_restored_exactly') or not result.get('cleanup_output_quiescent'):raise RuntimeError('Receiver did not prove output and exact restoration')
        if args.observe_pcm:
            pcm=result.get('private_pcm_observer',{});ids={r['utterance_id'] for r in result.get('matrix_speaker_attempts',[])};selected=[r for r in pcm.get('utterances',[]) if r['utterance_id'] in ids]
            good=[r for r in selected if r['starts']==1 and r['done']==1 and r['errors']==0 and r['bytes']>1000 and r['nonzero_bytes']>100]
            if not good or pcm.get('overflow_chunks') or pcm.get('forward_failures') or not (pcm.get('original_listener_restored') or pcm.get('newer_listener_untouched')):raise RuntimeError('Actual measured warning PCM/lifecycle/listener restoration not proven')
            exports=[]
            for value in good:
                remote=value.get('wav','');expected='/storage/emulated/0/Android/data/'+args.maps_package+'/files/native-warning-integrated/'+value['utterance_id']+'.wav'
                if remote!=expected:raise RuntimeError('Unexpected synthetic warning audio path')
                local=args.output/(value['utterance_id']+'.wav');adb('pull',remote,local);exports.append({'utterance_id':value['utterance_id'],'wav_sha256':sha(local),'path':str(local)})
            record['integrated_pcm_exports']=exports
        source_results=list((args.output/'source').glob('*/result.json'))
        if len(source_results)!=1:raise RuntimeError('Expected exactly one source result')
        source_result=json.loads(source_results[0].read_text())
        if not source_result.get('probe_completed') or not source_result.get('network_and_lease_restored'):raise RuntimeError('Source or its cleanup failed')
        record['source_result']=str(source_results[0]);record['receiver_result']=str(args.output/'receiver-result.json')
    except Exception as error:failure=repr(error)
    finally:
        # Leave source runner alive long enough to execute its verified force-stop/firewall/lease rollback.
        if any(p.poll() is None for p in processes.values()):
            request_cancel('Coordinator leaving failed/incomplete run')
            if receiver is not None:
                try:receiver.wait(timeout=20)
                except subprocess.TimeoutExpired:
                    adb('shell','am','force-stop',args.maps_package,check=False)
                    try:receiver.wait(timeout=10)
                    except subprocess.TimeoutExpired:receiver.kill()
            if source is not None:
                try:source.wait(timeout=65)
                except subprocess.TimeoutExpired:failure=(failure or '')+'; source runner still live, manual verified rollback required'
        cleanup_errors=[]
        def cleanup(label,action):
            try:action()
            except Exception as error:cleanup_errors.append(label+': '+repr(error))
        try:
            for permission in reversed(receiver_changed):cleanup('receiver permission '+permission,lambda permission=permission:adb('shell','pm','revoke',args.maps_package,permission))
            if source is None or source.poll() is not None:
                for permission in reversed(changed):cleanup('source permission '+permission,lambda permission=permission:adb('shell','pm','revoke','nl.flitsmeister',permission))
            else:cleanup_errors.append('Source still live; preserve its permissions for verified rollback')
            def verify_permissions():
                record['permissions_after']=permissions();record['permissions_restored_exactly']=record['permissions_after']==before
                record['receiver_permissions_after']=permissions(args.maps_package,True);record['receiver_permissions_restored_exactly']=record['receiver_permissions_after']==receiver_before
                if not record['permissions_restored_exactly'] or not record['receiver_permissions_restored_exactly']:raise RuntimeError('Permission grants/flags differ from baseline')
            cleanup('permission verification',verify_permissions)
        finally:
            if args.diagnostic_hidden_api_policy:
                try:
                    if policy_before=='null':adb('shell','settings','delete','global','hidden_api_policy')
                    else:adb('shell','settings','put','global','hidden_api_policy',policy_before)
                    record['diagnostic_hidden_api_policy_after']=adb('shell','settings','get','global','hidden_api_policy').stdout.strip();record['diagnostic_hidden_api_policy_restored_exactly']=record['diagnostic_hidden_api_policy_after']==policy_before
                    if not record['diagnostic_hidden_api_policy_restored_exactly']:cleanup_errors.append('Diagnostic hiddenAPIpolicy differs from baseline')
                except Exception as error:cleanup_errors.append('Diagnostic policy restore: '+repr(error))
        record['process_exit_codes']={name:p.poll() for name,p in processes.items()}
        if any(value is None for value in record['process_exit_codes'].values()):cleanup_errors.append('Owned child process remains live')
        else:
            for name in ['receiver-helper.apk','source-helper.apk']:cleanup('frozen input '+name,lambda name=name:(args.output/name).unlink(missing_ok=True))
        if cleanup_errors:failure=(failure or '')+'; cleanup: '+'; '.join(cleanup_errors)
        record['cleanup_errors']=cleanup_errors;record['cleanup_required']=bool(cleanup_errors);record['failure']=failure;record['probe_completed']=failure is None
        (args.output/'result.json').write_text(json.dumps(record,indent=2)+'\n')
    print(json.dumps({'probe_completed':record['probe_completed'],'failure':failure,'result':str(args.output/'result.json')}),flush=True)
    if failure:raise SystemExit(1)


if __name__=='__main__':main()
