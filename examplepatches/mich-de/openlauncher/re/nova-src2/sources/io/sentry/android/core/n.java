package io.sentry.android.core;

import android.os.SystemClock;

/* loaded from: classes4.dex */
public final class n implements io.sentry.android.core.internal.util.n {

    /* renamed from: a, reason: collision with root package name */
    public float f67000a = 0.0f;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p f67001b;

    public n(p pVar) {
        this.f67001b = pVar;
    }

    @Override // io.sentry.android.core.internal.util.n
    public final void c(long j11, long j12, long j13, long j14, boolean z11, boolean z12, float f11) {
        long jElapsedRealtimeNanos = SystemClock.elapsedRealtimeNanos() + (j12 - System.nanoTime());
        p pVar = this.f67001b;
        long j15 = jElapsedRealtimeNanos - pVar.f67011a;
        if (j15 < 0) {
            return;
        }
        if (z12) {
            pVar.f67020j.addLast(new io.sentry.profilemeasurements.b(Long.valueOf(j15), Long.valueOf(j13)));
        } else if (z11) {
            pVar.f67019i.addLast(new io.sentry.profilemeasurements.b(Long.valueOf(j15), Long.valueOf(j13)));
        }
        if (f11 != this.f67000a) {
            this.f67000a = f11;
            pVar.f67018h.addLast(new io.sentry.profilemeasurements.b(Long.valueOf(j15), Float.valueOf(f11)));
        }
    }
}
