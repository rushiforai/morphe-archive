// Remove only a confirmed dismissed, zero-height HaiagaruDialog window.
// Does not close a live dialog or touch activity windows, drafts or preferences.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(!String(app.getPackageName()).endsWith('.resumefix242'))throw Error('242 verification only');
    Java.scheduleOnMainThread(()=>{try{
        const global=Java.use('android.view.WindowManagerGlobal').getInstance();
        const f=global.getClass().getDeclaredField('mViews');f.setAccessible(true);
        const views=Java.cast(f.get(global),Java.use('java.util.ArrayList'));
        let count=0;
        for(let i=views.size()-1;i>=0;i--){
            const root=Java.cast(views.get(i),Java.use('android.view.View'));
            const decor=Java.cast(root,Java.use('com.android.internal.policy.DecorView'));
            const win=Java.cast(decor.mWindow.value,Java.use('android.view.Window'));
            const cb=Java.cast(win.getCallback(),Java.use('java.lang.Object'));
            if(String(cb.getClass().getName())!=='app.morphe.extension.chmate.HaiagaruDialog')continue;
            const dialog=Java.cast(cb,Java.use('android.app.Dialog'));
            if(dialog.isShowing()||root.getHeight()!==0||!root.isAttachedToWindow())continue;
            global.removeView(root,true);count++;
            console.log('AFTER_REMOVE attached='+root.isAttachedToWindow()+' roots='+views.size());
        }
        console.log('DISMISSED_ZERO_HEIGHT_WINDOWS_REMOVED '+count);
    }catch(e){console.log('FAIL RECOVERY '+e.stack);}});
});
