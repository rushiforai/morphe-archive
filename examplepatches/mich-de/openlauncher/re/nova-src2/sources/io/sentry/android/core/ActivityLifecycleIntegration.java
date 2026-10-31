package io.sentry.android.core;

import android.app.Activity;
import android.app.Application;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.SparseIntArray;
import android.view.View;
import androidx.core.app.FrameMetricsAggregator;
import io.sentry.g3;
import io.sentry.i3;
import io.sentry.j3;
import io.sentry.l1;
import io.sentry.m4;
import io.sentry.r4;
import io.sentry.s4;
import io.sentry.u2;
import io.sentry.w1;
import io.sentry.w3;
import java.io.Closeable;
import java.lang.ref.WeakReference;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.TimeUnit;

/* loaded from: classes4.dex */
public final class ActivityLifecycleIntegration implements io.sentry.v0, Closeable, Application.ActivityLifecycleCallbacks {

    /* renamed from: a, reason: collision with root package name */
    public final Application f66753a;

    /* renamed from: b, reason: collision with root package name */
    public final a0 f66754b;

    /* renamed from: c, reason: collision with root package name */
    public io.sentry.b0 f66755c;

    /* renamed from: d, reason: collision with root package name */
    public SentryAndroidOptions f66756d;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f66759g;

    /* renamed from: j, reason: collision with root package name */
    public io.sentry.q0 f66762j;

    /* renamed from: q, reason: collision with root package name */
    public final bn.s0 f66767q;

    /* renamed from: e, reason: collision with root package name */
    public boolean f66757e = false;

    /* renamed from: f, reason: collision with root package name */
    public boolean f66758f = false;

    /* renamed from: h, reason: collision with root package name */
    public boolean f66760h = false;

    /* renamed from: i, reason: collision with root package name */
    public io.sentry.w f66761i = null;

    /* renamed from: k, reason: collision with root package name */
    public final WeakHashMap f66763k = new WeakHashMap();

    /* renamed from: l, reason: collision with root package name */
    public final WeakHashMap f66764l = new WeakHashMap();

    /* renamed from: m, reason: collision with root package name */
    public u2 f66765m = new j3(new Date(0), 0);
    public final Handler n = new Handler(Looper.getMainLooper());
    public Future o = null;

    /* renamed from: p, reason: collision with root package name */
    public final WeakHashMap f66766p = new WeakHashMap();

    public ActivityLifecycleIntegration(Application application, a0 a0Var, bn.s0 s0Var) {
        i30.j.Q(application, "Application is required");
        this.f66753a = application;
        this.f66754b = a0Var;
        this.f66767q = s0Var;
        if (Build.VERSION.SDK_INT >= 29) {
            this.f66759g = true;
        }
    }

    public static void c(io.sentry.q0 q0Var, io.sentry.q0 q0Var2) {
        if (q0Var == null || q0Var.a()) {
            return;
        }
        String description = q0Var.getDescription();
        if (description == null || !description.endsWith(" - Deadline Exceeded")) {
            description = q0Var.getDescription() + " - Deadline Exceeded";
        }
        q0Var.d(description);
        u2 u2VarP = q0Var2 != null ? q0Var2.p() : null;
        if (u2VarP == null) {
            u2VarP = q0Var.r();
        }
        d(q0Var, u2VarP, m4.DEADLINE_EXCEEDED);
    }

    public static void d(io.sentry.q0 q0Var, u2 u2Var, m4 m4Var) {
        if (q0Var == null || q0Var.a()) {
            return;
        }
        if (m4Var == null) {
            m4Var = q0Var.h() != null ? q0Var.h() : m4.OK;
        }
        q0Var.q(m4Var, u2Var);
    }

    public final void a() {
        i3 i3Var;
        io.sentry.android.core.performance.e eVarA = io.sentry.android.core.performance.d.b().a(this.f66756d);
        if (eVarA.f67048d != 0) {
            if (eVarA.a()) {
                long j11 = eVarA.f67046b;
                long j12 = eVarA.f67048d;
                j = (j12 != 0 ? j12 - eVarA.f67047c : 0L) + j11;
            }
            i3Var = new i3(j * 1000000);
        } else {
            i3Var = null;
        }
        if (!this.f66757e || i3Var == null) {
            return;
        }
        d(this.f66762j, i3Var, null);
    }

