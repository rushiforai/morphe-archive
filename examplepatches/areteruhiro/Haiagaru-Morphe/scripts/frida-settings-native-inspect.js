Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 const File=Java.use('java.io.File');
 const dir=File.$new(app.getApplicationInfo().dataDir.value+'/shared_prefs');
 const files=dir.listFiles();
 for(let i=0;i<files.length;i++){
  const name=files[i].getName().toString().replace(/\.xml$/,'');
  const p=app.getSharedPreferences(name,0),it=p.getAll().keySet().iterator();
  while(it.hasNext()){
   const k=it.next().toString();
   if(/toolbar/i.test(k)) console.log(name+' '+k+' '+p.getAll().get(k));
  }
 }
});
