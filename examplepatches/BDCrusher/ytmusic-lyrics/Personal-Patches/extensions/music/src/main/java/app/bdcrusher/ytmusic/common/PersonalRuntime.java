/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.common;

import android.app.*;
import android.content.Context;
import android.os.*;
import android.view.*;
import java.util.*;

/** Application-scoped ownership of personal features; never starts the lyrics renderer. */
public final class PersonalRuntime implements Application.ActivityLifecycleCallbacks {
    private static PersonalRuntime instance;
    private final Map<Activity,NavigationWindow> windows=new WeakHashMap<>();
    private final Map<Window,NavigationWindow> dialogs=new WeakHashMap<>();
    private PersonalRuntime(){}
    public static boolean installed(Context c,String feature){try(var in=c.getAssets().open("bdcrusher-features/"+feature+".enabled")){return true;}catch(Exception absent){return false;}}
    public static void attach(Activity activity){
        FeatureDiagnostics.configure(activity);
        if(instance==null){instance=new PersonalRuntime();activity.getApplication().registerActivityLifecycleCallbacks(instance);}
        instance.onActivityCreated(activity,null);
    }
    public static void diagnosticsChanged(){if(instance!=null){for(NavigationWindow w:instance.windows.values())w.update();for(NavigationWindow w:instance.dialogs.values())w.update();}}
    public static void lyricsViewport(View root){
        if(instance==null||root==null||root.getWindowToken()==null)return;
        for(var entry:instance.windows.entrySet())if(entry.getKey().getWindow().getDecorView().getWindowToken()==root.getWindowToken()){entry.getValue().lyricsViewport(root);break;}
    }
    /** Exact Android Builder replacement preserves native construction and result handling. */
    public static AlertDialog showBuilder(AlertDialog.Builder builder){AlertDialog dialog=builder.show();dialog(dialog);return dialog;}
    public static void dialog(Dialog dialog){
        if(instance==null||dialog==null||dialog.getWindow()==null)return;
        Window window=dialog.getWindow();if(instance.dialogs.containsKey(window))return;
        NavigationWindow owner=new NavigationWindow(window);instance.dialogs.put(window,owner);owner.start();
        window.getDecorView().addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
            public void onViewAttachedToWindow(View view){}
            public void onViewDetachedFromWindow(View view){NavigationWindow old=instance.dialogs.remove(window);if(old!=null)old.close();view.removeOnAttachStateChangeListener(this);}
        });
    }
    public void onActivityCreated(Activity a,Bundle b){if(!windows.containsKey(a)){NavigationWindow owner=new NavigationWindow(a.getWindow());windows.put(a,owner);owner.start();}}
    public void onActivityResumed(Activity a){app.bdcrusher.ytmusic.shaders.ShaderRuntime.hostVisible(true);NavigationWindow owner=windows.get(a);if(owner!=null)owner.update();new Handler(Looper.getMainLooper()).post(()->{app.bdcrusher.ytmusic.playlists.PlaylistRuntime.init();app.bdcrusher.ytmusic.playlists.PlaylistRuntime.refreshFiles(false);app.bdcrusher.ytmusic.playlists.NativeMediaCache.recover();});}
    public void onActivityPaused(Activity a){FeatureDiagnostics.event("Lifecycle","Activity paused; background playback unchanged");app.bdcrusher.ytmusic.shaders.ShaderRuntime.hostVisible(false);}
    public void onActivityStarted(Activity a){}
    public void onActivityStopped(Activity a){FeatureDiagnostics.event("Lifecycle","Activity stopped");}
    public void onActivitySaveInstanceState(Activity a,Bundle b){}
    public void onActivityDestroyed(Activity a){NavigationWindow owner=windows.remove(a);if(owner!=null)owner.close();}
}
