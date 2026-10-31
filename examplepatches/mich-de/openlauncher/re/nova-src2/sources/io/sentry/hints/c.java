package io.sentry.hints;

import io.sentry.ILogger;
import io.sentry.g3;
import io.sentry.protocol.u;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/* loaded from: classes4.dex */
public abstract class c implements f {

    /* renamed from: a, reason: collision with root package name */
    public final CountDownLatch f67273a = new CountDownLatch(1);

    /* renamed from: b, reason: collision with root package name */
    public final long f67274b;

    /* renamed from: c, reason: collision with root package name */
    public final ILogger f67275c;

    public c(long j11, ILogger iLogger) {
        this.f67274b = j11;
        this.f67275c = iLogger;
    }

    @Override // io.sentry.hints.f
    public final boolean d() {
        try {
            return this.f67273a.await(this.f67274b, TimeUnit.MILLISECONDS);
        } catch (InterruptedException e3) {
            Thread.currentThread().interrupt();
            this.f67275c.e(g3.ERROR, "Exception while awaiting for flush in BlockingFlushHint", e3);
            return false;
        }
    }

    public abstract boolean e(u uVar);

    public abstract void f(u uVar);
}
