#!/usr/bin/env python3
"""Bounded call-through Frida observation for the explicitly owned emulator only."""
import argparse,json,queue,re,signal,subprocess,time,hashlib
from pathlib import Path
import frida

p=argparse.ArgumentParser(description=__doc__)
p.add_argument('--adb',type=Path,required=True);p.add_argument('--agent',type=Path,required=True);p.add_argument('--token',required=True);p.add_argument('--output',type=Path,required=True);p.add_argument('--stop-file',type=Path,required=True)
p.add_argument('--provider',choices=['nl.flitsmeister','com.waze'],default='nl.flitsmeister')
p.add_argument('--additional-provider',choices=['nl.flitsmeister','com.waze'])
p.add_argument('--additional-host',choices=['app.johninnl.drivedeck.dev','com.google.android.projection.gearhead'],action='append',default=[])
p.add_argument('--receiver',choices=['org.ungoogled.android.apps.maps','com.google.android.apps.maps','app.vela'],default='org.ungoogled.android.apps.maps')
p.add_argument('--receiver-cancel-contract',choices=['integrated','ownership'],default='integrated')
p.add_argument('--duration-seconds',type=int,choices=[240,300,900],default=240)
a=p.parse_args()
if not re.fullmatch('[a-f0-9]{32}',a.token):raise SystemExit('Invalid owned tracing token')
def adb(*args):return subprocess.run([str(a.adb),'-s','emulator-5590',*map(str,args)],check=True,capture_output=True,text=True,timeout=10).stdout.strip()
if adb('emu','avd','name').splitlines()[0]!='native_warnings_ui_api34' or adb('shell','getprop','ro.build.version.sdk')!='34' or adb('shell','id','-u')!='0':raise SystemExit('Wrong owned tracing target')
forwards=adb('forward','--list').splitlines()
if not any(row.split()==['emulator-5590','tcp:28101','tcp:27283'] for row in forwards):raise SystemExit('Expected owned loopback forward is absent')
providers=list(dict.fromkeys([a.provider]+([a.additional_provider] if a.additional_provider else [])))
a.output.mkdir(parents=True,exist_ok=True);events=queue.Queue();sessions={};ready={};finished=set();gated=set();stopping=False;lost=False;barrier=False
source=a.agent.read_text();metadata={'frida_version':frida.__version__,'agent_sha256':hashlib.sha256(source.encode()).hexdigest(),'targets':providers+[a.receiver,'com.google.android.tts']+list(dict.fromkeys(a.additional_host)),'selected_provider':a.provider,'selected_receiver':a.receiver,'receiver_cancel_contract':a.receiver_cancel_contract,'duration_seconds':a.duration_seconds,'attachments':[],'cleanup_errors':[]}
manager=frida.get_device_manager();device=manager.add_remote_device('127.0.0.1:28101')
log=(a.output/'events.jsonl').open('w')
def write(event):
    event['observed_host_monotonic_ns']=time.monotonic_ns()
    event['observed_host_unix_ms']=time.time_ns()//1000000
    log.write(json.dumps(event,default=str)+'\n');log.flush()
def stop(*args):
    global stopping
    stopping=True
signal.signal(signal.SIGTERM,stop);signal.signal(signal.SIGINT,stop)
def target(name):return next((x for x in metadata['targets'] if name and (name==x or name.startswith(x+':'))),None)
def marker(package,name):
    folder='/sdcard/Android/data/'+package+'/files/native-warning-integrated';adb('shell','mkdir','-p',folder);adb('shell','touch',folder+'/'+name+'-'+a.token+'.request')
def receiver_cancel_marker():
    if a.receiver_cancel_contract=='integrated':marker(a.receiver,'cancel')
    else:
        folder='/sdcard/Android/data/'+a.receiver+'/files/native-warning-ownership';adb('shell','mkdir','-p',folder);adb('shell','touch',folder+'/'+a.token+'-seed-receiver-stop')
