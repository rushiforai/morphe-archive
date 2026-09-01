package defpackage;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.view.Window;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jvf implements Application.ActivityLifecycleCallbacks {
    public final wjc a;
    public mvf b;

    public jvf(wjc wjcVar) {
        this.a = wjcVar;
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityCreated(Activity activity, Bundle bundle) {
        Window window = activity.getWindow();
        wjc wjcVar = this.a;
        window.setCallback(new awf(window.getCallback(), new zjf(window, activity.getClass().getSimpleName(), wjcVar, 4)));
        mvf mvfVar = new mvf(wjcVar);
        this.b = mvfVar;
        m15 m15Var = activity instanceof m15 ? (m15) activity : null;
        if (m15Var != null) {
            ((CopyOnWriteArrayList) m15Var.m().n.b).add(new s15(mvfVar));
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityDestroyed(Activity activity) {
        mvf mvfVar = this.b;
        if (mvfVar != null) {
            m15 m15Var = activity instanceof m15 ? (m15) activity : null;
            if (m15Var != null) {
                m15Var.m().h0(mvfVar);
            }
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityPaused(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityResumed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStarted(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStopped(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }
}
