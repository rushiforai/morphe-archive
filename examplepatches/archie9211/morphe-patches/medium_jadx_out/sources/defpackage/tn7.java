package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class tn7 implements c55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ m45 b;
    public final /* synthetic */ boolean c;

    public /* synthetic */ tn7(m45 m45Var, boolean z) {
        this.b = m45Var;
        this.c = z;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        long jB;
        int i = this.a;
        final boolean z = this.c;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj2;
                ((Integer) obj3).getClass();
                ((lw) obj).getClass();
                rh4 rh4Var = jfc.c;
                if (z) {
                    p65 p65Var = (p65) x12Var;
                    p65Var.Y(-1340997376);
                    jB = uu1.b(0.7f, ((zo7) p65Var.j(kt7.b)).c);
                    p65Var.p(false);
                } else {
                    p65 p65Var2 = (p65) x12Var;
                    p65Var2.Y(-1340880227);
                    jB = uu1.b(0.08f, ((zo7) p65Var2.j(kt7.b)).d);
                    p65Var2.p(false);
                }
                hp7.t(x12Var, hlg.r(flb.a0(rh4Var, jB, rv8.r), false, null, null, this.b, 15));
                return c1e.a;
            default:
                r28 r28Var = (r28) obj;
                ((Integer) obj3).getClass();
                p65 p65Var3 = (p65) ((x12) obj2);
                p65Var3.Y(-196777734);
                final long j = ((ekd) p65Var3.j(fkd.a)).a;
                boolean zE = p65Var3.e(j);
                final m45 m45Var = this.b;
                boolean zF = zE | p65Var3.f(m45Var) | p65Var3.g(z);
                Object objM = p65Var3.M();
                if (zF || objM == w12.a) {
                    objM = new x45() { // from class: is
                        @Override // defpackage.x45
                        public final Object invoke(Object obj4) {
                            d31 d31Var = (d31) obj4;
                            return d31Var.a(new bs(0, m45Var, g01.M(d31Var, Float.intBitsToFloat((int) (d31Var.a.f() >> 32)) / 2.0f), new bs0(5, j), z));
                        }
                    };
                    p65Var3.j0(objM);
                }
                r28 r28VarB = guc.B(r28Var, (x45) objM);
                p65Var3.p(false);
                return r28VarB;
        }
    }

    public /* synthetic */ tn7(boolean z, m45 m45Var) {
        this.c = z;
        this.b = m45Var;
    }
}
