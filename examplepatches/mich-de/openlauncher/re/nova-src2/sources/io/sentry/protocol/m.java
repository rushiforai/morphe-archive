package io.sentry.protocol;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class m implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public double f67573a;

    /* renamed from: b, reason: collision with root package name */
    public double f67574b;

    /* renamed from: c, reason: collision with root package name */
    public double f67575c;

    /* renamed from: d, reason: collision with root package name */
    public int f67576d;

    /* renamed from: e, reason: collision with root package name */
    public ConcurrentHashMap f67577e;

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) throws IOException {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        e3Var.o("min");
        e3Var.v(this.f67573a);
        e3Var.o(InneractiveMediationNameConsts.MAX);
        e3Var.v(this.f67574b);
        e3Var.o("sum");
        e3Var.v(this.f67575c);
        e3Var.o("count");
        e3Var.w(this.f67576d);
        if (this.f67577e != null) {
            e3Var.o("tags");
            e3Var.x(iLogger, this.f67577e);
        }
        e3Var.i();
    }
}
