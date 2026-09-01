package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class gaf implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ gaf(Object obj, Object obj2, Object obj3, Object obj4, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj4 = this.e;
        Object obj5 = this.d;
        Object obj6 = this.c;
        Object obj7 = this.b;
        switch (i) {
            case 0:
                vaf vafVar = (vaf) obj7;
                laf lafVar = (laf) obj6;
                md3 md3Var = (md3) obj5;
                kv6 kv6Var = (kv6) obj4;
                hy8 hy8Var = (hy8) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    p65Var.S();
                } else {
                    vo7.k(0, p65Var, md3Var, kv6Var, w2g.B(o28.b, hy8Var), lafVar, vafVar);
                }
                break;
            default:
                b55 b55Var = (b55) obj7;
                g92 g92Var = (g92) obj6;
                c55 c55Var = (c55) obj5;
                m45 m45Var = (m45) obj4;
                f92 f92Var = (f92) obj;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p65) x12Var2).f(f92Var) ? 4 : 2;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 19) != 18)) {
                    p65Var2.S();
                } else {
                    String str = (String) b55Var.invoke(p65Var2, 0);
                    if (muc.b0(str)) {
                        e26.c("Label must not be blank");
                    }
                    g92Var.getClass();
                    d46.b.q(o28.b, str, Boolean.TRUE, f92Var, c55Var, m45Var, p65Var2, Integer.valueOf((iIntValue2 << 9) & 7168));
                }
                break;
        }
        return c1eVar;
    }
}
