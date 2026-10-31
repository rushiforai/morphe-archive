package n4;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.util.Log;

/* loaded from: classes2.dex */
public final class d implements Application.ActivityLifecycleCallbacks {

    /* renamed from: a, reason: collision with root package name */
    public Object f77782a;

    /* renamed from: b, reason: collision with root package name */
    public Activity f77783b;

    /* renamed from: c, reason: collision with root package name */
    public final int f77784c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f77785d = false;

    /* renamed from: e, reason: collision with root package name */
    public boolean f77786e = false;

    /* renamed from: f, reason: collision with root package name */
    public boolean f77787f = false;

    public d(Activity activity) {
        this.f77783b = activity;
        this.f77784c = activity.hashCode();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityCreated(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityDestroyed(Activity activity) {
        if (this.f77783b == activity) {
            this.f77783b = null;
            this.f77786e = true;
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityPaused(Activity activity) {
        if (!this.f77786e || this.f77787f || this.f77785d) {
            return;
        }
        Object obj = this.f77782a;
        try {
            Object obj2 = e.f77790c.get(activity);
            if (obj2 == obj && activity.hashCode() == this.f77784c) {
                e.f77794g.postAtFrontOfQueue(new mk.w(3, e.f77789b.get(activity), obj2));
                this.f77787f = true;
                this.f77782a = null;
            }
        } catch (Throwable th2) {
            Log.e("ActivityRecreator", "Exception while fetching field values", th2);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityResumed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStarted(Activity activity) {
        if (this.f77783b == activity) {
            this.f77785d = true;
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStopped(Activity activity) {
    }
}
