package io.sentry;

import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes4.dex */
public final class u4 extends io.sentry.hints.c implements io.sentry.hints.h, io.sentry.hints.k {

    /* renamed from: d, reason: collision with root package name */
    public final AtomicReference f67824d;

    public u4(long j11, ILogger iLogger) {
        super(j11, iLogger);
        this.f67824d = new AtomicReference();
    }

    @Override // io.sentry.hints.c
    public final boolean e(io.sentry.protocol.u uVar) {
        io.sentry.protocol.u uVar2 = (io.sentry.protocol.u) this.f67824d.get();
        return uVar2 != null && uVar2.equals(uVar);
    }

    @Override // io.sentry.hints.c
    public final void f(io.sentry.protocol.u uVar) {
        this.f67824d.set(uVar);
    }
}
