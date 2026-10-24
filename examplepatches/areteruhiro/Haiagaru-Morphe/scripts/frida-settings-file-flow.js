// Exercise the actual provider, chooser intent, import confirmation and deferred restart.
// No chooser destination is selected; no file is sent outside the test application.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=app.getPackageName().toString();
 if(!pkg.endsWith('.settingsfix191'))throw Error('Isolated 191 settings app required');
 const A=Java.use('android.app.Activity'),I=Java.use('android.content.Intent'),U=Java.use('android.net.Uri');
 const P=Java.use('app.morphe.extension.chmate.SettingsProfiles'),D=Java.use('app.morphe.extension.chmate.HaiagaruDialog');
 const p=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),before=Java.use('java.util.HashMap').$new(p.getAll());
 const start=A.startActivity.overload('android.content.Intent');
 let checks=0,owner=null,uri=null,keys=[],importer=null,done=false;
 function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
 function restore(){
  if(done)return;done=true;start.implementation=null;
  const edit=p.edit();
  for(const k of keys){if(!before.containsKey(k)){edit.remove(k);continue;}const v=before.get(k),name=v.getClass().getName().toString();
   if(name==='java.lang.Boolean')edit.putBoolean(k,Java.cast(v,Java.use(name)).booleanValue());
   else if(name==='java.lang.Integer')edit.putInt(k,Java.cast(v,Java.use(name)).intValue());
   else if(name==='java.lang.String')edit.putString(k,Java.cast(v,Java.use(name)));
  }edit.commit();
  console.log('FILE_FIXTURE_CLEANUP '+checks);
 }
 function main(delay,fn){setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{fn();}catch(e){console.log('FAIL '+e.stack);restore();}})),delay);}
 start.implementation=function(intent){
  if(intent.getAction()!==null&&intent.getAction().toString()==='android.intent.action.CHOOSER'){
   const send=Java.cast(intent.getParcelableExtra('android.intent.extra.INTENT'),I);
   if(send.getType()!==null&&send.getType().toString()==='application/vnd.haiagaru.settings'){
    uri=Java.cast(send.getParcelableExtra('android.intent.extra.STREAM'),U);
    check((send.getFlags()&1)!==0&&send.getClipData()!==null,'shared URI has explicit read grant / ClipData');
    const r=app.getContentResolver(),q=r.query(uri,null,null,null,null);check(q!==null&&q.moveToFirst(),'provider query works');
    check(q.getString(q.getColumnIndex('_display_name')).toString().endsWith('.haiagaru'),'exported filename extension');q.close();
    const input=r.openInputStream(uri),out=Java.use('java.io.ByteArrayOutputStream').$new(),buffer=Java.array('byte',Array(4096).fill(0));let n;
    while((n=input.read(buffer))!==-1)out.write(buffer,0,n);input.close();
    const data=Java.use('org.json.JSONObject').$new(out.toString('UTF-8')),it=data.getJSONObject('settings').keys();
    while(it.hasNext())keys.push(it.next().toString());
    check(keys.length>20,'generated file contains portable settings');
    let denied=false;try{r.openOutputStream(uri);}catch(e){denied=true;}check(denied,'provider rejects write access');
    const provider=app.getPackageManager().resolveContentProvider(uri.getAuthority(),0);check(!provider.exported.value&&provider.grantUriPermissions.value,'provider is private and grantable');
    const open=I.$new('android.intent.action.VIEW');open.setDataAndType(uri,'application/vnd.haiagaru.settings');open.setPackage(pkg);
    const match=app.getPackageManager().resolveActivity(open,0);
    check(match!==null&&match.activityInfo.value.name.value.toString().endsWith('SettingsImportActivity'),'file-open intent resolves importer');
    open.setClassName(pkg,'app.morphe.extension.chmate.SettingsImportActivity');open.addFlags(1);
    start.call(owner,open);
    return;
   }
  }return start.call(this,intent);
 };
 main(0,()=>Java.choose('app.morphe.extension.chmate.HaiagaruSettingsActivity',{onMatch:a=>{if(owner===null&&!a.isFinishing()){owner=Java.retain(a);P.share(owner);}},onComplete:()=>{check(owner!==null,'settings screen found');}}));
 main(13000,()=>{
  check(uri!==null,'share callback completed');
  Java.choose('app.morphe.extension.chmate.SettingsImportActivity',{onMatch:a=>{if(!a.isFinishing())importer=Java.retain(a);},onComplete:()=>check(importer!==null,'import activity opened')});
  let found=false;
  Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{onMatch:d=>{
   if(!d.isShowing())return;try{const b=d.getButton(-1);if(b.getText().toString()==='読み込む'){found=true;b.performClick();}}catch(e){}
  },onComplete:()=>check(found,'import requires explicit confirmation')});
 });
 main(17500,()=>{
  let found=false;
  Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{onMatch:d=>{
   if(!d.isShowing())return;try{if(d.getButton(-1).getText().toString()==='今すぐ再起動'){found=true;d.getButton(-2).performClick();}}catch(e){}
  },onComplete:()=>check(found,'successful import offers restart / later')});
 });
 main(21500,()=>{check(importer!==null&&importer.isFinishing(),'later closes importer without blank screen');console.log('PASS '+checks+' settings-file flow checks');restore();});
});
