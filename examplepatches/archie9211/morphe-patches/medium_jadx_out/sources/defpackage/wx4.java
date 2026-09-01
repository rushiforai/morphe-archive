package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class wx4 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ gz8 b;

    public /* synthetic */ wx4(gz8 gz8Var, int i) {
        this.a = i;
        this.b = gz8Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int iK;
        int iK2;
        int i = this.a;
        gz8 gz8Var = this.b;
        switch (i) {
            case 0:
                iK = gz8Var.k();
                break;
            case 1:
                iK = gz8Var.o();
                break;
            case 2:
                iK = gz8Var.o();
                break;
            case 3:
                iK = gz8Var.k();
                break;
            case 4:
                return Integer.valueOf(gz8Var.k.a() ? gz8Var.r.g() : gz8Var.k());
            case 5:
                boolean zA = gz8Var.k.a();
                h49 h49Var = gz8Var.q;
                if (!zA) {
                    iK2 = gz8Var.k();
                } else if (h49Var.g() != -1) {
                    iK2 = h49Var.g();
                } else {
                    float fAbs = Math.abs(gz8Var.l());
                    m73 m73Var = gz8Var.n;
                    iz8 iz8Var = jz8.a;
                    if (fAbs >= Math.abs(Math.min(m73Var.Z(56.0f), gz8Var.p() / 2.0f) / gz8Var.p())) {
                        boolean zM = gz8Var.m();
                        int i2 = gz8Var.e;
                        iK2 = zM ? i2 + 1 : i2;
                    } else {
                        iK2 = gz8Var.k();
                    }
                }
                iK = gz8Var.j(iK2);
                break;
            case 6:
                iK = gz8Var.o();
                break;
            case 7:
                iK = ((Number) gz8Var.s.getValue()).intValue();
                break;
            case 8:
                iK = gz8Var.k();
                break;
            case 9:
                iK = gz8Var.k();
                break;
            case 10:
                iK = gz8Var.k();
                break;
            default:
                iK = ((Number) gz8Var.s.getValue()).intValue();
                break;
        }
        return Integer.valueOf(iK);
    }
}
