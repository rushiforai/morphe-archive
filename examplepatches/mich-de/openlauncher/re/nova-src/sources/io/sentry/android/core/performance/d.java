package io.sentry.android.core.performance;

import android.app.Activity;
import android.os.Bundle;
import android.os.SystemClock;
import io.sentry.android.core.SentryAndroidOptions;
import io.sentry.android.core.c0;
import io.sentry.j3;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;

/* loaded from: classes4.dex */
public final class d extends a {

    /* renamed from: k, reason: collision with root package name */
    public static final long f67033k = SystemClock.uptimeMillis();

    /* renamed from: l, reason: collision with root package name */
    public static volatile d f67034l;

    /* renamed from: b, reason: collision with root package name */
    public boolean f67036b;

    /* renamed from: a, reason: collision with root package name */
    public c f67035a = c.UNKNOWN;

    /* renamed from: h, reason: collision with root package name */
    public j3 f67042h = null;

    /* renamed from: i, reason: collision with root package name */
    public boolean f67043i = false;

    /* renamed from: j, reason: collision with root package name */
    public boolean f67044j = false;

    /* renamed from: c, reason: collision with root package name */
    public final e f67037c = new e();

    /* renamed from: d, reason: collision with root package name */
    public final e f67038d = new e();

    /* renamed from: e, reason: collision with root package name */
    public final e f67039e = new e();

    /* renamed from: f, reason: collision with root package name */
    public final HashMap f67040f = new HashMap();

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f67041g = new ArrayList();

    public d() {
        this.f67036b = false;
        this.f67036b = c0.g();
    }

    public static d b() {
        if (f67034l == null) {
            synchronized (d.class) {
                try {
                    if (f67034l == null) {
                        f67034l = new d();
                    }
                } finally {
                }
            }
        }
        return f67034l;
    }

    public final e a(SentryAndroidOptions sentryAndroidOptions) {
        if (sentryAndroidOptions.isEnablePerformanceV2()) {
            e eVar = this.f67037c;
            if (eVar.a()) {
                return (this.f67043i || !this.f67036b) ? new e() : eVar;
            }
        }
        return (this.f67043i || !this.f67036b) ? new e() : this.f67038d;
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityCreated(Activity activity, Bundle bundle) {
        if (this.f67036b && this.f67042h == null) {
            this.f67042h = new j3();
            e eVar = this.f67037c;
            long j11 = eVar.f67046b;
            if (eVar.f67048d == 0) {
                jCurrentTimeMillis = System.currentTimeMillis();
            } else if (eVar.a()) {
                long j12 = eVar.f67046b;
                long j13 = eVar.f67048d;
                jCurrentTimeMillis = (j13 != 0 ? j13 - eVar.f67047c : 0L) + j12;
            }
            if (jCurrentTimeMillis - j11 > TimeUnit.MINUTES.toMillis(1L)) {
                this.f67043i = true;
            }
        }
    }
}
