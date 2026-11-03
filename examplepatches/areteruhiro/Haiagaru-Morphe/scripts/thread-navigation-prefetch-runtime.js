/** Controlled transport regression: no real HTTP, native preferences restored in finally. */
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(()=>{
 Java.deoptimizeEverything();const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 if(!/^jp\.co\.airfront\.android\.a2chMate\.haiagaru\.bindings(191|226|242)$/.test(pkg))throw Error('isolated bindings package required');
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),A=Java.use('app.morphe.extension.chmate.ArchivedThreadImporter'),S=Java.use('java.lang.String'),F=Java.use('java.io.File'),Bundle=Java.use('android.os.Bundle'),Intent=Java.use('android.content.Intent'),Uri=Java.use('android.net.Uri');
 const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),old=prefs.getAll(),keys=['automaticDat','chtoio'];
 const req=A.requestBytes.overload('java.lang.String'),importer=A.importIfNeeded.overload('android.app.Activity','java.lang.String','java.lang.String');
 let checks=0,requests=[],mode='live',imports=0,host,intent,dir;const files=[];const key=String(Math.floor(Date.now()/1000)-86400),url='https://egg.5ch.io/test/read.cgi/android/'+key+'/45';
 function check(ok,label){if(!ok)throw Error(label);checks++;}
 function destination(name){const f=F.$new(dir,name+'.dat');files.push(f);return f;}
 function cleanup(){req.implementation=null;importer.implementation=null;if(host&&intent)host.setIntent(intent);const e=prefs.edit();for(const k of keys)old.containsKey(k)?e.putBoolean(k,Java.cast(old.get(k),Java.use('java.lang.Boolean')).booleanValue()):e.remove(k);e.commit();for(const f of files)f.delete();if(dir)dir.delete();}
 function fail(e){cleanup();reject(Error(String(e.stack||e)));}
 try{
  req.implementation=function(u){requests.push(String(u));if(mode==='fail'||mode==='fallback'&&requests.length===1)throw Java.use('java.io.IOException').$new('controlled DAT miss');return S.$new('fixture<><>2026/11/03 ID:Probe<>single downloaded DAT<>fixture\n').getBytes('MS932');};
  importer.implementation=function(a,u,f){imports++;return false;};
  dir=F.createTempFile('haiagaru-prefetch-check-','.owned',app.getCacheDir());check(dir.delete()&&dir.mkdir(),'owned test directory');
  prefs.edit().putBoolean('automaticDat',true).putBoolean('chtoio',true).commit();
 }catch(e){fail(e);return;}
 Java.scheduleOnMainThread(()=>{try{
  host=Java.retain(H.toolbarActivity(null));check(host!==null,'resumed host');intent=Java.retain(host.getIntent());
  host.setIntent(Intent.$new('android.intent.action.VIEW',Uri.parse(url)));const t=Date.now();H.rewriteLegacyThreadIntent(host);
  const b=Bundle.$new();b.putString('_data',url);check(!H.rewriteLegacyTabletThreadBundle(host,b),'native tablet navigation continues');
  check(imports===0&&requests.length===0,'no pre-navigation download or importer');
  check(String(host.getIntent().getDataString())===url&&String(b.getString('_data'))===url,'selector preserved');
  const f=destination('main-thread');check(!H.loadLiveTalkDat(url,f)&&requests.length===0,'main thread never downloads');
  const navigationMs=Date.now()-t;
  setTimeout(()=>Java.perform(()=>{try{
   check(Java.use('android.os.Looper').myLooper()===null||String(Java.use('java.lang.Thread').currentThread().getId())!==String(Java.use('android.os.Looper').getMainLooper().getThread().getId()),'worker context');
   const idx=F.$new(dir,'android_'+key+'.idx');files.push(idx);const out=Java.use('java.io.FileOutputStream').$new(idx);out.write(S.$new('owned native index').getBytes('UTF-8'));out.close();
   const live=destination('live');check(H.loadLiveTalkDat(url,live),'initial live DAT consumed');check(requests.length===1&&live.length()>0,'one request publishes native cache');check(idx.isFile()&&Number(idx.length())===18,'existing native index preserved');
   check(!H.loadLiveTalkDat(url,live)&&requests.length===1,'cached thread retains native refresh');
   prefs.edit().putBoolean('automaticDat',false).commit();check(!H.loadLiveTalkDat(url,destination('disabled'))&&requests.length===1,'automatic DAT OFF');prefs.edit().putBoolean('automaticDat',true).putBoolean('chtoio',false).commit();
   check(!H.loadLiveTalkDat(url,destination('rewrite-off'))&&requests.length===1,'rewrite OFF');prefs.edit().putBoolean('chtoio',true).commit();
   check(!H.loadLiveTalkDat('https://bbs.eddibb.cc/test/read.cgi/liveedge/'+key+'/',destination('external'))&&requests.length===1,'external board never sent to mirror');
   mode='fallback';requests=[];const archive=destination('archive');check(H.loadLiveTalkDat(url,archive),'recent archive fallback remains');check(requests.length===2&&archive.length()>0,'live miss plus one archive route');
   mode='fail';requests=[];const failed=destination('failed');check(!H.loadLiveTalkDat(url,failed),'failed archive leaves native downloader enabled');check(!failed.exists(),'failed download creates no DAT');
   const result={version:pkg.slice(-3),checks,navigationMs,liveRequests:1,archiveRequests:2,realNetworkRequests:0};cleanup();resolve(result);
  }catch(e){fail(e);}}),0);
 }catch(e){fail(e);}});
}));}};
