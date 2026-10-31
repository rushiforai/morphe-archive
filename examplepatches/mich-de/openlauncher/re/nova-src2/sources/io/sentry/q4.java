package io.sentry;

import io.branch.search.internal.C3125e3;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class q4 implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public final io.sentry.protocol.u f67667a;

    /* renamed from: b, reason: collision with root package name */
    public final String f67668b;

    /* renamed from: c, reason: collision with root package name */
    public final String f67669c;

    /* renamed from: d, reason: collision with root package name */
    public final String f67670d;

    /* renamed from: e, reason: collision with root package name */
    public final String f67671e;

    /* renamed from: f, reason: collision with root package name */
    public final String f67672f;

    /* renamed from: g, reason: collision with root package name */
    public final String f67673g;

    /* renamed from: h, reason: collision with root package name */
    public final String f67674h;

    /* renamed from: i, reason: collision with root package name */
    public final String f67675i;

    /* renamed from: j, reason: collision with root package name */
    public final io.sentry.protocol.u f67676j;

    /* renamed from: k, reason: collision with root package name */
    public ConcurrentHashMap f67677k;

    public q4(io.sentry.protocol.u uVar, String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, io.sentry.protocol.u uVar2) {
        this.f67667a = uVar;
        this.f67668b = str;
        this.f67669c = str2;
        this.f67670d = str3;
        this.f67671e = str4;
        this.f67672f = str5;
        this.f67673g = str6;
        this.f67674h = str7;
        this.f67675i = str8;
        this.f67676j = uVar2;
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        e3Var.o("trace_id");
        e3Var.x(iLogger, this.f67667a);
        e3Var.o("public_key");
        e3Var.A(this.f67668b);
        String str = this.f67669c;
        if (str != null) {
            e3Var.o("release");
            e3Var.A(str);
        }
        String str2 = this.f67670d;
        if (str2 != null) {
            e3Var.o("environment");
            e3Var.A(str2);
        }
        String str3 = this.f67671e;
        if (str3 != null) {
            e3Var.o("user_id");
            e3Var.A(str3);
        }
        String str4 = this.f67672f;
        if (str4 != null) {
            e3Var.o("user_segment");
            e3Var.A(str4);
        }
        String str5 = this.f67673g;
        if (str5 != null) {
            e3Var.o("transaction");
            e3Var.A(str5);
        }
        String str6 = this.f67674h;
        if (str6 != null) {
            e3Var.o("sample_rate");
            e3Var.A(str6);
        }
        String str7 = this.f67675i;
        if (str7 != null) {
            e3Var.o("sampled");
            e3Var.A(str7);
        }
        io.sentry.protocol.u uVar = this.f67676j;
        if (uVar != null) {
            e3Var.o("replay_id");
            e3Var.x(iLogger, uVar);
        }
        ConcurrentHashMap concurrentHashMap = this.f67677k;
        if (concurrentHashMap != null) {
            for (String str8 : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67677k, str8, e3Var, str8, iLogger);
            }
        }
        e3Var.i();
    }
}
