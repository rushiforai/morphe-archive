package defpackage;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentCallbacks2;
import android.content.res.Configuration;
import android.os.Bundle;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ex2 implements Application.ActivityLifecycleCallbacks, ComponentCallbacks2 {
    public final xpc a;
    public final Boolean b;

    public ex2(Application application) {
        xpc xpcVarJ = vv2.j(null);
        this.a = xpcVarJ;
        application.registerActivityLifecycleCallbacks(this);
        application.registerComponentCallbacks(this);
        this.b = (Boolean) xpcVarJ.getValue();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityCreated(Activity activity, Bundle bundle) {
        activity.getClass();
        Boolean bool = Boolean.FALSE;
        xpc xpcVar = this.a;
        xpcVar.getClass();
        xpcVar.m(null, bool);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityDestroyed(Activity activity) {
        activity.getClass();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityPaused(Activity activity) {
        activity.getClass();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityResumed(Activity activity) {
        activity.getClass();
        Boolean bool = Boolean.FALSE;
        xpc xpcVar = this.a;
        xpcVar.getClass();
        xpcVar.m(null, bool);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
        activity.getClass();
        bundle.getClass();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStarted(Activity activity) {
        activity.getClass();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStopped(Activity activity) {
        activity.getClass();
    }

    @Override // android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) {
        configuration.getClass();
    }

    @Override // android.content.ComponentCallbacks2
    public final void onTrimMemory(int i) {
        if (i == 20) {
            Boolean bool = Boolean.TRUE;
            xpc xpcVar = this.a;
            xpcVar.getClass();
            xpcVar.m(null, bool);
        }
    }

    @Override // android.content.ComponentCallbacks
    public final void onLowMemory() {
    }
}
