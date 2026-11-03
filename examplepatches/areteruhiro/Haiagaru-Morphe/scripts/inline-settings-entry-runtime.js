let checks=0;
function check(ok,label){if(!ok)throw Error(label);checks++;}
function main(fn){return new Promise((resolve,reject)=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{resolve(fn());}catch(e){reject(Error(String(e.stack||e)));}})));}
rpc.exports={test(){return main(()=>{
 const app=Java.use('android.app.ActivityThread').currentApplication();if(!/^jp\.co\.airfront\.android\.a2chMate\.haiagaru\.bindings(191|226|242)$/.test(String(app.getPackageName())))throw Error('isolated bindings required');
 const H=Java.use('app.morphe.extension.chmate.Haiagaru'),a=H.toolbarActivity(null);check(a!==null&&String(a.getClass().getName()).endsWith('.SettingActivity'),'native settings foreground');
 const root=Java.cast(a.findViewById(16908290),Java.use('android.widget.FrameLayout'));check(root.findViewWithTag('haiagaru.settings.inline')===null,'old overlay absent');const child=root.getChildAt(0),count=root.getChildCount();check(child!==null,'native content exists');H.onSettingsResume(a);H.onSettingsResume(a);check(root.getChildCount()===count&&root.getChildAt(0).equals(child),'resume keeps native content');
 const E=Java.use('app.morphe.extension.chmate.InlineSettingsEntry');check(!E.select('safe'),'native selection not intercepted');check(!E.selectRow(null),'null row not intercepted');
 if(String(app.getPackageName()).endsWith('242')){const C=Java.use('o.zzakg'),field=C.class.getDeclaredField('b');field.setAccessible(true);const list=Java.cast(field.get(null),Java.use('java.util.List'));check(list.size()>1,'catalog retained');const safe=Java.cast(list.get(1),Java.use('o.zzakg$RemoteActionCompatParcelizer'));check(String(safe.e.value)==='safe'&&!E.selectRow(safe),'Safe mode uses native click');}

 return {checks,version:String(app.getPackageName()).slice(-3)};
 });}};
