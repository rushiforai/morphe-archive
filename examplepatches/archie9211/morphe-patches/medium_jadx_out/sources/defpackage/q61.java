package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q61 implements swd {
    public final swd a;
    public final yv2 b;
    public final int c;

    public q61(swd swdVar, yv2 yv2Var, int i) {
        this.a = swdVar;
        this.b = yv2Var;
        this.c = i;
    }

    @Override // defpackage.yv2
    public final Object F(cw2 cw2Var, Object obj) {
        return this.a.F(cw2Var, obj);
    }

    @Override // defpackage.swd
    public final x67 N() {
        x67 x67VarN = this.a.N();
        x67VarN.getClass();
        return x67VarN;
    }

    @Override // defpackage.swd
    public final boolean R() {
        return true;
    }

    @Override // defpackage.co1
    public final hec T() {
        hec hecVarT = this.a.T();
        hecVarT.getClass();
        return hecVarT;
    }

    @Override // defpackage.co1, defpackage.yv2, defpackage.c41
    /* JADX INFO: renamed from: a */
    public final co1 x0() {
        return this.a.x0();
    }

    @Override // defpackage.aw2
    public final jkc d() {
        jkc jkcVarD = this.a.d();
        jkcVarD.getClass();
        return jkcVarD;
    }

    @Override // defpackage.gx
    public final ly getAnnotations() {
        return this.a.getAnnotations();
    }

    @Override // defpackage.swd
    public final int getIndex() {
        return this.a.getIndex() + this.c;
    }

    @Override // defpackage.yv2
    public final n98 getName() {
        n98 name = this.a.getName();
        name.getClass();
        return name;
    }

    @Override // defpackage.swd
    public final List getUpperBounds() {
        List upperBounds = this.a.getUpperBounds();
        upperBounds.getClass();
        return upperBounds;
    }

    @Override // defpackage.yv2
    public final yv2 h() {
        return this.b;
    }

    @Override // defpackage.co1
    public final zvd n() {
        zvd zvdVarN = this.a.n();
        zvdVarN.getClass();
        return zvdVarN;
    }

    @Override // defpackage.swd
    public final boolean t() {
        return this.a.t();
    }

    public final String toString() {
        return this.a + "[inner-copy]";
    }

    @Override // defpackage.swd
    public final pqe z() {
        pqe pqeVarZ = this.a.z();
        pqeVarZ.getClass();
        return pqeVarZ;
    }

    @Override // defpackage.yv2, defpackage.c41
    /* JADX INFO: renamed from: a */
    public final yv2 x0() {
        return this.a.x0();
    }

    @Override // defpackage.swd, defpackage.co1, defpackage.yv2, defpackage.c41
    /* JADX INFO: renamed from: a */
    public final swd x0() {
        return this.a.x0();
    }
}
