package defpackage;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.Timer;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t6 implements Application.ActivityLifecycleCallbacks {
    public final /* synthetic */ int a;

    public /* synthetic */ t6(int i) {
        this.a = i;
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityCreated(Activity activity, Bundle bundle) {
        int i = this.a;
        activity.getClass();
        switch (i) {
            case 0:
                z46 z46Var = f87.b;
                z46.q(i87.APP_EVENTS, u6.a, "onActivityCreated");
                u6.b.execute(new e(2));
                break;
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityDestroyed(Activity activity) {
        int i = this.a;
        activity.getClass();
        switch (i) {
            case 0:
                z46 z46Var = f87.b;
                z46.q(i87.APP_EVENTS, u6.a, "onActivityDestroyed");
                fq1 fq1Var = fq1.a;
                Set set = ec2.a;
                if (!set.contains(fq1.class)) {
                    try {
                        iq1 iq1VarK = iq1.g.k();
                        if (!set.contains(iq1VarK)) {
                            try {
                                ((HashMap) iq1VarK.f).remove(Integer.valueOf(activity.hashCode()));
                            } catch (Throwable th) {
                                ec2.a(iq1VarK, th);
                            }
                        }
                    } catch (Throwable th2) {
                        ec2.a(fq1.class, th2);
                        return;
                    }
                    break;
                }
                break;
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityPaused(Activity activity) {
        int i = this.a;
        activity.getClass();
        switch (i) {
            case 0:
                z46 z46Var = f87.b;
                i87 i87Var = i87.APP_EVENTS;
                String str = u6.a;
                z46.q(i87Var, str, "onActivityPaused");
                AtomicInteger atomicInteger = u6.f;
                int i2 = 0;
                if (atomicInteger.decrementAndGet() < 0) {
                    atomicInteger.set(0);
                    Log.w(str, "Unexpected activity pause without a matching activity resume. Logging data may be incorrect. Make sure you call activateApp from your Application's onCreate method");
                }
                u6.a();
                long jCurrentTimeMillis = System.currentTimeMillis();
                String strT = epe.t(activity);
                fq1 fq1Var = fq1.a;
                Set set = ec2.a;
                if (!set.contains(fq1.class)) {
                    try {
                        if (fq1.f.get()) {
                            iq1.g.k().M(activity);
                            jue jueVar = fq1.d;
                            if (jueVar != null && !set.contains(jueVar)) {
                                try {
                                    if (((Activity) jueVar.b.get()) != null) {
                                        try {
                                            Timer timer = jueVar.c;
                                            if (timer != null) {
                                                timer.cancel();
                                            }
                                            jueVar.c = null;
                                        } catch (Exception e) {
                                            Log.e(jue.e, "Error unscheduling indexing job", e);
                                        }
                                    }
                                } catch (Throwable th) {
                                    ec2.a(jueVar, th);
                                }
                            }
                            SensorManager sensorManager = fq1.c;
                            if (sensorManager != null) {
                                sensorManager.unregisterListener(fq1.b);
                            }
                            break;
                        }
                    } catch (Throwable th2) {
                        ec2.a(fq1.class, th2);
                    }
                }
                u6.b.execute(new s6(strT, i2, jCurrentTimeMillis));
                break;
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityResumed(Activity activity) {
        int i = this.a;
        activity.getClass();
        switch (i) {
            case 0:
                z46 z46Var = f87.b;
                z46.q(i87.APP_EVENTS, u6.a, "onActivityResumed");
                u6.l = new WeakReference(activity);
                u6.f.incrementAndGet();
                u6.a();
                long jCurrentTimeMillis = System.currentTimeMillis();
                u6.j = jCurrentTimeMillis;
                String strT = epe.t(activity);
                kue kueVar = fq1.b;
                fq1 fq1Var = fq1.a;
                Set set = ec2.a;
                int i2 = 1;
                if (!set.contains(fq1.class)) {
                    try {
                        if (fq1.f.get()) {
                            iq1.g.k().t(activity);
                            Context applicationContext = activity.getApplicationContext();
                            String strB = f94.b();
                            xe4 xe4VarB = af4.b(strB);
                            if (xe4VarB == null || !xe4VarB.g) {
                                set.contains(fq1Var);
                            } else {
                                SensorManager sensorManager = (SensorManager) applicationContext.getSystemService("sensor");
                                if (sensorManager != null) {
                                    fq1.c = sensorManager;
                                    Sensor defaultSensor = sensorManager.getDefaultSensor(1);
                                    jue jueVar = new jue(activity);
                                    fq1.d = jueVar;
                                    lt ltVar = new lt(xe4VarB, 2, strB);
                                    if (!set.contains(kueVar)) {
                                        try {
                                            kueVar.a = ltVar;
                                        } catch (Throwable th) {
                                            ec2.a(kueVar, th);
                                        }
                                    }
                                    sensorManager.registerListener(kueVar, defaultSensor, 2);
                                    if (xe4VarB.g) {
                                        jueVar.c();
                                    }
                                    break;
                                }
                            }
                            ec2.a.contains(fq1Var);
                            break;
                        }
                    } catch (Throwable th2) {
                        ec2.a(fq1.class, th2);
                    }
                }
                tz7 tz7Var = tz7.b;
                if (!ec2.a.contains(tz7.class)) {
                    try {
                        if (tz7.c) {
                            CopyOnWriteArraySet copyOnWriteArraySet = yz7.d;
                            if (!new HashSet(yz7.a()).isEmpty()) {
                                HashMap map = a08.e;
                                kp7.C(activity);
                                break;
                            }
                        }
                    } catch (Exception unused) {
                    } catch (Throwable th3) {
                        ec2.a(tz7.class, th3);
                    }
                }
                y0d.d(activity);
                String str = u6.m;
                if (str != null && muc.Q(str, "ProxyBillingActivity", false) && !strT.equals("ProxyBillingActivity")) {
                    u6.c.execute(new e(i2));
                }
                u6.b.execute(new r6(jCurrentTimeMillis, strT, activity.getApplicationContext()));
                u6.m = strT;
                break;
            case 1:
                x50 x50VarO = x50.b.o();
                if (x50VarO != null) {
                    x50VarO.b(activity);
                }
                break;
            default:
                try {
                    f94.c().execute(new e(10));
                } catch (Exception unused2) {
                    return;
                }
                break;
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
        int i = this.a;
        activity.getClass();
        bundle.getClass();
        switch (i) {
            case 0:
                z46 z46Var = f87.b;
                z46.q(i87.APP_EVENTS, u6.a, "onActivitySaveInstanceState");
                break;
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStarted(Activity activity) {
        int i = this.a;
        activity.getClass();
        switch (i) {
            case 0:
                u6.k++;
                z46 z46Var = f87.b;
                z46.q(i87.APP_EVENTS, u6.a, "onActivityStarted");
                break;
            case 1:
                x50 x50VarO = x50.b.o();
                if (x50VarO != null) {
                    x50VarO.b(activity);
                }
                break;
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStopped(Activity activity) {
        int i = this.a;
        activity.getClass();
        switch (i) {
            case 0:
                z46 z46Var = f87.b;
                z46.q(i87.APP_EVENTS, u6.a, "onActivityStopped");
                String str = g50.c;
                pkf pkfVar = l40.a;
                if (!ec2.a.contains(l40.class)) {
                    try {
                        l40.b.execute(new e(7));
                    } catch (Throwable th) {
                        ec2.a(l40.class, th);
                    }
                }
                u6.k--;
                break;
            case 1:
                break;
            default:
                try {
                    if (g76.L(fz5.c, Boolean.TRUE) && g76.L(activity.getLocalClassName(), "com.android.billingclient.api.ProxyBillingActivity")) {
                        f94.c().execute(new e(9));
                        break;
                    }
                } catch (Exception unused) {
                    return;
                }
                break;
        }
    }
}
