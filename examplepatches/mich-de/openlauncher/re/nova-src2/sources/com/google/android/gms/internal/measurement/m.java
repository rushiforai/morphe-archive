package com.google.android.gms.internal.measurement;

import android.os.Build;
import android.util.Log;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import java.util.logging.Level;

/* loaded from: classes3.dex */
public final class m extends c3 {

    /* renamed from: c, reason: collision with root package name */
    public static final boolean f32801c;

    /* renamed from: d, reason: collision with root package name */
    public static final boolean f32802d;

    /* renamed from: e, reason: collision with root package name */
    public static final boolean f32803e;

    /* renamed from: f, reason: collision with root package name */
    public static final AtomicReference f32804f;

    /* renamed from: g, reason: collision with root package name */
    public static final AtomicLong f32805g;

    /* renamed from: h, reason: collision with root package name */
    public static final ConcurrentLinkedQueue f32806h;

    /* renamed from: b, reason: collision with root package name */
    public volatile c3 f32807b;

    static {
        String str = Build.FINGERPRINT;
        f32801c = str == null || "robolectric".equals(str);
        String str2 = Build.HARDWARE;
        f32802d = "goldfish".equals(str2) || "ranchu".equals(str2);
        String str3 = Build.TYPE;
        f32803e = "eng".equals(str3) || "userdebug".equals(str3);
        f32804f = new AtomicReference();
        f32805g = new AtomicLong();
        f32806h = new ConcurrentLinkedQueue();
    }

    public static void m() {
        while (true) {
            l lVar = (l) f32806h.poll();
            if (lVar == null) {
                return;
            }
            f32805g.getAndDecrement();
            m mVar = lVar.f32750a;
            jh jhVar = lVar.f32751b;
            nh nhVar = jhVar.f32699c;
            if ((nhVar != null && Boolean.TRUE.equals(nhVar.j(mh.f32831g))) || mVar.e(jhVar.f32697a)) {
                mVar.f(jhVar);
            }
        }
    }

    @Override // com.google.android.gms.internal.measurement.c3
    public final boolean e(Level level) {
        return this.f32807b == null || this.f32807b.e(level);
    }

    @Override // com.google.android.gms.internal.measurement.c3
    public final void f(jh jhVar) {
        if (this.f32807b != null) {
            this.f32807b.f(jhVar);
            return;
        }
        if (f32805g.incrementAndGet() > 20) {
            f32806h.poll();
            Log.w("ProxyAndroidLoggerBackend", "Too many Flogger logs received before configuration. Dropping old logs.");
        }
        f32806h.offer(new l(this, jhVar));
        if (this.f32807b != null) {
            m();
        }
    }

    @Override // com.google.android.gms.internal.measurement.c3
    public final void i(RuntimeException runtimeException, jh jhVar) {
        if (this.f32807b != null) {
            this.f32807b.i(runtimeException, jhVar);
        } else {
            Log.e("ProxyAndroidLoggerBackend", "Internal logging error before configuration", runtimeException);
        }
    }
}