    @Override // io.sentry.v0
    public final void b(w3 w3Var) {
        SentryAndroidOptions sentryAndroidOptions = w3Var instanceof SentryAndroidOptions ? (SentryAndroidOptions) w3Var : null;
        i30.j.Q(sentryAndroidOptions, "SentryAndroidOptions is required");
        this.f66756d = sentryAndroidOptions;
        this.f66755c = io.sentry.b0.f67112a;
        this.f66757e = sentryAndroidOptions.isTracingEnabled() && sentryAndroidOptions.isEnableAutoActivityLifecycleTracing();
        this.f66761i = this.f66756d.getFullyDisplayedReporter();
        this.f66758f = this.f66756d.isEnableTimeToFullDisplayTracing();
        this.f66753a.registerActivityLifecycleCallbacks(this);
        this.f66756d.getLogger().g(g3.DEBUG, "ActivityLifecycleIntegration installed.", new Object[0]);
        lb0.b.o("ActivityLifecycle");
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.f66753a.unregisterActivityLifecycleCallbacks(this);
        SentryAndroidOptions sentryAndroidOptions = this.f66756d;
        if (sentryAndroidOptions != null) {
            sentryAndroidOptions.getLogger().g(g3.DEBUG, "ActivityLifecycleIntegration removed.", new Object[0]);
        }
        bn.s0 s0Var = this.f66767q;
        synchronized (s0Var) {
            try {
                if (s0Var.i()) {
                    s0Var.k("FrameMetricsAggregator.stop", new g.p(s0Var, 6));
                    og.g gVar = ((FrameMetricsAggregator) s0Var.f18279b).f14217a;
                    Object obj = gVar.f80407b;
                    gVar.f80407b = new SparseIntArray[9];
                }
                ((ConcurrentHashMap) s0Var.f18281d).clear();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void e(io.sentry.r0 r0Var, io.sentry.q0 q0Var, io.sentry.q0 q0Var2) {
        if (r0Var == null || r0Var.a()) {
            return;
        }
        m4 m4Var = m4.DEADLINE_EXCEEDED;
        if (q0Var != null && !q0Var.a()) {
            q0Var.i(m4Var);
        }
        c(q0Var2, q0Var);
        Future future = this.o;
        if (future != null) {
            future.cancel(false);
            this.o = null;
        }
        m4 m4VarH = r0Var.h();
        if (m4VarH == null) {
            m4VarH = m4.OK;
        }
        r0Var.i(m4VarH);
        io.sentry.b0 b0Var = this.f66755c;
        if (b0Var != null) {
            b0Var.s(new e(this, r0Var, 0));
        }
    }

    public final void f(io.sentry.q0 q0Var, io.sentry.q0 q0Var2) {
        io.sentry.android.core.performance.d dVarB = io.sentry.android.core.performance.d.b();
        io.sentry.android.core.performance.e eVar = dVarB.f67037c;
        io.sentry.android.core.performance.e eVar2 = dVarB.f67038d;
        if (eVar.a() && eVar.f67048d == 0) {
            eVar.f67048d = SystemClock.uptimeMillis();
        }
        if (eVar2.a() && eVar2.f67048d == 0) {
            eVar2.f67048d = SystemClock.uptimeMillis();
        }
        a();
        SentryAndroidOptions sentryAndroidOptions = this.f66756d;
        if (sentryAndroidOptions == null || q0Var2 == null) {
            if (q0Var2 == null || q0Var2.a()) {
                return;
            }
            q0Var2.c();
            return;
        }
        u2 u2VarA = sentryAndroidOptions.getDateProvider().a();
        long millis = TimeUnit.NANOSECONDS.toMillis(u2VarA.b(q0Var2.r()));
        Long lValueOf = Long.valueOf(millis);
        l1 l1Var = l1.MILLISECOND;
        q0Var2.n("time_to_initial_display", lValueOf, l1Var);
        if (q0Var != null && q0Var.a()) {
            q0Var.f(u2VarA);
            q0Var2.n("time_to_full_display", Long.valueOf(millis), l1Var);
        }
        d(q0Var2, u2VarA, null);
    }

    public final void h(Bundle bundle) {
        SentryAndroidOptions sentryAndroidOptions;
        if (this.f66755c != null && this.f66765m.d() == 0) {
            this.f66765m = this.f66755c.t().getDateProvider().a();
        } else if (this.f66765m.d() == 0) {
            h.f66892a.getClass();
            this.f66765m = new j3();
        }
        if (this.f66760h || (sentryAndroidOptions = this.f66756d) == null || sentryAndroidOptions.isEnablePerformanceV2()) {
            return;
        }
        io.sentry.android.core.performance.d.b().f67035a = bundle == null ? io.sentry.android.core.performance.c.COLD : io.sentry.android.core.performance.c.WARM;
    }

    public final void l(Activity activity) {
        WeakHashMap weakHashMap;
        WeakHashMap weakHashMap2;
        Boolean boolValueOf;
        i3 i3Var;
        u2 u2Var;
        WeakReference weakReference = new WeakReference(activity);
        if (this.f66755c != null) {
            WeakHashMap weakHashMap3 = this.f66766p;
            if (weakHashMap3.containsKey(activity)) {
                return;
            }
            if (!this.f66757e) {
                weakHashMap3.put(activity, w1.f67895a);
                this.f66755c.s(new ge.d(20));
                return;
            }
            Iterator it = weakHashMap3.entrySet().iterator();
            while (true) {
                boolean zHasNext = it.hasNext();
                weakHashMap = this.f66764l;
                weakHashMap2 = this.f66763k;
                if (!zHasNext) {
                    break;
                }
                Map.Entry entry = (Map.Entry) it.next();
                e((io.sentry.r0) entry.getValue(), (io.sentry.q0) weakHashMap2.get(entry.getKey()), (io.sentry.q0) weakHashMap.get(entry.getKey()));
            }
            String simpleName = activity.getClass().getSimpleName();
            io.sentry.android.core.performance.e eVarA = io.sentry.android.core.performance.d.b().a(this.f66756d);
            if (c0.g() && eVarA.a()) {
                i3Var = eVarA.a() ? new i3(eVarA.f67046b * 1000000) : null;
                boolValueOf = Boolean.valueOf(io.sentry.android.core.performance.d.b().f67035a == io.sentry.android.core.performance.c.COLD);
            } else {
                boolValueOf = null;
                i3Var = null;
            }
            s4 s4Var = new s4();
            s4Var.f67769f = 30000L;
            if (this.f66756d.isEnableActivityLifecycleTracingAutoFinish()) {
                s4Var.f67768e = this.f66756d.getIdleTimeout();
                s4Var.f17888a = true;
            }
            s4Var.f67767d = true;
            s4Var.f67770g = new f(this, weakReference, simpleName);
            if (this.f66760h || i3Var == null || boolValueOf == null) {
                u2Var = this.f66765m;
            } else {
                io.sentry.android.core.performance.d.b().getClass();
                io.sentry.android.core.performance.d.b().getClass();
                u2Var = i3Var;
            }
            s4Var.f67765b = u2Var;
            s4Var.f67766c = false;
            io.sentry.r0 r0VarX = this.f66755c.x(new r4(simpleName, io.sentry.protocol.d0.COMPONENT, "ui.load", null), s4Var);
            if (r0VarX != null) {
                r0VarX.o().f67360i = "auto.ui.activity";
            }
            if (!this.f66760h && i3Var != null && boolValueOf != null) {
                io.sentry.q0 q0VarJ = r0VarX.j(boolValueOf.booleanValue() ? "app.start.cold" : "app.start.warm", boolValueOf.booleanValue() ? "Cold Start" : "Warm Start", i3Var, io.sentry.u0.SENTRY);
                this.f66762j = q0VarJ;
                q0VarJ.o().f67360i = "auto.ui.activity";
                a();
            }
            String strConcat = simpleName.concat(" initial display");
            io.sentry.u0 u0Var = io.sentry.u0.SENTRY;
            io.sentry.q0 q0VarJ2 = r0VarX.j("ui.load.initial_display", strConcat, u2Var, u0Var);
            weakHashMap2.put(activity, q0VarJ2);
            q0VarJ2.o().f67360i = "auto.ui.activity";
            if (this.f66758f && this.f66761i != null && this.f66756d != null) {
                io.sentry.q0 q0VarJ3 = r0VarX.j("ui.load.full_display", simpleName.concat(" full display"), u2Var, u0Var);
                q0VarJ3.o().f67360i = "auto.ui.activity";
                try {
                    weakHashMap.put(activity, q0VarJ3);
                    this.o = this.f66756d.getExecutorService().m(new fa.l0(this, q0VarJ3, q0VarJ2), 30000L);
                } catch (RejectedExecutionException e3) {
                    this.f66756d.getLogger().e(g3.ERROR, "Failed to call the executor. Time to full display span will not be finished automatically. Did you call Sentry.close()?", e3);
                }
            }
            this.f66755c.s(new e(this, r0VarX, 1));
            weakHashMap3.put(activity, r0VarX);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final synchronized void onActivityCreated(Activity activity, Bundle bundle) {
        io.sentry.w wVar;
        SentryAndroidOptions sentryAndroidOptions;
        try {
            h(bundle);
            if (this.f66755c != null && (sentryAndroidOptions = this.f66756d) != null && sentryAndroidOptions.isEnableScreenTracking()) {
                this.f66755c.s(new ep.a(io.sentry.android.core.internal.util.e.a(activity), 4));
            }
            l(activity);
            io.sentry.q0 q0Var = (io.sentry.q0) this.f66764l.get(activity);
            this.f66760h = true;
            if (this.f66757e && q0Var != null && (wVar = this.f66761i) != null) {
                wVar.f67893a.add(new ge.d(18));
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final synchronized void onActivityDestroyed(Activity activity) {
        try {
            if (this.f66757e) {
                io.sentry.q0 q0Var = this.f66762j;
                m4 m4Var = m4.CANCELLED;
                if (q0Var != null && !q0Var.a()) {
                    q0Var.i(m4Var);
                }
                io.sentry.q0 q0Var2 = (io.sentry.q0) this.f66763k.get(activity);
                io.sentry.q0 q0Var3 = (io.sentry.q0) this.f66764l.get(activity);
                m4 m4Var2 = m4.DEADLINE_EXCEEDED;
                if (q0Var2 != null && !q0Var2.a()) {
                    q0Var2.i(m4Var2);
                }
                c(q0Var3, q0Var2);
                Future future = this.o;
                if (future != null) {
                    future.cancel(false);
                    this.o = null;
                }
                if (this.f66757e) {
                    e((io.sentry.r0) this.f66766p.get(activity), null, null);
                }
                this.f66762j = null;
                this.f66763k.remove(activity);
                this.f66764l.remove(activity);
            }
            this.f66766p.remove(activity);
        } catch (Throwable th2) {
            throw th2;
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final synchronized void onActivityPaused(Activity activity) {
        try {
            if (!this.f66759g) {
                this.f66760h = true;
                io.sentry.b0 b0Var = this.f66755c;
                if (b0Var == null) {
                    h.f66892a.getClass();
                    this.f66765m = new j3();
                } else {
                    this.f66765m = b0Var.t().getDateProvider().a();
                }
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityPostResumed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityPrePaused(Activity activity) {
        if (this.f66759g) {
            this.f66760h = true;
            io.sentry.b0 b0Var = this.f66755c;
            if (b0Var != null) {
                this.f66765m = b0Var.t().getDateProvider().a();
            } else {
                h.f66892a.getClass();
                this.f66765m = new j3();
            }
        }
    }

    /* JADX WARN: Type inference failed for: r2v2, types: [io.sentry.android.core.d] */
    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final synchronized void onActivityResumed(Activity activity) {
        try {
            if (this.f66757e) {
                final io.sentry.q0 q0Var = (io.sentry.q0) this.f66763k.get(activity);
                final io.sentry.q0 q0Var2 = (io.sentry.q0) this.f66764l.get(activity);
                View viewFindViewById = activity.findViewById(16908290);
                if (viewFindViewById != null) {
                    final int i5 = 0;
                    ?? r22 = new Runnable(this) { // from class: io.sentry.android.core.d

                        /* renamed from: b, reason: collision with root package name */
                        public final /* synthetic */ ActivityLifecycleIntegration f66858b;

                        {
                            this.f66858b = this;
                        }

                        @Override // java.lang.Runnable
                        public final void run() {
                            switch (i5) {
                                case 0:
                                    this.f66858b.f(q0Var2, q0Var);
                                    break;
                                default:
                                    this.f66858b.f(q0Var2, q0Var);
                                    break;
                            }
                        }
                    };
                    a0 a0Var = this.f66754b;
                    io.sentry.android.core.internal.util.i iVar = new io.sentry.android.core.internal.util.i(viewFindViewById, r22);
                    a0Var.getClass();
                    viewFindViewById.getViewTreeObserver().addOnDrawListener(iVar);
                } else {
                    final int i11 = 1;
                    this.n.post(new Runnable(this) { // from class: io.sentry.android.core.d

                        /* renamed from: b, reason: collision with root package name */
                        public final /* synthetic */ ActivityLifecycleIntegration f66858b;

                        {
                            this.f66858b = this;
                        }

                        @Override // java.lang.Runnable
                        public final void run() {
                            switch (i11) {
                                case 0:
                                    this.f66858b.f(q0Var2, q0Var);
                                    break;
                                default:
                                    this.f66858b.f(q0Var2, q0Var);
                                    break;
                            }
                        }
                    });
                }
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final synchronized void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final synchronized void onActivityStarted(Activity activity) {
        if (this.f66757e) {
            bn.s0 s0Var = this.f66767q;
            synchronized (s0Var) {
                if (s0Var.i()) {
                    s0Var.k("FrameMetricsAggregator.add", new b(s0Var, activity, 0));
                    c cVarD = s0Var.d();
                    if (cVarD != null) {
                        ((WeakHashMap) s0Var.f18282e).put(activity, cVarD);
                    }
                }
            }
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final synchronized void onActivityStopped(Activity activity) {
    }
}
