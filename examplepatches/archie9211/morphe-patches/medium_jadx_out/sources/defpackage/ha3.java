package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ha3 extends bw2 implements x93, do1 {
    public final x67 f;
    public final g93 g;
    public List h;
    public final w2 i;
    public final u6a j;
    public final p98 k;
    public final wjc l;
    public final kse m;
    public final u93 n;
    public hec o;
    public hec p;
    public List q;
    public hec r;

    static {
        n1b.a.g(new u4a(ha3.class, "constructors", "getConstructors()Ljava/util/Collection;", 0));
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ha3(x67 x67Var, yv2 yv2Var, ly lyVar, n98 n98Var, g93 g93Var, u6a u6aVar, p98 p98Var, wjc wjcVar, kse kseVar, u93 u93Var) {
        super(yv2Var, lyVar, n98Var, jkc.g0);
        x67Var.getClass();
        yv2Var.getClass();
        g93Var.getClass();
        u6aVar.getClass();
        p98Var.getClass();
        wjcVar.getClass();
        kseVar.getClass();
        x67Var.getClass();
        yv2Var.getClass();
        g93Var.getClass();
        this.f = x67Var;
        this.g = g93Var;
        x67Var.a(new v2(0, this));
        this.i = new w2(this);
        this.j = u6aVar;
        this.k = p98Var;
        this.l = wjcVar;
        this.m = kseVar;
        this.n = u93Var;
    }

    public final hec A0() {
        hec hecVar = this.o;
        if (hecVar != null) {
            return hecVar;
        }
        g76.g0("underlyingType");
        throw null;
    }

    public final void B0(List list, hec hecVar, hec hecVar2) {
        ev7 ev7VarM0;
        hec hecVarA0;
        hecVar.getClass();
        hecVar2.getClass();
        this.h = list;
        this.o = hecVar;
        this.p = hecVar2;
        this.q = hk7.r(this);
        y28 y28VarY0 = y0();
        if (y28VarY0 == null || (ev7VarM0 = y28VarY0.m0()) == null) {
            ev7VarM0 = dv7.b;
        }
        ev7 ev7Var = ev7VarM0;
        zkc zkcVar = new zkc(22, this);
        i24 i24Var = nxd.a;
        if (l24.f(this)) {
            hecVarA0 = l24.c(k24.UNABLE_TO_SUBSTITUTE_TYPE, toString());
        } else {
            zvd zvdVarN = n();
            if (zvdVarN == null) {
                nxd.a(12);
                throw null;
            }
            List listD = nxd.d(((w2) zvdVarN).getParameters());
            uvd.b.getClass();
            hecVarA0 = pwd.a0(uvd.c, zvdVarN, listD, false, ev7Var, zkcVar);
        }
        this.r = hecVarA0;
    }

    @Override // defpackage.x93
    public final wjc D() {
        return this.l;
    }

    @Override // defpackage.yv2
    public final Object F(cw2 cw2Var, Object obj) {
        return cw2Var.B(this, obj);
    }

    @Override // defpackage.x93
    public final p98 J() {
        return this.k;
    }

    @Override // defpackage.x93
    public final u93 K() {
        return this.n;
    }

    @Override // defpackage.co1
    public final hec T() {
        hec hecVar = this.r;
        if (hecVar != null) {
            return hecVar;
        }
        g76.g0("defaultTypeImpl");
        throw null;
    }

    @Override // defpackage.tu7
    public final boolean e0() {
        return false;
    }

    @Override // defpackage.s0d
    public final aw2 f(ixd ixdVar) {
        ixdVar.getClass();
        if (ixdVar.a.e()) {
            return this;
        }
        yv2 yv2VarH = h();
        yv2VarH.getClass();
        ly annotations = getAnnotations();
        annotations.getClass();
        n98 name = getName();
        name.getClass();
        ha3 ha3Var = new ha3(this.f, yv2VarH, annotations, name, this.g, this.j, this.k, this.l, this.m, this.n);
        List listG0 = g0();
        hec hecVarA0 = A0();
        pqe pqeVar = pqe.INVARIANT;
        ha3Var.B0(listG0, lk7.r(ixdVar.f(hecVarA0, pqeVar)), lk7.r(ixdVar.f(z0(), pqeVar)));
        return ha3Var;
    }

    @Override // defpackage.do1
    public final boolean g() {
        return nxd.c(A0(), new z(4, this), null);
    }

    @Override // defpackage.do1
    public final List g0() {
        List list = this.h;
        if (list != null) {
            return list;
        }
        g76.g0("declaredTypeParametersImpl");
        throw null;
    }

    @Override // defpackage.tu7, defpackage.dw2
    public final g93 getVisibility() {
        return this.g;
    }

    @Override // defpackage.tu7
    public final boolean isExternal() {
        return false;
    }

    @Override // defpackage.co1
    public final zvd n() {
        return this.i;
    }

    @Override // defpackage.x93
    public final q1 s() {
        return this.j;
    }

    @Override // defpackage.zv2, defpackage.b2
    public final String toString() {
        return "typealias " + getName().b();
    }

    @Override // defpackage.tu7
    public final boolean y() {
        return false;
    }

    public final y28 y0() {
        if (kyd.a0(z0())) {
            return null;
        }
        co1 co1VarA = z0().j0().a();
        if (co1VarA instanceof y28) {
            return (y28) co1VarA;
        }
        return null;
    }

    public final hec z0() {
        hec hecVar = this.p;
        if (hecVar != null) {
            return hecVar;
        }
        g76.g0("expandedType");
        throw null;
    }

    @Override // defpackage.bw2, defpackage.zv2, defpackage.yv2, defpackage.c41
    /* JADX INFO: renamed from: a */
    public final yv2 x0() {
        return this;
    }

    @Override // defpackage.bw2, defpackage.zv2, defpackage.yv2, defpackage.c41
    /* JADX INFO: renamed from: a */
    public final co1 x0() {
        return this;
    }

    @Override // defpackage.bw2
    public final aw2 x0() {
        return this;
    }
}
