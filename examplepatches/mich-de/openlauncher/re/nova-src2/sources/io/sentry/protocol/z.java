package io.sentry.protocol;

import io.branch.search.internal.C3125e3;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class z implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public List f67658a;

    /* renamed from: b, reason: collision with root package name */
    public ConcurrentHashMap f67659b;

    /* renamed from: c, reason: collision with root package name */
    public Boolean f67660c;

    /* renamed from: d, reason: collision with root package name */
    public ConcurrentHashMap f67661d;

    public z(List list) {
        this.f67658a = list;
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) throws IOException {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        if (this.f67658a != null) {
            e3Var.o("frames");
            e3Var.x(iLogger, this.f67658a);
        }
        if (this.f67659b != null) {
            e3Var.o("registers");
            e3Var.x(iLogger, this.f67659b);
        }
        if (this.f67660c != null) {
            e3Var.o("snapshot");
            e3Var.y(this.f67660c);
        }
        ConcurrentHashMap concurrentHashMap = this.f67661d;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67661d, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
    }
}
