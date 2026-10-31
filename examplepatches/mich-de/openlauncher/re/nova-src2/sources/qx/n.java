package qx;

import t70.g2;
import t70.i2;

/* loaded from: classes4.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final long f84557a;

    /* renamed from: b, reason: collision with root package name */
    public final ox.c f84558b;

    /* renamed from: c, reason: collision with root package name */
    public g2 f84559c;

    /* renamed from: d, reason: collision with root package name */
    public i2 f84560d;

    public n(long j11, ox.c cVar) {
        this.f84557a = j11;
        this.f84558b = cVar;
        i2 i2VarD = t70.m0.d();
        this.f84560d = i2VarD;
        a80.e eVar = t70.y0.f88884a;
        t70.k0.a(y70.o.f96819a.plus(i2VarD));
    }

    public final void a() {
        g2 g2Var = this.f84559c;
        if (g2Var != null) {
            g2Var.c(null);
        }
        this.f84559c = null;
        this.f84560d.c(null);
    }
}
