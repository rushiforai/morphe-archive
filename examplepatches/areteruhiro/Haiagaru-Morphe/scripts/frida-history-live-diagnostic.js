Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!String(app.getPackageName()).includes('.haiagaru.'))throw Error('Verification package required');
 const B=Java.use('app.morphe.extension.chmate.BrowsingHistory');
 const H=Java.use('app.morphe.extension.chmate.HiddenDroppedThreads');
 console.log('enabled='+H.enabled());
 Java.scheduleOnMainThread(function(){
  for(const n of ['legacyFragments','displays']){
   const f=B.class.getDeclaredField(n);f.setAccessible(true);const list=Java.cast(f.get(null),Java.use('java.util.List'));
   console.log(n+' count='+list.size());
   for(let i=0;i<list.size();i++){
    const entry=list.get(i),m=entry.getClass().getDeclaredField('mode');m.setAccessible(true);console.log('mode='+m.getInt(entry));
    if(n!=='legacyFragments')continue;
    const r=entry.getClass().getDeclaredField('fragment');r.setAccessible(true);const fragment=Java.cast(r.get(entry),Java.use('java.lang.ref.WeakReference')).get();if(!fragment)continue;
    const a=fragment.getClass().getDeclaredField(String(fragment.getClass().getName()).includes('r8lambda')?'e':'i');a.setAccessible(true);const adapter=Java.cast(a.get(fragment),Java.use('android.widget.BaseAdapter'));
    const af=adapter.getClass().getDeclaredField('j');af.setAccessible(true);const rows=Java.cast(af.get(adapter),Java.use('java.util.List'));
    let counts={};for(let j=0;j<rows.size();j++){const row=rows.get(j);const type=String(row.getClass().getName());counts[type]=(counts[type]||0)+1;}
    console.log('visible row types '+JSON.stringify(counts));
    if(m.getInt(entry)!==103){Java.cast(fragment,Java.use(String(fragment.getClass().getName()))).a(103,true);console.log('Opened HOME history');}
   }
  }
 });
});
