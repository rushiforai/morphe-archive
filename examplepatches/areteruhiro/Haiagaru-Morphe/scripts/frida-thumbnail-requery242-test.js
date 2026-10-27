// Controlled cached requery: retain the same URL and never alter preferences.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('242 verification only');
 Java.classFactory.loader=app.getClassLoader();
 const E=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),I=Java.use('o.zzbes'),G=Java.use('android.view.ViewGroup');
 function field(o,n){const f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f.get(o);}
 function bitmap(i){const fs=I.class.getDeclaredFields();for(let n=0;n<fs.length;n++)if(String(fs[n].getType().getName())==='o.VN22'){fs[n].setAccessible(true);return fs[n].get(i);}throw Error('Native bitmap field missing');}
 Java.scheduleOnMainThread(()=>{try{
  let image;
  function walk(v){if(I.class.isInstance(v)){const i=Java.cast(v,I);if(i.isShown()&&bitmap(i)&&!image)image=Java.retain(i);}if(G.class.isInstance(v)){const g=Java.cast(v,G);for(let n=0;n<g.getChildCount();n++)walk(g.getChildAt(n));}}
  const thread=Java.use('android.app.ActivityThread').currentActivityThread(),records=Java.cast(field(thread,'mActivities'),Java.use('java.util.Map')).values().iterator();
  while(records.hasNext()){const activity=Java.cast(field(records.next(),'activity'),Java.use('android.app.Activity'));if(activity.hasWindowFocus())walk(activity.getWindow().getDecorView());}
  if(!image)throw Error('No loaded visible thumbnail');
  const before=bitmap(image);console.log('BEFORE loaded='+!!before);
  image.d.overload('boolean').call(image,false);
  console.log('AFTER cached background requery loaded='+!!bitmap(image));
  setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>console.log('SETTLED loaded='+!!bitmap(image)))),2000);
 }catch(e){console.log('FAIL '+e.stack);}});
});
