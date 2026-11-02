rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{let host;
 Java.choose('app.morphe.extension.chmate.HaiagaruSettingsActivity',{onMatch(a){if(!a.isFinishing())host=Java.retain(Java.cast(a,Java.use('android.app.Activity')));},onComplete(){Java.scheduleOnMainThread(()=>{
 Java.deoptimizeEverything();
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),A=Java.use('app.morphe.extension.chmate.ArchivedThreadImporter'),I=Java.use('android.content.Intent'),Uri=Java.use('android.net.Uri'),Bundle=Java.use('android.os.Bundle');
 const prefs=host.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),old=prefs.getAll(),intent=host.getIntent(),keys=['automaticDat','chtoio'];let calls=[],checks=0;
 const importer=A.importIfNeeded.overload('android.app.Activity','java.lang.String','java.lang.String');
 function check(ok,m){if(!ok)throw Error(m);checks++;}
 try{
  importer.implementation=function(a,url,fallback){calls.push(String(url));return false;};prefs.edit().putBoolean('automaticDat',false).putBoolean('chtoio',true).commit();
  const key=String(Math.floor(Date.now()/1000)-86400),url='http://egg.5ch.net/test/read.cgi/android/'+key+'/1?x=%2F#p';
  host.setIntent(I.$new('android.intent.action.VIEW',Uri.parse(url)));H.rewriteLegacyThreadIntent(host);
  check(Java.use('app.morphe.extension.chmate.ArchiveThreadLinks').is5chThread(url),'recent previous-thread link is eligible for archive retrieval');
  check(String(host.getIntent().getDataString())==='https://egg.5ch.io/test/read.cgi/android/'+key+'/1?x=%2F#p','old HTTP link normalizes before native retrieval, selector preserved');
  const bundle=Bundle.$new();bundle.putString('_data',url);H.rewriteLegacyTabletThreadBundle(host,bundle);check(calls.length===0,'disabled retrieval does not fetch in tablet navigation');
  check(String(bundle.getString('_data'))===String(host.getIntent().getDataString()),'tablet selector and query preserved');
  host.setIntent(I.$new('android.intent.action.VIEW',Uri.parse(url)));H.rewriteLegacyThreadIntent(host);check(calls.length===0,'automatic retrieval OFF remains effective');
  check(!Java.use('app.morphe.extension.chmate.ArchiveThreadLinks').is5chThread('https://bbs.eddibb.cc/test/read.cgi/liveedge/'+key+'/'),'external identity never sent to 5ch mirror routes');
  resolve({version:String(host.getPackageName()).slice(-3),checks,networkRequests:0});
 }catch(e){reject(Error(String(e.stack||e)));}finally{importer.implementation=null;host.setIntent(intent);const e=prefs.edit();for(const k of keys)old.containsKey(k)?e.putBoolean(k,Java.cast(old.get(k),Java.use('java.lang.Boolean')).booleanValue()):e.remove(k);e.commit();}
 });}});
}));}};
