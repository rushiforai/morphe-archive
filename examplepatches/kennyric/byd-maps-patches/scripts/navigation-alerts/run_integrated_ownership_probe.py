"""Run real Maps/Vela BUSY and release handover on the task-owned API34 AVD."""
import argparse
import io
import tarfile
import subprocess,threading,queue,time,json,hashlib,re,uuid,sys,shutil
from pathlib import Path

if not __debug__:
    raise RuntimeError("Run validation without -O or PYTHONOPTIMIZE; assertion checks are required")

parser=argparse.ArgumentParser(description=__doc__)
for name in ['sdk','source-apk','maps-apk','vela-apk','source-probe','maps-probe','vela-probe','output']:parser.add_argument('--'+name,type=Path,required=True)
parser.add_argument('--death-owner',choices=['maps','vela'],default='vela')
parser.add_argument('--scenario',choices=['handover','death-recovery'],default='handover')
parser.add_argument('--serial',choices=['emulator-5590'],default='emulator-5590')
parser.add_argument('--maps-package',choices=['com.google.android.apps.maps','org.ungoogled.android.apps.maps'],default='org.ungoogled.android.apps.maps')
parser.add_argument('--reviewed-synthetic-choices',action='store_true',required=True)
args=parser.parse_args();sdk=args.sdk;adb=sdk/'platform-tools/adb';serial=args.serial;maps_package=args.maps_package;output=args.output;output.mkdir(parents=True,exist_ok=False);token=uuid.uuid4().hex

def device(*args,check=True):return subprocess.run([str(adb),'-s',serial,*map(str,args)],capture_output=True,text=True,check=check,timeout=60)
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
assert device('emu','avd','name').stdout.splitlines()[0]=='native_warnings_ui_api34'
assert device('shell','getprop','ro.kernel.qemu').stdout.strip()=='1'
assert device('shell','getprop','ro.build.version.sdk').stdout.strip()=='34'
assert device('shell','getprop','sys.boot_completed').stdout.strip()=='1'
assert device('shell','id','-u').stdout.strip()=='0'
inputs={'nl.flitsmeister':args.source_apk,maps_package:args.maps_apk,'app.vela':args.vela_apk}
record={'scenario':args.scenario,'death_owner':args.death_owner,'serial':serial,'avd':'native_warnings_ui_api34','output':str(output),'control_token':token,'installed_sha256':{}}
for pkg,apk in inputs.items():
 installed=device('shell','pm','path',pkg).stdout.strip().removeprefix('package:');actual=device('shell','sha256sum',installed).stdout.split()[0];assert actual==sha(apk),(pkg,actual);record['installed_sha256'][pkg]=actual
certs=[]
helpers={}
for kind in ['maps','vela','source']:
 apk=getattr(args,kind+'_probe');frozen=output/(kind+'-helper.apk');shutil.copyfile(apk,frozen);helpers[kind]=frozen
 build=apk.parent/'build-report.json'
 if build.exists():shutil.copyfile(build,output/(kind+'-build-report.json'))
for apk in [*inputs.values(),*helpers.values()]:
 certs.append(re.search(r'Signer #1 certificate SHA-256 digest: ([0-9a-f]+)',subprocess.check_output([str(sdk/'build-tools/36.0.0/apksigner'),'verify','--print-certs',str(apk)],text=True)).group(1))
assert len(set(certs))==1;record['signer_sha256']=certs[0];record['helper_sha256']={k:sha(v) for k,v in helpers.items()}
for kind in ['maps','vela']:device('install','--no-incremental','-r',helpers[kind])
def permissions():
 text=device('shell','dumpsys','package','nl.flitsmeister').stdout;out={}
 for name in ['ACCESS_COARSE_LOCATION','ACCESS_FINE_LOCATION','ACCESS_BACKGROUND_LOCATION']:
  key='android.permission.'+name;m=re.search(re.escape(key)+r': granted=(true|false), flags=\[([^\]]*)\]',text)
  if m:out[key]={'granted':m[1]=='true','flags':m[2].strip()}
 return out
