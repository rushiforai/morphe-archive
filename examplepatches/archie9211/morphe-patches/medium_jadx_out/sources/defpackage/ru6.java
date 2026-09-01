package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ru6 extends q28 implements xxb {
    public m45 o;
    public ku6 p;
    public hw8 q;
    public boolean r;
    public lrb s;
    public final ou6 t = new ou6(this, 0);
    public ou6 u;

    public ru6(m45 m45Var, ku6 ku6Var, hw8 hw8Var, boolean z) {
        this.o = m45Var;
        this.p = ku6Var;
        this.q = hw8Var;
        this.r = z;
        I0();
    }

    @Override // defpackage.xxb
    public final boolean I() {
        return false;
    }

    public final void I0() {
        this.s = new lrb(new pu6(this, 0), new pu6(this, 1));
        this.u = this.r ? new ou6(this, 1) : null;
    }

    @Override // defpackage.xxb
    public final boolean i() {
        return true;
    }

    @Override // defpackage.xxb
    public final void r0(jyb jybVar) {
        fj6[] fj6VarArr;
        gyb.i(jybVar);
        jybVar.d(eyb.N, this.t);
        hw8 hw8Var = this.q;
        hw8 hw8Var2 = hw8.Vertical;
        lrb lrbVar = this.s;
        if (hw8Var == hw8Var2) {
            if (lrbVar == null) {
                g76.g0("scrollAxisRange");
                throw null;
            }
            iyb iybVar = eyb.w;
            fj6VarArr = gyb.a;
            fj6 fj6Var = fj6VarArr[13];
            jybVar.d(iybVar, lrbVar);
        } else {
            if (lrbVar == null) {
                g76.g0("scrollAxisRange");
                throw null;
            }
            iyb iybVar2 = eyb.v;
            fj6VarArr = gyb.a;
            fj6 fj6Var2 = fj6VarArr[12];
            jybVar.d(iybVar2, lrbVar);
        }
        ou6 ou6Var = this.u;
        if (ou6Var != null) {
            jybVar.d(sxb.f, new i4(null, ou6Var));
        }
        jybVar.d(sxb.C, new i4(null, new fw8(5, new pu6(this, 2))));
        pr1 pr1VarE = this.p.e();
        iyb iybVar3 = eyb.f;
        fj6 fj6Var3 = fj6VarArr[24];
        jybVar.d(iybVar3, pr1VarE);
    }

    @Override // defpackage.xxb
    public final boolean s0() {
        return false;
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }
}
