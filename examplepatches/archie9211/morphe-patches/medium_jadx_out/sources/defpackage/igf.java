package defpackage;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import java.util.LinkedHashMap;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class igf implements Application.ActivityLifecycleCallbacks {
    public static final igf a = new igf();
    public static final LinkedHashMap b = new LinkedHashMap();

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityCreated(Activity activity, Bundle bundle) {
        activity.getClass();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityDestroyed(Activity activity) {
        activity.getClass();
        Set setEntrySet = b.entrySet();
        hgf hgfVar = new hgf(activity, 0);
        setEntrySet.getClass();
        bu1.u0(setEntrySet, hgfVar, true);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityPaused(Activity activity) {
        activity.getClass();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityResumed(Activity activity) {
        activity.getClass();
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
        Set setEntrySet = b.entrySet();
        hgf hgfVar = new hgf(activity, 1);
        setEntrySet.getClass();
        bu1.u0(setEntrySet, hgfVar, true);
    }
}
