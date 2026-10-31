package io.sentry;

import java.time.Instant;

/* loaded from: classes4.dex */
public final class c3 extends u2 {

    /* renamed from: a, reason: collision with root package name */
    public final Instant f67153a = Instant.now();

    @Override // io.sentry.u2
    public final long d() {
        return (this.f67153a.getEpochSecond() * 1000000000) + r0.getNano();
    }
}
