package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class lu0 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ float b;
    public final /* synthetic */ int c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    public /* synthetic */ lu0(iv0 iv0Var, pu0 pu0Var, r28 r28Var, float f, x45 x45Var, int i, int i2) {
        this.a = 0;
        this.d = iv0Var;
        this.e = pu0Var;
        this.f = r28Var;
        this.b = f;
        this.g = x45Var;
        this.c = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        int i2 = this.c;
        c1e c1eVar = c1e.a;
        Object obj3 = this.f;
        Object obj4 = this.g;
        Object obj5 = this.e;
        Object obj6 = this.d;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                kyd.e((iv0) obj6, (pu0) obj5, (r28) obj3, this.b, (x45) obj4, (x12) obj, tr7.y(1), this.c);
                break;
            case 1:
                b55 b55Var = (b55) obj6;
                yrb yrbVar = (yrb) obj5;
                mz1 mz1Var = (mz1) obj3;
                mz1 mz1Var2 = (mz1) obj4;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    zk7 zk7VarC = dy0.c(z46.j, false);
                    long j = p65Var.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    o28 o28Var = o28.b;
                    r28 r28VarR = gx1.R(p65Var, o28Var);
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
                    tp7.B(p65Var, q12.g, Integer.valueOf(i3));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR);
                    b55Var.invoke(p65Var, 0);
                    Object objM = p65Var.M();
                    uob uobVar = w12.a;
                    if (objM == uobVar) {
                        objM = kyd.M(p65Var);
                        p65Var.j0(objM);
                    }
                    sb2 sb2Var = (sb2) objM;
                    boolean zF = p65Var.f(yrbVar) | p65Var.f(sb2Var);
                    Object objM2 = p65Var.M();
                    if (zF || objM2 == uobVar) {
                        objM2 = new osb(yrbVar, sb2Var);
                        p65Var.j0(objM2);
                    }
                    osb osbVar = (osb) objM2;
                    r28 r28VarZ = r40.z(wxb.a(wgf.v(jfc.s(jfc.d(o28Var, 1.0f), z46.g, 2), yrbVar), false, new dsb(3)));
                    float f = this.b;
                    boolean zC = p65Var.c(f) | p65Var.f(mz1Var) | p65Var.f(mz1Var2) | p65Var.h(osbVar);
                    int i4 = this.c;
                    boolean zD = p65Var.d(i4) | zC;
                    Object objM3 = p65Var.M();
                    if (zD || objM3 == uobVar) {
                        fs7 fs7Var = new fs7(f, mz1Var, osbVar, i4, mz1Var2, 0);
                        p65Var.j0(fs7Var);
                        objM3 = fs7Var;
                    }
                    f76.u(r28VarZ, (b55) objM3, p65Var, 0, 0);
                    p65Var.p(true);
                }
                break;
            case 2:
                ((Integer) obj2).getClass();
                s42.F((jfe) obj6, (nee) obj5, (r28) obj3, (yrb) obj4, this.b, (x12) obj, tr7.y(i2 | 1));
                break;
            case 3:
                ((Integer) obj2).getClass();
                s42.f((efe) obj6, (yrb) obj5, (nee) obj4, (r28) obj3, this.b, (x12) obj, tr7.y(i2 | 1));
                break;
            case 4:
                ((Integer) obj2).getClass();
                sfe.f((mge) obj6, (rfe) obj5, (r28) obj3, (kv6) obj4, this.b, (x12) obj, tr7.y(i2 | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                sfe.b((ige) obj6, (rfe) obj5, (kv6) obj4, this.b, (r28) obj3, (x12) obj, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ lu0(b55 b55Var, yrb yrbVar, float f, mz1 mz1Var, mz1 mz1Var2, int i) {
        this.a = 1;
        this.d = b55Var;
        this.e = yrbVar;
        this.b = f;
        this.f = mz1Var;
        this.g = mz1Var2;
        this.c = i;
    }

    public /* synthetic */ lu0(efe efeVar, yrb yrbVar, nee neeVar, r28 r28Var, float f, int i) {
        this.a = 3;
        this.d = efeVar;
        this.e = yrbVar;
        this.g = neeVar;
        this.f = r28Var;
        this.b = f;
        this.c = i;
    }

    public /* synthetic */ lu0(ige igeVar, rfe rfeVar, kv6 kv6Var, float f, r28 r28Var, int i) {
        this.a = 5;
        this.d = igeVar;
        this.e = rfeVar;
        this.g = kv6Var;
        this.b = f;
        this.f = r28Var;
        this.c = i;
    }

    public /* synthetic */ lu0(Object obj, Object obj2, r28 r28Var, nsb nsbVar, float f, int i, int i2) {
        this.a = i2;
        this.d = obj;
        this.e = obj2;
        this.f = r28Var;
        this.g = nsbVar;
        this.b = f;
        this.c = i;
    }
}
