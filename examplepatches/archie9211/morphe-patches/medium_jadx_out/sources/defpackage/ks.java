package defpackage;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ks implements Application.ActivityLifecycleCallbacks {
    public final double a;
    public final /* synthetic */ ms b;

    public ks(ms msVar, kva kvaVar) {
        this.b = msVar;
        hva hvaVar = kvaVar.a;
        q84 q84Var = ix5.a;
        Object obj = hvaVar.b.n.a.get(ix5.d);
        this.a = ((Number) (obj == null ? Double.valueOf(1.0d) : obj)).doubleValue();
    }

    public final void a(Context context) {
        long j;
        double d = this.a;
        if (d == 1.0d) {
            return;
        }
        Context applicationContext = context.getApplicationContext();
        applicationContext.getClass();
        ((Application) applicationContext).registerActivityLifecycleCallbacks(this);
        ms msVar = this.b;
        kva kvaVar = (kva) ((WeakReference) msVar.b).get();
        if (kvaVar == null) {
            msVar.f();
            return;
        }
        pva pvaVarD = kvaVar.d();
        if (pvaVarD != null) {
            synchronized (pvaVarD.c) {
                j = pvaVarD.a.a;
            }
            pvaVarD.e((long) (d * j));
        }
    }

    public final void b(Context context) {
        long j;
        if (this.a == 1.0d) {
            return;
        }
        Context applicationContext = context.getApplicationContext();
        applicationContext.getClass();
        ((Application) applicationContext).unregisterActivityLifecycleCallbacks(this);
        ms msVar = this.b;
        kva kvaVar = (kva) ((WeakReference) msVar.b).get();
        if (kvaVar == null) {
            msVar.f();
            return;
        }
        pva pvaVarD = kvaVar.d();
        if (pvaVarD != null) {
            synchronized (pvaVarD.c) {
                j = pvaVarD.a.a;
            }
            pvaVarD.e(j);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStarted(Activity activity) {
        b(activity);
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
    public final void onActivityStopped(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityCreated(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }
}
