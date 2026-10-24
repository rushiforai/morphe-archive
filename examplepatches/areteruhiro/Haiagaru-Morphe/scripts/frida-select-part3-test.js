// Select the already-open Part3 tab in an isolated verification app. No URL launch or new thread fetch.
Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
 if(!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg))throw Error('Verification app required');
 Java.classFactory.loader=app.getClassLoader();
 const v191=pkg.endsWith('191'),v226=pkg.endsWith('226'),Integer=Java.use('java.lang.Integer');
 function field(o,n){for(let c=o.getClass();c!==null;c=c.getSuperclass())try{const f=c.getDeclaredField(n);f.setAccessible(true);return f.get(o);}catch(e){}throw Error(n);}
 function call(o,n,types,args){const m=o.getClass().getMethod(n,Java.array('java.lang.Class',types));m.setAccessible(true);return m.invoke(o,Java.array('java.lang.Object',args));}
 Java.scheduleOnMainThread(()=>{try{
  let host;const records=Java.use('android.app.ActivityThread').currentActivityThread().mActivities.value.values().toArray();
  for(let i=0;i<records.length;i++){const a=Java.cast(field(records[i],'activity'),Java.use('android.app.Activity'));if(!a.isFinishing()&&a.getWindow().getDecorView().hasWindowFocus()&&String(a.getClass().getName()).endsWith('.TabletHomeActivity'))host=a;}
  if(!host)throw Error('Focused tablet required');
  const pane=v191?field(host,'I'):Java.use('java.lang.reflect.Array').get(field(host,v226?'r':'w'),1),model=field(pane,v191?'d':v226?'a':'e');
  const state=v191?null:call(field(model,v226?'d':'e'),v226?'c':'d',[],[]),pages=Java.cast(field(v191?model:state,v191?'a':v226?'b':'a'),Java.use('java.util.List'));
  for(let i=0;i<pages.size();i++){const page=pages.get(i),fields=page.getClass().getDeclaredFields();let args;
   for(let n=0;n<fields.length;n++)if(String(fields[n].getType().getName())==='android.os.Bundle'){fields[n].setAccessible(true);args=Java.cast(fields[n].get(page),Java.use('android.os.Bundle'));break;}
   if(args&&(String(args).includes('1792500780')||String(args).includes('Haiagaru')&&String(args).includes('Part3'))){call(v191?pane:model,v191?'a':v226?'c':'e',[Integer.TYPE.value],[Integer.valueOf(i)]);console.log('PART3_SELECTED existing tab '+i);return;}
  }
  throw Error('Existing Part3 not found');
 }catch(e){console.log('FAIL '+e.stack);}});
});
