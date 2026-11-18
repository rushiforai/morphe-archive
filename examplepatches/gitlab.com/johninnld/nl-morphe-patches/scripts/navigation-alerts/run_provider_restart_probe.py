"""Verify persisted uncertainty across actual provider-process death and parked recovery."""
import argparse
import io
import tarfile
import xml.etree.ElementTree as ET
import subprocess,threading,queue,time,json,hashlib,re,uuid,sys,shutil
from pathlib import Path

if not __debug__:
    raise RuntimeError("Run validation without -O or PYTHONOPTIMIZE; assertion checks are required")

parser=argparse.ArgumentParser(description=__doc__)
for name in ['sdk','source-apk','maps-apk','vela-apk','source-probe','maps-probe','vela-probe','output']:parser.add_argument('--'+name,type=Path,required=True)
parser.add_argument('--receiver',choices=['maps','vela'],default='maps')
parser.add_argument('--serial',choices=['emulator-5590'],default='emulator-5590')
parser.add_argument('--maps-package',choices=['com.google.android.apps.maps','org.ungoogled.android.apps.maps'],default='com.google.android.apps.maps')
parser.add_argument('--prepare-vela-ui',action='store_true')
parser.add_argument('--warning-suite',action='store_true')
parser.add_argument('--warning-suite-cases',choices=['all','road-service','concurrent','native-guidance','moving-camera','delayed-passage','native-zone'],default='all')
parser.add_argument('--warning-categories',type=int,choices=range(1,128),default=127)
parser.add_argument('--reviewed-synthetic-choices',action='store_true',required=True)
args=parser.parse_args();
if args.warning_suite_cases in ['native-guidance','moving-camera','delayed-passage','native-zone'] and not args.warning_suite:parser.error('Guidance, moving camera and delayed passage cases require the warning suite')
if args.warning_suite_cases in ['native-guidance','moving-camera','delayed-passage','native-zone'] and args.receiver=='vela' and not args.prepare_vela_ui:parser.error('Vela guidance and spatial cases require the original phone UI setup')
if args.warning_suite_cases in ['moving-camera','delayed-passage','native-zone'] and args.serial!='emulator-5590':parser.error('Spatial replay and moving camera cases require the isolated phone AVD')
if args.prepare_vela_ui and args.receiver!='vela':parser.error('--prepare-vela-ui requires --receiver vela')
if args.warning_categories!=127 and (not args.warning_suite or args.warning_suite_cases!='road-service'):parser.error('A restricted category mask is only supported for the focused road-service suite')
sdk=args.sdk;adb=sdk/'platform-tools/adb';serial=args.serial;avd='native_warnings_ui_api34';output=args.output;output.mkdir(parents=True,exist_ok=False);token=uuid.uuid4().hex

def device(*args,check=True):return subprocess.run([str(adb),'-s',serial,*map(str,args)],capture_output=True,text=True,check=check,timeout=60)
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
assert device('emu','avd','name').stdout.splitlines()[0]==avd
assert device('shell','getprop','ro.kernel.qemu').stdout.strip()=='1'
assert device('shell','getprop','ro.build.version.sdk').stdout.strip()=='34'
assert device('shell','getprop','sys.boot_completed').stdout.strip()=='1'
assert device('shell','id','-u').stdout.strip()=='0'
inputs={'nl.flitsmeister':args.source_apk,args.maps_package:args.maps_apk,'app.vela':args.vela_apk}
record={'scenario':'warning-suite' if args.warning_suite else 'provider-restart','receiver':args.receiver,'warning_suite_cases':args.warning_suite_cases,'warning_categories':args.warning_categories,'serial':serial,'avd':avd,'output':str(output),'control_token':token,'installed_sha256':{}}
for pkg,apk in inputs.items():
 installed=device('shell','pm','path',pkg).stdout.strip().removeprefix('package:');actual=device('shell','sha256sum',installed).stdout.split()[0];assert actual==sha(apk),(pkg,actual);record['installed_sha256'][pkg]=actual
