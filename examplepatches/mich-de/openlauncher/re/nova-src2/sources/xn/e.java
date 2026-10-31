package xn;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.Application;
import android.os.Bundle;

/* loaded from: classes.dex */
public class e implements Application.ActivityLifecycleCallbacks {

    /* renamed from: a, reason: collision with root package name */
    public boolean f96185a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f96186b;

    /* renamed from: c, reason: collision with root package name */
    public d f96187c;

    public void a(boolean z11) {
    }

    public boolean b() {
        return false;
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityCreated(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityDestroyed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityPaused(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityResumed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStarted(Activity activity) {
        if (!this.f96186b) {
            this.f96186b = true;
            if (this.f96185a) {
                a(true);
                d dVar = this.f96187c;
                if (dVar != null) {
                    dVar.a(true);
                }
            }
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStopped(Activity activity) {
        ActivityManager.RunningAppProcessInfo runningAppProcessInfo = new ActivityManager.RunningAppProcessInfo();
        ActivityManager.getMyMemoryState(runningAppProcessInfo);
        boolean z11 = runningAppProcessInfo.importance == 100 || b();
        if (this.f96186b != z11) {
            this.f96186b = z11;
            if (this.f96185a) {
                a(z11);
                d dVar = this.f96187c;
                if (dVar != null) {
                    dVar.a(z11);
                }
            }
        }
    }
}
