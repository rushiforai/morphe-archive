package io.sentry.protocol;

import io.branch.search.internal.C3125e3;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class j implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public final Number f67558a;

    /* renamed from: b, reason: collision with root package name */
    public final String f67559b;

    /* renamed from: c, reason: collision with root package name */
    public ConcurrentHashMap f67560c;

    public j(Number number, String str) {
        this.f67558a = number;
        this.f67559b = str;
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        e3Var.o("value");
        e3Var.z(this.f67558a);
        String str = this.f67559b;
        if (str != null) {
            e3Var.o("unit");
            e3Var.A(str);
        }
        ConcurrentHashMap concurrentHashMap = this.f67560c;
        if (concurrentHashMap != null) {
            for (String str2 : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67560c, str2, e3Var, str2, iLogger);
            }
        }
        e3Var.i();
    }
}
