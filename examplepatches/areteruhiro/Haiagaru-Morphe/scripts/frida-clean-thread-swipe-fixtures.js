// Remove only native local pages created by frida-thread-tool-tab-swipe.js.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg))throw Error('Verification package required');
 Java.classFactory.loader=app.getClassLoader();
 const version=String(app.getPackageManager().getPackageInfo(pkg,0).versionName.value),v191=version.includes('191'),v226=version.includes('226');
 const T=Java.use('app.morphe.extension.chmate.NativeToolTabs'),H=Java.use('app.morphe.extension.chmate.Haiagaru'),Tablet=Java.use('jp.syoboi.a2chMate.activity.TabletHomeActivity');
 let removed=0,host;
 function field(o,n){for(let c=o.getClass();c!==null;c=c.getSuperclass())try{const f=c.getDeclaredField(n);f.setAccessible(true);return f.get(o);}catch(e){}throw Error('field '+n);}
 function call(o,n,types,args){const m=o.getClass().getMethod(n,Java.array('java.lang.Class',types));m.setAccessible(true);return m.invoke(o,Java.array('java.lang.Object',args));}
 function step(){Java.scheduleOnMainThread(()=>{try{
  if(!host)throw Error('No focused tablet');
  const pane=v191?field(host,'I'):Java.use('java.lang.reflect.Array').get(field(host,v226?'r':'w'),1),model=field(pane,v191?'d':v226?'a':'e');
  const state=v191?null:call(field(model,v226?'d':'e'),v226?'c':'d',[],[]);
  const pages=Java.cast(field(v191?model:state,v191?'a':v226?'b':'a'),Java.use('java.util.List'));
  for(let i=pages.size()-1;i>=0;i--){const page=pages.get(i);let args=null;const fields=page.getClass().getDeclaredFields();for(let j=0;j<fields.length;j++)if(String(fields[j].getType().getName())==='android.os.Bundle'){fields[j].setAccessible(true);args=Java.cast(fields[j].get(page),Java.use('android.os.Bundle'));break;}if(!args)throw Error('Page arguments missing');
   const data=String(args.getString('_data')),title=String(args.getString('android.intent.extra.TITLE'));
   if(!data.startsWith('about:blank#haiagaru-swipe-')&&!title.startsWith('SWIPE FIXTURE ')&&!String(args).includes('haiagaru-swipe-'))continue;
   if(v191){
    call(pane,'a',[Java.use('java.lang.Integer').TYPE.value],[Java.use('java.lang.Integer').valueOf(i)]);
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{const f=field(page,'c');if(!f)throw Error('Uninstantiated fixture');host.e.overload('androidx.fragment.app.Fragment','boolean').call(host,f,false);removed++;setTimeout(()=>Java.perform(step),400);}catch(e){console.log('FAIL '+e.stack);}})),500);return;
   }
   call(model,v226?'d':'c',[Java.use('java.lang.Integer').TYPE.value],[Java.use('java.lang.Integer').valueOf(i)]);removed++;setTimeout(()=>Java.perform(step),300);return;
  }
  console.log('THREAD_SWIPE_FIXTURES_CLEANED '+removed+' local pages; other tabs preserved');
 }catch(e){console.log('FAIL '+e.stack);}});}
 Java.choose(Tablet.$className,{onMatch(a){if(!a.isFinishing()&&a.getWindow().getDecorView().hasWindowFocus())host=Java.retain(a);},onComplete(){step();}});
});