def fail(reason):
    global lost
    if lost:return
    lost=True;metadata['coverage_failure']=reason;write({'event':'coverage-failed','reason':reason})
    for provider in providers:marker(provider,'trace-lost')
    receiver_cancel_marker()
def attach(pid,name):
    if pid in sessions:return
    write({'event':'attach-start','pid':pid,'process':name})
    metadata.setdefault('attachment_attempts',[]).append({'pid':pid,'process':name})
    session=device.attach(pid);sessions[pid]=session
    def detached(reason,crash):events.put(('detach',pid,name,reason,crash))
    session.on('detached',detached)
    script=session.create_script(source,name='native-warning-observer')
    def message_received(message,data):events.put(('message',pid,name,message))
    script.on('message',message_received)
    script.load();metadata['attachments'].append({'pid':pid,'process':name,'script_loaded':True});write({'event':'attached','pid':pid,'process':name})
try:
    device.on('spawn-added',lambda spawn:events.put(('spawn',spawn.pid,spawn.identifier)))
    device.enable_spawn_gating()
    for process in device.enumerate_processes():
        if target(process.name):attach(process.pid,process.name)
    (a.output/'observer-ready').write_text('spawn observation active\n')
    deadline=time.monotonic()+a.duration_seconds
    while not stopping and not lost and not a.stop_file.exists() and time.monotonic()<deadline:
        try:event=events.get(timeout=.1)
        except queue.Empty:continue
        kind,pid,name,*body=event
        if kind=='spawn':
            gated.add(pid)
            try:
                if target(name):attach(pid,name)
            finally:
                device.resume(pid);gated.discard(pid)
        elif kind=='message':
            message=body[0];write({'pid':pid,'process':name,'message':message})
            if message.get('type')=='error':fail('Agent script error in '+name);continue
            payload=message.get('payload',{});code=payload.get('event')
            if code=='hooks-ready':
                installed=payload.get('installed',[])
                required=[]
                if name in providers:
                    required=['WarningEndpoint!handle(']
                    if name=='com.waze':required+=['NativeWarnings!prepareControllers(', 'NativeWarnings!repository(', 'NativeWarnings!sound(']
                elif name==a.receiver:
                    required=['WarningScheduler!cancel(']
                    if a.receiver=='app.vela':required+=['VelaWarningSpeaker!dispatch(','VelaWarningSpeaker!beforeSpeech(','VelaWarningSpeaker!finish(','VelaWarningSpeaker!utteranceStopped(']
                elif target(name) in a.additional_host:
                    required=['java.lang.Thread!dispatchUncaughtException(', 'android.app.Instrumentation!callActivityOnResume(']
                if payload.get('package')!=name:fail('Hooks-ready process/package mismatch: '+name)
                elif any(not any(symbol in hook for hook in installed) for symbol in required):fail('Required selected-process hooks absent: '+name)
                else:
                    ready[name]=pid
                    if name in providers:marker(name,'trace-ready')
                    metadata['ready_pids']=dict(ready)
            elif code in ['hooks-failed','observer-error','observer-budget-exhausted']:fail('Observation coverage failed in '+name+': '+str(code))
            elif code and code.startswith('java.lang.Thread!dispatchUncaughtException('):fail('Observed uncaught Java exception in '+name)
            elif code and 'Instrumentation!finish' in code:finished.add(pid)
            if not barrier and not lost and all(x in ready for x in [a.provider,a.receiver]):
                marker(a.provider,'trace-ready');barrier=True;metadata['barrier_released']=True;metadata['required_pids']={name:ready[name] for name in [a.provider,a.receiver]};write({'event':'both-required-processes-hooked-before-stimuli','pids':dict(metadata['required_pids'])})
        elif kind=='detach':
            reason,crash=body
            if not stopping and not a.stop_file.exists():
                try:
                    evidence=adb('shell','dumpsys','activity','exit-info',target(name))
                    filename='exit-info-'+str(pid)+'.txt';(a.output/filename).write_text(evidence[-65536:])
                    metadata.setdefault('exit_info',[]).append({'pid':pid,'process':name,'path':filename})
                except Exception as error:metadata.setdefault('exit_info_errors',[]).append({'pid':pid,'error':repr(error)})
            terminal=False;requested_stop=False
            if target(name) is not None and crash is None and reason=='process-terminated':
                path='/sdcard/Android/data/'+target(name)+'/files/native-warning-integrated/trace-terminal-'+a.token+'.request'
                check=subprocess.run([str(a.adb),'-s','emulator-5590','shell','test','-f',path],capture_output=True,timeout=10)
                if check.returncode not in [0,1]:raise RuntimeError('Cannot verify selected-process terminal marker')
                terminal=check.returncode==0
                stop_path='/data/user/0/'+target(name)+'/files/native-warning-integrated/trace-stop-'+a.token+'.request'
                check=subprocess.run([str(a.adb),'-s','emulator-5590','shell','test','-f',stop_path],capture_output=True,timeout=10)
                if check.returncode not in [0,1]:raise RuntimeError('Cannot verify requested process stop marker')
                requested_stop=check.returncode==0
            write({'event':'detached','pid':pid,'process':name,'reason':reason,'expected_after_instrumentation_finish':pid in finished,'expected_after_requested_stop':requested_stop,'expected_after_successful_source_capture':terminal and name==a.provider,'expected_after_successful_receiver_capture':terminal and name==a.receiver,'crash_present':crash is not None})
            if crash is not None:
                report=str(getattr(crash,'report',crash));(a.output/('crash-'+str(pid)+'.txt')).write_text(report[:524288]);metadata.setdefault('crashes',[]).append({'pid':pid,'truncated':len(report)>524288});fail('Observed target crash: '+name)
            if not (terminal or requested_stop) and pid not in finished and not (metadata.get('required_pids') and all(v in finished for v in metadata['required_pids'].values())) and not a.stop_file.exists():fail('Unexpected process detach: '+name+' '+str(reason))
            ready.pop(name,None)
    if time.monotonic()>=deadline and not a.stop_file.exists():fail('Bounded observer window ended')
