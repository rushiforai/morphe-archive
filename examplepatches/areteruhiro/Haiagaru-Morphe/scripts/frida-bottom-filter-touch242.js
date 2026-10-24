// Preparation only. Use a real ADB long touch afterward; never replace the listener.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(!String(app.getPackageName()).endsWith('.resumefix242'))throw Error('242 verification only');
    const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='bottomQuickFilterPanel';
    const had=prefs.contains(key),old=prefs.getBoolean(key,false),F=Java.use('app.morphe.extension.chmate.ExtraQuickFilters');
    let host=null;
    Java.scheduleOnMainThread(()=>{try{
        const field=F.class.getDeclaredField('OWNERS');field.setAccessible(true);
        const owners=Java.cast(field.get(null),Java.use('java.util.List'));
        for(let i=owners.size()-1;i>=0;i--){
            const target=Java.cast(owners.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!target)continue;
            const view=target.getClass().getMethod('getView',Java.array('java.lang.Class',[])).invoke(target,Java.array('java.lang.Object',[]));
            if(!view||!Java.cast(view,Java.use('android.view.View')).isShown())continue;
            host=Java.retain(Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(target));
            prefs.edit().putBoolean(key,true).commit();F.updateOptions(host);
            if(!F.open(target))throw Error('Bottom filter did not open');
            console.log('READY_REAL_BOTTOM_FILTER_TOUCH');return;
        }throw Error('No visible thread');
    }catch(e){console.log('FAIL PREPARE '+e.stack);}});
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
        const edit=prefs.edit();if(had)edit.putBoolean(key,old);else edit.remove(key);edit.commit();
        if(host&&!host.isDestroyed())F.updateOptions(host);
        console.log('BOTTOM_FILTER_PREFERENCE_RESTORED');
    })),55000);
});
