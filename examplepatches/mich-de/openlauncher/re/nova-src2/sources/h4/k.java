package h4;

import b.c0;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class k extends o {

    /* renamed from: k, reason: collision with root package name */
    public static final int[] f59121k = new int[2];

    public static void m(int[] iArr, int i5, int i11, int i12, int i13, float f11, int i14) {
        int i15 = i11 - i5;
        int i16 = i13 - i12;
        if (i14 != -1) {
            if (i14 == 0) {
                iArr[0] = (int) ((i16 * f11) + 0.5f);
                iArr[1] = i16;
                return;
            } else {
                if (i14 != 1) {
                    return;
                }
                iArr[0] = i15;
                iArr[1] = (int) ((i15 * f11) + 0.5f);
                return;
            }
        }
        int i17 = (int) ((i16 * f11) + 0.5f);
        int i18 = (int) ((i15 / f11) + 0.5f);
        if (i17 <= i15) {
            iArr[0] = i17;
            iArr[1] = i16;
        } else if (i18 <= i16) {
            iArr[0] = i15;
            iArr[1] = i18;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:116:0x0268  */
    /* JADX WARN: Removed duplicated region for block: B:11:0x0026  */
    @Override // h4.d
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(d dVar) {
        float f11;
        float f12;
        float f13;
        float f14;
        int i5;
        if (c0.F(this.f59141j) == 3) {
            g4.d dVar2 = this.f59133b;
            l(dVar2.H, dVar2.J, 0);
            return;
        }
        g gVar = this.f59136e;
        boolean z11 = gVar.f59116j;
        f fVar = this.f59139h;
        f fVar2 = this.f59140i;
        if (z11 || this.f59135d != 3) {
            f11 = 0.5f;
        } else {
            g4.d dVar3 = this.f59133b;
            int i11 = dVar3.f57111q;
            if (i11 == 2) {
                f11 = 0.5f;
                g4.d dVar4 = dVar3.S;
                if (dVar4 != null) {
                    if (dVar4.f57088d.f59136e.f59116j) {
                        gVar.d((int) ((r5.f59113g * dVar3.f57116v) + 0.5f));
                    }
                }
            } else if (i11 == 3) {
                int i12 = dVar3.f57112r;
                if (i12 == 0 || i12 == 3) {
                    m mVar = dVar3.f57090e;
                    f fVar3 = mVar.f59139h;
                    f fVar4 = mVar.f59140i;
                    boolean z12 = dVar3.H.f57078f != null;
                    boolean z13 = dVar3.I.f57078f != null;
                    boolean z14 = dVar3.J.f57078f != null;
                    boolean z15 = dVar3.K.f57078f != null;
                    f11 = 0.5f;
                    int i13 = dVar3.W;
                    if (z12 && z13 && z14 && z15) {
                        float f15 = dVar3.V;
                        boolean z16 = fVar3.f59116j;
                        ArrayList arrayList = fVar3.f59118l;
                        int[] iArr = f59121k;
                        if (z16 && fVar4.f59116j) {
                            if (fVar.f59109c && fVar2.f59109c) {
                                m(iArr, ((f) fVar.f59118l.get(0)).f59113g + fVar.f59112f, ((f) fVar2.f59118l.get(0)).f59113g - fVar2.f59112f, fVar3.f59113g + fVar3.f59112f, fVar4.f59113g - fVar4.f59112f, f15, i13);
                                gVar.d(iArr[0]);
                                this.f59133b.f57090e.f59136e.d(iArr[1]);
                                return;
                            }
                            return;
                        }
                        if (fVar.f59116j && fVar2.f59116j) {
                            if (!fVar3.f59109c || !fVar4.f59109c) {
                                return;
                            }
                            m(iArr, fVar.f59113g + fVar.f59112f, fVar2.f59113g - fVar2.f59112f, ((f) arrayList.get(0)).f59113g + fVar3.f59112f, ((f) fVar4.f59118l.get(0)).f59113g - fVar4.f59112f, f15, i13);
                            gVar.d(iArr[0]);
                            this.f59133b.f57090e.f59136e.d(iArr[1]);
                        }
                        if (!fVar.f59109c || !fVar2.f59109c || !fVar3.f59109c || !fVar4.f59109c) {
                            return;
                        }
                        m(iArr, ((f) fVar.f59118l.get(0)).f59113g + fVar.f59112f, ((f) fVar2.f59118l.get(0)).f59113g - fVar2.f59112f, ((f) arrayList.get(0)).f59113g + fVar3.f59112f, ((f) fVar4.f59118l.get(0)).f59113g - fVar4.f59112f, f15, i13);
                        gVar.d(iArr[0]);
                        this.f59133b.f57090e.f59136e.d(iArr[1]);
                    } else if (z12 && z14) {
                        if (!fVar.f59109c || !fVar2.f59109c) {
                            return;
                        }
                        float f16 = dVar3.V;
                        int i14 = ((f) fVar.f59118l.get(0)).f59113g + fVar.f59112f;
                        int i15 = ((f) fVar2.f59118l.get(0)).f59113g - fVar2.f59112f;
                        if (i13 == -1 || i13 == 0) {
                            int iG = g(i15 - i14, 0);
                            int i16 = (int) ((iG * f16) + 0.5f);
                            int iG2 = g(i16, 1);
                            if (i16 != iG2) {
                                iG = (int) ((iG2 / f16) + 0.5f);
                            }
                            gVar.d(iG);
                            this.f59133b.f57090e.f59136e.d(iG2);
                        } else if (i13 == 1) {
                            int iG3 = g(i15 - i14, 0);
                            int i17 = (int) ((iG3 / f16) + 0.5f);
                            int iG4 = g(i17, 1);
                            if (i17 != iG4) {
                                iG3 = (int) ((iG4 * f16) + 0.5f);
                            }
                            gVar.d(iG3);
                            this.f59133b.f57090e.f59136e.d(iG4);
                        }
                    } else if (z13 && z15) {
                        if (!fVar3.f59109c || !fVar4.f59109c) {
                            return;
                        }
                        float f17 = dVar3.V;
                        int i18 = ((f) fVar3.f59118l.get(0)).f59113g + fVar3.f59112f;
                        int i19 = ((f) fVar4.f59118l.get(0)).f59113g - fVar4.f59112f;
                        if (i13 == -1) {
                            int iG5 = g(i19 - i18, 1);
                            int i21 = (int) ((iG5 / f17) + 0.5f);
                            int iG6 = g(i21, 0);
                            if (i21 != iG6) {
                                iG5 = (int) ((iG6 * f17) + 0.5f);
                            }
                            gVar.d(iG6);
                            this.f59133b.f57090e.f59136e.d(iG5);
                        } else if (i13 == 0) {
                            int iG7 = g(i19 - i18, 1);
                            int i22 = (int) ((iG7 * f17) + 0.5f);
                            int iG8 = g(i22, 0);
                            if (i22 != iG8) {
                                iG7 = (int) ((iG8 / f17) + 0.5f);
                            }
                            gVar.d(iG8);
                            this.f59133b.f57090e.f59136e.d(iG7);
                        } else if (i13 == 1) {
                        }
                    }
                } else {
                    int i23 = dVar3.W;
                    if (i23 == -1) {
                        f12 = dVar3.f57090e.f59136e.f59113g;
                        f13 = dVar3.V;
                    } else if (i23 == 0) {
                        f14 = dVar3.f57090e.f59136e.f59113g / dVar3.V;
                        i5 = (int) (f14 + 0.5f);
                        gVar.d(i5);
                        f11 = 0.5f;
                    } else if (i23 != 1) {
                        i5 = 0;
                        gVar.d(i5);
                        f11 = 0.5f;
                    } else {
                        f12 = dVar3.f57090e.f59136e.f59113g;
                        f13 = dVar3.V;
                    }
                    f14 = f12 * f13;
                    i5 = (int) (f14 + 0.5f);
                    gVar.d(i5);
                    f11 = 0.5f;
                }
            }
        }
        boolean z17 = fVar.f59109c;
        ArrayList arrayList2 = fVar.f59118l;
        if (z17) {
            boolean z18 = fVar2.f59109c;
            ArrayList arrayList3 = fVar2.f59118l;
            if (z18) {
                if (fVar.f59116j && fVar2.f59116j && gVar.f59116j) {
                    return;
                }
                if (!gVar.f59116j && this.f59135d == 3) {
                    g4.d dVar5 = this.f59133b;
                    if (dVar5.f57111q == 0 && !dVar5.u()) {
                        f fVar5 = (f) arrayList2.get(0);
                        f fVar6 = (f) arrayList3.get(0);
                        int i24 = fVar5.f59113g + fVar.f59112f;
                        int i25 = fVar6.f59113g + fVar2.f59112f;
                        fVar.d(i24);
                        fVar2.d(i25);
                        gVar.d(i25 - i24);
                        return;
                    }
                }
                if (!gVar.f59116j && this.f59135d == 3 && this.f59132a == 1 && arrayList2.size() > 0 && arrayList3.size() > 0) {
                    int iMin = Math.min((((f) arrayList3.get(0)).f59113g + fVar2.f59112f) - (((f) arrayList2.get(0)).f59113g + fVar.f59112f), gVar.f59119m);
                    g4.d dVar6 = this.f59133b;
                    int i26 = dVar6.f57115u;
                    int iMax = Math.max(dVar6.f57114t, iMin);
                    if (i26 > 0) {
                        iMax = Math.min(i26, iMax);
                    }
                    gVar.d(iMax);
                }
                if (gVar.f59116j) {
                    f fVar7 = (f) arrayList2.get(0);
                    f fVar8 = (f) arrayList3.get(0);
                    int i27 = fVar7.f59113g;
                    int i28 = fVar.f59112f + i27;
                    int i29 = fVar8.f59113g;
                    int i31 = fVar2.f59112f + i29;
                    float f18 = this.f59133b.f57087c0;
                    if (fVar7 == fVar8) {
                        f18 = f11;
                    } else {
                        i27 = i28;
                        i29 = i31;
                    }
                    fVar.d((int) ((((i29 - i27) - gVar.f59113g) * f18) + i27 + f11));
                    fVar2.d(fVar.f59113g + gVar.f59113g);
                }
            }
        }
    }

    @Override // h4.o
    public final void d() {
        g4.d dVar;
        g4.d dVar2;
        int i5;
        g4.d dVar3;
        g4.d dVar4;
        int i11;
        g4.d dVar5 = this.f59133b;
        boolean z11 = dVar5.f57082a;
        g gVar = this.f59136e;
        if (z11) {
            gVar.d(dVar5.n());
        }
        boolean z12 = gVar.f59116j;
        ArrayList arrayList = gVar.f59117k;
        ArrayList arrayList2 = gVar.f59118l;
        f fVar = this.f59140i;
        f fVar2 = this.f59139h;
        if (!z12) {
            g4.d dVar6 = this.f59133b;
            int i12 = dVar6.f57109o0[0];
            this.f59135d = i12;
            if (i12 != 3) {
                if (i12 == 4 && (dVar4 = dVar6.S) != null && ((i11 = dVar4.f57109o0[0]) == 1 || i11 == 4)) {
                    int iN = (dVar4.n() - this.f59133b.H.e()) - this.f59133b.J.e();
                    o.b(fVar2, dVar4.f57088d.f59139h, this.f59133b.H.e());
                    o.b(fVar, dVar4.f57088d.f59140i, -this.f59133b.J.e());
                    gVar.d(iN);
                    return;
                }
                if (i12 == 1) {
                    gVar.d(dVar6.n());
                }
            }
        } else if (this.f59135d == 4 && (dVar2 = (dVar = this.f59133b).S) != null && ((i5 = dVar2.f57109o0[0]) == 1 || i5 == 4)) {
            o.b(fVar2, dVar2.f57088d.f59139h, dVar.H.e());
            o.b(fVar, dVar2.f57088d.f59140i, -this.f59133b.J.e());
            return;
        }
        if (gVar.f59116j) {
            g4.d dVar7 = this.f59133b;
            if (dVar7.f57082a) {
                g4.c[] cVarArr = dVar7.P;
                g4.c cVar = cVarArr[0];
                g4.c cVar2 = cVar.f57078f;
                if (cVar2 != null && cVarArr[1].f57078f != null) {
                    if (dVar7.u()) {
                        fVar2.f59112f = this.f59133b.P[0].e();
                        fVar.f59112f = -this.f59133b.P[1].e();
                        return;
                    }
                    f fVarH = o.h(this.f59133b.P[0]);
                    if (fVarH != null) {
                        o.b(fVar2, fVarH, this.f59133b.P[0].e());
                    }
                    f fVarH2 = o.h(this.f59133b.P[1]);
                    if (fVarH2 != null) {
                        o.b(fVar, fVarH2, -this.f59133b.P[1].e());
                    }
                    fVar2.f59108b = true;
                    fVar.f59108b = true;
                    return;
                }
                if (cVar2 != null) {
                    f fVarH3 = o.h(cVar);
                    if (fVarH3 != null) {
                        o.b(fVar2, fVarH3, this.f59133b.P[0].e());
                        o.b(fVar, fVar2, gVar.f59113g);
                        return;
                    }
                    return;
                }
                g4.c cVar3 = cVarArr[1];
                if (cVar3.f57078f != null) {
                    f fVarH4 = o.h(cVar3);
                    if (fVarH4 != null) {
                        o.b(fVar, fVarH4, -this.f59133b.P[1].e());
                        o.b(fVar2, fVar, -gVar.f59113g);
                        return;
                    }
                    return;
                }
                if ((dVar7 instanceof g4.i) || dVar7.S == null || dVar7.i(7).f57078f != null) {
                    return;
                }
                g4.d dVar8 = this.f59133b;
                o.b(fVar2, dVar8.S.f57088d.f59139h, dVar8.o());
                o.b(fVar, fVar2, gVar.f59113g);
                return;
            }
        }
        if (this.f59135d == 3) {
            g4.d dVar9 = this.f59133b;
            int i13 = dVar9.f57111q;
            if (i13 == 2) {
                g4.d dVar10 = dVar9.S;
                if (dVar10 != null) {
                    g gVar2 = dVar10.f57090e.f59136e;
                    arrayList2.add(gVar2);
                    gVar2.f59117k.add(gVar);
                    gVar.f59108b = true;
                    arrayList.add(fVar2);
                    arrayList.add(fVar);
                }
            } else if (i13 == 3) {
                if (dVar9.f57112r == 3) {
                    fVar2.f59107a = this;
                    fVar.f59107a = this;
                    m mVar = dVar9.f57090e;
                    mVar.f59139h.f59107a = this;
                    mVar.f59140i.f59107a = this;
                    gVar.f59107a = this;
                    if (dVar9.v()) {
                        arrayList2.add(this.f59133b.f57090e.f59136e);
                        this.f59133b.f57090e.f59136e.f59117k.add(gVar);
                        m mVar2 = this.f59133b.f57090e;
                        mVar2.f59136e.f59107a = this;
                        arrayList2.add(mVar2.f59139h);
                        arrayList2.add(this.f59133b.f57090e.f59140i);
                        this.f59133b.f57090e.f59139h.f59117k.add(gVar);
                        this.f59133b.f57090e.f59140i.f59117k.add(gVar);
                    } else if (this.f59133b.u()) {
                        this.f59133b.f57090e.f59136e.f59118l.add(gVar);
                        arrayList.add(this.f59133b.f57090e.f59136e);
                    } else {
                        this.f59133b.f57090e.f59136e.f59118l.add(gVar);
                    }
                } else {
                    g gVar3 = dVar9.f57090e.f59136e;
                    arrayList2.add(gVar3);
                    gVar3.f59117k.add(gVar);
                    this.f59133b.f57090e.f59139h.f59117k.add(gVar);
                    this.f59133b.f57090e.f59140i.f59117k.add(gVar);
                    gVar.f59108b = true;
                    arrayList.add(fVar2);
                    arrayList.add(fVar);
                    fVar2.f59118l.add(gVar);
                    fVar.f59118l.add(gVar);
                }
            }
        }
        g4.d dVar11 = this.f59133b;
        g4.c[] cVarArr2 = dVar11.P;
        g4.c cVar4 = cVarArr2[0];
        g4.c cVar5 = cVar4.f57078f;
        if (cVar5 != null && cVarArr2[1].f57078f != null) {
            if (dVar11.u()) {
                fVar2.f59112f = this.f59133b.P[0].e();
                fVar.f59112f = -this.f59133b.P[1].e();
                return;
            }
            f fVarH5 = o.h(this.f59133b.P[0]);
            f fVarH6 = o.h(this.f59133b.P[1]);
            if (fVarH5 != null) {
                fVarH5.b(this);
            }
            if (fVarH6 != null) {
                fVarH6.b(this);
            }
            this.f59141j = 4;
            return;
        }
        if (cVar5 != null) {
            f fVarH7 = o.h(cVar4);
            if (fVarH7 != null) {
                o.b(fVar2, fVarH7, this.f59133b.P[0].e());
                c(fVar, fVar2, 1, gVar);
                return;
            }
            return;
        }
        g4.c cVar6 = cVarArr2[1];
        if (cVar6.f57078f != null) {
            f fVarH8 = o.h(cVar6);
            if (fVarH8 != null) {
                o.b(fVar, fVarH8, -this.f59133b.P[1].e());
                c(fVar2, fVar, -1, gVar);
                return;
            }
            return;
        }
        if ((dVar11 instanceof g4.i) || (dVar3 = dVar11.S) == null) {
            return;
        }
        o.b(fVar2, dVar3.f57088d.f59139h, dVar11.o());
        c(fVar, fVar2, 1, gVar);
    }

    @Override // h4.o
    public final void e() {
        f fVar = this.f59139h;
        if (fVar.f59116j) {
            this.f59133b.X = fVar.f59113g;
        }
    }

    @Override // h4.o
    public final void f() {
        this.f59134c = null;
        this.f59139h.c();
        this.f59140i.c();
        this.f59136e.c();
        this.f59138g = false;
    }

    @Override // h4.o
    public final boolean k() {
        return this.f59135d != 3 || this.f59133b.f57111q == 0;
    }

    public final void n() {
        this.f59138g = false;
        f fVar = this.f59139h;
        fVar.c();
        fVar.f59116j = false;
        f fVar2 = this.f59140i;
        fVar2.c();
        fVar2.f59116j = false;
        this.f59136e.f59116j = false;
    }

    public final String toString() {
        return "HorizontalRun " + this.f59133b.f57095g0;
    }
}
