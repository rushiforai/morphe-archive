package io.sentry.android.core.internal.util;

import android.os.SystemClock;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final long f66951a;

    /* renamed from: d, reason: collision with root package name */
    public final int f66954d;

    /* renamed from: c, reason: collision with root package name */
    public final AtomicInteger f66953c = new AtomicInteger(0);

    /* renamed from: e, reason: collision with root package name */
    public final AtomicLong f66955e = new AtomicLong(0);

    /* renamed from: b, reason: collision with root package name */
    public final c f66952b = c.f66947a;

    public g(long j11, int i5) {
        this.f66951a = j11;
        this.f66954d = i5 <= 0 ? 1 : i5;
    }

    public final boolean a() {
        this.f66952b.getClass();
        long jUptimeMillis = SystemClock.uptimeMillis();
        AtomicLong atomicLong = this.f66955e;
        long j11 = atomicLong.get();
        AtomicInteger atomicInteger = this.f66953c;
        if (j11 == 0 || atomicLong.get() + this.f66951a <= jUptimeMillis) {
            atomicInteger.set(0);
            atomicLong.set(jUptimeMillis);
            return false;
        }
        if (atomicInteger.incrementAndGet() < this.f66954d) {
            return false;
        }
        atomicInteger.set(0);
        return true;
    }
}
