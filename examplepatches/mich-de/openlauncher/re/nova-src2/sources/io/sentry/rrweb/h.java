package io.sentry.rrweb;

import io.branch.search.internal.C3125e3;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.io.IOException;
import java.util.HashMap;

/* loaded from: classes4.dex */
public final class h implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public int f67725a;

    /* renamed from: b, reason: collision with root package name */
    public float f67726b;

    /* renamed from: c, reason: collision with root package name */
    public float f67727c;

    /* renamed from: d, reason: collision with root package name */
    public long f67728d;

    /* renamed from: e, reason: collision with root package name */
    public HashMap f67729e;

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) throws IOException {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        e3Var.o("id");
        e3Var.w(this.f67725a);
        e3Var.o("x");
        e3Var.v(this.f67726b);
        e3Var.o("y");
        e3Var.v(this.f67727c);
        e3Var.o("timeOffset");
        e3Var.w(this.f67728d);
        HashMap map = this.f67729e;
        if (map != null) {
            for (String str : map.keySet()) {
                C3125e3.a(this.f67729e, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
    }
}
