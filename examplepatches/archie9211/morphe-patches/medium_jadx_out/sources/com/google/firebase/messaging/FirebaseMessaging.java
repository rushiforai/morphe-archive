package com.google.firebase.messaging;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import com.google.firebase.messaging.FirebaseMessaging;
import defpackage.bf3;
import defpackage.ca4;
import defpackage.dsc;
import defpackage.e4;
import defpackage.ep7;
import defpackage.f33;
import defpackage.h8a;
import defpackage.hk4;
import defpackage.hz1;
import defpackage.jrg;
import defpackage.lk4;
import defpackage.lt;
import defpackage.lv2;
import defpackage.mt;
import defpackage.mya;
import defpackage.nig;
import defpackage.nm;
import defpackage.ojg;
import defpackage.opg;
import defpackage.rmb;
import defpackage.u3b;
import defpackage.u5d;
import defpackage.uj;
import defpackage.vp7;
import defpackage.xj4;
import defpackage.y70;
import defpackage.zf3;
import defpackage.zwc;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class FirebaseMessaging {
    public static dsc j;
    public static h8a k = new hz1(5);
    public static ScheduledThreadPoolExecutor l;
    public final xj4 a;
    public final Context b;
    public final nig c;
    public final mya d;
    public final zf3 e;
    public final ScheduledThreadPoolExecutor f;
    public final ThreadPoolExecutor g;
    public final e4 h;
    public boolean i;

    public FirebaseMessaging(xj4 xj4Var, h8a h8aVar, h8a h8aVar2, hk4 hk4Var, h8a h8aVar3, zwc zwcVar) {
        xj4Var.a();
        Context context = xj4Var.a;
        final e4 e4Var = new e4();
        final int i = 0;
        e4Var.d = 0;
        e4Var.e = context;
        final nig nigVar = new nig(xj4Var, e4Var, h8aVar, h8aVar2, hk4Var);
        final int i2 = 1;
        ExecutorService executorServiceNewSingleThreadExecutor = Executors.newSingleThreadExecutor(new lv2("Firebase-Messaging-Task", 1));
        ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = new ScheduledThreadPoolExecutor(1, new lv2("Firebase-Messaging-Init", 1));
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(0, 1, 30L, TimeUnit.SECONDS, new LinkedBlockingQueue(), new lv2("Firebase-Messaging-File-Io", 1));
        this.i = false;
        k = h8aVar3;
        this.a = xj4Var;
        this.e = new zf3(this, zwcVar);
        xj4Var.a();
        final Context context2 = xj4Var.a;
        this.b = context2;
        ca4 ca4Var = new ca4();
        this.h = e4Var;
        this.c = nigVar;
        this.d = new mya(executorServiceNewSingleThreadExecutor);
        this.f = scheduledThreadPoolExecutor;
        this.g = threadPoolExecutor;
        xj4Var.a();
        if (context instanceof Application) {
            ((Application) context).registerActivityLifecycleCallbacks(ca4Var);
        } else {
            Log.w("FirebaseMessaging", "Context " + context + " was not an application, can't register for lifecycle callbacks. Some notification events may be dropped as a result.");
        }
        scheduledThreadPoolExecutor.execute(new Runnable(this) { // from class: kk4
            public final /* synthetic */ FirebaseMessaging b;

            {
                this.b = this;
            }

            private final void a() {
                FirebaseMessaging firebaseMessaging = this.b;
                if (firebaseMessaging.e.i() && firebaseMessaging.j(firebaseMessaging.e())) {
                    synchronized (firebaseMessaging) {
                        if (!firebaseMessaging.i) {
                            firebaseMessaging.i(0L);
                        }
                    }
                }
            }

            @Override // java.lang.Runnable
            public final void run() {
                jrg jrgVarW;
                int i3;
                switch (i) {
                    case 0:
                        a();
                        return;
                    default:
                        FirebaseMessaging firebaseMessaging = this.b;
                        Context context3 = firebaseMessaging.b;
                        nm.s(context3);
                        nig nigVar2 = firebaseMessaging.c;
                        boolean zH = firebaseMessaging.h();
                        if (Build.VERSION.SDK_INT >= 29) {
                            SharedPreferences sharedPreferencesO = mo7.O(context3);
                            if (!sharedPreferencesO.contains("proxy_retention") || sharedPreferencesO.getBoolean("proxy_retention", false) != zH) {
                                rmb rmbVar = (rmb) nigVar2.c;
                                if (rmbVar.c.p() >= 241100000) {
                                    Bundle bundle = new Bundle();
                                    bundle.putBoolean("proxy_retention", zH);
                                    opg opgVarD = opg.d(rmbVar.b);
                                    synchronized (opgVarD) {
                                        i3 = opgVarD.a;
                                        opgVarD.a = i3 + 1;
                                    }
                                    jrgVarW = opgVarD.i(new ojg(i3, 4, bundle, 0));
                                } else {
                                    jrgVarW = vp7.w(new IOException("SERVICE_NOT_AVAILABLE"));
                                }
                                jrgVarW.e(new b70(1), new ca6(context3, zH));
                            }
                        }
                        if (firebaseMessaging.h()) {
                            firebaseMessaging.f();
                            return;
                        }
                        return;
                }
            }
        });
        final ScheduledThreadPoolExecutor scheduledThreadPoolExecutor2 = new ScheduledThreadPoolExecutor(1, new lv2("Firebase-Messaging-Topics-Io", 1));
        vp7.j(scheduledThreadPoolExecutor2, new Callable() { // from class: opd
            @Override // java.util.concurrent.Callable
            public final Object call() {
                npd npdVar;
                Context context3 = context2;
                ScheduledThreadPoolExecutor scheduledThreadPoolExecutor3 = scheduledThreadPoolExecutor2;
                FirebaseMessaging firebaseMessaging = this;
                e4 e4Var2 = e4Var;
                nig nigVar2 = nigVar;
                synchronized (npd.class) {
                    try {
                        WeakReference weakReference = npd.d;
                        npd npdVar2 = weakReference != null ? (npd) weakReference.get() : null;
                        if (npdVar2 == null) {
                            npdVar = new npd(context3.getSharedPreferences("com.google.android.gms.appid", 0), scheduledThreadPoolExecutor3);
                            npdVar.b();
                            npd.d = new WeakReference(npdVar);
                        } else {
                            npdVar = npdVar2;
                        }
                    } catch (Throwable th) {
                        throw th;
                    }
                }
                return new ppd(firebaseMessaging, e4Var2, npdVar, nigVar2, context3, scheduledThreadPoolExecutor3);
            }
        }).e(scheduledThreadPoolExecutor, new lk4(this, i));
        scheduledThreadPoolExecutor.execute(new Runnable(this) { // from class: kk4
            public final /* synthetic */ FirebaseMessaging b;

            {
                this.b = this;
            }

            private final void a() {
                FirebaseMessaging firebaseMessaging = this.b;
                if (firebaseMessaging.e.i() && firebaseMessaging.j(firebaseMessaging.e())) {
                    synchronized (firebaseMessaging) {
                        if (!firebaseMessaging.i) {
                            firebaseMessaging.i(0L);
                        }
                    }
                }
            }

            @Override // java.lang.Runnable
            public final void run() {
                jrg jrgVarW;
                int i3;
                switch (i2) {
                    case 0:
                        a();
                        return;
                    default:
                        FirebaseMessaging firebaseMessaging = this.b;
                        Context context3 = firebaseMessaging.b;
                        nm.s(context3);
                        nig nigVar2 = firebaseMessaging.c;
                        boolean zH = firebaseMessaging.h();
                        if (Build.VERSION.SDK_INT >= 29) {
                            SharedPreferences sharedPreferencesO = mo7.O(context3);
                            if (!sharedPreferencesO.contains("proxy_retention") || sharedPreferencesO.getBoolean("proxy_retention", false) != zH) {
                                rmb rmbVar = (rmb) nigVar2.c;
                                if (rmbVar.c.p() >= 241100000) {
                                    Bundle bundle = new Bundle();
                                    bundle.putBoolean("proxy_retention", zH);
                                    opg opgVarD = opg.d(rmbVar.b);
                                    synchronized (opgVarD) {
                                        i3 = opgVarD.a;
                                        opgVarD.a = i3 + 1;
                                    }
                                    jrgVarW = opgVarD.i(new ojg(i3, 4, bundle, 0));
                                } else {
                                    jrgVarW = vp7.w(new IOException("SERVICE_NOT_AVAILABLE"));
                                }
                                jrgVarW.e(new b70(1), new ca6(context3, zH));
                            }
                        }
                        if (firebaseMessaging.h()) {
                            firebaseMessaging.f();
                            return;
                        }
                        return;
                }
            }
        });
    }

    public static void b(Runnable runnable, long j2) {
        synchronized (FirebaseMessaging.class) {
            try {
                ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = l;
                if (scheduledThreadPoolExecutor == null) {
                    scheduledThreadPoolExecutor = new ScheduledThreadPoolExecutor(1, new lv2("TAG", 1));
                    l = scheduledThreadPoolExecutor;
                }
                scheduledThreadPoolExecutor.schedule(runnable, j2, TimeUnit.SECONDS);
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public static synchronized dsc c(Context context) {
        dsc dscVar;
        dscVar = j;
        if (dscVar == null) {
            dscVar = new dsc(context);
            j = dscVar;
        }
        return dscVar;
    }

    public static synchronized FirebaseMessaging getInstance(xj4 xj4Var) {
        FirebaseMessaging firebaseMessaging;
        firebaseMessaging = (FirebaseMessaging) xj4Var.b(FirebaseMessaging.class);
        vp7.q("Firebase Messaging component is not present", firebaseMessaging);
        return firebaseMessaging;
    }

    public final String d() {
        xj4 xj4Var = this.a;
        xj4Var.a();
        return "[DEFAULT]".equals(xj4Var.b) ? "" : xj4Var.f();
    }

    public final f33 e() {
        f33 f33VarC;
        dsc dscVarC = c(this.b);
        String strD = d();
        String strD2 = e4.d(this.a);
        synchronized (dscVarC) {
            f33VarC = f33.c(dscVarC.a.getString(dsc.a(strD, strD2), null));
        }
        return f33VarC;
    }

    public final void f() {
        jrg jrgVarW;
        int i;
        rmb rmbVar = (rmb) this.c.c;
        int i2 = 1;
        if (rmbVar.c.p() >= 241100000) {
            opg opgVarD = opg.d(rmbVar.b);
            Bundle bundle = Bundle.EMPTY;
            synchronized (opgVarD) {
                i = opgVarD.a;
                opgVarD.a = i + 1;
            }
            jrgVarW = opgVarD.i(new ojg(i, 5, bundle, 1)).f(bf3.e, u3b.n);
        } else {
            jrgVarW = vp7.w(new IOException("SERVICE_NOT_AVAILABLE"));
        }
        jrgVarW.e(this.f, new lk4(this, i2));
    }

    public final synchronized void g(boolean z) {
        this.i = z;
    }

    public final boolean h() {
        Context context = this.b;
        nm.s(context);
        if (!nm.u(context)) {
            return false;
        }
        if (this.a.b(uj.class) != null) {
            return true;
        }
        return ep7.q() && k != null;
    }

    public final synchronized void i(long j2) {
        b(new u5d(this, Math.min(Math.max(30L, 2 * j2), 28800L)), j2);
        this.i = true;
    }

    public final boolean j(f33 f33Var) {
        if (f33Var != null) {
            return System.currentTimeMillis() > f33Var.a + 604800000 || !this.h.b().equals((String) f33Var.c);
        }
        return true;
    }

    public final String a() {
        jrg jrgVarG;
        f33 f33VarE = e();
        if (!j(f33VarE)) {
            return (String) f33VarE.b;
        }
        String strD = e4.d(this.a);
        mya myaVar = this.d;
        String str = aJzfoQ.QNCuypDtF;
        synchronized (myaVar) {
            jrgVarG = (jrg) ((y70) myaVar.c).get(strD);
            if (jrgVarG != null) {
                if (Log.isLoggable("FirebaseMessaging", 3)) {
                    Log.d("FirebaseMessaging", "Joining ongoing request for: " + strD);
                }
            } else {
                if (Log.isLoggable("FirebaseMessaging", 3)) {
                    Log.d("FirebaseMessaging", str + strD);
                }
                nig nigVar = this.c;
                jrgVarG = nigVar.h(nigVar.G(e4.d((xj4) nigVar.a), "*", new Bundle())).l(this.g, new mt(this, strD, f33VarE, 4)).g((Executor) myaVar.b, new lt(myaVar, 14, strD));
                ((y70) myaVar.c).put(strD, jrgVarG);
            }
        }
        try {
            return (String) vp7.h(jrgVarG);
        } catch (InterruptedException | ExecutionException e) {
            throw new IOException(e);
        }
    }
}
