Java.perform(()=>Java.scheduleOnMainThread(()=>{
 const pkg=String(Java.use('android.app.ActivityThread').currentApplication().getPackageName());
 const version=pkg.slice(-3);
 if(!/\.haiagaru\.reporter(191|226|242)$/.test(pkg))throw Error('Isolated reporter required');
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'), field=H.class.getDeclaredField('resumedActivity');
 field.setAccessible(true);
 const a=Java.cast(Java.cast(field.get(null),Java.use('java.lang.ref.WeakReference')).get(),Java.use('android.app.Activity'));
 const name=String(a.getClass().getName());
 if(!name.startsWith('jp.syoboi.a2chMate.activity.ResEditActivity') || name.endsWith('$Dialog'))throw Error('Expected the full-screen posting editor, got '+name);
 const Profile=Java.use('app.morphe.extension.chmate.PostingIpWarning');
 const bindings=Profile.class.getDeclaredField('bindings');
 bindings.setAccessible(true);
 const values=Java.cast(bindings.get(null),Java.use('java.util.Map')).values().iterator();
 let owner=null;
 function weak(owner,key){
   const f=owner.getClass().getDeclaredField(key);f.setAccessible(true);
   return Java.cast(f.get(owner),Java.use('java.lang.ref.WeakReference')).get();
 }
 while(values.hasNext()){
   const b=values.next();
   const candidate=weak(b,'activity');
   if(candidate&&candidate.equals(a)){owner=weak(b,'fragment');if(owner)break;}
 }
 if(!owner)throw Error('Native editor fragment not initialized');
 const native=Java.cast(owner,Java.use(String(owner.getClass().getName())));
 const anchor=a.getWindow().getDecorView();
 const popup=Java.use('android.widget.PopupMenu').$new(a,anchor);
 const menu=popup.getMenu();
 const method=version==='191'?'Wy_':'d', action=0x7e000049;
 const prepare=native[method].overload('android.view.Menu');
 prepare.call(native,menu);
 prepare.call(native,menu);
 let count=0;
 for(let i=0;i<menu.size();i++)if(menu.getItem(i).getItemId()===action)count++;
 const enabled=a.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0).getBoolean('showGigaFileUploadButton',false);
 if(!enabled){
   if(count!==0)throw Error('Overflow item shown while disabled');
   console.log('PASS native full-screen overflow hidden by default '+version);
   return;
 }
 if(count!==1)throw Error('Expected one GigaFile option; got '+count);
 if(anchor.findViewWithTag('haiagaru.gigafile'))throw Error('Old wide button remains');
 console.log('PASS native full-screen overflow item appears once '+version);
 const dispatch=version==='191'?'VQ_':version==='226'?'e':'a_';
 if(!native[dispatch].overload('android.view.MenuItem').call(native,menu.findItem(action)))throw Error('Native overflow did not open GigaFile');
 console.log('RESULT PASS full-screen overflow dispatch '+version);
}));