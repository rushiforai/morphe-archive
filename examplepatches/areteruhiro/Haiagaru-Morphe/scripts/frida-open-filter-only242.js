Java.perform(function(){
 const app=Java.use('android.app.ActivityThread').currentApplication();
 if(!String(app.getPackageName()).endsWith('.resumefix242'))throw Error('Verification only');
 Java.scheduleOnMainThread(()=>{try{
  Java.use('java.lang.System').setProperty('haiagaru.dialog.trace','true');
  const F=Java.use('app.morphe.extension.chmate.ExtraQuickFilters');
  const f=F.class.getDeclaredField('OWNERS');f.setAccessible(true);
  const owners=Java.cast(f.get(null),Java.use('java.util.List'));
  for(let i=owners.size()-1;i>=0;i--){
   const owner=Java.cast(owners.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!owner)continue;
   const v=owner.getClass().getMethod('getView',Java.array('java.lang.Class',[])).invoke(owner,Java.array('java.lang.Object',[]));
   if(v&&Java.cast(v,Java.use('android.view.View')).isShown()){console.log('OPEN '+F.open(owner));return;}
  }throw Error('No visible thread');
 }catch(e){console.log('FAIL '+e.stack);}});
});
