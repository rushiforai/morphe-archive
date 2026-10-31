package gf;

import fe.x1;
import fe.y1;
import fe.z1;

/* loaded from: classes3.dex */
public final class o extends k {

    /* renamed from: e, reason: collision with root package name */
    public static final Object f57579e = new Object();

    /* renamed from: c, reason: collision with root package name */
    public final Object f57580c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f57581d;

    public o(z1 z1Var, Object obj, Object obj2) {
        super(z1Var);
        this.f57580c = obj;
        this.f57581d = obj2;
    }

    @Override // gf.k, fe.z1
    public final int b(Object obj) {
        Object obj2;
        if (f57579e.equals(obj) && (obj2 = this.f57581d) != null) {
            obj = obj2;
        }
        return this.f57534b.b(obj);
    }

    @Override // gf.k, fe.z1
    public final x1 f(int i5, x1 x1Var, boolean z11) {
        this.f57534b.f(i5, x1Var, z11);
        if (wf.v.a(x1Var.f55076b, this.f57581d) && z11) {
            x1Var.f55076b = f57579e;
        }
        return x1Var;
    }

    @Override // gf.k, fe.z1
    public final Object l(int i5) {
        Object objL = this.f57534b.l(i5);
        return wf.v.a(objL, this.f57581d) ? f57579e : objL;
    }

    @Override // gf.k, fe.z1
    public final y1 m(int i5, y1 y1Var, long j11) {
        this.f57534b.m(i5, y1Var, j11);
        if (wf.v.a(y1Var.f55098a, this.f57580c)) {
            y1Var.f55098a = y1.f55095q;
        }
        return y1Var;
    }
}
