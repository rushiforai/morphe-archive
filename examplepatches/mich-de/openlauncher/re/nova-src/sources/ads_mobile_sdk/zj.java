package ads_mobile_sdk;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.Application;
import android.os.Bundle;
import b.bd;

/* loaded from: classes2.dex */
public class zj implements Application.ActivityLifecycleCallbacks {

    /* renamed from: a, reason: collision with root package name */
    public boolean f12549a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f12550b;

    /* renamed from: c, reason: collision with root package name */
    public bd f12551c;

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
        if (!this.f12550b) {
            this.f12550b = true;
            if (this.f12549a) {
                a(true);
                bd bdVar = this.f12551c;
                if (bdVar != null) {
                    bdVar.a(true);
                }
            }
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStopped(Activity activity) {
        boolean zA = a();
        if (this.f12550b != zA) {
            this.f12550b = zA;
            if (this.f12549a) {
                a(zA);
                bd bdVar = this.f12551c;
                if (bdVar != null) {
                    bdVar.a(zA);
                }
            }
        }
    }

    public final boolean a() {
        ActivityManager.RunningAppProcessInfo runningAppProcessInfo = new ActivityManager.RunningAppProcessInfo();
        ActivityManager.getMyMemoryState(runningAppProcessInfo);
        return runningAppProcessInfo.importance == 100 || b();
    }
}
