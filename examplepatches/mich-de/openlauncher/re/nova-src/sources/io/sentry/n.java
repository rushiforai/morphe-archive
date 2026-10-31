package io.sentry;

import java.io.File;

/* loaded from: classes4.dex */
public abstract class n {

    /* renamed from: a, reason: collision with root package name */
    public final g0 f67402a;

    /* renamed from: b, reason: collision with root package name */
    public final ILogger f67403b;

    /* renamed from: c, reason: collision with root package name */
    public final long f67404c;

    /* renamed from: d, reason: collision with root package name */
    public final o4 f67405d;

    public n(g0 g0Var, ILogger iLogger, long j11, int i5) {
        this.f67402a = g0Var;
        this.f67403b = iLogger;
        this.f67404c = j11;
        this.f67405d = new o4(new g(i5));
    }

    public abstract boolean a(String str);

    public abstract void b(File file, x xVar);
}
