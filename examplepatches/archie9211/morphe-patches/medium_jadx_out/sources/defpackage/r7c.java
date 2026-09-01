package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r7c implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;

    public /* synthetic */ r7c(String str, int i) {
        this.a = i;
        this.b = str;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                nod nodVar = (nod) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Number) obj3).intValue();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= (iIntValue & 8) == 0 ? ((p65) x12Var).f(nodVar) : ((p65) x12Var).h(nodVar) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    p65Var.S();
                } else {
                    kod.a(nodVar, null, null, 0.0f, null, 0L, 0L, pxf.E(-999924215, new fx2(6, this.b), p65Var), p65Var, (iIntValue & 14) | 805306368, 255);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Number) obj3).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(1 & iIntValue2, (iIntValue2 & 17) != 16)) {
                    p65Var2.S();
                } else {
                    jjd.b(this.b, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var2, 0, 0, 262142);
                }
                break;
        }
        return c1eVar;
    }
}
