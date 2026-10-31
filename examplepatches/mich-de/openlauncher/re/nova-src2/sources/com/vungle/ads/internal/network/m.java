package com.vungle.ads.internal.network;

import java.io.IOException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import x80.l0;
import x80.m0;
import x80.o0;
import x80.p0;

/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final x80.i f47259a;

    /* renamed from: b, reason: collision with root package name */
    public final com.vungle.ads.internal.network.converters.a f47260b;

    static {
        new h();
    }

    public m(x80.i rawCall, com.vungle.ads.internal.network.converters.a responseConverter) {
        Intrinsics.g(rawCall, "rawCall");
        Intrinsics.g(responseConverter, "responseConverter");
        this.f47259a = rawCall;
        this.f47260b = responseConverter;
    }

    public final void a(a callback) {
        x80.i iVar;
        Intrinsics.g(callback, "callback");
        synchronized (this) {
            iVar = this.f47259a;
            Unit unit = Unit.f71706a;
        }
        iVar.b(new l(this, callback));
    }

    public final o a() {
        x80.i iVar;
        Object objA;
        synchronized (this) {
            iVar = this.f47259a;
            Unit unit = Unit.f71706a;
        }
        try {
            int i5 = Result.f71687b;
            objA = a(iVar.l());
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("[execute] Failed to parse response:  ");
            sbA.append(thA.getLocalizedMessage());
            com.vungle.ads.internal.util.t.b("OkHttpCall", sbA.toString());
        }
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        return (o) objA;
    }

    public final o a(m0 m0Var) throws IOException {
        p0 p0Var = m0Var.f95559g;
        if (p0Var == null) {
            return null;
        }
        l0 l0VarD = m0Var.d();
        l0VarD.f95528g = new k(p0Var.contentType(), p0Var.contentLength());
        m0 m0VarA = l0VarD.a();
        int i5 = m0VarA.f95556d;
        if (i5 >= 200 && i5 < 300) {
            if (i5 != 204 && i5 != 205) {
                j jVar = new j(p0Var);
                try {
                    return n.a(this.f47260b.a(jVar), m0VarA);
                } catch (Throwable th2) {
                    jVar.a();
                    throw th2;
                }
            }
            p0Var.close();
            return n.a(null, m0VarA);
        }
        try {
            m90.g gVar = new m90.g();
            p0Var.source().O(gVar);
            o0 o0Var = p0.Companion;
            x80.a0 a0VarContentType = p0Var.contentType();
            long jContentLength = p0Var.contentLength();
            o0Var.getClass();
            o0.b(gVar, a0VarContentType, jContentLength);
            o oVarA = n.a(m0VarA);
            p0Var.close();
            return oVarA;
        } finally {
        }
    }
}
