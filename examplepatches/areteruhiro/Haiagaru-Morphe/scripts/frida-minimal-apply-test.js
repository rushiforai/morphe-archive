// Apply only in an isolated emulator app; restore the exact preference maps afterward.
setTimeout(()=>Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=app.getPackageName().toString();
 if(!pkg.endsWith('.settingsfix191'))throw Error('Dedicated settings test app required');
 const P=Java.use('app.morphe.extension.chmate.SettingsProfiles'),M=Java.use('app.morphe.extension.chmate.MinimalSetup');
 const names=['io.github.areteruhiro.chmate.haiagaru.ui-config','haiagaru.poster-highlight','haiagaru.programmable-ng',
 'haiagaru.hidden-id-ng','haiagaru.local-auto-backup','haiagaru.mega-sync.options','haiagaru_imgur_web','haiagaru_upload_hosts','resMenuDialog'];
 const Hash=Java.use('java.util.HashMap'),saved=names.map(n=>[n,Hash.$new(app.getSharedPreferences(n,0).getAll())]);
 let checks=0,owner=null,restoreDone=false;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 function field(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f.get(o);}
 function restore(){
  if(restoreDone)return;restoreDone=true;
  for(const pair of saved){
   const p=app.getSharedPreferences(pair[0],0),e=p.edit().clear(),it=pair[1].entrySet().iterator();
   while(it.hasNext()){const row=Java.cast(it.next(),Java.use('java.util.Map$Entry')),k=row.getKey().toString(),v=row.getValue(),name=v.getClass().getName().toString();
    if(name==='java.lang.Boolean')e.putBoolean(k,Java.cast(v,Java.use(name)).booleanValue());
    else if(name==='java.lang.Integer')e.putInt(k,Java.cast(v,Java.use(name)).intValue());
    else if(name==='java.lang.Long')e.putLong(k,Java.cast(v,Java.use(name)).longValue());
    else if(name==='java.lang.Float')e.putFloat(k,Java.cast(v,Java.use(name)).floatValue());
    else if(name==='java.lang.String')e.putString(k,Java.cast(v,Java.use(name)));
    else if(Java.use('java.util.Set').class.isInstance(v))e.putStringSet(k,Java.cast(v,Java.use('java.util.Set')));
   }e.commit();
  }console.log('MINIMAL_FIXTURE_CLEANUP '+checks);
 }
 function step(delay,fn){setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{fn();}catch(e){console.log('FAIL '+e.stack);restore();}})),delay);}
 function findSwitch(root){if(Java.use('android.widget.Switch').class.isInstance(root))return Java.cast(root,Java.use('android.widget.Switch'));
  if(Java.use('android.view.ViewGroup').class.isInstance(root)){const g=Java.cast(root,Java.use('android.view.ViewGroup'));for(let i=0;i<g.getChildCount();i++){const result=findSwitch(g.getChildAt(i));if(result!==null)return result;}}return null;
 }
 function dialogs(title,callback){let count=0;Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{onMatch:d=>{
  if(d.isShowing()&&field(field(d,'spec'),'title').toString()===title){count++;callback(d);}
 },onComplete:()=>check(count===1,'one '+title+' dialog')});}
 step(0,()=>Java.choose('app.morphe.extension.chmate.HaiagaruSettingsActivity',{onMatch:a=>{if(owner===null&&!a.isFinishing()){owner=Java.retain(a);
   Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{onMatch:d=>{if(d.isShowing())d.dismiss();},onComplete:()=>{}});
   M.show(owner);}},onComplete:()=>check(owner!==null,'settings available')}));
 step(3500,()=>dialogs('Haiagaruの初期設定',d=>{
  const toggle=findSwitch(field(field(d,'spec'),'view'));check(toggle!==null&&!toggle.isChecked(),'minimal is opt-in, initially off');
  d.getButton(-1).performClick();check(!app.getSharedPreferences(names[0],0).getBoolean('minimalSetupV1',false),'off confirmation does not apply preset');
  M.show(owner);
 }));
 step(6500,()=>dialogs('Haiagaruの初期設定',d=>{
  findSwitch(field(field(d,'spec'),'view')).performClick();d.getButton(-1).performClick();
  const p=app.getSharedPreferences(names[0],0);
  check(p.getBoolean('minimalSetupV1',false),'enabled confirmation applies preset');
  check(p.getBoolean('hideAd',false)&&p.getBoolean('automaticDat',false)&&p.getBoolean('edgeReporterId',false),'minimum features on');
  check(!p.getBoolean('xPostPreviewEnabled',true)&&!p.getBoolean('groupBrowsingHistoryByBoard',true)&&!p.getBoolean('quickFilterCounts',true),'other feature switches off');
  check(!app.getSharedPreferences('haiagaru_imgur_web',0).getBoolean('enabled',true),'login upload disabled without clearing login');
 }));
 step(10000,()=>{dialogs('変更の反映には再起動が必要です',d=>d.getButton(-2).performClick());console.log('PASS '+checks+' minimum preset application checks');restore();});
}),1000);
