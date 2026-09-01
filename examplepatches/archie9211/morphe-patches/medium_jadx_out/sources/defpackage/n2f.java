package defpackage;

import com.medium.android.profile.ui.you.YouProfileFragment;
import com.medium.android.profile.ui.you.a;
import com.medium.android.profile.ui.you.b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class n2f implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ n2f(int i, int i2, r28 r28Var, Object obj, Object obj2) {
        this.a = i2;
        this.c = obj;
        this.d = obj2;
        this.b = r28Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        Object[] objArr = 0;
        final int i2 = 1;
        c1e c1eVar = c1e.a;
        Object obj3 = this.b;
        Object obj4 = this.d;
        Object obj5 = this.c;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                nk7.e0((s2f) obj5, (o2f) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 1:
                ((Integer) obj2).getClass();
                vo7.e((vaf) obj5, (laf) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 2:
                YouProfileFragment youProfileFragment = (YouProfileFragment) obj5;
                vq6 vq6Var = youProfileFragment.w0;
                mbf mbfVar = (mbf) obj4;
                upc upcVar = (upc) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    b.g(((YouProfileFragment.BundleInfo) vq6Var.getValue()).getPreSelectedTab(), ((YouProfileFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), youProfileFragment.x0, mbfVar, w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) upcVar.getValue()).a, 7), null, p65Var, 0);
                }
                break;
            case 3:
                uod uodVar = (uod) obj5;
                final xbf xbfVar = (xbf) obj4;
                final d2f d2fVar = (d2f) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    final Object[] objArr2 = objArr == true ? 1 : 0;
                    qk7.d(pxf.E(-251477533, new c55() { // from class: pbf
                        @Override // defpackage.c55
                        public final Object f(Object obj6, Object obj7, Object obj8) {
                            int i3 = objArr2;
                            c1e c1eVar2 = c1e.a;
                            xbf xbfVar2 = xbfVar;
                            switch (i3) {
                                case 0:
                                    yt7 yt7Var = (yt7) obj6;
                                    x12 x12Var3 = (x12) obj7;
                                    int iIntValue3 = ((Integer) obj8).intValue();
                                    yt7Var.getClass();
                                    if ((iIntValue3 & 6) == 0) {
                                        iIntValue3 |= ((p65) x12Var3).f(yt7Var) ? 4 : 2;
                                    }
                                    p65 p65Var3 = (p65) x12Var3;
                                    if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 19) != 18)) {
                                        p65Var3.S();
                                    } else {
                                        if (xbfVar2 instanceof ubf) {
                                            p65Var3.Y(-1344133492);
                                            b.d(yt7Var, (ubf) xbfVar2, d2fVar, null, p65Var3, iIntValue3 & 14);
                                        } else {
                                            p65Var3.Y(-1359396993);
                                        }
                                        p65Var3.p(false);
                                    }
                                    break;
                                default:
                                    pmb pmbVar = (pmb) obj6;
                                    x12 x12Var4 = (x12) obj7;
                                    int iIntValue4 = ((Integer) obj8).intValue();
                                    pmbVar.getClass();
                                    if ((iIntValue4 & 6) == 0) {
                                        iIntValue4 |= ((p65) x12Var4).f(pmbVar) ? 4 : 2;
                                    }
                                    p65 p65Var4 = (p65) x12Var4;
                                    if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 19) != 18)) {
                                        p65Var4.S();
                                    } else {
                                        if (xbfVar2 instanceof ubf) {
                                            p65Var4.Y(1042619843);
                                            d2f d2fVar2 = d2fVar;
                                            boolean zF = p65Var4.f(d2fVar2) | p65Var4.f(xbfVar2);
                                            Object objM = p65Var4.M();
                                            if (zF || objM == w12.a) {
                                                objM = new qbf(1, d2fVar2, xbfVar2);
                                                p65Var4.j0(objM);
                                            }
                                            f49.l((m45) objM, pmbVar.b(bgf.N(o28.b, "settings_icon"), z46.m), false, null, null, a.a, p65Var4, 1572864, 60);
                                        } else {
                                            p65Var4.Y(1026995130);
                                        }
                                        p65Var4.p(false);
                                    }
                                    break;
                            }
                            return c1eVar2;
                        }
                    }, p65Var2), null, pxf.E(-986664216, new c55() { // from class: pbf
                        @Override // defpackage.c55
                        public final Object f(Object obj6, Object obj7, Object obj8) {
                            int i3 = i2;
                            c1e c1eVar2 = c1e.a;
                            xbf xbfVar2 = xbfVar;
                            switch (i3) {
                                case 0:
                                    yt7 yt7Var = (yt7) obj6;
                                    x12 x12Var3 = (x12) obj7;
                                    int iIntValue3 = ((Integer) obj8).intValue();
                                    yt7Var.getClass();
                                    if ((iIntValue3 & 6) == 0) {
                                        iIntValue3 |= ((p65) x12Var3).f(yt7Var) ? 4 : 2;
                                    }
                                    p65 p65Var3 = (p65) x12Var3;
                                    if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 19) != 18)) {
                                        p65Var3.S();
                                    } else {
                                        if (xbfVar2 instanceof ubf) {
                                            p65Var3.Y(-1344133492);
                                            b.d(yt7Var, (ubf) xbfVar2, d2fVar, null, p65Var3, iIntValue3 & 14);
                                        } else {
                                            p65Var3.Y(-1359396993);
                                        }
                                        p65Var3.p(false);
                                    }
                                    break;
                                default:
                                    pmb pmbVar = (pmb) obj6;
                                    x12 x12Var4 = (x12) obj7;
                                    int iIntValue4 = ((Integer) obj8).intValue();
                                    pmbVar.getClass();
                                    if ((iIntValue4 & 6) == 0) {
                                        iIntValue4 |= ((p65) x12Var4).f(pmbVar) ? 4 : 2;
                                    }
                                    p65 p65Var4 = (p65) x12Var4;
                                    if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 19) != 18)) {
                                        p65Var4.S();
                                    } else {
                                        if (xbfVar2 instanceof ubf) {
                                            p65Var4.Y(1042619843);
                                            d2f d2fVar2 = d2fVar;
                                            boolean zF = p65Var4.f(d2fVar2) | p65Var4.f(xbfVar2);
                                            Object objM = p65Var4.M();
                                            if (zF || objM == w12.a) {
                                                objM = new qbf(1, d2fVar2, xbfVar2);
                                                p65Var4.j0(objM);
                                            }
                                            f49.l((m45) objM, pmbVar.b(bgf.N(o28.b, "settings_icon"), z46.m), false, null, null, a.a, p65Var4, 1572864, 60);
                                        } else {
                                            p65Var4.Y(1026995130);
                                        }
                                        p65Var4.p(false);
                                    }
                                    break;
                            }
                            return c1eVar2;
                        }
                    }, p65Var2), null, null, 0L, null, uodVar, p65Var2, 3078);
                }
                break;
            case 4:
                ((Integer) obj2).getClass();
                flb.T((wdf) obj5, (ddf) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            default:
                ((Integer) obj2).getClass();
                pwd.k((mff) obj5, (gff) obj4, (r28) obj3, (x12) obj, tr7.y(385));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ n2f(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.c = obj;
        this.d = obj2;
        this.b = obj3;
    }
}
