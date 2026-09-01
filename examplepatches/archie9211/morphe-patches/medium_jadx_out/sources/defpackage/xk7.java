package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xk7 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ yk7 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xk7(yk7 yk7Var, int i) {
        super(0);
        this.a = i;
        this.b = yk7Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        yk7 yk7Var = this.b;
        switch (i) {
            case 0:
                eq6 eq6Var = yk7Var.f;
                eq6Var.i = 0;
                o78 o78VarZ = eq6Var.a.z();
                Object[] objArr = o78VarZ.a;
                int i2 = o78VarZ.c;
                for (int i3 = 0; i3 < i2; i3++) {
                    yk7 yk7Var2 = ((aq6) objArr[i3]).G.p;
                    yk7Var2.h = yk7Var2.i;
                    yk7Var2.i = Integer.MAX_VALUE;
                    yk7Var2.u = false;
                    if (yk7Var2.l == yp6.InLayoutBlock) {
                        yk7Var2.l = yp6.NotUsed;
                    }
                }
                aq6 aq6Var = eq6Var.a;
                aq6 aq6Var2 = eq6Var.a;
                o78 o78VarZ2 = aq6Var.z();
                Object[] objArr2 = o78VarZ2.a;
                int i4 = o78VarZ2.c;
                for (int i5 = 0; i5 < i4; i5++) {
                    ((aq6) objArr2[i5]).G.p.y.d = false;
                }
                if (yk7Var.e().k) {
                    v68 v68Var = (v68) aq6Var2.n();
                    int i6 = ((o78) v68Var.b).c;
                    for (int i7 = 0; i7 < i6; i7++) {
                        ((eh8) ((aq6) v68Var.get(i7)).F.e).k = true;
                    }
                }
                yk7Var.e().w0().d();
                if (yk7Var.e().k) {
                    v68 v68Var2 = (v68) aq6Var2.n();
                    int i8 = ((o78) v68Var2.b).c;
                    for (int i9 = 0; i9 < i8; i9++) {
                        ((eh8) ((aq6) v68Var2.get(i9)).F.e).k = false;
                    }
                }
                o78 o78VarZ3 = aq6Var2.z();
                Object[] objArr3 = o78VarZ3.a;
                int i10 = o78VarZ3.c;
                for (int i11 = 0; i11 < i10; i11++) {
                    aq6 aq6Var3 = (aq6) objArr3[i11];
                    eq6 eq6Var2 = aq6Var3.G;
                    if (eq6Var2.p.h != aq6Var3.w()) {
                        aq6Var2.O();
                        aq6Var2.C();
                        if (aq6Var3.w() == Integer.MAX_VALUE) {
                            if (eq6Var2.c || dm2.L(aq6Var3)) {
                                mb7 mb7Var = eq6Var2.q;
                                mb7Var.getClass();
                                mb7Var.l0(false);
                            }
                            eq6Var2.p.n0();
                        }
                    }
                }
                o78 o78VarZ4 = aq6Var2.z();
                Object[] objArr4 = o78VarZ4.a;
                int i12 = o78VarZ4.c;
                for (int i13 = 0; i13 < i12; i13++) {
                    bq6 bq6Var = ((aq6) objArr4[i13]).G.p.y;
                    bq6Var.e = bq6Var.d;
                }
                break;
            case 1:
                yk7Var.f.a().s(yk7Var.C);
                break;
            default:
                eq6 eq6Var3 = yk7Var.f;
                eh8 eh8Var = eq6Var3.a().q;
                s99 placementScope = eh8Var != null ? eh8Var.l : ((mn) dq6.a(eq6Var3.a)).getPlacementScope();
                x45 x45Var = yk7Var.H;
                of5 of5Var = yk7Var.I;
                if (of5Var != null) {
                    eh8 eh8VarA = eq6Var3.a();
                    long j = yk7Var.J;
                    float f = yk7Var.K;
                    placementScope.e(eh8VarA);
                    eh8VarA.a0(k46.d(j, eh8VarA.e), f, of5Var);
                } else if (x45Var == null) {
                    eh8 eh8VarA2 = eq6Var3.a();
                    long j2 = yk7Var.J;
                    float f2 = yk7Var.K;
                    placementScope.e(eh8VarA2);
                    eh8VarA2.X(k46.d(j2, eh8VarA2.e), f2, null);
                } else {
                    eh8 eh8VarA3 = eq6Var3.a();
                    long j3 = yk7Var.J;
                    float f3 = yk7Var.K;
                    placementScope.e(eh8VarA3);
                    eh8VarA3.X(k46.d(j3, eh8VarA3.e), f3, x45Var);
                }
                break;
        }
        return c1eVar;
    }
}
