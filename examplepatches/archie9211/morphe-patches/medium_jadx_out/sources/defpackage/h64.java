package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class h64 implements c55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ kv6 b;
    public final /* synthetic */ x64 c;
    public final /* synthetic */ l64 d;
    public final /* synthetic */ sh9 e;
    public final /* synthetic */ obe f;
    public final /* synthetic */ cs1 g;

    public /* synthetic */ h64(x64 x64Var, kv6 kv6Var, l64 l64Var, sh9 sh9Var, obe obeVar, cs1 cs1Var) {
        this.c = x64Var;
        this.b = kv6Var;
        this.d = l64Var;
        this.e = sh9Var;
        this.f = obeVar;
        this.g = cs1Var;
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
                if (!p65Var.P(1 & iIntValue, (iIntValue & 19) != 18)) {
                    p65Var.S();
                } else {
                    hlg.d(this.c, this.b, this.d, this.e, this.f, this.g, w2g.B(o28.b, hy8Var), p65Var, 0);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    p65Var2.S();
                } else {
                    jy8 jy8VarH = w2g.h(0.0f, 0.0f, 0.0f, 88.0f, 7);
                    x64 x64Var = this.c;
                    boolean z = x64Var instanceof u64;
                    l64 l64Var = this.d;
                    boolean zH = p65Var2.h(l64Var) | p65Var2.f(x64Var);
                    sh9 sh9Var = this.e;
                    boolean zF = zH | p65Var2.f(sh9Var);
                    obe obeVar = this.f;
                    boolean zF2 = zF | p65Var2.f(obeVar);
                    cs1 cs1Var = this.g;
                    boolean zF3 = zF2 | p65Var2.f(cs1Var);
                    Object objM = p65Var2.M();
                    if (zF3 || objM == w12.a) {
                        objM = new s7(x64Var, l64Var, sh9Var, obeVar, cs1Var, 2);
                        p65Var2.j0(objM);
                    }
                    k40.t(null, this.b, jy8VarH, null, null, null, z, null, (x45) objM, p65Var2, 0, 377);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ h64(kv6 kv6Var, x64 x64Var, l64 l64Var, sh9 sh9Var, obe obeVar, cs1 cs1Var) {
        this.b = kv6Var;
        this.c = x64Var;
        this.d = l64Var;
        this.e = sh9Var;
        this.f = obeVar;
        this.g = cs1Var;
    }
}
