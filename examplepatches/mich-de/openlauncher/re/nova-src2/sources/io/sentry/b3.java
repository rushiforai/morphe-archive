package io.sentry;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import io.branch.search.internal.C3125e3;
import java.util.AbstractMap;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class b3 extends r2 implements i1 {

    /* renamed from: p, reason: collision with root package name */
    public Date f67115p;

    /* renamed from: q, reason: collision with root package name */
    public io.sentry.protocol.l f67116q;

    /* renamed from: r, reason: collision with root package name */
    public String f67117r;

    /* renamed from: s, reason: collision with root package name */
    public g1 f67118s;

    /* renamed from: t, reason: collision with root package name */
    public g1 f67119t;

    /* renamed from: u, reason: collision with root package name */
    public g3 f67120u;

    /* renamed from: v, reason: collision with root package name */
    public String f67121v;

    /* renamed from: w, reason: collision with root package name */
    public List f67122w;

    /* renamed from: x, reason: collision with root package name */
    public ConcurrentHashMap f67123x;

    /* renamed from: y, reason: collision with root package name */
    public AbstractMap f67124y;

    public b3(Throwable th2) {
        this();
        this.f67691j = th2;
    }

    public final io.sentry.protocol.t c() {
        Boolean bool;
        g1 g1Var = this.f67119t;
        if (g1Var == null) {
            return null;
        }
        Iterator it = g1Var.f67245a.iterator();
        while (it.hasNext()) {
            io.sentry.protocol.t tVar = (io.sentry.protocol.t) it.next();
            io.sentry.protocol.k kVar = tVar.f67618f;
            if (kVar != null && (bool = kVar.f67564d) != null && !bool.booleanValue()) {
                return tVar;
            }
        }
        return null;
    }

    public final boolean d() {
        g1 g1Var = this.f67119t;
        return (g1Var == null || g1Var.f67245a.isEmpty()) ? false : true;
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        e3Var.o("timestamp");
        e3Var.x(iLogger, this.f67115p);
        if (this.f67116q != null) {
            e3Var.o(PglCryptUtils.KEY_MESSAGE);
            e3Var.x(iLogger, this.f67116q);
        }
        if (this.f67117r != null) {
            e3Var.o("logger");
            e3Var.A(this.f67117r);
        }
        g1 g1Var = this.f67118s;
        if (g1Var != null && !g1Var.f67245a.isEmpty()) {
            e3Var.o("threads");
            e3Var.f();
            e3Var.o("values");
            e3Var.x(iLogger, this.f67118s.f67245a);
            e3Var.i();
        }
        g1 g1Var2 = this.f67119t;
        if (g1Var2 != null && !g1Var2.f67245a.isEmpty()) {
            e3Var.o("exception");
            e3Var.f();
            e3Var.o("values");
            e3Var.x(iLogger, this.f67119t.f67245a);
            e3Var.i();
        }
        if (this.f67120u != null) {
            e3Var.o("level");
            e3Var.x(iLogger, this.f67120u);
        }
        if (this.f67121v != null) {
            e3Var.o("transaction");
            e3Var.A(this.f67121v);
        }
        if (this.f67122w != null) {
            e3Var.o("fingerprint");
            e3Var.x(iLogger, this.f67122w);
        }
        if (this.f67124y != null) {
            e3Var.o("modules");
            e3Var.x(iLogger, this.f67124y);
        }
        cl.l0.N(this, e3Var, iLogger);
        ConcurrentHashMap concurrentHashMap = this.f67123x;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67123x, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
    }

    public b3() {
        io.sentry.protocol.u uVar = new io.sentry.protocol.u((UUID) null);
        Date dateV = android.support.v4.media.session.b.V();
        super(uVar);
        this.f67115p = dateV;
    }
}
