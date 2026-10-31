/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.common;
import android.content.*;
import android.media.session.*;
/** Stop only this app's media session on an actual Music task dismissal. Never handles Home/Back. */
public final class TaskDismissal {
    private static MediaSession.Token token;private static long lastRemoved=-10000;
    private TaskDismissal(){}
    public static void session(Object value){if(value instanceof MediaSession.Token nativeToken)token=nativeToken;}
    public static void removed(Context c,Intent root){
        if(root==null||root.getComponent()==null||!c.getPackageName().equals(root.getComponent().getPackageName())||!"com.google.android.apps.youtube.music.activities.MusicActivity".equals(root.getComponent().getClassName()))return;
        long now=android.os.SystemClock.elapsedRealtime();if(now-lastRemoved<1000)return;lastRemoved=now;
        FeatureDiagnostics.record("Task-dismissal","Music task swiped from Recents; requesting own-session stop");
        try { MediaSession.Token current=token;if(current==null){FeatureDiagnostics.record("Task-dismissal","No captured media session; native service dismissal remains authoritative");return;}
        try{MediaController controller=new MediaController(c,current);if(!c.getPackageName().equals(controller.getPackageName())){FeatureDiagnostics.record("Task-dismissal","Rejected a session owned by another package");return;}controller.getTransportControls().pause();controller.getTransportControls().stop();FeatureDiagnostics.record("Task-dismissal","Own-session pause/stop dispatched");}
        catch(Exception unavailable){FeatureDiagnostics.record("Task-dismissal","Session unavailable: "+unavailable.getClass().getSimpleName());}
        } finally {
            app.bdcrusher.ytmusic.shaders.ShaderRuntime.hostVisible(false);
            try{app.morphe.extension.music.patches.CrossfadePatch.onTaskRemoved();}catch(Exception unavailable){FeatureDiagnostics.record("Task-dismissal","Crossfade cleanup unavailable after own-session stop request");}
        }
    }
}
