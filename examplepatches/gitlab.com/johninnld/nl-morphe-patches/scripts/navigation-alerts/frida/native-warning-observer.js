import Java from 'frida-java-bridge';
// Observation only: each wrapper calls the original once and returns/throws unchanged.
let count=0,exhausted=false;const limit=12000;const installed=[];const patched=new Set();
const readinessPolls=new Map();
function emit(event,fields={}){
 const polling=event.includes('WarningScheduler!pumpOne():')||event.includes('WarningSpeaker!isReady(')||Object.prototype.hasOwnProperty.call(fields,'policy_active');
 if(polling){
  const values={...fields};delete values.elapsed_ms;
  const fingerprint=JSON.stringify(values),now=Date.now(),previous=readinessPolls.get(event);
  if(previous&&previous.fingerprint===fingerprint&&now-previous.at<1000)return;
  readinessPolls.set(event,{fingerprint,at:now});
 }
 if(count++<limit)send({event,pid:Process.id,host_clock_ms:Date.now(),...fields});else if(!exhausted){exhausted=true;send({event:'observer-budget-exhausted',pid:Process.id});}
}
function field(o,name){if(o===null||o===undefined)return null;let c=o.getClass();while(c!==null){try{const f=c.getDeclaredField(name);f.setAccessible(true);return f.get(o);}catch(_){c=c.getSuperclass();}}return null;}
function scalar(o){if(o===null||o===undefined)return null;try{const n=o.getClass().getName().toString();if(n==='java.lang.Boolean')return o.toString().toString()==='true';if(['java.lang.Long','java.lang.Integer'].includes(n))return Number(o.toString());if(n==='java.lang.String')return o.toString().slice(0,100);if(o.getClass().isEnum())return o.toString().toString();}catch(_){}return null;}
function get(o,n){return scalar(field(o,n));}
function klass(o){try{return o===null?null:o.getClass().getName().toString();}catch(_){return null;}}
function state(o){const a=field(o,'active'),p=a===null?null:field(a,'pending'),g=a===null?null:field(a,'grant'),e=p===null?null:field(p,'authority'),lease=field(o,'lease');return {status:get(o,'status'),generation:get(o,'generation'),lease_until:lease===null?null:get(lease,'until'),lease_epoch:lease===null?null:get(lease,'epoch'),active:a!==null,started:a===null?null:get(a,'started'),cancelled:a===null?null:get(a,'cancelled'),attempt:g===null?null:get(g,'attemptId'),event_key:g===null?null:get(g,'eventKey'),authority_sequence:e===null?null:get(e,'sequence'),deadline:e===null?null:get(e,'announceUntil')};}
function safe(event,build){try{emit(event,{elapsed_ms:Number(Java.use('android.os.SystemClock').elapsedRealtime()),...build()});}catch(e){emit('observer-error',{where:event,error_type:e.name});}}
function hook(name,method,signature,before,after){const key=name+'!'+method+'('+signature.join(',')+')';if(patched.has(key))return;const C=Java.use(name),m=C[method].overload(...signature);m.implementation=function(...args){if(before)safe(key+':enter',()=>before(this,args));let result;try{result=m.call(this,...args);}catch(e){emit('original-exception',{method:key,error_type:e.$className||e.name});throw e;}if(after)safe(key+':return',()=>after(this,args,result));return result;};patched.add(key);installed.push(key);}
function stack(){return Java.backtrace({limit:10}).frames.map(f=>f.signature);}
function focusListener(request){const listener=field(request,'mOnAudioFocusChangeListener'),name=klass(listener);if(name)hook(name,'onAudioFocusChange',['int'],(_,a)=>({change:Number(a[0]),stack:stack()}));}
function policy(o){const p=field(o,'policy'),name=klass(p);if(!name)return;hook(name,'active',[],null,(_,a,r)=>({policy_active:!!r}));}
function progress(o){const p=field(o,'progress'),name=klass(p);if(!name)return;for(const method of ['onStart','onDone','onError']){try{hook(name,method,['java.lang.String'],(_,a)=>({utterance_id:String(a[0])}));}catch(_){}}try{hook(name,'onStop',['java.lang.String','boolean'],(_,a)=>({utterance_id:String(a[0]),interrupted:!!a[1]}));}catch(_){}}
function velaAttempt(a){const g=field(a,'grant'),e=field(a,'event');return {attempt:get(g,'attemptId'),event_key:get(g,'eventKey'),authority_sequence:get(e,'sequence'),until:get(a,'announceUntil'),started:get(a,'started'),cancelled:get(a,'cancelled'),submitted:get(a,'submitted'),holding:get(a,'holding'),native_stopped:get(a,'nativeStopped'),quiescent:get(a,'quiescent')};}
function velaGuide(g){const q=field(g,'g');return {guide_class:klass(g),queue_size:q===null?null:Number(Java.cast(q,Java.use('java.util.Collection')).size()),native_focus_count:get(g,'s'),neural:get(g,'m'),ready:get(g,'e'),system_ready:get(g,'h'),initializing:get(g,'i')};}
function familyStatus(bundle){const result={};if(bundle===null)return result;for(const key of ['alerters','zones','segments','route_context','notifications','osm']){const b=bundle.getBundle(key);if(b!==null)result[key]={controller_state:String(b.getString('controller_state')),native_available:String(b.getString('native_available')),count:Number(b.getInt('current_state_count')),observed_ms:b.containsKey('observed_elapsed_ms')?Number(b.getLong('observed_elapsed_ms')):null};}return result;}
function warningEvents(values){const out=[];for(let i=0;i<Math.min(Number(values.size()),8);i++){const e=values.get(i);out.push({operation:get(e,'operation'),native_type:get(e,'nativeType'),category:get(e,'category'),sequence:get(e,'sequence'),announcement_index:get(e,'announcementIndex')});}return {event_count:Number(values.size()),warnings:out};}
Java.performNow(()=>{try{hook('java.lang.Thread','dispatchUncaughtException',['java.lang.Throwable'],(_,a)=>({exception_class:klass(a[0])}));}catch(e){emit('hook-optional-error',{where:'uncaught-exception',error_type:e.name});}});
const attachDeadline=Date.now()+20000;
function installApplicationHooks(){Java.performNow(()=>{try{
 const AT=Java.use('android.app.ActivityThread'),thread=AT.currentActivityThread(),bound=thread===null?null:thread.mBoundApplication.value,info=bound===null?null:bound.info.value;
 if(bound===null||info===null){if(Date.now()<attachDeadline){setTimeout(installApplicationHooks,25);return;}throw new Error('APPLICATION_BINDING_UNAVAILABLE');}
 // Instrumentation targets do not follow the ordinary Application.onCreate barrier.
 Java.classFactory.loader=info.getClassLoader();
 const pkg=AT.currentProcessName().toString();
 for(const method of ['callActivityOnPause','callActivityOnResume','callActivityOnStop','callActivityOnDestroy'])hook('android.app.Instrumentation',method,['android.app.Activity'],(_,a)=>({activity:klass(a[0])}));
 hook('android.media.AudioManager','requestAudioFocus',['android.media.AudioFocusRequest'],(_,a)=>{focusListener(a[0]);return {};},(_,a,r)=>({result:Number(r)}));
 hook('android.speech.tts.TextToSpeech','speak',['java.lang.CharSequence','int','android.os.Bundle','java.lang.String'],(_,a)=>({utterance_id:String(a[3]),queue_mode:Number(a[1]),text_length:a[0]===null?0:Number(a[0].length())}),(_,a,r)=>({utterance_id:String(a[3]),result:Number(r)}));
 for(const method of ['stop','shutdown'])hook('android.speech.tts.TextToSpeech',method,[],()=>({stack:stack()}),(_,a,r)=>({result:r===undefined?null:Number(r)}));
 hook('android.app.Instrumentation','finish',['int','android.os.Bundle'],(_,a)=>({result_code:a[0],stimuli_finished:true}));
 if(pkg==='nl.flitsmeister'){
  hook('nl.johninnl.navigation.alerts.WarningEndpoint','handle',['int','int','java.lang.String','android.os.Bundle'],null,(_,a,r)=>({code:a[0],caller_uid:a[1],status:r===null?null:r.getString('status'),audio_status:r===null?null:r.getString('audio_status')}));
  hook('nl.johninnl.flitsmeister.NavigationControlService','observeControlClient',['int','boolean'],(_,a)=>({caller_uid:a[0],warning_aware:!!a[1]}));
  hook('nl.johninnl.flitsmeister.NavigationBroadcasts','engineRunning',[],null,(_,a,r)=>({engine_running:!!r}));
 }else if(pkg==='com.waze'){
  // Owner-approved shutdown attribution; observe before the unchanged original runs.
  const Life=Java.use('nl.johninnl.navigation.startup.ProviderLifecycle');
  const Engine=Java.use('nl.johninnl.navigation.startup.ProviderEngineService');
  const shutdownState=()=>({stack:stack(),api_started:!!Life.apiStarted(),lease_remaining_ms:Number(Life.remaining()),wrapper_state:String(Engine.lastState()),activity_count:Number(Life.activities.value.size()),car_session_count:Number(Life.cars.value.size())});
  hook('com.waze.NativeManager','shutDown',[],shutdownState);
  hook('com.waze.NativeManager','onNativeLayerShutDown',['boolean'],(_,a)=>({...shutdownState(),native_flag:!!a[0]}));
  hook('java.lang.IllegalArgumentException','$init',['java.lang.String'],(_,a)=>{const frames=stack();if(frames.some(f=>f.includes('NativeWarnings')))emit('waze-capture-exception',{reason:String(a[0]).slice(0,240),stack:frames});return {};});
  hook('nl.johninnl.navigation.alerts.WarningEndpoint','handle',['int','int','java.lang.String','android.os.Bundle'],null,(_,a,r)=>({code:a[0],caller_uid:a[1],status:r===null?null:r.getString('status'),audio_status:r===null?null:r.getString('audio_status')}));
  hook('org.ungoogled.waze.NavigationControlService','observeControlClient',['int','boolean'],(_,a)=>({caller_uid:a[0],warning_aware:!!a[1]}));
  hook('org.ungoogled.waze.NavigationStartup','running',[],null,(_,a,r)=>({engine_running:!!r}));
  hook('com.waze.alerters.a.aa','b',['com.waze.j'],(_,a)=>({identity_class:klass(a[0])}));
  const N='org.ungoogled.waze.NativeWarnings';
  hook(N,'prepareControllers',[],()=>({}),()=>({}));
  hook(N,'familyStatus',[],null,(_,a,r)=>({families:familyStatus(r)}));
  for(const method of ['repository','sound','zoneSelected','zonePresented','zoneExit','segments','notificationAdded','notificationRemoved'])hook(N,method,['java.lang.Object'],(_,a)=>({native_class:klass(a[0])}));
  hook(N,'emit',['android.os.Bundle'],(_,a)=>({operation:a[0].getString('operation'),warning_id:a[0].getString('warning_id'),category:a[0].getString('category'),native_type:a[0].getString('native_type'),phase:a[0].getString('phase'),origin:a[0].getString('announcement_origin'),revision:Number(a[0].getLong('revision')),announcement_index:Number(a[0].getLong('announcement_index'))}));
 }else if(pkg==='org.ungoogled.android.apps.maps'||pkg==='com.google.android.apps.maps'){
  const S='nl.johninnl.navigation.alerts.WarningScheduler',A=S+'$Active',G='nl.johninnl.navigation.alerts.PlaybackGrant';
  hook(S,'events',[S+'$Transport','java.util.List'],(_,a)=>warningEvents(a[1]));
  hook(S,'pumpOne',[],o=>{policy(o);return {};});
  hook(S,'cancel',[A,'boolean'],(o,a)=>({...state(o),retry:!!a[1],stack:stack()}));
  hook(S,'finish',[A,'nl.johninnl.navigation.alerts.PlaybackGrant$Outcome','boolean'],(o,a)=>({...state(o),outcome:a[1].name().toString(),quiescent:!!a[2]}));
  hook(S,'disconnected',[],o=>state(o));hook(S,'revoked',['long'],(o,a)=>({...state(o),revoked_epoch:Number(a[0])}));
  const W='org.ungoogled.ui.MapsWarningSpeaker',WA=W+'$Attempt';
  hook(W,'begin',[WA],(o,a)=>{progress(o);return {initialized:get(o,'initialized'),prepared_language:get(o,'preparedLanguage'),cancelled:get(a[0],'cancelled'),until:get(a[0],'until')};});
  hook(W,'cancel',[G],(o,a)=>({attempt:get(a[0],'attemptId'),stack:stack()}));
  hook(W,'selectVoice',['java.lang.String'],(_,a)=>({language:String(a[0])}),(o,a,r)=>({language:String(a[0]),selected:!!r,prepared_language:get(o,'preparedLanguage')}));
  hook(W,'isReady',['java.lang.String','nl.johninnl.navigation.alerts.WarningAudioOwner$Mode'],null,(o,a,r)=>({language:String(a[0]),mode:a[1].name().toString(),ready:!!r,closed:get(o,'closed'),initialized:get(o,'initialized'),prepared_language:get(o,'preparedLanguage')}));
  hook(W,'finish',[WA,'nl.johninnl.navigation.alerts.PlaybackGrant$Outcome','boolean'],(o,a)=>({attempt:get(field(a[0],'grant'),'attemptId'),cancelled:get(a[0],'cancelled'),started:get(a[0],'started'),outcome:a[1].name().toString(),quiescent:!!a[2]}));
  const GPS=Java.use('org.ungoogled.ui.WazeAlerts');
  hook('android.location.LocationManager','removeUpdates',['android.location.LocationListener'],(_,a)=>({listener_class:klass(a[0]),stack:stack()}));
  hook('android.location.LocationManager','requestLocationUpdates',['java.lang.String','long','float','android.location.LocationListener','android.os.Looper'],(_,a)=>({provider:String(a[0]),interval_ms:Number(a[1]),listener_class:klass(a[3])}));
  hook('org.ungoogled.ui.WazeAlerts','listen',[],null,()=>({listening:!!GPS.listening.value,resumed:Number(GPS.resumed.value),navigating:!!GPS.navigating.value}));
  hook('org.ungoogled.ui.ExternalTelemetry','fix',['android.location.Location'],(_,a)=>({fix_elapsed_ms:a[0]===null?null:Number(a[0].getElapsedRealtimeNanos())/1000000,latitude:a[0]===null?null:Number(a[0].getLatitude()),longitude:a[0]===null?null:Number(a[0].getLongitude())}));
  const C='org.ungoogled.ui.MapsGuidanceCoordinator';
  hook(C,'relevance',['nl.johninnl.navigation.alerts.WarningEvent','android.location.Location','long','boolean'],null,(_,a,r)=>({warning_id:get(a[0],'warningId'),announcement_index:get(a[0],'announcementIndex'),relevance:scalar(r),navigating:!!a[3]}));
  hook(C,'abandon',['long',C+'$Ready','java.lang.String'],(o,a)=>({reason:String(a[2]),holding:get(o,'holding'),fault:get(o,'fault')}));
  hook(C,'acquireMain',['java.lang.String','nl.johninnl.navigation.alerts.WarningEvent$Priority','long',C+'$Ready'],o=>{const m=field(o,'manager');return {bound:get(o,'bound'),fault:get(o,'fault'),holding:get(o,'holding'),native_active_class:m===null?null:klass(field(m,'p')),native_pending_class:m===null?null:klass(field(m,'q'))};});
  hook(C,'canRegenerate',[],null,(_,a,r)=>({can_regenerate:!!r}));
 }else if(pkg==='app.vela'){
  const S='nl.johninnl.navigation.alerts.WarningScheduler',A=S+'$Active',G='nl.johninnl.navigation.alerts.PlaybackGrant',O=G+'$Outcome',M='nl.johninnl.navigation.alerts.WarningAudioOwner$Mode',E='nl.johninnl.navigation.alerts.WarningEvent';
  hook(S,'events',[S+'$Transport','java.util.List'],(_,a)=>warningEvents(a[1]));
  hook(S,'pumpOne',[],o=>{policy(o);return {};});
  hook(S,'cancel',[A,'boolean'],(o,a)=>({...state(o),retry:!!a[1],stack:stack()}));
  hook(S,'finish',[A,O,'boolean'],(o,a)=>({...state(o),outcome:a[1].name().toString(),quiescent:!!a[2]}));
  hook(S,'disconnected',[],o=>state(o));hook(S,'revoked',['long'],(o,a)=>({...state(o),revoked_epoch:Number(a[0])}));
  const W='nl.johninnl.vela.VelaWarningSpeaker',WA=W+'$Attempt';
  hook(W,'speak',[E,G,'long',W+'$Listener'],(o,a)=>({attempt:get(a[1],'attemptId'),language:get(a[0],'languageTag'),until:Number(a[2]),closed:get(o,'closed'),...velaGuide(field(o,'guide'))}),(_,a,r)=>({accepted:!!r}));
  hook(W,'isReady',['java.lang.String',M],null,(o,a,r)=>({language:String(a[0]),mode:a[1].name().toString(),ready:!!r,closed:get(o,'closed')}));
  hook(W,'canSpeak',[E,M],null,(_,a,r)=>({can_speak:!!r,language:get(a[0],'languageTag')}));
  hook(W,'cancel',[G],(o,a)=>({attempt:get(a[0],'attemptId'),stack:stack()}));
  hook(W,'finish',[WA,O,'boolean'],(_,a)=>({...velaAttempt(a[0]),outcome:a[1].name().toString(),quiescent:!!a[2]}));
  hook(W,'eligibility',[WA,'boolean'],null,(_,a,r)=>({...velaAttempt(a[0]),checks_focus:!!a[1],refusal:r===null?null:r.name().toString()}));
  hook(W,'capture',['java.lang.Object'],(_,a)=>({closure_class:klass(a[0])}));
  hook(W,'dispatch',['java.lang.Object'],(_,a)=>({closure_class:klass(a[0])}),(_,a,r)=>({handled:!!r}));
  hook(W,'beforeSpeech',['java.lang.Object','boolean'],(_,a)=>({...velaGuide(a[0]),interrupt:!!a[1]}),(_,a,r)=>({held:!!r}));
  for(const method of ['nativeStop','nativeSpeech','engineChanging','engineChanged','focusRequest'])hook(W,method,['java.lang.Object'],(_,a)=>({...velaGuide(a[0]),stack:stack()}));
  hook(W,'focusResult',['java.lang.Object','int'],(_,a)=>({...velaGuide(a[0]),result:Number(a[1])}));
  hook(W,'focusChanged',['java.lang.Object','int'],(_,a)=>({listener_class:klass(a[0]),change:Number(a[1])}));
  for(const method of ['utteranceStart','utteranceDone','utteranceError'])hook(W,method,['java.lang.Object','java.lang.String'],(_,a)=>({listener_class:klass(a[0]),utterance_id:String(a[1])}));
  hook(W,'utteranceStopped',['java.lang.Object','java.lang.String','boolean'],(_,a)=>({listener_class:klass(a[0]),utterance_id:String(a[1]),interrupted:!!a[2]}));
  hook(W,'regenerateInput',['java.lang.Object','java.lang.Object'],(_,a)=>({route_class:klass(a[0]),state_class:klass(a[1])}),(_,a,r)=>({result_class:klass(r)}));
 }
 emit('hooks-ready',{package:pkg,installed});
}catch(e){emit('hooks-failed',{error_type:e.$className||e.name,error:String(e).slice(0,240),installed});}});}
setImmediate(installApplicationHooks);
