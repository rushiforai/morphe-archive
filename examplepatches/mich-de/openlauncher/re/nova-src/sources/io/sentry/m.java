package io.sentry;

import java.util.Queue;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/* loaded from: classes4.dex */
public final class m implements io.sentry.hints.d, io.sentry.hints.g, io.sentry.hints.j, io.sentry.hints.f {

    /* renamed from: a, reason: collision with root package name */
    public boolean f67387a = false;

    /* renamed from: b, reason: collision with root package name */
    public boolean f67388b = false;

    /* renamed from: c, reason: collision with root package name */
    public final CountDownLatch f67389c = new CountDownLatch(1);

    /* renamed from: d, reason: collision with root package name */
    public final long f67390d;

    /* renamed from: e, reason: collision with root package name */
    public final ILogger f67391e;

    /* renamed from: f, reason: collision with root package name */
    public final String f67392f;

    /* renamed from: g, reason: collision with root package name */
    public final Queue f67393g;

    public m(long j11, ILogger iLogger, String str, o4 o4Var) {
        this.f67390d = j11;
        this.f67392f = str;
        this.f67393g = o4Var;
        this.f67391e = iLogger;
    }

    @Override // io.sentry.hints.g
    public final boolean a() {
        return this.f67387a;
    }

    @Override // io.sentry.hints.j
    public final void b(boolean z11) {
        this.f67388b = z11;
        this.f67389c.countDown();
    }

    @Override // io.sentry.hints.g
    public final void c(boolean z11) {
        this.f67387a = z11;
    }

    @Override // io.sentry.hints.f
    public final boolean d() {
        try {
            return this.f67389c.await(this.f67390d, TimeUnit.MILLISECONDS);
        } catch (InterruptedException e3) {
            Thread.currentThread().interrupt();
            this.f67391e.e(g3.ERROR, "Exception while awaiting on lock.", e3);
            return false;
        }
    }

    @Override // io.sentry.hints.j
    public final boolean isSuccess() {
        return this.f67388b;
    }
}
