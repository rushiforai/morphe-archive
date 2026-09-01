package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class b9a implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ q9a b;
    public final /* synthetic */ kv6 c;
    public final /* synthetic */ e9a d;

    public /* synthetic */ b9a(q9a q9aVar, kv6 kv6Var, e9a e9aVar, int i) {
        this.a = i;
        this.b = q9aVar;
        this.c = kv6Var;
        this.d = e9aVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                hy8 hy8Var = (hy8) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    ht2.E(this.b, this.c, this.d, w2g.B(o28.b, hy8Var), p65Var, 0);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            default:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    q9a q9aVar = this.b;
                    boolean z = q9aVar instanceof f9a;
                    e9a e9aVar = this.d;
                    if (z) {
                        p65Var2.Y(324397051);
                        ht2.F((f9a) q9aVar, this.c, e9aVar, null, p65Var2, 0);
                        p65Var2.p(false);
                    } else if (q9aVar instanceof g9a) {
                        p65Var2.Y(324403390);
                        ht2.G(((g9a) q9aVar).a, e9aVar, null, p65Var2, 0);
                        p65Var2.p(false);
                    } else {
                        if (!(q9aVar instanceof l9a)) {
                            throw ho2.L(p65Var2, 324395041, false);
                        }
                        p65Var2.Y(324408795);
                        ht2.H(null, p65Var2, 0);
                        p65Var2.p(false);
                    }
                } else {
                    p65Var2.S();
                }
                return c1eVar;
        }
    }
}
