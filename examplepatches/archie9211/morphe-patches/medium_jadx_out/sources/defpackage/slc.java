package defpackage;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import com.userleap.EventPayload;
import com.userleap.Sprig;
import java.lang.ref.WeakReference;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class slc implements Application.ActivityLifecycleCallbacks {
    public final dm4 a;
    public volatile WeakReference b;

    public slc(Application application, dm4 dm4Var) {
        this.a = dm4Var;
        application.registerActivityLifecycleCallbacks(this);
    }

    public final void a(String str, nl4 nl4Var, Map map) {
        if (this.a.b(nl4.ENABLE_SPRIG) && this.a.b(nl4Var)) {
            WeakReference weakReference = this.b;
            Activity activity = weakReference != null ? (Activity) weakReference.get() : null;
            if (activity == null) {
                wld.a.e(null, ev6.x("Cannot present Sprig survey for event ", str, ": no resumed activity tracked"), new Object[0]);
                return;
            }
            EventPayload eventPayload = new EventPayload(str, null, null, map, null, null, null, 118, null);
            wld.a.b(null, ho2.C(map.size(), "Presenting Sprig survey for event ", str, " (", " properties)"), new Object[0]);
            Sprig.INSTANCE.trackAndPresent(eventPayload, activity);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityCreated(Activity activity, Bundle bundle) {
        activity.getClass();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityDestroyed(Activity activity) {
        activity.getClass();
        WeakReference weakReference = this.b;
        if ((weakReference != null ? (Activity) weakReference.get() : null) == activity) {
            this.b = null;
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityPaused(Activity activity) {
        activity.getClass();
        WeakReference weakReference = this.b;
        if ((weakReference != null ? (Activity) weakReference.get() : null) == activity) {
            this.b = null;
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityResumed(Activity activity) {
        activity.getClass();
        this.b = new WeakReference(activity);
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
}
