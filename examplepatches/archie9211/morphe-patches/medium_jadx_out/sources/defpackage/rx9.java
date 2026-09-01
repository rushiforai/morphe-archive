package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class rx9 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ long b;
    public final /* synthetic */ int c;
    public final /* synthetic */ int d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    public /* synthetic */ rx9(amb ambVar, sb2 sb2Var, pod podVar, int i, long j, int i2) {
        this.e = ambVar;
        this.f = sb2Var;
        this.g = podVar;
        this.c = i;
        this.b = j;
        this.d = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.c;
        Object obj3 = this.g;
        Object obj4 = this.f;
        Object obj5 = this.e;
        switch (i) {
            case 0:
                amb ambVar = (amb) obj5;
                sb2 sb2Var = (sb2) obj4;
                pod podVar = (pod) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                int i3 = 2;
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    r28 r28VarY = r40.y(bo.B(o28.b, 1.0f, ((zo7) p65Var.j(kt7.b)).x, ambVar), ambVar);
                    boolean zH = p65Var.h(sb2Var) | p65Var.h(podVar);
                    Object objM = p65Var.M();
                    if (zH || objM == w12.a) {
                        objM = new ip0(sb2Var, podVar, i3);
                        p65Var.j0(objM);
                    }
                    r28 r28VarF = w2g.F(hlg.r(r28VarY, false, null, null, (m45) objM, 15), 10.0f, 8.0f, 12.0f, 8.0f);
                    omb ombVarA = nmb.a(new h70(8.0f, true, new z10(21)), z46.n, p65Var, 54);
                    long j = p65Var.T;
                    int i4 = (int) (j ^ (j >>> 32));
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
                    tp7.B(p65Var, q12.f, ombVarA);
                    tp7.B(p65Var, q12.e, i89VarL);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i4));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR);
                    c09 c09VarJ = vn7.J(i2, 0, p65Var);
                    long j2 = this.b;
                    qv5.b(c09VarJ, null, null, j2, p65Var, 56, 4);
                    jjd.b(vo7.R(p65Var, this.d), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).m, j2, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131070);
                    p65Var.p(true);
                }
                break;
            default:
                ((Integer) obj2).getClass();
                il7.l((stc) obj5, (r28) obj4, this.b, (hy8) obj3, (x12) obj, tr7.y(i2 | 1), this.d);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ rx9(stc stcVar, r28 r28Var, long j, hy8 hy8Var, int i, int i2) {
        this.e = stcVar;
        this.f = r28Var;
        this.b = j;
        this.g = hy8Var;
        this.c = i;
        this.d = i2;
    }
}