certs=[]
helpers={}
for kind in ['maps','vela','source']:
 apk=getattr(args,kind+'_probe');frozen=output/(kind+'-helper.apk');shutil.copyfile(apk,frozen);helpers[kind]=frozen
 build=apk.parent/'build-report.json'
 if build.exists():shutil.copyfile(build,output/(kind+'-build-report.json'))
 if kind==args.receiver:
  assert build.exists() and json.loads(build.read_text())['target_package']==(args.maps_package if kind=='maps' else 'app.vela'),'Receiver helper target differs from requested package'
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
for pkg in inputs:
 assert_stopped(pkg);preferences_before[pkg]=snapshot_preferences(pkg,pkg+'-before')
record['preferences_before']=preferences_before

def restore_preferences(package,baseline=None):
 assert_stopped(package);baseline=preferences_before[package] if baseline is None else baseline;now=snapshot_preferences(package,package+'-pre-restore')
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

receiver_package=args.maps_package if args.receiver=='maps' else 'app.vela'
route_package=receiver_package
working_preferences=dict(preferences_before)
vela_permission_changes=[]
vela_permissions_before={}
route_permissions_before={}
route_permission_changes=[]
hidden_policy_before=None
base='probe-restart-'+token
source_details={}

def source(name,scenario,**expectations):
 command=[sys.executable,'-u','scripts/navigation-alerts/run_fm_capture_probe.py','--adb',adb,'--serial',serial,'--target-apk',inputs['nl.flitsmeister'],'--probe-apk',helpers['source'],'--output',output/name,'--scenarios',scenario,'--receiver-package',args.maps_package,'--death-owner',receiver_package,'--native-id',base,'--warning-suite-cases',args.warning_suite_cases,'--matrix-timeout-seconds','240']
 for key,value in expectations.items():command.extend(['--'+key.replace('_','-'),value])
 launch(name,command)
def receiver(role):
 launch(role,[adb,'-s',serial,'shell','am','instrument','-w','-r','-e','reviewed_synthetic_choices','true','-e','control_token',token+'-'+role,'-e','warning_categories',str(args.warning_categories),'-e','passage_case','true' if args.warning_suite_cases=='delayed-passage' else 'false','-e','moving_camera_case','true' if args.warning_suite_cases=='moving-camera' else 'false','-e','native_zone_case','true' if args.warning_suite_cases=='native-zone' else 'false','-e','native_guidance_case','true' if args.warning_suite_cases=='native-guidance' else 'false','nl.johninnl.warningprobe.owner.'+args.receiver+'/nl.johninnl.warningprobe.ownership.OwnershipReceiverProbe'])
def signal(role,action='stop'):
 assert action in ['stop','on','off']
 folder='/sdcard/Android/data/'+receiver_package+'/files/native-warning-ownership';device('shell','mkdir','-p',folder);device('shell','touch',folder+'/'+token+'-'+role+'-'+action)
def receiver_report(role):
 text=(output/(role+'-output.txt')).read_text();m=re.search(r'^INSTRUMENTATION_RESULT: ownership_receiver_result=(.+)$',text,re.M);assert m,'Missing complete receiver result: '+role
 value=json.loads(m[1]);(output/(role+'-result.json')).write_text(json.dumps(value,indent=2)+'\n');assert value['status']=='observed' and value['output_quiescent'] and value['preferences_restored_exactly'];return value
def source_report(name):
 results=list((output/name).glob('*/result.json'));assert len(results)==1
 value=json.loads(results[0].read_text());assert value['network_and_lease_restored'] and not value['cleanup_errors'];return results[0],value

def vela_permissions(package='app.vela',declared_only=False):
 text=device('shell','dumpsys','package',package).stdout;out={}
 for name in ['ACCESS_FINE_LOCATION','ACCESS_COARSE_LOCATION','POST_NOTIFICATIONS']:
  key='android.permission.'+name;match=re.search(re.escape(key)+r': granted=(true|false), flags=\[([^\]]*)\]',text)
  if declared_only and match is None:continue
  assert match,'Missing receiver permission '+key;out[key]={'granted':match[1]=='true','flags':match[2].strip()}
 return out

def ui_dump(label):
 remote='/sdcard/native-warning-vela-reviewed-ui.xml';device('shell','uiautomator','dump',remote);path=output/(label+'.xml');device('pull',remote,path);return ET.parse(path)
