package io.sentry.protocol;

import io.branch.search.internal.C3125e3;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class q implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public String f67597a;

    /* renamed from: b, reason: collision with root package name */
    public ConcurrentHashMap f67598b;

    /* renamed from: c, reason: collision with root package name */
    public Integer f67599c;

    /* renamed from: d, reason: collision with root package name */
    public Long f67600d;

    /* renamed from: e, reason: collision with root package name */
    public Object f67601e;

    /* renamed from: f, reason: collision with root package name */
    public ConcurrentHashMap f67602f;

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        if (this.f67597a != null) {
            e3Var.o("cookies");
            e3Var.A(this.f67597a);
        }
        if (this.f67598b != null) {
            e3Var.o("headers");
            e3Var.x(iLogger, this.f67598b);
        }
        if (this.f67599c != null) {
            e3Var.o("status_code");
            e3Var.x(iLogger, this.f67599c);
        }
        if (this.f67600d != null) {
            e3Var.o("body_size");
            e3Var.x(iLogger, this.f67600d);
        }
        if (this.f67601e != null) {
            e3Var.o("data");
            e3Var.x(iLogger, this.f67601e);
        }
        ConcurrentHashMap concurrentHashMap = this.f67602f;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67602f, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
    }
}
