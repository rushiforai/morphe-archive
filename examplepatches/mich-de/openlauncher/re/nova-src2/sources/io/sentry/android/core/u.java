package io.sentry.android.core;

import io.sentry.ILogger;

/* loaded from: classes4.dex */
public final class u extends io.sentry.hints.c implements io.sentry.hints.b, io.sentry.hints.a {

    /* renamed from: d, reason: collision with root package name */
    public final long f67077d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f67078e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f67079f;

    public u(long j11, ILogger iLogger, long j12, boolean z11, boolean z12) {
        super(j11, iLogger);
        this.f67077d = j12;
        this.f67078e = z11;
        this.f67079f = z12;
    }

    @Override // io.sentry.hints.a
    public final Long a() {
        return Long.valueOf(this.f67077d);
    }

    @Override // io.sentry.hints.a
    public final boolean b() {
        return false;
    }

    @Override // io.sentry.hints.a
    public final String c() {
        return this.f67079f ? "anr_background" : "anr_foreground";
    }

    @Override // io.sentry.hints.c
    public final boolean e(io.sentry.protocol.u uVar) {
        return true;
    }

    @Override // io.sentry.hints.c
    public final void f(io.sentry.protocol.u uVar) {
    }
}
