package ads_mobile_sdk;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import android.os.SystemClock;
import b.k9;
import b.l7;
import b.o2;
import b0.x;
import b4.i;
import b70.d;
import java.lang.ref.WeakReference;
import java.util.Iterator;
import java.util.LinkedHashSet;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import t70.m0;

/* loaded from: classes2.dex */
public final class g0 extends c61 implements Application.ActivityLifecycleCallbacks {

    /* renamed from: c, reason: collision with root package name */
    public final Application f3588c;

    /* renamed from: d, reason: collision with root package name */
    public final WeakReference f3589d;

    /* renamed from: e, reason: collision with root package name */
    public final t70.j0 f3590e;

    /* renamed from: f, reason: collision with root package name */
    public final jr0 f3591f;

    /* renamed from: g, reason: collision with root package name */
    public final o2 f3592g;

    /* renamed from: h, reason: collision with root package name */
    public final LinkedHashSet f3593h;

    /* renamed from: i, reason: collision with root package name */
    public final LinkedHashSet f3594i;

    /* renamed from: j, reason: collision with root package name */
    public s f3595j;

    /* renamed from: k, reason: collision with root package name */
    public Activity f3596k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f3597l;

    /* renamed from: m, reason: collision with root package name */
    public t70.g2 f3598m;
    public boolean n;
    public boolean o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g0(Context applicationContext, Application application, WeakReference firstContextReference, t70.j0 backgroundScope, jr0 flags, o2 clock) {
        super(wv0.CUI_NAME_SDKINIT_ACTIVITY_TRACKER, 2);
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(application, "application");
        Intrinsics.g(firstContextReference, "firstContextReference");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(clock, "clock");
        this.f3588c = application;
        this.f3589d = firstContextReference;
        this.f3590e = backgroundScope;
        this.f3591f = flags;
        this.f3592g = clock;
        this.f3593h = new LinkedHashSet();
        this.f3594i = new LinkedHashSet();
        this.f3595j = s.f9366b;
        this.o = k9.D(applicationContext);
    }

    public final void a(Function1 function1) {
        synchronized (this) {
            Iterator it = b70.g.I1(this.f3594i).iterator();
            while (it.hasNext()) {
                l7 l7Var = (l7) ((WeakReference) it.next()).get();
                if (l7Var != null) {
                    try {
                        function1.invoke(l7Var);
                    } catch (Exception e3) {
                        cz.b bVar = mu0.f7335a;
                        mu0.c("Failed to dispatch Activity lifecycle event", e3);
                    }
                }
            }
            d.D0(this.f3594i, u.f10157a);
        }
    }

    public final Activity b() {
        Activity activity;
        synchronized (this) {
            activity = this.f3596k;
        }
        return activity;
    }

    public final boolean c() {
        boolean z11;
        synchronized (this) {
            z11 = this.o;
        }
        return z11;
    }

    @Override // ads_mobile_sdk.c61
    public final Object h(Continuation continuation) {
        Unit unit;
        synchronized (this) {
            try {
                Context context = (Context) this.f3589d.get();
                if (context != null && (context instanceof Activity)) {
                    this.f3596k = (Activity) context;
                    this.f3595j = s.f9370f;
                }
                Unit unit2 = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        this.f3588c.registerActivityLifecycleCallbacks(this);
        boolean zC = c();
        cz.b bVar = mu0.f7335a;
        mu0.b("App is initially ".concat(zC ? "backgrounded" : "foregrounded"), null);
        Duration.Companion companion = Duration.f72038b;
        this.f3592g.getClass();
        long jH = DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d);
        synchronized (this) {
            try {
                Iterator it = this.f3593h.iterator();
                while (it.hasNext()) {
                    zi3.a(this.f3590e, new i(zC, (b.db) it.next(), jH, null, 1));
                }
                unit = Unit.f71706a;
            } catch (Throwable th3) {
                throw th3;
            }
        }
        return new xu0(unit);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityCreated(Activity activity, Bundle bundle) {
        Intrinsics.g(activity, "activity");
        a(activity, s.f9369e);
        a(new y(activity, bundle, 0));
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityDestroyed(Activity activity) {
        Intrinsics.g(activity, "activity");
        synchronized (this) {
            try {
                if (activity.equals(this.f3596k)) {
                    this.f3596k = null;
                    this.f3595j = s.f9366b;
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        a(new z(activity, 0));
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityPaused(Activity activity) {
        Intrinsics.g(activity, "activity");
        a(activity, s.f9368d);
        a(new z(activity, 1));
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityResumed(Activity activity) {
        Intrinsics.g(activity, "activity");
        a(activity, s.f9372h);
        a(new z(activity, 2));
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        Intrinsics.g(activity, "activity");
        Intrinsics.g(outState, "outState");
        a(new y(activity, outState, 1));
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStarted(Activity activity) {
        Intrinsics.g(activity, "activity");
        a(activity, s.f9371g);
        a(new x(activity, 3));
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStopped(Activity activity) {
        Intrinsics.g(activity, "activity");
        a(activity, s.f9367c);
        a(new z(activity, 3));
    }

    public final void a(Activity activity, s sVar) {
        Intrinsics.g(activity, "activity");
        synchronized (this) {
            try {
                if (activity.equals(this.f3596k)) {
                    this.f3595j = sVar;
                } else {
                    if (sVar.f9374a < this.f3595j.f9374a) {
                        return;
                    }
                    this.f3596k = activity;
                    this.f3595j = sVar;
                }
                Continuation continuation = null;
                if (sVar == s.f9372h) {
                    this.f3597l = false;
                    if (c()) {
                        mu0.b("App is now foregrounded", null);
                        this.o = false;
                        t70.g2 g2Var = this.f3598m;
                        if (g2Var != null) {
                            g2Var.c(null);
                        }
                        this.f3598m = null;
                        this.n = true;
                        Duration.Companion companion = Duration.f72038b;
                        this.f3592g.getClass();
                        long jH = DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d);
                        for (b.db dbVar : this.f3593h) {
                            t70.j0 j0Var = this.f3590e;
                            b4.j jVar = new b4.j(dbVar, jH, continuation, 2);
                            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                            Intrinsics.g(j0Var, "<this>");
                            Intrinsics.g(context, "context");
                            m0.t(j0Var, context, null, new ar.a(jVar, null), 2);
                        }
                    }
                } else if (sVar == s.f9367c) {
                    this.f3597l = true;
                    t70.j0 j0Var2 = this.f3590e;
                    a60.d dVar = new a60.d(this, continuation, 21);
                    EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var2, "<this>");
                    Intrinsics.g(context2, "context");
                    this.f3598m = m0.t(j0Var2, context2, null, new ar.a(dVar, null), 2);
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void a(l7 l7Var) {
        synchronized (this) {
            try {
                Iterator it = this.f3594i.iterator();
                while (it.hasNext()) {
                    WeakReference weakReference = (WeakReference) it.next();
                    if (weakReference.get() == null || Intrinsics.b(weakReference.get(), l7Var)) {
                        it.remove();
                    }
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void a(b.db listener) {
        Intrinsics.g(listener, "listener");
        synchronized (this) {
            this.f3593h.remove(listener);
        }
    }
}
