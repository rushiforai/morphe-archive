package com.vungle.ads.internal.util;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements Application.ActivityLifecycleCallbacks {

    /* renamed from: f, reason: collision with root package name */
    public static final d f47677f = new d();

    /* renamed from: b, reason: collision with root package name */
    public volatile int f47679b;

    /* renamed from: c, reason: collision with root package name */
    public volatile boolean f47680c;

    /* renamed from: d, reason: collision with root package name */
    public volatile c f47681d;

    /* renamed from: a, reason: collision with root package name */
    public final AtomicBoolean f47678a = new AtomicBoolean(false);

    /* renamed from: e, reason: collision with root package name */
    public final CopyOnWriteArraySet f47682e = new CopyOnWriteArraySet();

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityCreated(Activity activity, Bundle bundle) {
        Intrinsics.g(activity, "activity");
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityDestroyed(Activity activity) {
        Intrinsics.g(activity, "activity");
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityPaused(Activity activity) {
        Intrinsics.g(activity, "activity");
        Iterator it = this.f47682e.iterator();
        while (it.hasNext()) {
            ((b) it.next()).a(activity);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityResumed(Activity activity) {
        Intrinsics.g(activity, "activity");
        Iterator it = this.f47682e.iterator();
        while (it.hasNext()) {
            ((b) it.next()).b(activity);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        Intrinsics.g(activity, "activity");
        Intrinsics.g(outState, "outState");
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStarted(Activity activity) {
        Intrinsics.g(activity, "activity");
        this.f47679b++;
        if (this.f47680c || this.f47679b != 1) {
            return;
        }
        this.f47680c = true;
        c cVar = this.f47681d;
        if (cVar != null) {
            Context context = (Context) cVar.b().get();
            if (context != null) {
                a.a(context, cVar.c(), cVar.d(), cVar.a());
            }
            this.f47681d = null;
        }
        Iterator it = this.f47682e.iterator();
        while (it.hasNext()) {
            ((b) it.next()).b();
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStopped(Activity activity) {
        Intrinsics.g(activity, "activity");
        this.f47679b--;
        if (this.f47680c && this.f47679b == 0) {
            this.f47680c = false;
            Iterator it = this.f47682e.iterator();
            while (it.hasNext()) {
                ((b) it.next()).a();
            }
        }
    }

    public static final boolean a(d dVar, Context context, Intent intent, Intent intent2, com.vungle.ads.internal.ui.m mVar) {
        dVar.getClass();
        try {
            if (intent != null) {
                context.startActivity(intent);
                if (mVar != null) {
                    mVar.a(true);
                }
            } else {
                if (intent2 == null) {
                    return false;
                }
                context.startActivity(intent2);
            }
        } catch (Exception e3) {
            boolean z11 = u.f47714a;
            t.b("ActivityManager", "Failed to start activity: " + e3);
            if (intent != null && mVar != null) {
                try {
                    mVar.a(false);
                } catch (Exception unused) {
                    return false;
                }
            }
            if (intent != null && intent2 != null) {
                context.startActivity(intent2);
            }
            return false;
        }
        return true;
    }

    public static final void a(d dVar, Context context) {
        Object objA;
        if (dVar.f47678a.getAndSet(true)) {
            return;
        }
        try {
            int i5 = Result.f71687b;
            Context applicationContext = context.getApplicationContext();
            Intrinsics.e(applicationContext, "null cannot be cast to non-null type android.app.Application");
            ((Application) applicationContext).registerActivityLifecycleCallbacks(dVar);
            objA = Unit.f71706a;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            boolean z11 = u.f47714a;
            t.a("ActivityManager", "Error initializing ActivityManager", thA);
            dVar.f47678a.set(false);
        }
    }

    public static final boolean a(d dVar) {
        return !dVar.f47678a.get() || dVar.f47680c;
    }

    public static final void a(d dVar, b bVar) {
        dVar.f47682e.add(bVar);
    }

    public final void a(b callback) {
        Intrinsics.g(callback, "callback");
        this.f47682e.remove(callback);
    }
}
