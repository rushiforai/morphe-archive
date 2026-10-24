// No texts, URLs, draft content or credentials are printed.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(!String(app.getPackageName()).endsWith('.resumefix242'))throw Error('242 verification only');
    console.log('WINDOW_DIAGNOSTIC attached');
    const G=Java.use('android.view.ViewGroup');
    function tree(view,depth){
        if(!view||depth>5)return;
        console.log('VIEW '+depth+' '+view.getClass().getName()+' shown='+view.isShown()+' attached='+view.isAttachedToWindow()+' w='+view.getWidth()+' h='+view.getHeight());
        if(G.class.isInstance(view)){const g=Java.cast(view,G);for(let i=0;i<g.getChildCount();i++)tree(g.getChildAt(i),depth+1);}
    }
    Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{
        onMatch(d){const keep=Java.retain(d);Java.scheduleOnMainThread(()=>{
            if(!keep.isShowing())return;
            console.log('HAIAGARU_DIALOG showing=true lifecycle='+keep.getLifecycle().getCurrentState());
            tree(keep.getWindow().getDecorView(),0);
        });},onComplete(){}
    });
    Java.scheduleOnMainThread(()=>{
        try {
            const global=Java.use('android.view.WindowManagerGlobal').getInstance();
            const f=global.getClass().getDeclaredField('mViews');f.setAccessible(true);
            const views=Java.cast(f.get(global),Java.use('java.util.ArrayList'));
            console.log('ROOTS '+views.size());
            for(let i=0;i<views.size();i++){
                const root=Java.cast(views.get(i),Java.use('android.view.View'));tree(root,0);
                try{const decor=Java.cast(root,Java.use('com.android.internal.policy.DecorView'));
                    const win=Java.cast(decor.mWindow.value,Java.use('android.view.Window'));
                    const cb=Java.cast(win.getCallback(),Java.use('java.lang.Object'));console.log('WINDOW_CALLBACK '+cb.getClass().getName());
                    if(Java.use('android.app.Dialog').class.isInstance(cb)){
                        const dialog=Java.cast(cb,Java.use('android.app.Dialog'));
                        console.log('DIALOG_SHOWING '+dialog.isShowing());
                        console.log('DIALOG_DECOR_SAME '+dialog.getWindow().getDecorView().equals(root));
                    }
                }catch(e){console.log('WINDOW_CALLBACK unavailable '+e.stack);}
            }
        }catch(e){console.log('FAIL ROOTS '+e.stack);}
    });
});
