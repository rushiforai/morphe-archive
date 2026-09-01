package defpackage;

import com.medium.android.donkey.main.MainActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class re7 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ MainActivity b;

    public /* synthetic */ re7(MainActivity mainActivity, int i) {
        this.a = i;
        this.b = mainActivity;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        sb0 sb0Var = sb0.a;
        uob uobVar = w12.a;
        c1e c1eVar = c1e.a;
        MainActivity mainActivity = this.b;
        int i2 = 2;
        int i3 = 3;
        int i4 = 0;
        int i5 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                int i6 = MainActivity.H;
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    jt7.a(false, pxf.E(-2116767858, new re7(mainActivity, i3), p65Var), p65Var, 48, 1);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                int i7 = MainActivity.H;
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    l78 l78VarX = guc.x(mainActivity.v().K, sb0Var, p65Var2, 48);
                    l78 l78VarZ = guc.z((xpc) mainActivity.A.getValue(), p65Var2, 0);
                    vb0 vb0Var = (vb0) l78VarX.getValue();
                    ub0 ub0Var = vb0Var instanceof ub0 ? (ub0) vb0Var : null;
                    Object objM = p65Var2.M();
                    if (objM == uobVar) {
                        objM = qo7.u(null);
                        p65Var2.j0(objM);
                    }
                    l78 l78Var = (l78) objM;
                    ub0 ub0Var2 = ub0Var == null ? (ub0) l78Var.getValue() : ub0Var;
                    if (ub0Var != null) {
                        l78Var.setValue(ub0Var);
                    }
                    vv2.c(ub0Var != null, null, u08.a, u08.b, null, pxf.E(1479417246, new gx4(ub0Var2, mainActivity, l78VarZ, 7), p65Var2), p65Var2, 196608, 18);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                int i8 = MainActivity.H;
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    l78 l78VarX2 = guc.x(mainActivity.v().K, sb0Var, p65Var3, 48);
                    l78 l78VarZ2 = guc.z(mainActivity.v().G, p65Var3, 0);
                    vb0 vb0Var2 = (vb0) l78VarX2.getValue();
                    if (vb0Var2 instanceof sb0) {
                        p65Var3.Y(-691241463);
                        p65Var3.p(false);
                    } else {
                        if (!(vb0Var2 instanceof ub0)) {
                            throw ho2.L(p65Var3, -691242697, false);
                        }
                        p65Var3.Y(-691239305);
                        vv2.c(((Boolean) l78VarZ2.getValue()).booleanValue(), null, zz3.b, sz3.d(null, 3), null, pxf.E(1916968254, new g64(mainActivity, 21, l78VarX2), p65Var3), p65Var3, 199680, 18);
                        p65Var3.p(false);
                    }
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 3:
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                int i9 = MainActivity.H;
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    nf7 nf7Var = (nf7) guc.z(mainActivity.v().y, p65Var4, 0).getValue();
                    if (nf7Var instanceof mf7) {
                        p65Var4.Y(1600594124);
                        mf7 mf7Var = (mf7) nf7Var;
                        String str = mf7Var.a;
                        String str2 = str != null ? str : null;
                        boolean z = mf7Var.b;
                        boolean zH = p65Var4.h(mainActivity);
                        Object objM2 = p65Var4.M();
                        if (zH || objM2 == uobVar) {
                            objM2 = new te7(mainActivity, i4);
                            p65Var4.j0(objM2);
                        }
                        m45 m45Var = (m45) objM2;
                        boolean zH2 = p65Var4.h(mainActivity);
                        Object objM3 = p65Var4.M();
                        if (zH2 || objM3 == uobVar) {
                            objM3 = new te7(mainActivity, i5);
                            p65Var4.j0(objM3);
                        }
                        qq7.b(str2, z, m45Var, (m45) objM3, p65Var4, 0);
                        p65Var4.p(false);
                    } else if (nf7Var instanceof lf7) {
                        p65Var4.Y(-1919847902);
                        mo7.v(((lf7) nf7Var).a, mainActivity.F, p65Var4, 0);
                        p65Var4.p(false);
                    } else {
                        if (nf7Var != null) {
                            throw ho2.L(p65Var4, 1600592107, false);
                        }
                        p65Var4.Y(1600645874);
                        p65Var4.p(false);
                    }
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 4:
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                int i10 = MainActivity.H;
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    jt7.a(false, pxf.E(-273344699, new re7(mainActivity, i2), p65Var5), p65Var5, 48, 1);
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            default:
                x12 x12Var6 = (x12) obj;
                int iIntValue6 = ((Integer) obj2).intValue();
                int i11 = MainActivity.H;
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(iIntValue6 & 1, (iIntValue6 & 3) != 2)) {
                    jt7.a(false, pxf.E(1220567750, new re7(mainActivity, i5), p65Var6), p65Var6, 48, 1);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
        }
    }
}
