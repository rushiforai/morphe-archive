package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class vt7 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ m45 b;
    public final /* synthetic */ c09 c;
    public final /* synthetic */ String d;
    public final /* synthetic */ long e;

    public /* synthetic */ vt7(m45 m45Var, c09 c09Var, String str, long j, int i) {
        this.a = i;
        this.b = m45Var;
        this.c = c09Var;
        this.d = str;
        this.e = j;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        o28 o28Var = o28.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    m45 m45Var = this.b;
                    if (m45Var != null) {
                        p65Var.Y(-2027805107);
                        r28 r28VarN = bgf.N(o28Var, "navigation_icon_button");
                        final int i2 = 0;
                        final c09 c09Var = this.c;
                        final String str = this.d;
                        final long j = this.e;
                        f49.l(m45Var, r28VarN, false, null, null, pxf.E(1776426354, new b55() { // from class: wt7
                            @Override // defpackage.b55
                            public final Object invoke(Object obj3, Object obj4) {
                                int i3 = i2;
                                c1e c1eVar2 = c1e.a;
                                o28 o28Var2 = o28.b;
                                x12 x12Var2 = (x12) obj3;
                                int iIntValue2 = ((Integer) obj4).intValue();
                                switch (i3) {
                                    case 0:
                                        p65 p65Var2 = (p65) x12Var2;
                                        if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                                            p65Var2.S();
                                        } else {
                                            qv5.b(c09Var, str, bgf.N(o28Var2, "navigation_icon"), j, p65Var2, 392, 0);
                                        }
                                        break;
                                    default:
                                        p65 p65Var3 = (p65) x12Var2;
                                        if (!p65Var3.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                                            p65Var3.S();
                                        } else {
                                            qv5.b(c09Var, str, bgf.N(o28Var2, "navigation_icon"), j, p65Var3, 392, 0);
                                        }
                                        break;
                                }
                                return c1eVar2;
                            }
                        }, p65Var), p65Var, 1572912, 60);
                    } else {
                        p65Var.Y(-2030600439);
                    }
                    p65Var.p(false);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(1 & iIntValue2, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    m45 m45Var2 = this.b;
                    if (m45Var2 != null) {
                        p65Var2.Y(1948290723);
                        r28 r28VarN2 = bgf.N(o28Var, "navigation_icon_button");
                        final int i3 = 1;
                        final c09 c09Var2 = this.c;
                        final String str2 = this.d;
                        final long j2 = this.e;
                        f49.l(m45Var2, r28VarN2, false, null, null, pxf.E(197439388, new b55() { // from class: wt7
                            @Override // defpackage.b55
                            public final Object invoke(Object obj3, Object obj4) {
                                int i32 = i3;
                                c1e c1eVar2 = c1e.a;
                                o28 o28Var2 = o28.b;
                                x12 x12Var22 = (x12) obj3;
                                int iIntValue22 = ((Integer) obj4).intValue();
                                switch (i32) {
                                    case 0:
                                        p65 p65Var22 = (p65) x12Var22;
                                        if (!p65Var22.P(iIntValue22 & 1, (iIntValue22 & 3) != 2)) {
                                            p65Var22.S();
                                        } else {
                                            qv5.b(c09Var2, str2, bgf.N(o28Var2, "navigation_icon"), j2, p65Var22, 392, 0);
                                        }
                                        break;
                                    default:
                                        p65 p65Var3 = (p65) x12Var22;
                                        if (!p65Var3.P(iIntValue22 & 1, (iIntValue22 & 3) != 2)) {
                                            p65Var3.S();
                                        } else {
                                            qv5.b(c09Var2, str2, bgf.N(o28Var2, "navigation_icon"), j2, p65Var3, 392, 0);
                                        }
                                        break;
                                }
                                return c1eVar2;
                            }
                        }, p65Var2), p65Var2, 1572912, 60);
                    } else {
                        p65Var2.Y(1934933567);
                    }
                    p65Var2.p(false);
                }
                break;
        }
        return c1eVar;
    }
}