before=permissions();record['source_permissions_before']=before;changed=[];events=queue.Queue();processes={};threads=[];failure=None
receiver_permission_baselines={};receiver_permission_changes=[]
def receiver_permissions(package):
 text=device('shell','dumpsys','package',package).stdout;values={}
 for name in ['ACCESS_FINE_LOCATION','ACCESS_COARSE_LOCATION','POST_NOTIFICATIONS']:
  permission='android.permission.'+name;match=re.search(re.escape(permission)+r': granted=(true|false), flags=\[([^\]]*)\]',text)
  if match:values[permission]={'granted':match[1]=='true','flags':match[2].strip()}
 assert 'android.permission.ACCESS_FINE_LOCATION' in values and 'android.permission.ACCESS_COARSE_LOCATION' in values,'Missing receiver location declaration'
 return values
window_before={key:device('shell','settings','get','global',key).stdout.strip() for key in ['enable_freeform_support','force_resizable_activities']};window_changed=[];record['window_settings_before']=window_before

def launch(name,args):
 process=subprocess.Popen(list(map(str,args)),stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,bufsize=1);processes[name]=process
 def drain():
  with (output/(name+'-output.txt')).open('w') as f:
   for line in process.stdout:
    f.write(line);f.flush();events.put((name,line))
    if '_stage=' in line or 'STATUS: stage=' in line:print(name+': '+line.strip(),flush=True)
  events.put((name,None))
 t=threading.Thread(target=drain,daemon=True);t.start();threads.append(t)
def snapshot_preferences(package,label):
 remote='/data/user/0/'+package+'/shared_prefs';state={'package':package,'remote':remote,'files':{}}
 if device('shell','test','-d',remote,check=False).returncode:
  state['directory_existed']=False;return state
 state['directory_existed']=True
 raw=subprocess.check_output([str(adb),'-s',serial,'exec-out','tar','-cf','-','-C',remote,'.']);archive=output/(label+'-preferences.tar');archive.write_bytes(raw);state['archive']=str(archive)
 with tarfile.open(fileobj=io.BytesIO(raw)) as tar:
  for item in tar.getmembers():
   name=item.name.removeprefix('./')
   if item.isdir() and name in ('','.'):continue
   assert item.isfile() and '/' not in name and re.fullmatch(r'[A-Za-z0-9_.+=-]+\.xml(?:\.bak)?',name),'Unexpected preference entry'
   data=tar.extractfile(item).read();state['files'][name]={'sha256':hashlib.sha256(data).hexdigest(),'uid':item.uid,'gid':item.gid,'mode':item.mode}
 return state
preferences_before={}
def assert_stopped(package,wait_seconds=0):
 started=time.monotonic();deadline=started+wait_seconds
 observation={'package':package,'stopped':False,'samples':[]}
 record.setdefault('process_stop_observations',[]).append(observation)
 while True:
  lines=device('shell','ps','-A','-o','UID,PID,STAT,NAME').stdout.splitlines()
  matching=[line for line in lines if line.split() and (line.split()[-1]==package or line.split()[-1].startswith(package+':'))]
  now=time.monotonic();observation['samples'].append({'elapsed_seconds':now-started,'processes':matching})
  if not matching:
   observation['stopped']=True;return
  assert now<deadline,package+' process is still alive'
  time.sleep(min(.05,deadline-now))
if args.scenario=='death-recovery':
 for pkg in inputs:
  assert_stopped(pkg);preferences_before[pkg]=snapshot_preferences(pkg,pkg+'-before')
 record['preferences_before']=preferences_before

