package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class pv0 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ Object c;

    public /* synthetic */ pv0(lid lidVar, boolean z, int i) {
        this.a = 1;
        this.c = lidVar;
        this.b = z;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        long j;
        String strW;
        int i = this.a;
        o28 o28Var = o28.b;
        boolean z = this.b;
        c1e c1eVar = c1e.a;
        Object obj3 = this.c;
        switch (i) {
            case 0:
                lv0 lv0Var = (lv0) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    if (lv0Var == lv0.YOUR_FOLLOWING_FEED && z) {
                        p65Var.Y(1314970745);
                        j = ((zo7) p65Var.j(kt7.b)).r;
                        p65Var.p(false);
                    } else {
                        p65Var.Y(1314971853);
                        p65Var.p(false);
                        j = uu1.g;
                    }
                    dy0.a(jfc.l(flb.a0(o28Var, j, bmb.a), 4.0f), p65Var, 0);
                }
                break;
            case 1:
                ((Integer) obj2).getClass();
                rv8.o((lid) obj3, z, (x12) obj, tr7.y(1));
                break;
            case 2:
                ((Integer) obj2).getClass();
                kt7.a(z, (mz1) obj3, (x12) obj, tr7.y(49));
                break;
            case 3:
                ((Integer) obj2).getClass();
                no7.h(z, (b55) obj3, (x12) obj, tr7.y(1));
                break;
            case 4:
                ina inaVar = (ina) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    vv2.c(this.b, null, sz3.c(null, 3), sz3.d(null, 3), null, pxf.E(1185608834, new so1(28, inaVar), p65Var2), p65Var2, 200064, 18);
                }
                break;
            case 5:
                zl3 zl3Var = (zl3) obj;
                ufc ufcVar = ufc.a;
                ho2.k(zl3Var, ((qfc) obj3).a(z, true), zl3Var.Z(ufc.b) / 2.0f, ((ip8) obj2).a, null, 120);
                break;
            case 6:
                ycd ycdVar = (ycd) obj3;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    if (z) {
                        p65Var3.Y(491766430);
                        rcd rcdVar = ycdVar.b;
                        ocd ocdVar = rcdVar instanceof ocd ? (ocd) rcdVar : null;
                        strW = ocdVar != null ? ocdVar.a : null;
                        if (strW == null) {
                            strW = km4.w(p65Var3, -1231059487, R.string.tag_title, p65Var3, false);
                        } else {
                            p65Var3.Y(-1231062556);
                            p65Var3.p(false);
                        }
                        p65Var3.p(false);
                    } else {
                        strW = km4.w(p65Var3, 491916129, R.string.tag_title, p65Var3, false);
                    }
                    jjd.b(strW, bgf.N(o28Var, "title"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var3.j(jt7.c)).e, p65Var3, 48, 0, 131068);
                }
                break;
            case 7:
                nje njeVar = (nje) obj3;
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else if (njeVar instanceof jje) {
                    vv2.c(this.b, null, sz3.c(f76.Q(300, 0, null, 6), 2), sz3.d(f76.Q(300, 0, null, 6), 2), null, pxf.E(-1007950995, new nra(15, njeVar), p65Var4), p65Var4, 200064, 18);
                }
                break;
            default:
                m45 m45Var = (m45) obj3;
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    p65Var5.S();
                } else {
                    long j2 = ((zo7) p65Var5.j(kt7.b)).d;
                    boolean z2 = this.b;
                    f49.l(m45Var, flb.a0(o28Var, uu1.b(z2 ? 1.0f : 0.38f, j2), bmb.a), z2, null, null, rx0.g, p65Var5, 1572864, 56);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ pv0(Object obj, boolean z, int i) {
        this.a = i;
        this.c = obj;
        this.b = z;
    }

    public /* synthetic */ pv0(boolean z, b55 b55Var, int i, int i2) {
        this.a = i2;
        this.b = z;
        this.c = b55Var;
    }

    public /* synthetic */ pv0(boolean z, Object obj, int i) {
        this.a = i;
        this.b = z;
        this.c = obj;
    }
}