def ui_click(tree,label,package='app.vela'):
 parents={child:parent for parent in tree.iter() for child in parent};nodes=[node for node in tree.iter('node') if node.get('package')==package and (node.get('text')==label or node.get('content-desc')==label)];assert len(nodes)==1,('Expected unique UI control',label,len(nodes));node=nodes[0]
 original=node
 while node.get('clickable')!='true' and node in parents:node=parents[node]
 # Some original Compose pointer-input controls expose enabled text but no clickable ancestor.
 if node.get('clickable')!='true':node=original
 assert node.get('package')==package and node.get('enabled')=='true';display=None;focus=[]
 for line in device('shell','dumpsys','window','displays').stdout.splitlines():
  match=re.search(r'Display: mDisplayId=(\d+)',line)
  if match:display=int(match[1])
  if display==0 and 'mCurrentFocus=' in line:focus.append(line)
 assert len(focus)==1 and package+'/' in focus[0],('Unexpected current UI focus',focus)
 coords=list(map(int,re.findall(r'\d+',node.get('bounds'))));assert len(coords)==4;record.setdefault('reviewed_ui_actions',[]).append({'label':label,'package':package,'bounds':node.get('bounds')});device('shell','input','tap',(coords[0]+coords[2])//2,(coords[1]+coords[3])//2)
def ui_picture(label):
 (output/(label+'.png')).write_bytes(subprocess.check_output([str(adb),'-s',serial,'exec-out','screencap','-p']))
def ui_scroll(tree):
 scrollers=[node for node in tree.iter('node') if node.get('package')=='app.vela' and node.get('scrollable')=='true'];assert scrollers,'No actual Vela scroll surface';bounds=[list(map(int,re.findall(r'\d+',node.get('bounds')))) for node in scrollers];x1,y1,x2,y2=max(bounds,key=lambda b:(b[2]-b[0])*(b[3]-b[1]));device('shell','input','swipe',(x1+x2)//2,y1+(y2-y1)*4//5,(x1+x2)//2,y1+(y2-y1)//5,'350')
def vela_setup_surface(tree,focus):
 """Admit reviewed setup surfaces; never dismiss an arbitrary app-failure dialog."""
 android={node.get('text') for node in tree.iter('node') if node.get('package')=='android'}
 if "Digital Wellbeing isn't responding" in android:
  if not re.search(r'Application Not Responding: com\.google\.android\.apps\.wellbeing(?:[ }]|$)',focus):
   raise RuntimeError('Digital Wellbeing dialog has an unexpected focused package')
  buttons=[node for node in tree.iter('node') if node.get('package')=='android' and node.get('text')=='Close app' and node.get('enabled')=='true' and node.get('clickable')=='true']
  if len(buttons)!=1 or not re.fullmatch(r'\[\d+,\d+\]\[\d+,\d+\]',buttons[0].get('bounds','')):
   raise RuntimeError('Reviewed system ANR close control is ambiguous')
  coords=list(map(int,re.findall(r'\d+',buttons[0].get('bounds'))))
  if coords[2]<=coords[0] or coords[3]<=coords[1]:raise RuntimeError('Reviewed system ANR close control has invalid bounds')
  return 'WELLBEING_ANR',buttons[0].get('bounds')
 if any(text and ("isn't responding" in text or 'keeps stopping' in text) for text in android):
  raise RuntimeError('Unreviewed app failure dialog blocks Vela setup')
 if 'app.vela/' not in focus:return 'PENDING',None
 labels={node.get('text') or node.get('content-desc') for node in tree.iter('node') if node.get('package')=='app.vela'}
 known={'Get started','No Google','Use system voice','Got it','Settings','Open settings'}
 if labels&known or ('Continue' in labels and labels&{'Plate cameras','License plate camera marker'}):return 'READY',None
 return 'PENDING',None
def await_vela_setup_surface():
 deadline=time.monotonic()+30;closed=False
 for attempt in range(12):
  if time.monotonic()>=deadline:break
  tree=ui_dump('setup-admission-'+str(attempt));display=None;focus=[]
  for line in device('shell','dumpsys','window','displays').stdout.splitlines():
   match=re.search(r'Display: mDisplayId=(\d+)',line)
   if match:display=int(match[1])
   if display==0 and 'mCurrentFocus=' in line:focus.append(line)
  if len(focus)!=1:raise RuntimeError('Ambiguous default-display focus during Vela setup')
  state,bounds=vela_setup_surface(tree,focus[0]);record.setdefault('setup_admission',[]).append({'state':state,'focus':focus[0]})
  if state=='READY':return tree
  if state=='WELLBEING_ANR':
   if closed:raise RuntimeError('Reviewed Digital Wellbeing ANR recurred; setup is not stable')
   ui_picture('reviewed-wellbeing-anr');coords=list(map(int,re.findall(r'\d+',bounds)))
   record.setdefault('reviewed_ui_actions',[]).append({'label':'Close app','package':'android','target':'com.google.android.apps.wellbeing','bounds':bounds,'scope':'Owned emulator snapshot only; restored after job'})
   device('shell','input','tap',(coords[0]+coords[2])//2,(coords[1]+coords[3])//2);closed=True
  time.sleep(.5)
 raise RuntimeError('Original Vela setup surface did not become ready within its admission bound')
def prepare_vela_ui():
 global vela_permissions_before
 vela_permissions_before=route_permissions_before if args.warning_suite else vela_permissions();record['vela_permissions_before']=vela_permissions_before
 if not args.warning_suite:
  for permission,value in vela_permissions_before.items():
   if not value['granted']:
    assert not any(flag in value['flags'] for flag in ['USER_FIXED','POLICY_FIXED','SYSTEM_FIXED']);device('shell','pm','grant','app.vela',permission);vela_permission_changes.append(permission)
 record['vela_permissions_during']=vela_permissions();assert all(value['granted'] for value in record['vela_permissions_during'].values())
 device('shell','am','start','-W','--windowingMode','1','-n','app.vela/.Launcher')
 tree=await_vela_setup_surface();ui_picture('onboarding-initial')
 if any(node.get('package')=='app.vela' and node.get('text')=='Get started' for node in tree.iter('node')):ui_click(tree,'Get started');time.sleep(.5)
 for attempt in range(9):
  tree=ui_dump('onboarding-'+str(attempt));labels={node.get('text') or node.get('content-desc') for node in tree.iter('node') if node.get('package')=='app.vela'}
  record.setdefault('reviewed_onboarding_ui_labels',[]).append(sorted(value for value in labels if value))
  if 'No Google' in labels:
   ui_click(tree,'No Google');time.sleep(.3);choice=ui_dump('onboarding-google-choice-'+str(attempt));choice_labels={node.get('text') or node.get('content-desc') for node in choice.iter('node') if node.get('package')=='app.vela'}
   if 'Continue' in choice_labels:ui_click(choice,'Continue')
   time.sleep(.3);continue
  if 'Continue' in labels and ('Plate cameras' in labels or 'License plate camera marker' in labels):ui_click(tree,'Continue');time.sleep(.3);continue
  if 'Use system voice' in labels:ui_click(tree,'Use system voice');time.sleep(.5);continue
  if 'Got it' in labels:ui_click(tree,'Got it');time.sleep(.5);continue
  if 'Settings' in labels or 'Open settings' in labels:break
  if attempt==8:raise RuntimeError('Original Vela map/settings UI not reached after reviewed onboarding')
  time.sleep(.5)
 ui_picture('after-onboarding');device('shell','am','force-stop','app.vela');assert_stopped('app.vela',wait_seconds=5);working_preferences['app.vela']=snapshot_preferences('app.vela','vela-reviewed-ui-baseline');record['working_vela_ui_preferences']=working_preferences['app.vela']

def find_vela_status_ui(expected,max_seconds=75):
 deadline=time.monotonic()+max_seconds;previous=None;unchanged=0
 for attempt in range(36):
  if time.monotonic()>=deadline:break
  tree=ui_dump('fenced-navigation-'+str(attempt));nodes=[node for node in tree.iter('node') if node.get('package')=='app.vela']
  labels=[node.get('text') or node.get('content-desc') for node in nodes]
  if any(value and expected in value for value in labels):
   ui_picture('actual-vela-uncertainty-status');record['visible_vela_uncertainty_status']={'text':expected,'xml':str(output/('fenced-navigation-'+str(attempt)+'.xml')),'screenshot':str(output/'actual-vela-uncertainty-status.png')};return
  signature=tuple((node.get('text'),node.get('content-desc'),node.get('bounds')) for node in nodes)
  unchanged=unchanged+1 if signature==previous else 0;previous=signature
  assert unchanged<2,'Actual Vela settings scroll surface unchanged before recovery status'
  ui_scroll(tree)
 raise AssertionError('Actual Vela uncertainty status not visible in navigation settings')

def inspect_vela_status_ui():
 tree=ui_dump('fenced-map-ui');ui_picture('fenced-map-ui');labels={node.get('text') or node.get('content-desc') for node in tree.iter('node') if node.get('package')=='app.vela'}
 assert any(label and 'Speed cam 50' in label for label in labels),'Actual Vela map does not expose received semantic warning'
 ui_click(tree,'Settings');time.sleep(.2);opened=False
 for attempt in range(7):
  tree=ui_dump('fenced-settings-menu-'+str(attempt));labels={node.get('text') or node.get('content-desc') for node in tree.iter('node') if node.get('package')=='app.vela'}
  if 'Navigation' in labels:ui_click(tree,'Navigation');time.sleep(.2);opened=True;break
  ui_scroll(tree)
 assert opened,'Actual Navigation settings section not reached'
 find_vela_status_ui('Waiting for previous audio to stop')

def stop_and_verify_outputs():
 for pkg in [args.maps_package,'app.vela','com.google.android.tts']:
  device('shell','am','force-stop',pkg);assert_stopped(pkg,wait_seconds=5)
 for pkg in [args.maps_package,'app.vela']:record.setdefault('pre_recovery_preferences_cleanup',{})[pkg]=restore_preferences(pkg,working_preferences[pkg])
 audio=device('shell','dumpsys','audio').stdout;(output/'audio-before-parked-reset.txt').write_text(audio);players=audio.split('  players:',1)[1].split('  ducked players',1)[0]
 relevant={int(re.search(r'uid:(\d+)',device('shell','pm','list','packages','-U',pkg).stdout)[1]) for pkg in [*inputs,'com.google.android.tts']}
 for line in players.splitlines():
  uid=re.search(r'u/pid:(\d+)/',line);assert not(uid and int(uid[1]) in relevant and 'state:started' in line),'Relevant player remains active'
 record['outputs_verified_stopped']={'packages':[args.maps_package,'app.vela','com.google.android.tts'],'relevant_uids':sorted(relevant),'active_relevant_players':0}
 folder='/sdcard/Android/data/nl.flitsmeister/files/native-warning-ownership';device('shell','mkdir','-p',folder);device('shell','touch',folder+'/'+base+'-outputs-stopped')
try:
 for key,value in window_before.items():
  if value!='1':device('shell','settings','put','global',key,'1');window_changed.append(key)
 for permission,value in before.items():
  if not value['granted']:
   assert not any(flag in value['flags'] for flag in ['USER_FIXED','POLICY_FIXED','SYSTEM_FIXED']);device('shell','pm','grant','nl.flitsmeister',permission);changed.append(permission)
 if args.warning_suite:
  # Complete reviewed receiver permission setup before its real Activity can request it mid-corpus.
  # Never synthesize a permission absent from this installed receiver's runtime declaration.
  route_permissions_before=vela_permissions(route_package,declared_only=True);record['route_permissions_before']=route_permissions_before
  record['reviewed_receiver_permission_package']=route_package
  for permission,value in route_permissions_before.items():
   if not value['granted']:
    assert not any(flag in value['flags'] for flag in ['SYSTEM_FIXED','POLICY_FIXED','USER_FIXED']);device('shell','pm','grant',route_package,permission);route_permission_changes.append(permission)
  record['route_permissions_during']=vela_permissions(route_package,declared_only=True);assert all(value['granted'] for value in record['route_permissions_during'].values())
 if args.warning_suite_cases in ['native-guidance','moving-camera','delayed-passage','native-zone']:
  (output/'route-location-before.txt').write_text(device('shell','dumpsys','location').stdout);device('emu','geo','fix','4.9000','52.3700');record['controlled_route_start']={'latitude':52.3700,'longitude':4.9000}
 if args.prepare_vela_ui:prepare_vela_ui()
 if args.warning_suite_cases=='native-guidance' and args.receiver=='vela':
  hidden_policy_before=device('shell','settings','get','global','hidden_api_policy').stdout.strip();record['hidden_api_policy_before']=hidden_policy_before;device('shell','settings','put','global','hidden_api_policy','1')
 source('seed-source','integrated_warning_suite' if args.warning_suite else 'integrated_restart_seed');deadline=time.monotonic()+300
 while time.monotonic()<deadline:
  try:name,line=events.get(timeout=.2)
  except queue.Empty:
   if all(p.poll() is not None for p in processes.values()):break
   continue
  if not args.warning_suite and name=='seed-source' and line is None and 'restarted-source' not in processes:raise RuntimeError('Seed source ended before the native playback boundary')
  if line:
   if name in ['seed-source','restarted-source'] and line.startswith('INSTRUMENTATION_STATUS: fm_capture_detail='):source_details[name]=json.loads(line.split('fm_capture_detail=',1)[1])
   if name=='seed-source' and 'fm_capture_stage=restart_seed_ready' in line:receiver('seed-receiver')
   if args.warning_suite_cases in ['moving-camera','native-zone'] and name=='seed-source' and 'fm_capture_stage=moving_camera_fix' in line:
    sample=dict(source_details[name]);sample['gps_console_response']=device('emu','geo','fix',sample['longitude'],sample['latitude'],'0','8',sample['speed_mps']*1.94384449).stdout.strip();assert sample['gps_console_response']=='OK','Emulator rejected moving GPS';sample['host_monotonic_s']=time.monotonic();record.setdefault('moving_gps_samples',[]).append(sample)
   if args.warning_suite and args.warning_suite_cases!='delayed-passage' and name=='seed-source' and 'fm_capture_stage=warning_suite_ready' in line:receiver('seed-receiver')
   if args.warning_suite_cases=='delayed-passage' and name=='seed-source':
    if 'fm_capture_stage=warning_suite_ready' in line:
     response=device('emu','geo','fix','4.9','52.3806','0','8',20*1.94384449).stdout.strip();assert response=='OK';receiver('seed-receiver')
    if 'fm_capture_stage=replay_preflight_completed' in line:signal('seed-receiver','off')
    if 'fm_capture_stage=replay_case_prepared' in line:
     detail=source_details[name];response=device('emu','geo','fix',detail['receiver_longitude'],detail['receiver_latitude'],'0','8',detail['receiver_speed_mps']*1.94384449).stdout.strip();assert response=='OK';record.setdefault('replay_cases_prepared',[]).append(detail)
     if 'seed-receiver' not in processes:receiver('seed-receiver')
     else:signal('seed-receiver','on')
    if 'fm_capture_stage=replay_case_completed' in line:signal('seed-receiver','off')
    if 'fm_capture_stage=replay_same_authority_rebind' in line:signal('seed-receiver','on')
    if 'fm_capture_stage=replay_rebind_completed' in line:signal('seed-receiver','off')
   if args.warning_suite_cases=='native-zone' and name=='seed-source' and 'fm_capture_stage=native_zone_trace_ready' in line:
    detail=source_details[name];remote=detail['remote_trace'];assert re.fullmatch(r'/storage/emulated/0/Android/data/nl\.flitsmeister/files/native-warning-zones/private-fm15-zone-[a-f0-9-]+\.json',remote)
    local=output/'native-zone-source-trace.json';device('pull',remote,local);assert sha(local)==detail['trace_sha256'];record['native_zone_trace']=str(local);record['native_zone_trace_sha256']=detail['trace_sha256']
   if args.warning_suite and name=='seed-source' and 'fm_capture_stage=warning_suite_complete' in line:
    if args.warning_suite_cases=='native-guidance' and args.receiver=='vela':device('emu','geo','fix','4.9000','52.3701');record['fresh_post_warning_fix']={'latitude':52.3701,'longitude':4.9000}
    else:signal('seed-receiver')
   if name=='seed-receiver' and 'INSTRUMENTATION_STATUS: stage=NATIVE_GUIDANCE_REGENERATED' in line:signal('seed-receiver')
   if name=='seed-receiver' and 'INSTRUMENTATION_STATUS: stage=RECEIVER_PASSAGE_FIX_READY' in line:
    folder='/sdcard/Android/data/nl.flitsmeister/files/native-warning-ownership';device('shell','mkdir','-p',folder);device('shell','touch',folder+'/'+base+'-replay-gps-ready')
   if name=='seed-receiver' and 'INSTRUMENTATION_STATUS: stage=NATIVE_GUIDANCE_STARTED' in line:
    folder='/sdcard/Android/data/nl.flitsmeister/files/native-warning-ownership';device('shell','mkdir','-p',folder);device('shell','touch',folder+'/'+base+'-native-guidance-started')
   if args.warning_suite and name=='seed-source' and 'fm_capture_error=' in line:raise RuntimeError('Actual native warning suite failed; partial evidence retained')
   if name=='seed-source' and 'fm_capture_stage=restart_seed_started' in line:
    detail=source_details[name];pending=detail['pending'];assert pending['stored_started'] and pending['stored_attempt']==pending['pending_attempt'];record['seed_started']=detail
    # Deliberately kill both real processes after the source durably acknowledged native STARTED.
    for package in [receiver_package,'nl.flitsmeister']:device('shell','am','force-stop',package);assert_stopped(package,wait_seconds=5)
    processes['seed-source'].wait(timeout=20)
    for thread in threads:thread.join(timeout=.1)
    path,seed=source_report('seed-source');assert not seed['probe_completed'];record['expected_killed_source_result']=str(path)
    device('pull','/sdcard/Android/data/'+receiver_package+'/files/native-warning-ownership/'+token+'-seed-receiver-progress.json',output/'seed-receiver-progress.json')
    record['seed_receiver_preferences_restored']=restore_preferences(receiver_package,working_preferences[receiver_package])
    source('restarted-source','integrated_restart_recovery',expected_pending_attempt=pending['pending_attempt'],expected_old_session=pending['provider_session'])
   if name=='restarted-source' and 'fm_capture_stage=restart_uncertainty_loaded' in line:
    loaded=source_details[name];original=record['seed_started']['pending'];assert loaded['provider_session']!=original['provider_session'] and loaded['pending_provider_session']==original['provider_session'] and loaded['pending_attempt']==original['pending_attempt'] and loaded['code']=='AUDIO_UNCERTAIN';record['reloaded_pending']=loaded;receiver('fenced-receiver')
   if name=='restarted-source' and 'fm_capture_stage=restart_fenced_event_observed' in line:
    record['fenced_native_event']=source_details[name]
    device('pull','/sdcard/Android/data/'+receiver_package+'/files/native-warning-ownership/'+token+'-fenced-receiver-progress.json',output/'fenced-receiver-progress.json')
    progress=json.loads((output/'fenced-receiver-progress.json').read_text());assert any(row['audio']=='AUDIO_UNCERTAIN' for row in progress['states']);assert not any(row['stage']=='SCHEDULER_STARTED' for row in progress['diagnostics']);assert any(row['stage']=='RECEIVER_ACCEPTED' and row.get('sequence')==record['fenced_native_event']['authority']['sequence'] for row in progress['diagnostics'])
    picture=subprocess.check_output([str(adb),'-s',serial,'exec-out','screencap','-p']);(output/'actual-fenced-receiver.png').write_bytes(picture)
    (output/'actual-fenced-activities.txt').write_text(device('shell','dumpsys','activity','activities').stdout)
    if args.prepare_vela_ui:inspect_vela_status_ui()
    signal('fenced-receiver');processes['fenced-receiver'].wait(timeout=20)
    for thread in threads:thread.join(timeout=.1)
    receiver_report('fenced-receiver');stop_and_verify_outputs()
   if name=='restarted-source' and 'fm_capture_stage=restart_recovery_completed' in line:receiver('recovered-receiver')
   if name=='restarted-source' and 'fm_capture_stage=restart_future_completed' in line:signal('recovered-receiver')
   if name=='restarted-source' and 'fm_capture_error=' in line:raise RuntimeError('Actual restarted provider probe failed; partial evidence retained')
  if all(p.poll() is not None for p in processes.values()):break
 if args.warning_suite:
  assert all(process.poll() is not None for process in processes.values()),'Native warning suite deadline'
  for thread in threads:thread.join(timeout=2)
  path,result=source_report('seed-source');assert result['probe_completed'] and not result['failure'];record['warning_suite_source_result']=str(path);receiver_report('seed-receiver')
 else:
  assert 'restarted-source' in processes and all(p.poll() is not None for p in processes.values()),'Provider restart deadline'
  for thread in threads:thread.join(timeout=2)
  path,restarted=source_report('restarted-source');assert restarted['probe_completed'] and not restarted['failure'];record['restarted_source_result']=str(path);receiver_report('recovered-receiver')
  case=restarted['scenarios']['integrated_restart_recovery'];reset=case['uncertain_output_recovery']
  for field in ['actual_window_screenshot','confirmations_screenshot']:
   remote=reset[field];assert re.fullmatch(r'/storage/emulated/0/Android/data/nl\.flitsmeister/files/probe-restart-[a-f0-9]+-(?:recovered|uncertain-confirmations)\.png',remote);device('pull',remote,output/(field+'.png'))
except Exception as error:
 failure=repr(error)
 if args.prepare_vela_ui and 'fenced_native_event' in record and 'outputs_verified_stopped' not in record and processes.get('restarted-source') is not None and processes['restarted-source'].poll() is None:
  try:
   stop_and_verify_outputs();record['failure_cleanup_parked_reset_requested']=True
  except Exception as cleanup_error:record['failure_cleanup_error']=repr(cleanup_error)
finally:
 for role in ['seed-receiver','fenced-receiver','recovered-receiver']:
  if role in processes and processes[role].poll() is None:signal(role)
 for name,process in processes.items():
  try:process.wait(timeout=65)
  except subprocess.TimeoutExpired:failure=(failure or '')+'; '+name+' remains live; verified cleanup pending'
 for package in inputs:
  if package=='nl.flitsmeister' and any(name.endswith('source') and process.poll() is None for name,process in processes.items()):failure=(failure or '')+'; preserve source preferences while source runner is live';continue
  try:
   device('shell','am','force-stop',package)
   assert_stopped(package,wait_seconds=5)
   record.setdefault('final_preferences_cleanup',{})[package]=restore_preferences(package)
  except Exception as error:failure=(failure or '')+'; preference cleanup '+repr(error)
 if hidden_policy_before is not None:
  current=device('shell','settings','get','global','hidden_api_policy').stdout.strip()
  if current!='1':failure=(failure or '')+'; independent hidden API policy change, preserve for review'
  else:device('shell','settings','delete' if hidden_policy_before=='null' else 'put','global','hidden_api_policy',*([] if hidden_policy_before=='null' else [hidden_policy_before]))
  record['hidden_api_policy_after']=device('shell','settings','get','global','hidden_api_policy').stdout.strip();record['hidden_api_policy_restored_exactly']=record['hidden_api_policy_after']==hidden_policy_before
 for permission in reversed(route_permission_changes):device('shell','pm','revoke',route_package,permission)
 for permission in reversed(vela_permission_changes):device('shell','pm','revoke','app.vela',permission)
 if 'route_permissions_before' in record:
  record['route_permissions_after']=vela_permissions(route_package,declared_only=True);record['route_permissions_restored_exactly']=record['route_permissions_after']==route_permissions_before
  if not record['route_permissions_restored_exactly']:failure=(failure or '')+'; receiver permission grants/flags drift'
 if args.prepare_vela_ui:
  record['vela_permissions_after']=vela_permissions();record['vela_permissions_restored_exactly']=record['vela_permissions_after']==vela_permissions_before
  if not record['vela_permissions_restored_exactly']:failure=(failure or '')+'; Vela permission drift'
 for permission in reversed(changed):device('shell','pm','revoke','nl.flitsmeister',permission)
 record['source_permissions_after']=permissions();record['source_permissions_restored_exactly']=record['source_permissions_after']==before
 if not record['source_permissions_restored_exactly']:failure=(failure or '')+'; permission drift'
 for key in reversed(window_changed):
  current=device('shell','settings','get','global',key).stdout.strip()
  if current!='1':failure=(failure or '')+'; independent Android setting change, preserve for review';continue
  value=window_before[key];device('shell','settings','delete' if value=='null' else 'put','global',key,*([] if value=='null' else [value]))
 record['window_settings_after']={key:device('shell','settings','get','global',key).stdout.strip() for key in window_before};record['window_settings_restored_exactly']=record['window_settings_after']==window_before
 if not record['window_settings_restored_exactly']:failure=(failure or '')+'; window settings differ'
 record['failure']=failure;record['probe_completed']=failure is None;record['process_exit_codes']={name:process.poll() for name,process in processes.items()};(output/'result.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps({'probe_completed':failure is None,'failure':failure,'result':str(output/'result.json')}),flush=True)
if failure:raise SystemExit(1)