def restore_preferences(package):
 assert_stopped(package);baseline=preferences_before[package];now=snapshot_preferences(package,package+'-pre-restore')
 remote=baseline['remote']
 for name in now['files'].keys()-baseline['files'].keys():device('shell','rm','-f',remote+'/'+name)
 if baseline.get('directory_existed'):
  device('shell','mkdir','-p',remote)
  with tarfile.open(baseline['archive']) as tar:
   for item in tar.getmembers():
    if not item.isfile():continue
    name=item.name.removeprefix('./');entry=baseline['files'][name];data=tar.extractfile(item).read();local=output/(package+'-restore-'+name);local.write_bytes(data)
    device('push',local,remote+'/'+name);device('shell','chown',str(entry['uid'])+':'+str(entry['gid']),remote+'/'+name);device('shell','chmod',format(entry['mode'],'o'),remote+'/'+name)
 elif device('shell','test','-d',remote,check=False).returncode==0:device('shell','rmdir',remote)
 after=snapshot_preferences(package,package+'-restored');assert after['files']==baseline['files'] and after['directory_existed']==baseline['directory_existed'],'Preference restore drift: '+package
 return {'restored_exactly':True,'files':after['files']}

def stop_output_and_preserve_evidence():
 # Kill the receiver while its genuine speaker has already acknowledged STARTED.
 record['death_force_stop_monotonic_ns']=time.monotonic_ns()
 for pkg in ['app.vela',maps_package,'com.google.android.tts']:device('shell','am','force-stop',pkg);assert_stopped(pkg,wait_seconds=5)
 for kind,pkg in [('maps',maps_package),('vela','app.vela')]:
  device('pull','/sdcard/Android/data/'+pkg+'/files/native-warning-ownership/'+token+'-progress.json',output/(kind+'-pre-death-progress.json'))
  record.setdefault('pre_death_receiver_preferences_cleanup',{})[pkg]=restore_preferences(pkg)
 audio=device('shell','dumpsys','audio').stdout;(output/'audio-after-all-outputs-stopped.txt').write_text(audio)
 players=audio.split('  players:',1)[1].split('  ducked players',1)[0]
 relevant={int(re.search(r'uid:(\d+)',device('shell','pm','list','packages','-U',pkg).stdout).group(1)) for pkg in [*inputs,'com.google.android.tts']}
 for line in players.splitlines():
  uid=re.search(r'u/pid:(\d+)/',line)
  assert not (uid and int(uid[1]) in relevant and 'state:started' in line),'Relevant engine player remains active'
 record['outputs_verified_stopped']={'packages':[maps_package,'app.vela','com.google.android.tts'],'relevant_uids':sorted(relevant),'active_relevant_players':0}
 folder='/sdcard/Android/data/nl.flitsmeister/files/native-warning-ownership';device('shell','mkdir','-p',folder);device('shell','touch',folder+'/probe-handover-'+token+'-outputs-stopped')

def receiver(kind):
 label=kind;target=kind.removesuffix('-recovered');control=token+'-recovered' if kind.endswith('-recovered') else token
 launch(label,[adb,'-s',serial,'shell','am','instrument','-w','-r','-e','reviewed_synthetic_choices','true','-e','control_token',control,'nl.johninnl.warningprobe.owner.'+target+'/nl.johninnl.warningprobe.ownership.OwnershipReceiverProbe'])
def signal(kind,command):
 pkg=maps_package if kind.removesuffix('-recovered')=='maps' else 'app.vela';control=token+'-recovered' if kind.endswith('-recovered') else token;folder='/sdcard/Android/data/'+pkg+'/files/native-warning-ownership';device('shell','mkdir','-p',folder);device('shell','touch',folder+'/'+control+'-'+command)
