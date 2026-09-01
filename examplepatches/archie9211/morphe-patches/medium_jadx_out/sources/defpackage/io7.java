package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class io7 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ yn7 b;
    public final /* synthetic */ l78 c;
    public final /* synthetic */ String d;

    public /* synthetic */ io7(yn7 yn7Var, l78 l78Var, String str, int i) {
        this.a = i;
        this.b = yn7Var;
        this.c = l78Var;
        this.d = str;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        o28 o28Var = o28.b;
        l78 l78Var = this.c;
        yn7 yn7Var = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    p65Var.S();
                } else {
                    mkd mkdVarA = mkd.a(dl7.m((mkd) yn7Var.getTextStyle().invoke(p65Var, 0)), ((uu1) l78Var.getValue()).a, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                    r28 r28VarF = jfc.f(o28Var, ((m73) p65Var.j(z22.h)).z(mkdVarA.b.c), 0.0f, 2);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var.T;
                    int i2 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarF);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, zk7VarC);
                    tp7.B(p65Var, q12.e, i89VarL);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i2));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR);
                    kjd.b(this.d, null, 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkdVarA, p65Var, 0, 3120, 55294);
                    p65Var.p(true);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    p65Var2.S();
                } else {
                    mkd mkdVarA2 = mkd.a(dl7.m((mkd) yn7Var.getTextStyle().invoke(p65Var2, 0)), ((uu1) l78Var.getValue()).a, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                    r28 r28VarF2 = jfc.f(o28Var, ((m73) p65Var2.j(z22.h)).z(mkdVarA2.b.c), 0.0f, 2);
                    zk7 zk7VarC2 = dy0.c(z46.h, false);
                    long j2 = p65Var2.T;
                    int i3 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, r28VarF2);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, zk7VarC2);
                    tp7.B(p65Var2, q12.e, i89VarL2);
                    tp7.B(p65Var2, q12.g, Integer.valueOf(i3));
                    tp7.y(p65Var2, q12.h);
                    tp7.B(p65Var2, q12.d, r28VarR2);
                    kjd.b(this.d, null, 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkdVarA2, p65Var2, 0, 3120, 55294);
                    p65Var2.p(true);
                }
                break;
        }
        return c1eVar;
    }
}
