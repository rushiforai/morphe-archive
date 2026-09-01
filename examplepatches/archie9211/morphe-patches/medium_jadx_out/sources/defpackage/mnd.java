package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mnd extends uo1 {
    public boolean O;
    public x45 P;
    public final doc Q;

    public mnd(boolean z, m68 m68Var, boolean z2, vkb vkbVar, x45 x45Var) {
        super(m68Var, null, false, z2, null, vkbVar, new ic0(x45Var, z, 6));
        this.O = z;
        this.P = x45Var;
        this.Q = new doc(16, this);
    }

    @Override // defpackage.r0
    public final void L0(jyb jybVar) {
        nnd nndVarL = yo7.l(this.O);
        fj6[] fj6VarArr = gyb.a;
        iyb iybVar = eyb.K;
        fj6[] fj6VarArr2 = gyb.a;
        fj6 fj6Var = fj6VarArr2[26];
        jybVar.d(iybVar, nndVarL);
        no noVar = tz7.g;
        iyb iybVar2 = eyb.s;
        fj6 fj6Var2 = fj6VarArr2[9];
        jybVar.d(iybVar2, noVar);
        jp jpVarP = epe.p(this.O);
        if (jpVarP != null) {
            iyb iybVar3 = eyb.t;
            fj6 fj6Var3 = fj6VarArr2[10];
            jybVar.d(iybVar3, jpVarP);
        }
        jybVar.d(sxb.h, new i4(null, new kl1(jybVar, 1)));
    }
}
