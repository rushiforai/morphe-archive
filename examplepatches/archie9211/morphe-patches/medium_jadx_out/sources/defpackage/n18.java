package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n18 implements b55 {
    public final /* synthetic */ long a;
    public final /* synthetic */ m45 b;
    public final /* synthetic */ v7c c;
    public final /* synthetic */ u18 d;
    public final /* synthetic */ ou e;
    public final /* synthetic */ sb2 f;
    public final /* synthetic */ x45 g;
    public final /* synthetic */ r28 h;
    public final /* synthetic */ float i;
    public final /* synthetic */ boolean j;
    public final /* synthetic */ m3c k;
    public final /* synthetic */ long l;
    public final /* synthetic */ long m;
    public final /* synthetic */ mz1 n;
    public final /* synthetic */ b55 o;
    public final /* synthetic */ mz1 p;

    public n18(long j, m45 m45Var, v7c v7cVar, u18 u18Var, ou ouVar, sb2 sb2Var, x45 x45Var, r28 r28Var, float f, boolean z, m3c m3cVar, long j2, long j3, mz1 mz1Var, b55 b55Var, mz1 mz1Var2) {
        this.a = j;
        this.b = m45Var;
        this.c = v7cVar;
        this.d = u18Var;
        this.e = ouVar;
        this.f = sb2Var;
        this.g = x45Var;
        this.h = r28Var;
        this.i = f;
        this.j = z;
        this.k = m3cVar;
        this.l = j2;
        this.m = j3;
        this.n = mz1Var;
        this.o = b55Var;
        this.p = mz1Var2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            r28 r28VarX = rv8.X(jfc.c, rv8.v);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new ss7(11);
                p65Var.j0(objM);
            }
            r28 r28VarA = wxb.a(r28VarX, false, (x45) objM);
            zk7 zk7VarC = dy0.c(z46.d, false);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarA);
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
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            v7c v7cVar = this.c;
            boolean z = ((w7c) ((j83) v7cVar.e.j).getValue()) != w7c.Hidden;
            this.d.getClass();
            long j = this.a;
            m45 m45Var = this.b;
            t18.c(j, m45Var, z, p65Var, 0);
            t18.b(this.e, this.f, m45Var, this.g, this.h, v7cVar, this.i, this.j, this.k, this.l, this.m, 0.0f, this.n, this.o, this.p, p65Var, 70);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
