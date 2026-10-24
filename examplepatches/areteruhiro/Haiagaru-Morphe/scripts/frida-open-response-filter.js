// Open the installed real filter only; long-press is performed afterward by ADB touch.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication(),pkg=String(app.getPackageName());
    if(!/\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg))throw Error('Verification apps only');
    Java.scheduleOnMainThread(()=>{try{
        const F=Java.use('app.morphe.extension.chmate.ExtraQuickFilters'),f=F.class.getDeclaredField('OWNERS');f.setAccessible(true);
        const owners=Java.cast(f.get(null),Java.use('java.util.List'));
        for(let i=owners.size()-1;i>=0;i--){const owner=Java.cast(owners.get(i),Java.use('java.lang.ref.WeakReference')).get();if(!owner)continue;
            const view=owner.getClass().getMethod('getView',Java.array('java.lang.Class',[])).invoke(owner,Java.array('java.lang.Object',[]));
            if(view&&Java.cast(view,Java.use('android.view.View')).isShown()){if(!F.open(owner))throw Error('Filter not opened');console.log('READY_NATIVE_RESPONSE_FILTER');return;}}
        throw Error('No visible thread');
    }catch(error){console.log('FAIL '+error.stack);}});
});
