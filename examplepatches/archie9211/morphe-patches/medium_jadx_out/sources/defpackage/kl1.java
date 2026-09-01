package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class kl1 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ jyb b;

    public /* synthetic */ kl1(jyb jybVar, int i) {
        this.a = i;
        this.b = jybVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        boolean z = true;
        jyb jybVar = this.b;
        switch (i) {
            case 0:
                ssd ssdVar = (ssd) obj;
                ssdVar.getClass();
                n49 n49Var = (n49) ssdVar;
                n49Var.p = true;
                n49Var.o.invoke(jybVar);
                dl7.u(n49Var);
                return Boolean.FALSE;
            default:
                Boolean boolA = ((jp) ((th4) obj)).a();
                if (boolA != null) {
                    nnd nndVarL = yo7.l(boolA.booleanValue());
                    fj6[] fj6VarArr = gyb.a;
                    iyb iybVar = eyb.K;
                    fj6 fj6Var = gyb.a[26];
                    jybVar.d(iybVar, nndVarL);
                } else {
                    z = false;
                }
                return Boolean.valueOf(z);
        }
    }
}
