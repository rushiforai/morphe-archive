package com.apm.insight.b;

import android.os.SystemClock;
import com.apm.insight.runtime.m;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: b, reason: collision with root package name */
    private static long f21444b;

    /* renamed from: a, reason: collision with root package name */
    private final b f21445a;

    /* renamed from: c, reason: collision with root package name */
    private boolean f21446c = false;

    /* renamed from: d, reason: collision with root package name */
    private final Runnable f21447d;

    public c(b bVar) {
        Runnable runnable = new Runnable() { // from class: com.apm.insight.b.c.1
            @Override // java.lang.Runnable
            public final void run() throws Throwable {
                if (c.this.f21446c) {
                    return;
                }
                c.this.f21445a.d();
                long unused = c.f21444b = SystemClock.uptimeMillis();
                if (com.apm.insight.runtime.i.a().b()) {
                    m.a().a(c.this.f21447d, 500L);
                } else {
                    m.a().a(c.this.f21447d, 500L);
                }
                com.apm.insight.runtime.b.a(c.f21444b);
            }
        };
        this.f21447d = runnable;
        this.f21445a = bVar;
        m.a().a(runnable, 5000L);
    }

    public static boolean c() {
        return SystemClock.uptimeMillis() - f21444b <= 15000;
    }

    public final void b() {
        this.f21446c = true;
    }

    public final void a() {
        if (this.f21446c) {
            return;
        }
        m.a().a(this.f21447d, 5000L);
    }
}