try:
 for key,value in window_before.items():
  if value!='1':device('shell','settings','put','global',key,'1');window_changed.append(key)
 for perm,value in before.items():
  if not value['granted']:
   assert not any(x in value['flags'] for x in ['USER_FIXED','POLICY_FIXED','SYSTEM_FIXED']);device('shell','pm','grant','nl.flitsmeister',perm);changed.append(perm)
 for package in [maps_package,'app.vela']:
  baseline=receiver_permissions(package);receiver_permission_baselines[package]=baseline
  for permission,value in baseline.items():
   if not value['granted']:
    assert not any(flag in value['flags'] for flag in ['USER_FIXED','POLICY_FIXED','SYSTEM_FIXED']);device('shell','pm','grant',package,permission);receiver_permission_changes.append((package,permission))
 record['receiver_permissions_before']=receiver_permission_baselines
 launch('source',[sys.executable,'-u','scripts/navigation-alerts/run_fm_capture_probe.py','--adb',adb,'--serial',serial,'--target-apk',inputs['nl.flitsmeister'],'--probe-apk',helpers['source'],'--output',output/'source','--receiver-package',maps_package,'--scenarios','integrated_death_recovery' if args.scenario=='death-recovery' else 'integrated_handover','--death-owner','app.vela' if args.death_owner=='vela' else maps_package,'--native-id','probe-handover-'+token,'--matrix-timeout-seconds','240'])
 deadline=time.monotonic()+300
 while time.monotonic()<deadline:
  try:name,line=events.get(timeout=.2)
  except queue.Empty:
   if all(p.poll() is not None for p in processes.values()):break
   continue
  if line:
   if name=='source' and 'fm_capture_stage=production_endpoint_ready' in line and 'maps' not in processes:receiver('maps')
   if name=='source' and 'fm_capture_stage=handover_first_owner_ready' in line and 'vela' not in processes:receiver('vela')
   if name=='source' and 'fm_capture_stage=handover_first_complete' in line:signal('maps','off')
   if args.scenario=='handover' and name=='source' and 'fm_capture_stage=handover_second_complete' in line:
    signal('maps','stop');signal('vela','stop')
   if args.scenario=='death-recovery' and name=='source' and 'fm_capture_stage=death_maps_handover_required' in line:signal('vela','off');signal('maps','on')
   if args.scenario=='death-recovery' and name=='source' and 'fm_capture_stage=death_playback_started' in line:stop_output_and_preserve_evidence()
   if args.scenario=='death-recovery' and name=='source' and 'fm_capture_stage=death_recovery_completed' in line:receiver(args.death_owner+'-recovered')
   if args.scenario=='death-recovery' and name=='source' and 'fm_capture_stage=death_future_completed' in line:signal(args.death_owner+'-recovered','stop')
   if name=='source' and 'fm_capture_stage=native_event_in_production_journal' in line:(output/('concurrent-activities-'+str(time.monotonic_ns())+'.txt')).write_text(device('shell','dumpsys','activity','activities').stdout)
   if name=='vela' and line.startswith('INSTRUMENTATION_STATUS: detail='):
    state=json.loads(line.split('detail=',1)[1])
    if state.get('audio','').startswith('BUSY:'):
     folder='/sdcard/Android/data/nl.flitsmeister/files/native-warning-ownership';device('shell','mkdir','-p',folder);device('shell','touch',folder+'/probe-handover-'+token+'-contender-busy');record['contender_busy_state']=state
   if 'fm_capture_error=' in line:raise RuntimeError('Source native handover failed; raw log preserved')
   if 'ownership_receiver_result=' in line:
    r=json.loads(line.split('ownership_receiver_result=',1)[1]);(output/(name+'-result.json')).write_text(json.dumps(r,indent=2));assert r.get('status')=='observed',r
  if all(p.poll() is not None for p in processes.values()):break
 assert all(p.poll() is not None for p in processes.values()),'Bounded handover did not end'
 for t in threads:t.join(3)
 source=list((output/'source').glob('*/result.json'));assert len(source)==1
 r=json.loads(source[0].read_text());record['source_result']=str(source[0]);assert r['probe_completed'] and r['network_and_lease_restored'] and not r.get('failure'),r
 for kind in ([args.death_owner+'-recovered'] if args.scenario=='death-recovery' else ['maps','vela']):
  r=json.loads((output/(kind+'-result.json')).read_text());assert r['status']=='observed' and r['output_quiescent'] and r['preferences_restored_exactly']
 if args.scenario=='death-recovery':
  case=r_source=json.loads(source[0].read_text())['scenarios']['integrated_death_recovery']
  for key in ['live_owner_recovery_refused','uncertain_output_recovery']:
   remote=case[key]['actual_window_screenshot'];assert re.fullmatch(r'/storage/emulated/0/Android/data/nl\.flitsmeister/files/probe-handover-[a-f0-9]+-(?:refused|recovered)\.png',remote);device('pull',remote,output/(key+'.png'))
   remote=case[key]['confirmations_screenshot'];assert re.fullmatch(r'/storage/emulated/0/Android/data/nl\.flitsmeister/files/probe-handover-[a-f0-9]+-(?:live|uncertain)-confirmations\.png',remote);device('pull',remote,output/(key+'-confirmations.png'))
 # Save genuine platform windowing/lifecycle evidence; no lifecycle or policy flag is fabricated.
 (output/'actual-activities.txt').write_text(device('shell','dumpsys','activity','activities').stdout)
