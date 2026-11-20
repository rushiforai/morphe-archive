// Launch the real archive search screen and ensure its Compose content remains alive.
Java.perform(function(){
  const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
  if(!/\.reporter(191|226|242)$/.test(pkg))throw Error('Reporter verification build only');
  const I=Java.use('android.content.Intent'),U=Java.use('android.net.Uri');
  const name='app.morphe.extension.chmate.HissiMenuActivity';
  const i=I.$new();i.setClassName(pkg,name);i.setAction('android.intent.action.VIEW');i.setData(U.parse('haiagaru-eddi://eddiarchive3rd.boy.jp/'));i.addFlags(0x10000000);
  app.startActivity(i);
  setTimeout(function(){Java.perform(function(){
    try{
      const T=Java.use('android.app.ActivityThread'),R=Java.use('android.app.ActivityThread$ActivityClientRecord');
      const records=T.currentActivityThread().mActivities.value.values().toArray();let found=null;
      records.forEach(r=>{const a=Java.cast(r,R).activity.value;if(a&&String(a.getClass().getName())===name&&!a.isFinishing())found=Java.retain(a);});
      if(found===null){console.log('FAIL archive Activity missing');return;}
      const controller=Java.cast(found,Java.use(name)).controller.value;
      const ui=Java.cast(controller,Java.use('app.morphe.extension.chmate.HissiMenuController')).archiveSearchUi.value;
      if(ui===null){console.log('FAIL archive controller missing');return;}
      const root=ui.rootView();
      if(root===null||root.getChildCount()<7){console.log('FAIL native archive layout incomplete');return;}
      const B=Java.use('android.widget.Button'),L=Java.use('android.widget.LinearLayout');
      if(!L.class.isInstance(root.getChildAt(5))||!B.class.isInstance(root.getChildAt(6))){console.log('FAIL archive native child types do not match Compose indices');return;}
      console.log('PASS Compose navigation uses native child 5 and original-site button child 6');
      console.log('PASS archive search controller alive; native children='+root.getChildCount());
      console.log('ARCHIVE_SEARCH_CRASH_SMOKE_COMPLETE');
    }catch(e){console.log('FAIL archive smoke '+e.stack);}
  });},3000);
});
