package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lb7 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ mb7 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lb7(mb7 mb7Var, int i) {
        super(0);
        this.a = i;
        this.b = mb7Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        hb7 hb7VarM0;
        int i = this.a;
        c1e c1eVar = c1e.a;
        mb7 mb7Var = this.b;
        switch (i) {
            case 0:
                eq6 eq6Var = mb7Var.f;
                eq6Var.h = 0;
                o78 o78VarZ = eq6Var.a.z();
                Object[] objArr = o78VarZ.a;
                int i2 = o78VarZ.c;
                for (int i3 = 0; i3 < i2; i3++) {
                    mb7 mb7Var2 = ((aq6) objArr[i3]).G.q;
                    mb7Var2.getClass();
                    mb7Var2.h = mb7Var2.i;
                    mb7Var2.i = Integer.MAX_VALUE;
                    if (mb7Var2.j == yp6.InLayoutBlock) {
                        mb7Var2.j = yp6.NotUsed;
                    }
                }
                aq6 aq6Var = eq6Var.a;
                aq6 aq6Var2 = eq6Var.a;
                o78 o78VarZ2 = aq6Var.z();
                Object[] objArr2 = o78VarZ2.a;
                int i4 = o78VarZ2.c;
                for (int i5 = 0; i5 < i4; i5++) {
                    mb7 mb7Var3 = ((aq6) objArr2[i5]).G.q;
                    mb7Var3.getClass();
                    mb7Var3.s.d = false;
                }
                k26 k26Var = mb7Var.e().X;
                if (k26Var != null) {
                    boolean z = k26Var.k;
                    v68 v68Var = (v68) aq6Var2.n();
                    int i6 = ((o78) v68Var.b).c;
                    for (int i7 = 0; i7 < i6; i7++) {
                        hb7 hb7VarM02 = ((eh8) ((aq6) v68Var.get(i7)).F.e).M0();
                        if (hb7VarM02 != null) {
                            hb7VarM02.k = z;
                        }
                    }
                }
                k26 k26Var2 = mb7Var.e().X;
                k26Var2.getClass();
                k26Var2.w0().d();
                if (mb7Var.e().X != null) {
                    v68 v68Var2 = (v68) aq6Var2.n();
                    int i8 = ((o78) v68Var2.b).c;
                    for (int i9 = 0; i9 < i8; i9++) {
                        hb7 hb7VarM03 = ((eh8) ((aq6) v68Var2.get(i9)).F.e).M0();
                        if (hb7VarM03 != null) {
                            hb7VarM03.k = false;
                        }
                    }
                }
                o78 o78VarZ3 = aq6Var2.z();
                Object[] objArr3 = o78VarZ3.a;
                int i10 = o78VarZ3.c;
                for (int i11 = 0; i11 < i10; i11++) {
                    mb7 mb7Var4 = ((aq6) objArr3[i11]).G.q;
                    mb7Var4.getClass();
                    int i12 = mb7Var4.h;
                    int i13 = mb7Var4.i;
                    if (i12 != i13 && i13 == Integer.MAX_VALUE) {
                        mb7Var4.l0(true);
                    }
                }
                o78 o78VarZ4 = aq6Var2.z();
                Object[] objArr4 = o78VarZ4.a;
                int i14 = o78VarZ4.c;
                for (int i15 = 0; i15 < i14; i15++) {
                    mb7 mb7Var5 = ((aq6) objArr4[i15]).G.q;
                    mb7Var5.getClass();
                    bq6 bq6Var = mb7Var5.s;
                    bq6Var.e = bq6Var.d;
                }
                break;
            case 1:
                eq6 eq6Var2 = mb7Var.f;
                s99 placementScope = null;
                if (dm2.L(eq6Var2.a) || eq6Var2.c) {
                    eh8 eh8Var = eq6Var2.a().q;
                    if (eh8Var != null) {
                        placementScope = eh8Var.l;
                    }
                } else {
                    eh8 eh8Var2 = eq6Var2.a().q;
                    if (eh8Var2 != null && (hb7VarM0 = eh8Var2.M0()) != null) {
                        placementScope = hb7VarM0.l;
                    }
                }
                if (placementScope == null) {
                    placementScope = ((mn) dq6.a(eq6Var2.a)).getPlacementScope();
                }
                hb7 hb7VarM04 = eq6Var2.a().M0();
                hb7VarM04.getClass();
                s99.i(placementScope, hb7VarM04, mb7Var.o);
                break;
            default:
                hb7 hb7VarM05 = mb7Var.f.a().M0();
                hb7VarM05.getClass();
                hb7VarM05.s(mb7Var.z);
                break;
        }
        return c1eVar;
    }
}