except Exception as e:failure=repr(e)
finally:
 for kind in ['maps','vela','maps-recovered','vela-recovered']:
  if kind in processes and processes[kind].poll() is None:signal(kind,'stop')
 for name,p in processes.items():
  try:p.wait(timeout=65)
  except subprocess.TimeoutExpired:failure=(failure or '')+'; '+name+' remains live, verified cleanup required'
 if args.scenario=='death-recovery':
  for pkg in inputs:
   if pkg=='nl.flitsmeister' and processes.get('source') is not None and processes['source'].poll() is None:
    failure=(failure or '')+'; source runner remains live, preserve source preferences for verified rollback';continue
   try:
    device('shell','am','force-stop',pkg)
    assert_stopped(pkg,wait_seconds=5)
    record.setdefault('final_preferences_cleanup',{})[pkg]=restore_preferences(pkg)
   except Exception as error:failure=(failure or '')+'; preference cleanup: '+repr(error)
 for perm in reversed(changed):device('shell','pm','revoke','nl.flitsmeister',perm)
 for package,permission in reversed(receiver_permission_changes):device('shell','pm','revoke',package,permission)
 record['receiver_permissions_after']={package:receiver_permissions(package) for package in receiver_permission_baselines}
 record['receiver_permissions_restored_exactly']=record['receiver_permissions_after']==receiver_permission_baselines
 if not record['receiver_permissions_restored_exactly']:failure=(failure or '')+'; receiver permission grants/flags drift'
 record['source_permissions_after']=permissions();record['source_permissions_restored_exactly']=record['source_permissions_after']==before
 if not record['source_permissions_restored_exactly']:failure=(failure or '')+'; permission drift'
 for key in reversed(window_changed):
  current=device('shell','settings','get','global',key).stdout.strip()
  if current!='1':failure=(failure or '')+'; independent window-setting change, preserve for manual review';continue
  value=window_before[key];device('shell','settings','delete' if value=='null' else 'put','global',key,*([] if value=='null' else [value]))
 record['window_settings_after']={key:device('shell','settings','get','global',key).stdout.strip() for key in window_before};record['window_settings_restored_exactly']=record['window_settings_after']==window_before
 if not record['window_settings_restored_exactly']:failure=(failure or '')+'; window-setting drift'
 record['failure']=failure;record['probe_completed']=failure is None;record['process_exit_codes']={k:p.poll() for k,p in processes.items()};(output/'result.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps({'probe_completed':record['probe_completed'],'failure':failure,'result':str(output/'result.json')}),flush=True)
if failure:sys.exit(1)
