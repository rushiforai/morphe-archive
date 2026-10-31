package gf;

import android.util.Pair;
import fe.x1;
import fe.y1;
import fe.z1;

/* loaded from: classes3.dex */
public final class q extends z0 {

    /* renamed from: l, reason: collision with root package name */
    public final boolean f57600l;

    /* renamed from: m, reason: collision with root package name */
    public final y1 f57601m;
    public final x1 n;
    public o o;

    /* renamed from: p, reason: collision with root package name */
    public n f57602p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f57603q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f57604r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f57605s;

    public q(a aVar, boolean z11) {
        super(aVar);
        this.f57600l = z11 && aVar.h();
        this.f57601m = new y1();
        this.n = new x1();
        z1 z1VarF = aVar.f();
        if (z1VarF == null) {
            this.o = new o(new p(aVar.g()), y1.f55095q, o.f57579e);
        } else {
            this.o = new o(z1VarF, null, null);
            this.f57605s = true;
        }
    }

    public final void A(long j11) {
        n nVar = this.f57602p;
        int iB = this.o.b(nVar.f57567a.f57640a);
        if (iB == -1) {
            return;
        }
        o oVar = this.o;
        x1 x1Var = this.n;
        oVar.f(iB, x1Var, false);
        long j12 = x1Var.f55078d;
        if (j12 != -9223372036854775807L && j11 >= j12) {
            j11 = Math.max(0L, j12 - 1);
        }
        nVar.f57573g = j11;
    }

    @Override // gf.h, gf.a
    public final void i() {
    }

    @Override // gf.a
    public final void m(t tVar) {
        n nVar = (n) tVar;
        if (nVar.f57571e != null) {
            a aVar = nVar.f57570d;
            aVar.getClass();
            aVar.m(nVar.f57571e);
        }
        if (tVar == this.f57602p) {
            this.f57602p = null;
        }
    }

    @Override // gf.h, gf.a
    public final void o() {
        this.f57604r = false;
        this.f57603q = false;
        super.o();
    }

    @Override // gf.z0
    public final w w(w wVar) {
        Object obj = wVar.f57640a;
        Object obj2 = this.o.f57581d;
        if (obj2 != null && obj2.equals(obj)) {
            obj = o.f57579e;
        }
        return wVar.b(obj);
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00c6  */
    /* JADX WARN: Removed duplicated region for block: B:37:? A[RETURN, SYNTHETIC] */
    @Override // gf.z0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void x(z1 z1Var) {
        o oVar;
        w wVarB;
        o oVar2;
        if (this.f57604r) {
            o oVar3 = this.o;
            this.o = new o(z1Var, oVar3.f57580c, oVar3.f57581d);
            n nVar = this.f57602p;
            if (nVar != null) {
                A(nVar.f57573g);
            }
        } else {
            boolean zP = z1Var.p();
            Object obj = o.f57579e;
            if (!zP) {
                y1 y1Var = this.f57601m;
                z1Var.n(0, y1Var);
                long j11 = y1Var.f55109l;
                Object obj2 = y1Var.f55098a;
                n nVar2 = this.f57602p;
                if (nVar2 != null) {
                    long j12 = nVar2.f57568b;
                    o oVar4 = this.o;
                    Object obj3 = nVar2.f57567a.f57640a;
                    x1 x1Var = this.n;
                    oVar4.g(obj3, x1Var);
                    long j13 = x1Var.f55079e + j12;
                    this.o.m(0, y1Var, 0L);
                    long j14 = j13 != y1Var.f55109l ? j13 : j11;
                    Pair pairI = z1Var.i(this.f57601m, this.n, 0, j14);
                    Object obj4 = pairI.first;
                    long jLongValue = ((Long) pairI.second).longValue();
                    if (this.f57605s) {
                        o oVar5 = this.o;
                        oVar = new o(z1Var, oVar5.f57580c, oVar5.f57581d);
                    } else {
                        oVar = new o(z1Var, obj2, obj4);
                    }
                    this.o = oVar;
                    n nVar3 = this.f57602p;
                    if (nVar3 != null) {
                        A(jLongValue);
                        w wVar = nVar3.f57567a;
                        Object obj5 = wVar.f57640a;
                        if (this.o.f57581d != null && obj5.equals(obj)) {
                            obj5 = this.o.f57581d;
                        }
                        wVarB = wVar.b(obj5);
                    }
                }
                this.f57605s = true;
                this.f57604r = true;
                l(this.o);
                if (wVarB == null) {
                    n nVar4 = this.f57602p;
                    nVar4.getClass();
                    nVar4.f(wVarB);
                    return;
                }
                return;
            }
            if (this.f57605s) {
                o oVar6 = this.o;
                oVar2 = new o(z1Var, oVar6.f57580c, oVar6.f57581d);
            } else {
                oVar2 = new o(z1Var, y1.f55095q, obj);
            }
            this.o = oVar2;
        }
        wVarB = null;
        this.f57605s = true;
        this.f57604r = true;
        l(this.o);
        if (wVarB == null) {
        }
    }

    @Override // gf.z0
    public final void y() {
        if (this.f57600l) {
            return;
        }
        this.f57603q = true;
        v(null, this.f57671k);
    }

    @Override // gf.a
    /* renamed from: z, reason: merged with bridge method [inline-methods] */
    public final n a(w wVar, vf.m mVar, long j11) {
        n nVar = new n(wVar, mVar, j11);
        wf.a.i(nVar.f57570d == null);
        a aVar = this.f57671k;
        nVar.f57570d = aVar;
        if (!this.f57604r) {
            this.f57602p = nVar;
            if (!this.f57603q) {
                this.f57603q = true;
                v(null, aVar);
            }
            return nVar;
        }
        Object obj = wVar.f57640a;
        if (this.o.f57581d != null && obj.equals(o.f57579e)) {
            obj = this.o.f57581d;
        }
        nVar.f(wVar.b(obj));
        return nVar;
    }
}
