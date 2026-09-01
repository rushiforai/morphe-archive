package defpackage;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a2a implements Application.ActivityLifecycleCallbacks {
    public final z1a a;
    public final AtomicInteger b = new AtomicInteger(0);
    public final AtomicInteger c = new AtomicInteger(0);
    public final AtomicBoolean d = new AtomicBoolean(true);
    public final AtomicBoolean e = new AtomicBoolean(true);

    public a2a(z1a z1aVar) {
        this.a = z1aVar;
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityCreated(Activity activity, Bundle bundle) {
        activity.getClass();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityDestroyed(Activity activity) {
        activity.getClass();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityPaused(Activity activity) {
        activity.getClass();
        if (this.b.decrementAndGet() != 0 || this.d.getAndSet(true)) {
            return;
        }
        this.a.e();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityResumed(Activity activity) {
        activity.getClass();
        if (this.b.incrementAndGet() == 1 && this.d.getAndSet(false)) {
            this.a.j();
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
        activity.getClass();
        bundle.getClass();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStarted(Activity activity) {
        activity.getClass();
        if (this.c.incrementAndGet() == 1 && this.e.getAndSet(false)) {
            this.a.f();
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStopped(Activity activity) {
        activity.getClass();
        if (this.c.decrementAndGet() == 0 && this.d.get()) {
            this.a.l();
            this.e.set(true);
        }
    }
}
