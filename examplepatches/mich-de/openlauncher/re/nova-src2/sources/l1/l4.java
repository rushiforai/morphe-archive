package l1;

/* loaded from: classes2.dex */
public abstract class l4 {

    /* renamed from: a, reason: collision with root package name */
    public static final float f73582a;

    /* renamed from: b, reason: collision with root package name */
    public static final float f73583b;

    static {
        float f11 = o1.r.f79147a;
        f73582a = o1.r.f79147a;
        f73583b = 8;
        float f12 = o1.r.f79147a;
        float f13 = o1.r.f79147a;
        float f14 = o1.r.f79147a;
    }

    public static final void a(b2.t tVar, long j11, long j12, float f11, k0.g2 g2Var, x1.e eVar, p1.o oVar, int i5) {
        k0.g2 g2VarA;
        long j13;
        long j14;
        float f12;
        b2.t tVar2;
        x1.e eVar2;
        p1.t tVar3;
        k0.g2 g2Var2;
        b2.t tVar4;
        long j15;
        long j16;
        float f13;
        p1.t tVar5 = (p1.t) oVar;
        tVar5.d0(1596802123);
        if (((i5 | 11414) & 74899) == 74898 && tVar5.E()) {
            tVar5.V();
            tVar4 = tVar;
            j15 = j11;
            j16 = j12;
            f13 = f11;
            g2Var2 = g2Var;
            eVar2 = eVar;
            tVar3 = tVar5;
        } else {
            tVar5.X();
            if ((i5 & 1) == 0 || tVar5.B()) {
                float f14 = j4.f73494a;
                float f15 = o1.r.f79147a;
                long jE = g1.e(tVar5, 37);
                long jA = g1.a((d1) tVar5.j(g1.f73330a), jE);
                float f16 = j4.f73494a;
                g2VarA = j4.a(tVar5);
                j13 = jE;
                j14 = jA;
                f12 = f16;
                tVar2 = b2.r.f17024a;
            } else {
                tVar5.V();
                tVar2 = tVar;
                j13 = j11;
                j14 = j12;
                f12 = f11;
                g2VarA = g2Var;
            }
            tVar5.q();
            eVar2 = eVar;
            tVar3 = tVar5;
            t7.a(tVar2, null, j13, j14, f12, 0.0f, null, x1.f.d(105663120, new c4.n(4, g2VarA, eVar2), tVar5), tVar3, 12607494, 98);
            g2Var2 = g2VarA;
            tVar4 = tVar2;
            j15 = j13;
            j16 = j14;
            f13 = f12;
        }
        p1.t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new k4(tVar4, j15, j16, f13, g2Var2, eVar2, i5);
        }
    }
}
