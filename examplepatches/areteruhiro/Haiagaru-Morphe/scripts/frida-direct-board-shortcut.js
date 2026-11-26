// Run only against an isolated reporter. Restore every modified preference.
rpc.exports.test=()=>new Promise(resolve=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
 let prefs, saved=[],entries;
 try {
  const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
  if(!/\.haiagaru\.reporter(?:191|226|242)$/.test(pkg))throw Error('Use an isolated reporter');
  const D=Java.use('app.morphe.extension.chmate.DirectBoardShortcut'),T=Java.use('app.morphe.extension.chmate.ToolbarIcons');
  prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
  entries={had:prefs.contains('boardUrlShortcuts'),value:prefs.getString('boardUrlShortcuts','[]')};
  for(let i=0;i<8;i++){let k=String(D.key(i));saved.push({k,had:prefs.contains(k),value:prefs.getString(k,'')});prefs.edit().remove(k).commit();}
  let passed=0; const check=(ok,label)=>{if(!ok)throw Error(label);passed++;};
  const target=D.target.overload('android.content.Context','int'), dest=D.destination.overload('android.content.Context','int'), save=D.save.overload('android.content.Context','int','java.lang.String','java.lang.String');
  check(!D.handles(0x7e484a31)&&!D.handles(0x7e484a3a),'action range excludes adjacent buttons');
  check(D.validSaved('')&&!D.validSaved('{broken'),'backup validation');
  for(let i=0;i<8;i++){
   check(target.call(D,app,i)===null,'empty slot '+i);
   save.call(D,app,i,'板'+i,'https://egg.5ch.io/board'+i+'/');
   let intent=dest.call(D,app,i);
   check(String(intent.getDataString())==='https://egg.5ch.io/board'+i+'/','independent destination '+i);
   check(String(intent.getComponent().getClassName()).endsWith('ThreadListActivity'),'native board route '+i);
   check(D.handles(0x7e484a32+i),'action dispatch range '+i);
   const resource=String(D.resource(i));
   check(app.getResources().getIdentifier(resource,'string',pkg)!==0&&app.getResources().getIdentifier(resource,'drawable',pkg)!==0,'label and icon '+i);
   check(T.index(0x7e484a32+i)===16+i,'separate icon slot '+i);
  }
  prefs.edit().remove(String(D.key(3))).commit();
  check(dest.call(D,app,3)===null&&dest.call(D,app,2)!==null&&dest.call(D,app,4)!==null,'clear one preserves neighbours');
  let rejected=false;try{save.call(D,app,7,'bad','javascript:alert(1)');}catch(e){rejected=true;}
  check(rejected,'invalid URL rejected');
  for(const [url,title] of [['https://kenmo.org/news/','オルグ'],['https://00c.org/news/','オルグ'],['https://bbs.eddibb.cc/liveedge/','エッヂ'],['https://bbs.eddibb.net/liveedge/','エッヂ'],['https://bbs.eddibb.org/liveedge/','エッヂ']]){
   save.call(D,app,7,'',url);
   const id=app.getResources().getIdentifier(String(D.resource(7)),'string',pkg);
   check(String(D.toolbarText(app,id))===title,'URL-derived toolbar label '+url);
   check(String(D.toolbarCharSequence(app,id))===title,'CharSequence toolbar label '+url);
  }
  save.call(D,app,7,'自分の名前','https://kenmo.org/news/');
  const labelId=app.getResources().getIdentifier(String(D.resource(7)),'string',pkg);
  check(String(D.toolbarText(app,labelId))==='自分の名前','custom label preserved');
  check(String(D.defaultName('https://kenmo.org.example.com/news/'))==='https://kenmo.org.example.com/news/','lookalike domain not aliased');
  const fallback=app.getResources().getIdentifier('haiagaru_board_url_picker','string',pkg);
  check(String(D.toolbarText(app,fallback))===String(app.getString(fallback)),'other toolbar labels unchanged');
  resolve({passed,slots:8,navigationIntentsVerified:true,networkRequests:0});
 }catch(e){resolve({error:String(e)});}finally{
  if(prefs){let edit=prefs.edit();for(const row of saved){if(row.had)edit.putString(row.k,row.value);else edit.remove(row.k);}if(entries){if(entries.had)edit.putString('boardUrlShortcuts',entries.value);else edit.remove('boardUrlShortcuts');}edit.commit();}
 }
})));
