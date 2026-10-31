package com.fyber.inneractive.sdk.util;

import android.os.SystemClock;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class w1 {

    /* renamed from: a, reason: collision with root package name */
    public final TimeUnit f31246a;

    /* renamed from: b, reason: collision with root package name */
    public final long f31247b;

    /* renamed from: c, reason: collision with root package name */
    public final u1 f31248c;

    /* renamed from: e, reason: collision with root package name */
    public v1 f31250e;

    /* renamed from: d, reason: collision with root package name */
    public boolean f31249d = false;

    /* renamed from: f, reason: collision with root package name */
    public long f31251f = 0;

    public w1(TimeUnit timeUnit, long j11) {
        this.f31247b = j11;
        this.f31246a = timeUnit;
        IAlog.a("Visible time counter init - time %d", Long.valueOf(j11));
        this.f31248c = new u1(this);
    }

    public final void a(long j11) {
        long jUptimeMillis = (SystemClock.uptimeMillis() - j11) + 50 + this.f31251f;
        this.f31251f = jUptimeMillis;
        if (this.f31250e != null && jUptimeMillis > this.f31246a.toMillis(this.f31247b)) {
            this.f31250e.a();
            return;
        }
        u1 u1Var = this.f31248c;
        if (u1Var == null || this.f31250e == null) {
            return;
        }
        u1Var.removeMessages(1932593528);
        this.f31248c.sendEmptyMessageDelayed(1932593528, 50L);
    }
}
