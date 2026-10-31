package h4;

import h6.c1;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class c extends o {

    /* renamed from: k, reason: collision with root package name */
    public final ArrayList f59096k;

    /* renamed from: l, reason: collision with root package name */
    public int f59097l;

    public c(g4.d dVar, int i5) {
        g4.d dVar2;
        super(dVar);
        ArrayList arrayList = new ArrayList();
        this.f59096k = arrayList;
        this.f59137f = i5;
        g4.d dVar3 = this.f59133b;
        g4.d dVarM = dVar3.m(i5);
        while (true) {
            dVar2 = dVar3;
            dVar3 = dVarM;
            if (dVar3 == null) {
                break;
            } else {
                dVarM = dVar3.m(this.f59137f);
            }
        }
        this.f59133b = dVar2;
        int i11 = this.f59137f;
        arrayList.add(i11 == 0 ? dVar2.f57088d : i11 == 1 ? dVar2.f57090e : null);
        g4.d dVarL = dVar2.l(this.f59137f);
        while (dVarL != null) {
            int i12 = this.f59137f;
            arrayList.add(i12 == 0 ? dVarL.f57088d : i12 == 1 ? dVarL.f57090e : null);
            dVarL = dVarL.l(this.f59137f);
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            o oVar = (o) it.next();
            int i13 = this.f59137f;
            if (i13 == 0) {
                oVar.f59133b.f57084b = this;
            } else if (i13 == 1) {
                oVar.f59133b.f57086c = this;
            }
        }
        if (this.f59137f == 0 && ((g4.e) this.f59133b.S).f57126u0 && arrayList.size() > 1) {
            this.f59133b = ((o) c1.l(arrayList, 1)).f59133b;
        }
        this.f59097l = this.f59137f == 0 ? this.f59133b.f57097h0 : this.f59133b.f57099i0;
    }

    /* JADX WARN: Removed duplicated region for block: B:62:0x00ce  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00dd  */
    @Override // h4.d
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(d dVar) {
        int i5;
        int i11;
        boolean z11;
        float f11;
        int i12;
        int i13;
        int i14;
        int i15;
        float f12;
        int i16;
        int i17;
        int i18;
        int i19;
        int i21;
        int i22;
        boolean z12;
        int i23;
        f fVar = this.f59139h;
        if (fVar.f59116j) {
            f fVar2 = this.f59140i;
            if (fVar2.f59116j) {
                g4.d dVar2 = this.f59133b.S;
                boolean z13 = dVar2 instanceof g4.e ? ((g4.e) dVar2).f57126u0 : false;
                int i24 = fVar2.f59113g - fVar.f59113g;
                ArrayList arrayList = this.f59096k;
                int size = arrayList.size();
                int i25 = 0;
                while (true) {
                    i5 = -1;
                    i11 = 8;
                    if (i25 >= size) {
                        i25 = -1;
                        break;
                    } else if (((o) arrayList.get(i25)).f59133b.f57093f0 != 8) {
                        break;
                    } else {
                        i25++;
                    }
                }
                int i26 = size - 1;
                int i27 = i26;
                while (true) {
                    if (i27 < 0) {
                        break;
                    }
                    if (((o) arrayList.get(i27)).f59133b.f57093f0 != 8) {
                        i5 = i27;
                        break;
                    }
                    i27--;
                }
                int i28 = 0;
                while (i28 < 2) {
                    f11 = 0.0f;
                    int i29 = 0;
                    i14 = 0;
                    int i31 = 0;
                    int i32 = 0;
                    while (i29 < size) {
                        o oVar = (o) arrayList.get(i29);
                        g4.d dVar3 = oVar.f59133b;
                        boolean z14 = z13;
                        if (dVar3.f57093f0 == i11) {
                            i22 = i28;
                        } else {
                            i32++;
                            if (i29 > 0 && i29 >= i25) {
                                i14 += oVar.f59139h.f59112f;
                            }
                            g gVar = oVar.f59136e;
                            int i33 = gVar.f59113g;
                            i22 = i28;
                            boolean z15 = oVar.f59135d != 3;
                            if (z15) {
                                int i34 = this.f59137f;
                                if (i34 == 0 && !dVar3.f57088d.f59136e.f59116j) {
                                    return;
                                }
                                if (i34 == 1 && !dVar3.f57090e.f59136e.f59116j) {
                                    return;
                                } else {
                                    z12 = z15;
                                }
                            } else {
                                z12 = z15;
                                if (oVar.f59132a == 1 && i22 == 0) {
                                    i23 = gVar.f59119m;
                                    i31++;
                                } else if (gVar.f59116j) {
                                    i23 = i33;
                                }
                                z12 = true;
                                if (z12) {
                                    i31++;
                                    float f13 = dVar3.f57101j0[this.f59137f];
                                    if (f13 >= 0.0f) {
                                        f11 += f13;
                                    }
                                } else {
                                    i14 += i23;
                                }
                                if (i29 >= i26 && i29 < i5) {
                                    i14 += -oVar.f59140i.f59112f;
                                }
                            }
                            i23 = i33;
                            if (z12) {
                            }
                            if (i29 >= i26) {
                            }
                        }
                        i29++;
                        z13 = z14;
                        i28 = i22;
                        i11 = 8;
                    }
                    z11 = z13;
                    int i35 = i28;
                    if (i14 < i24 || i31 == 0) {
                        i12 = i31;
                        i13 = i32;
                        break;
                    } else {
                        i28 = i35 + 1;
                        z13 = z11;
                        i11 = 8;
                    }
                }
                z11 = z13;
                f11 = 0.0f;
                i12 = 0;
                i13 = 0;
                i14 = 0;
                int i36 = fVar.f59113g;
                if (z11) {
                    i36 = fVar2.f59113g;
                }
                float f14 = 0.5f;
                if (i14 > i24) {
                    i36 = z11 ? i36 + ((int) (((i14 - i24) / 2.0f) + 0.5f)) : i36 - ((int) (((i14 - i24) / 2.0f) + 0.5f));
                }
                if (i12 > 0) {
                    float f15 = i24 - i14;
                    int i37 = (int) ((f15 / i12) + 0.5f);
                    int i38 = 0;
                    int i39 = 0;
                    while (i38 < size) {
                        float f16 = f14;
                        o oVar2 = (o) arrayList.get(i38);
                        int i40 = i36;
                        g4.d dVar4 = oVar2.f59133b;
                        int i41 = i12;
                        g gVar2 = oVar2.f59136e;
                        float f17 = f15;
                        int i42 = i37;
                        if (dVar4.f57093f0 == 8 || oVar2.f59135d != 3 || gVar2.f59116j) {
                            i21 = i38;
                        } else {
                            int i43 = f11 > 0.0f ? (int) (((dVar4.f57101j0[this.f59137f] * f17) / f11) + f16) : i42;
                            if (this.f59137f == 0) {
                                i18 = dVar4.f57115u;
                                i19 = dVar4.f57114t;
                            } else {
                                i18 = dVar4.f57118x;
                                i19 = dVar4.f57117w;
                            }
                            i21 = i38;
                            int iMax = Math.max(i19, oVar2.f59132a == 1 ? Math.min(i43, gVar2.f59119m) : i43);
                            if (i18 > 0) {
                                iMax = Math.min(i18, iMax);
                            }
                            if (iMax != i43) {
                                i39++;
                                i43 = iMax;
                            }
                            gVar2.d(i43);
                        }
                        i38 = i21 + 1;
                        i36 = i40;
                        f14 = f16;
                        i12 = i41;
                        f15 = f17;
                        i37 = i42;
                    }
                    i15 = i36;
                    f12 = f14;
                    int i44 = i12;
                    if (i39 > 0) {
                        i12 = i44 - i39;
                        i14 = 0;
                        for (int i45 = 0; i45 < size; i45++) {
                            o oVar3 = (o) arrayList.get(i45);
                            if (oVar3.f59133b.f57093f0 != 8) {
                                if (i45 > 0 && i45 >= i25) {
                                    i14 += oVar3.f59139h.f59112f;
                                }
                                i14 += oVar3.f59136e.f59113g;
                                if (i45 < i26 && i45 < i5) {
                                    i14 += -oVar3.f59140i.f59112f;
                                }
                            }
                        }
                    } else {
                        i12 = i44;
                    }
                    i17 = 2;
                    if (this.f59097l == 2 && i39 == 0) {
                        i16 = 0;
                        this.f59097l = 0;
                    } else {
                        i16 = 0;
                    }
                } else {
                    i15 = i36;
                    f12 = 0.5f;
                    i16 = 0;
                    i17 = 2;
                }
                if (i14 > i24) {
                    this.f59097l = i17;
                }
                if (i13 > 0 && i12 == 0 && i25 == i5) {
                    this.f59097l = i17;
                }
                int i46 = this.f59097l;
                if (i46 == 1) {
                    int i47 = i13 > 1 ? (i24 - i14) / (i13 - 1) : i13 == 1 ? (i24 - i14) / 2 : i16;
                    if (i12 > 0) {
                        i47 = i16;
                    }
                    int i48 = i15;
                    for (int i49 = i16; i49 < size; i49++) {
                        o oVar4 = (o) arrayList.get(z11 ? size - (i49 + 1) : i49);
                        g4.d dVar5 = oVar4.f59133b;
                        f fVar3 = oVar4.f59140i;
                        f fVar4 = oVar4.f59139h;
                        if (dVar5.f57093f0 == 8) {
                            fVar4.d(i48);
                            fVar3.d(i48);
                        } else {
                            if (i49 > 0) {
                                i48 = z11 ? i48 - i47 : i48 + i47;
                            }
                            if (i49 > 0 && i49 >= i25) {
                                i48 = z11 ? i48 - fVar4.f59112f : i48 + fVar4.f59112f;
                            }
                            if (z11) {
                                fVar3.d(i48);
                            } else {
                                fVar4.d(i48);
                            }
                            g gVar3 = oVar4.f59136e;
                            int i51 = gVar3.f59113g;
                            if (oVar4.f59135d == 3 && oVar4.f59132a == 1) {
                                i51 = gVar3.f59119m;
                            }
                            i48 = z11 ? i48 - i51 : i48 + i51;
                            if (z11) {
                                fVar4.d(i48);
                            } else {
                                fVar3.d(i48);
                            }
                            oVar4.f59138g = true;
                            if (i49 < i26 && i49 < i5) {
                                i48 = z11 ? i48 - (-fVar3.f59112f) : i48 + (-fVar3.f59112f);
                            }
                        }
                    }
                    return;
                }
                if (i46 == 0) {
                    int i52 = (i24 - i14) / (i13 + 1);
                    if (i12 > 0) {
                        i52 = i16;
                    }
                    int i53 = i15;
                    for (int i54 = i16; i54 < size; i54++) {
                        o oVar5 = (o) arrayList.get(z11 ? size - (i54 + 1) : i54);
                        g4.d dVar6 = oVar5.f59133b;
                        f fVar5 = oVar5.f59140i;
                        f fVar6 = oVar5.f59139h;
                        if (dVar6.f57093f0 == 8) {
                            fVar6.d(i53);
                            fVar5.d(i53);
                        } else {
                            int i55 = z11 ? i53 - i52 : i53 + i52;
                            if (i54 > 0 && i54 >= i25) {
                                i55 = z11 ? i55 - fVar6.f59112f : i55 + fVar6.f59112f;
                            }
                            if (z11) {
                                fVar5.d(i55);
                            } else {
                                fVar6.d(i55);
                            }
                            g gVar4 = oVar5.f59136e;
                            int iMin = gVar4.f59113g;
                            if (oVar5.f59135d == 3 && oVar5.f59132a == 1) {
                                iMin = Math.min(iMin, gVar4.f59119m);
                            }
                            i53 = z11 ? i55 - iMin : i55 + iMin;
                            if (z11) {
                                fVar6.d(i53);
                            } else {
                                fVar5.d(i53);
                            }
                            if (i54 < i26 && i54 < i5) {
                                i53 = z11 ? i53 - (-fVar5.f59112f) : i53 + (-fVar5.f59112f);
                            }
                        }
                    }
                    return;
                }
                if (i46 == 2) {
                    float f18 = this.f59137f == 0 ? this.f59133b.f57087c0 : this.f59133b.f57089d0;
                    if (z11) {
                        f18 = 1.0f - f18;
                    }
                    int i56 = (int) (((i24 - i14) * f18) + f12);
                    if (i56 < 0 || i12 > 0) {
                        i56 = i16;
                    }
                    int i57 = z11 ? i15 - i56 : i15 + i56;
                    for (int i58 = i16; i58 < size; i58++) {
                        o oVar6 = (o) arrayList.get(z11 ? size - (i58 + 1) : i58);
                        g4.d dVar7 = oVar6.f59133b;
                        f fVar7 = oVar6.f59140i;
                        f fVar8 = oVar6.f59139h;
                        if (dVar7.f57093f0 == 8) {
                            fVar8.d(i57);
                            fVar7.d(i57);
                        } else {
                            if (i58 > 0 && i58 >= i25) {
                                i57 = z11 ? i57 - fVar8.f59112f : i57 + fVar8.f59112f;
                            }
                            if (z11) {
                                fVar7.d(i57);
                            } else {
                                fVar8.d(i57);
                            }
                            g gVar5 = oVar6.f59136e;
                            int i59 = gVar5.f59113g;
                            if (oVar6.f59135d == 3 && oVar6.f59132a == 1) {
                                i59 = gVar5.f59119m;
                            }
                            i57 = z11 ? i57 - i59 : i57 + i59;
                            if (z11) {
                                fVar8.d(i57);
                            } else {
                                fVar7.d(i57);
                            }
                            if (i58 < i26 && i58 < i5) {
                                i57 = z11 ? i57 - (-fVar7.f59112f) : i57 + (-fVar7.f59112f);
                            }
                        }
                    }
                }
            }
        }
    }

    @Override // h4.o
    public final void d() {
        ArrayList arrayList = this.f59096k;
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            ((o) it.next()).d();
        }
        int size = arrayList.size();
        if (size < 1) {
            return;
        }
        g4.d dVar = ((o) arrayList.get(0)).f59133b;
        g4.d dVar2 = ((o) arrayList.get(size - 1)).f59133b;
        int i5 = this.f59137f;
        f fVar = this.f59140i;
        f fVar2 = this.f59139h;
        if (i5 == 0) {
            g4.c cVar = dVar.H;
            g4.c cVar2 = dVar2.J;
            f fVarI = o.i(cVar, 0);
            int iE = cVar.e();
            g4.d dVarM = m();
            if (dVarM != null) {
                iE = dVarM.H.e();
            }
            if (fVarI != null) {
                o.b(fVar2, fVarI, iE);
            }
            f fVarI2 = o.i(cVar2, 0);
            int iE2 = cVar2.e();
            g4.d dVarN = n();
            if (dVarN != null) {
                iE2 = dVarN.J.e();
            }
            if (fVarI2 != null) {
                o.b(fVar, fVarI2, -iE2);
            }
        } else {
            g4.c cVar3 = dVar.I;
            g4.c cVar4 = dVar2.K;
            f fVarI3 = o.i(cVar3, 1);
            int iE3 = cVar3.e();
            g4.d dVarM2 = m();
            if (dVarM2 != null) {
                iE3 = dVarM2.I.e();
            }
            if (fVarI3 != null) {
                o.b(fVar2, fVarI3, iE3);
            }
            f fVarI4 = o.i(cVar4, 1);
            int iE4 = cVar4.e();
            g4.d dVarN2 = n();
            if (dVarN2 != null) {
                iE4 = dVarN2.K.e();
            }
            if (fVarI4 != null) {
                o.b(fVar, fVarI4, -iE4);
            }
        }
        fVar2.f59107a = this;
        fVar.f59107a = this;
    }

    @Override // h4.o
    public final void e() {
        int i5 = 0;
        while (true) {
            ArrayList arrayList = this.f59096k;
            if (i5 >= arrayList.size()) {
                return;
            }
            ((o) arrayList.get(i5)).e();
            i5++;
        }
    }

    @Override // h4.o
    public final void f() {
        this.f59134c = null;
        Iterator it = this.f59096k.iterator();
        while (it.hasNext()) {
            ((o) it.next()).f();
        }
    }

    @Override // h4.o
    public final long j() {
        ArrayList arrayList = this.f59096k;
        int size = arrayList.size();
        long j11 = 0;
        for (int i5 = 0; i5 < size; i5++) {
            j11 = r5.f59140i.f59112f + ((o) arrayList.get(i5)).j() + j11 + r5.f59139h.f59112f;
        }
        return j11;
    }

    @Override // h4.o
    public final boolean k() {
        ArrayList arrayList = this.f59096k;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            if (!((o) arrayList.get(i5)).k()) {
                return false;
            }
        }
        return true;
    }

    public final g4.d m() {
        int i5 = 0;
        while (true) {
            ArrayList arrayList = this.f59096k;
            if (i5 >= arrayList.size()) {
                return null;
            }
            g4.d dVar = ((o) arrayList.get(i5)).f59133b;
            if (dVar.f57093f0 != 8) {
                return dVar;
            }
            i5++;
        }
    }

    public final g4.d n() {
        ArrayList arrayList = this.f59096k;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            g4.d dVar = ((o) arrayList.get(size)).f59133b;
            if (dVar.f57093f0 != 8) {
                return dVar;
            }
        }
        return null;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ChainRun ");
        sb2.append(this.f59137f == 0 ? "horizontal : " : "vertical : ");
        Iterator it = this.f59096k.iterator();
        while (it.hasNext()) {
            o oVar = (o) it.next();
            sb2.append("<");
            sb2.append(oVar);
            sb2.append("> ");
        }
        return sb2.toString();
    }
}
