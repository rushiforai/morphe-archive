package d00;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;

/* loaded from: classes4.dex */
public final class x implements Application.ActivityLifecycleCallbacks {

    /* renamed from: a, reason: collision with root package name */
    public boolean f48719a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Context f48720b;

    public x(Context context) {
        this.f48720b = context;
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
        String name = activity.getClass().getName();
        if (r70.j.I0(name, "com.teslacoilsw", false)) {
            y yVar = y.f48721a;
            if (y.b()) {
                y.d(this.f48719a);
            } else {
                y.e(this.f48720b, false);
            }
        }
        this.f48719a = r70.j.I0(name, "com.instabridge.", false);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStarted(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStopped(Activity activity) {
    }
}