except BaseException as error:
    metadata['error']=repr(error)
    try:fail('Observer failed')
    except Exception as nested:metadata['cleanup_errors'].append('Coverage marker: '+repr(nested))
finally:
    try:device.disable_spawn_gating()
    except Exception as error:metadata['cleanup_errors'].append('Disable spawn gating: '+repr(error))
    for pid in list(gated):
        try:device.resume(pid)
        except Exception as error:metadata['cleanup_errors'].append('Resume paused process: '+repr(error))
    for pid,session in sessions.items():
        try:session.detach()
        except frida.InvalidOperationError:pass
        except Exception as error:metadata['cleanup_errors'].append('Detach: '+repr(error))
    for package in metadata['targets']:
        folder='/sdcard/Android/data/'+package+'/files/native-warning-integrated/'
        for prefix in ['trace-ready','trace-lost','trace-terminal','trace-stop','cancel']:
            try:adb('shell','rm','-f',folder+prefix+'-'+a.token+'.request')
            except Exception as error:metadata['cleanup_errors'].append('Marker removal: '+repr(error))
        try:adb('shell','rm','-f','/data/user/0/'+package+'/files/native-warning-integrated/trace-stop-'+a.token+'.request')
        except Exception as error:metadata['cleanup_errors'].append('Requested-stop marker removal: '+repr(error))
    if a.receiver_cancel_contract=='ownership':
        try:adb('shell','rm','-f','/sdcard/Android/data/'+a.receiver+'/files/native-warning-ownership/'+a.token+'-seed-receiver-stop')
        except Exception as error:metadata['cleanup_errors'].append('Ownership cancellation marker removal: '+repr(error))
    metadata['coverage_lost']=lost;metadata['cleanup_required']=bool(metadata['cleanup_errors']);log.close()
    (a.output/'result.json').write_text(json.dumps(metadata,indent=2)+'\n');manager.remove_remote_device('127.0.0.1:28101')
