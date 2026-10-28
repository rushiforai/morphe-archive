const P='app.morphe.extension.chmate.';
function app(){return Java.use('android.app.ActivityThread').currentApplication();}
function main(fn){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{resolve(fn());}catch(e){reject(Error(String(e.stack||e)));}})));}
let activity,old,had,checks=0;
function check(ok,text){if(!ok)throw Error(text);checks++;send('PASS '+text);}
rpc.exports.launch=function(){return main(()=>{
 const a=app(),prefs=a.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);had=prefs.contains('cachedSearchCreatedOrder');old=prefs.getInt('cachedSearchCreatedOrder',0);
 const Intent=Java.use('android.content.Intent'),args=Java.use('jp.syoboi.a2chMate.feature.logsearch.SearchFragmentArgs').$new('fixture-no-query',true,false,false,true);
 const intent=Intent.$new(a,Java.use('jp.syoboi.a2chMate.activity.SearchActivity').class);intent.putExtra.overload('java.lang.String','android.os.Parcelable').call(intent,'searchArgs',args);intent.addFlags(0x10000000);a.startActivity(intent);return true;
});};
rpc.exports.test=function(){return main(()=>{
 const a=app(),prefs=a.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),Order=Java.use(P+'CachedSearchOrder');
 const thread=Java.use('android.app.ActivityThread').currentActivityThread(),records=thread.mActivities.value.values().toArray();
 for(const record of records){const f=record.getClass().getDeclaredField('activity');f.setAccessible(true);const act=Java.cast(f.get(record),Java.use('android.app.Activity'));if(String(act.getClass().getName()).endsWith('SearchActivity')&&act.hasWindowFocus())activity=Java.retain(act);}
 check(!!activity,'native cached search visible');const select=Java.cast(activity.getWindow().getDecorView().findViewWithTag('haiagaru.cachedSearchOrder'),Java.use('android.widget.Spinner'));check(!!select&&select.isShown()&&select.getHeight()>0,'sort selector embedded and measured');
 const strings=Java.use('java.lang.String'),Row=Java.use('o.startResolutionForResult'),List=Java.use('java.util.ArrayList');
 function row(id){return Row.$new('title','https://example.org/test/read.cgi/board/'+id+'/',null,0);}
 const newer=row('1700000000'),older=row('1500000000'),unknown=row('unknown'),same=row('1700000000');
 const list=List.$new();[unknown,older,newer,same].forEach(r=>list.add(r));
 const State=Java.use('o.isAfterLast$IconCompatParcelizer'),Query=Java.use('o.GNk46'),query=Query.$new(Java.use('o.zzbuz').d.overload('java.lang.String','boolean','boolean').call(Java.use('o.zzbuz'),'fixture',false,true),true,false,false,true);
 const state=State.$new(query,list,4,7);
 function field(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f.get(o);}
 function result(){const out=Order.project(state);return {out,rows:Java.cast(field(out,'b'),Java.use('java.util.List'))};}
 for(const mode of [1,2,0]){
  select.setSelection(mode);select.getOnItemSelectedListener().onItemSelected(select,null,mode,mode);
  check(prefs.getInt('cachedSearchCreatedOrder',-1)===mode,'UI selection saved '+mode);
  const r=result(),urls=[];for(let n=0;n<r.rows.size();n++)urls.push(String(Java.cast(r.rows.get(n),Row).d.value));
  if(mode===1)check(r.rows.get(0).equals(newer)&&r.rows.get(1).equals(same)&&r.rows.get(2).equals(older),'newest first; equal date keeps response order');
  if(mode===2)check(r.rows.get(0).equals(older)&&r.rows.get(1).equals(newer),'oldest first');
  if(mode)check(r.rows.get(3).equals(unknown),'unknown creation date last');
  else check(r.out.equals(state),'standard returns original native state');
  check(list.get(0).equals(unknown)&&list.get(1).equals(older),'original search list unchanged');
  check(Number(Java.cast(r.out,State).d.value)===4&&Number(Java.cast(r.out,State).e.value)===7,'result counts unchanged');
  check(r.rows.contains(newer)&&r.rows.contains(older),'original click-target objects retained');
 }
 check(Number(Order.created('https://example.org/test/read.cgi/board/1700000000/25'))===1700000000,'thread ID used, not response date/number');
 return checks;
});};
rpc.exports.cleanup=function(){return main(()=>{const p=app().getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),e=p.edit();if(had)e.putInt('cachedSearchCreatedOrder',old);else e.remove('cachedSearchCreatedOrder');e.commit();if(activity)activity.finish();return true;});};
