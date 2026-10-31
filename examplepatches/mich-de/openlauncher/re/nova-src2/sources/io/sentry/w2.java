package io.sentry;

import io.branch.search.internal.C3125e3;
import java.util.Date;
import java.util.HashMap;

/* loaded from: classes4.dex */
public final class w2 implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public final io.sentry.protocol.u f67896a;

    /* renamed from: b, reason: collision with root package name */
    public final io.sentry.protocol.s f67897b;

    /* renamed from: c, reason: collision with root package name */
    public final q4 f67898c;

    /* renamed from: d, reason: collision with root package name */
    public Date f67899d;

    /* renamed from: e, reason: collision with root package name */
    public HashMap f67900e;

    public w2(io.sentry.protocol.u uVar, io.sentry.protocol.s sVar, q4 q4Var) {
        this.f67896a = uVar;
        this.f67897b = sVar;
        this.f67898c = q4Var;
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        io.sentry.protocol.u uVar = this.f67896a;
        if (uVar != null) {
            e3Var.o("event_id");
            e3Var.x(iLogger, uVar);
        }
        io.sentry.protocol.s sVar = this.f67897b;
        if (sVar != null) {
            e3Var.o("sdk");
            e3Var.x(iLogger, sVar);
        }
        q4 q4Var = this.f67898c;
        if (q4Var != null) {
            e3Var.o("trace");
            e3Var.x(iLogger, q4Var);
        }
        if (this.f67899d != null) {
            e3Var.o("sent_at");
            e3Var.x(iLogger, android.support.v4.media.session.b.b0(this.f67899d));
        }
        HashMap map = this.f67900e;
        if (map != null) {
            for (String str : map.keySet()) {
                C3125e3.a(this.f67900e, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
    }
}
