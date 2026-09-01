package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class h29 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ b85 b;
    public final /* synthetic */ j29 c;

    public /* synthetic */ h29(b85 b85Var, j29 j29Var, int i) {
        this.a = i;
        this.b = b85Var;
        this.c = j29Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        j29 j29Var = this.c;
        int i2 = 1;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i) {
            case 0:
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(-1639310502, new h29(this.b, j29Var, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var2.S();
                } else {
                    s42.u(this.b, null, null, j29Var.d, p65Var2, 0, 6);
                }
                break;
        }
        return c1eVar;
    }
}
