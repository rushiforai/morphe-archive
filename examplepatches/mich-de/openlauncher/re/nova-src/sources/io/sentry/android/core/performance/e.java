package io.sentry.android.core.performance;

import android.os.SystemClock;
import java.util.concurrent.TimeUnit;

/* loaded from: classes4.dex */
public final class e implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public String f67045a;

    /* renamed from: b, reason: collision with root package name */
    public long f67046b;

    /* renamed from: c, reason: collision with root package name */
    public long f67047c;

    /* renamed from: d, reason: collision with root package name */
    public long f67048d;

    public final boolean a() {
        return this.f67047c != 0;
    }

    public final void b(long j11) {
        this.f67047c = j11;
        long jUptimeMillis = SystemClock.uptimeMillis() - this.f67047c;
        this.f67046b = System.currentTimeMillis() - jUptimeMillis;
        TimeUnit.MILLISECONDS.toNanos(jUptimeMillis);
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return Long.compare(this.f67046b, ((e) obj).f67046b);
    }
}
