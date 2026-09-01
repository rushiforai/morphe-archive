package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class rt7 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ m45 b;
    public final /* synthetic */ c09 c;
    public final /* synthetic */ String d;

    public /* synthetic */ rt7(m45 m45Var, c09 c09Var, String str, int i) {
        this.a = i;
        this.b = m45Var;
        this.c = c09Var;
        this.d = str;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        o28 o28Var = o28.b;
        final String str = this.d;
        final c09 c09Var = this.c;
        Object[] objArr = 0;
        final int i2 = 1;
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
                        p65Var.Y(1263031618);
                        r28 r28VarN = bgf.N(o28Var, "navigation_icon_button");
                        final Object[] objArr2 = objArr == true ? 1 : 0;
                        f49.l(m45Var, r28VarN, false, null, null, pxf.E(963588911, new b55() { // from class: tt7
                            @Override // defpackage.b55
                            public final Object invoke(Object obj3, Object obj4) {
                                int i3 = objArr2;
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
                                            qv5.b(c09Var, str, bgf.N(o28Var2, "navigation_icon"), ((zo7) p65Var2.j(kt7.b)).o, p65Var2, 392, 0);
                                        }
                                        break;
                                    default:
                                        p65 p65Var3 = (p65) x12Var2;
                                        if (!p65Var3.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                                            p65Var3.S();
                                        } else {
                                            rv5.a(c09Var, str, bgf.N(o28Var2, "navigation_icon"), ((zo7) p65Var3.j(kt7.b)).o, p65Var3, 392, 0);
                                        }
                                        break;
                                }
                                return c1eVar2;
                            }
                        }, p65Var), p65Var, 1572912, 60);
                    } else {
                        p65Var.Y(1251353050);
                    }
                    p65Var.p(false);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    f49.k(this.b, bgf.N(o28Var, "navigation_icon_button"), false, pxf.E(-1406795115, new b55() { // from class: tt7
                        @Override // defpackage.b55
                        public final Object invoke(Object obj3, Object obj4) {
                            int i3 = i2;
                            c1e c1eVar2 = c1e.a;
                            o28 o28Var2 = o28.b;
                            x12 x12Var22 = (x12) obj3;
                            int iIntValue22 = ((Integer) obj4).intValue();
                            switch (i3) {
                                case 0:
                                    p65 p65Var22 = (p65) x12Var22;
                                    if (!p65Var22.P(iIntValue22 & 1, (iIntValue22 & 3) != 2)) {
                                        p65Var22.S();
                                    } else {
                                        qv5.b(c09Var, str, bgf.N(o28Var2, "navigation_icon"), ((zo7) p65Var22.j(kt7.b)).o, p65Var22, 392, 0);
                                    }
                                    break;
                                default:
                                    p65 p65Var3 = (p65) x12Var22;
                                    if (!p65Var3.P(iIntValue22 & 1, (iIntValue22 & 3) != 2)) {
                                        p65Var3.S();
                                    } else {
                                        rv5.a(c09Var, str, bgf.N(o28Var2, "navigation_icon"), ((zo7) p65Var3.j(kt7.b)).o, p65Var3, 392, 0);
                                    }
                                    break;
                            }
                            return c1eVar2;
                        }
                    }, p65Var2), p65Var2, 24624, 12);
                }
                break;
        }
        return c1eVar;
    }
}
