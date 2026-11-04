let app,a,view,session,other,group,fixtureFile,pref,prefSaved,checks=[],writes=[],latest;
function main(fn){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{resolve(fn());}catch(e){reject(Error(String(e.stack||e)));}})));}
function check(ok,label){if(!ok)throw Error(label);checks.push(label);}
function restorePref(){if(!prefSaved)return;const edit=pref.edit();for(const key of ['enabled','rules','color']){const v=prefSaved.get(key);if(v===null)edit.remove(key);else if(key==='enabled')edit.putBoolean(key,Java.cast(v,Java.use('java.lang.Boolean')).booleanValue());else if(key==='color')edit.putInt(key,Java.cast(v,Java.use('java.lang.Integer')).intValue());else edit.putString(key,String(v));}edit.commit();Java.use('app.morphe.extension.chmate.PosterHighlight').reload();}
rpc.exports={
 prepare(){return main(()=>{
  Java.deoptimizeEverything();app=Java.use('android.app.ActivityThread').currentApplication();check(String(app.getPackageName()).endsWith('.bindings191'),'isolated191 only');
  a=Java.retain(Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null));check(a!==null,'foreground activity');
  const R=Java.use('o.processAdDisplayErrorPostbackForUserError'),B=Java.use('jp.syoboi.a2chMate.client.BBSUrlInfo'),rows=Java.use('java.util.ArrayList').$new();
  for(let i=1;i<=12;i++)rows.add(R.$new.overload('int','java.lang.String','java.lang.String','java.lang.String','java.lang.String').call(R,i,'fixture','sage','2026/11/03','fixture body'));
  const owner=Java.use('o.pa').$new();owner.W.value=B.c.overload('java.lang.String').call(B,'https://fixture.invalid/test/read.cgi/fixture/'+Math.floor(Date.now()/1000)+'/');
  view=Java.retain(Java.use('android.widget.ListView').$new(a));view.setAdapter(Java.use('android.widget.ArrayAdapter').$new.overload('android.content.Context','int','java.util.List').call(Java.use('android.widget.ArrayAdapter'),a,17367043,rows));
  a.addContentView(view,Java.use('android.view.ViewGroup$LayoutParams').$new(-1,500));
  session=Java.retain(Java.use('app.morphe.extension.chmate.ReadingPosition$Session').$new(owner,a,view));
  return true;
 });},
 run(){return main(()=>{
  const anchor=session.anchor();check(anchor!==null,'actual visible list anchor');session.inspectedKey.value=String(anchor.key.value);fixtureFile=Java.retain(session.file(String(anchor.key.value)));check(!fixtureFile.exists(),'fixture file absent before test');
  const Atomic=Java.use('android.util.AtomicFile'),Thread=Java.use('java.lang.Thread');Atomic.startWrite.overload().implementation=function(){if(String(this.getBaseFile().getPath())===String(fixtureFile.getPath()))writes.push({thread:String(Thread.currentThread().getName()),ui:Thread.currentThread().equals(Java.use('android.os.Looper').getMainLooper().getThread())});return Atomic.startWrite.overload().call(this);};
  let inspections=0;const S=Java.use('app.morphe.extension.chmate.ReadingPosition$Session'),L=Java.use('android.widget.ListView'),getAdapter=L.getAdapter.overloads.find(x=>x.returnType.className==='android.widget.ListAdapter');getAdapter.implementation=function(){if(this.equals(view))inspections++;return getAdapter.call(this);};
  session.nextInspection.value=0;session.lastScroll.value=0;for(let i=0;i<500;i++)session.onPreDraw();check(inspections===1,'500 settled redraws inspect once: '+inspections);
  inspections=0;session.nextInspection.value=0;session.onScrollChanged();for(let i=0;i<100;i++)session.onPreDraw();check(inspections===0,'active scrolling performs no inspection');
  session.nextInspection.value=0;view.setVisibility(8);for(let i=0;i<50;i++)session.onPreDraw();check(inspections===0,'hidden tablet pane performs no inspection');view.setVisibility(0);
  getAdapter.implementation=null;
  session.save();view.setPadding(0,7,0,0);session.save();const end=session.anchor();latest={key:String(end.key.value),number:Number(end.number.value),offset:Number(end.offset.value)};
  const P=Java.use('app.morphe.extension.chmate.PosterHighlight'),Rule=Java.use('app.morphe.extension.chmate.PosterHighlightRules$Rule');pref=Java.retain(app.getSharedPreferences('haiagaru.poster-highlight',0));prefSaved=Java.retain(pref.getAll());pref.edit().putBoolean('enabled',true).commit();
  const rules=Java.use('java.util.ArrayList').$new();rules.add(Rule.$new.overload('int','int','java.lang.String','java.lang.String','boolean').call(Rule,4,2,'','◆2ofgBR.b9E',true));P.save(rules);
  const R=Java.use('o.processAdDisplayErrorPostbackForUserError'),board=Java.use('jp.syoboi.a2chMate.client.BBSUrlInfo').c.overload('java.lang.String').call(Java.use('jp.syoboi.a2chMate.client.BBSUrlInfo'),'https://jbbs.shitaraba.net/bbs/read.cgi/computer/45040/1793701433/');
  const Span=Java.use('android.text.SpannableString'),Bg=Java.use('android.text.style.BackgroundColorSpan');
  for(const name of ['areteruhiro</b> ◆2ofgBR.b9E<b>','areteruhiro ◆2ofgBR.b9E\u3000','areteruhiro ◆2ofgBR.b9E\u200e']){
   const r=R.$new.overload('int','java.lang.String','java.lang.String','java.lang.String','java.lang.String').call(R,9,name,'sage','2026/11/03','fixture');const poster=P.poster(r);check(String(poster.trip.value)==='2ofgBR.b9E','shitaraba native trip normalized');
   const text=P.decorateResponse(Span.$new.overload('java.lang.CharSequence').call(Span,Java.use('java.lang.String').$new('fixture body')),r,board,null);const sp=Java.cast(text,Java.use('android.text.SpannableString'));check(sp.getSpans(0,String(sp.toString()).length,Bg.class).length===1,'global trip produces actual Android background span');
  }
  restorePref();return {checks};
 });},
 finish(){return main(()=>{
  const Recent=Java.use('app.morphe.extension.chmate.ReadingPosition').RECENT.value,saved=Java.cast(Recent.get(latest.key),Java.use('org.json.JSONObject'));check(saved.getInt('offset')===latest.offset,'latest anchor immediately available in memory');
  const bytes=Java.use('android.util.AtomicFile').$new(fixtureFile).readFully(),json=Java.use('org.json.JSONObject').$new(Java.use('java.lang.String').$new(bytes,'UTF-8'));check(json.getInt('number')===latest.number&&json.getInt('offset')===latest.offset,'ordered writer persists latest position');check(writes.length>=1&&writes.every(w=>!w.ui),'all AtomicFile writes off UI thread');
  return {ok:true,checks,writes,realNetworkRequests:0};
 });},
 cleanup(){return main(()=>{restorePref();if(session){session.closed.value=true;session.close();}if(view&&view.getParent())Java.cast(view.getParent(),Java.use('android.view.ViewGroup')).removeView(view);Java.use('android.util.AtomicFile').startWrite.overload().implementation=null;for(const m of Java.use('android.widget.ListView').getAdapter.overloads)m.implementation=null;if(fixtureFile&&fixtureFile.exists())fixtureFile.delete();return true;});}
};
