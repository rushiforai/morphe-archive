package h4;

import b.c0;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class m extends o {

    /* renamed from: k, reason: collision with root package name */
    public f f59124k;

    /* renamed from: l, reason: collision with root package name */
    public a f59125l;

    @Override // h4.d
    public final void a(d dVar) {
        float f11;
        float f12;
        float f13;
        int i5;
        if (c0.F(this.f59141j) == 3) {
            g4.d dVar2 = this.f59133b;
            l(dVar2.I, dVar2.K, 1);
            return;
        }
        g gVar = this.f59136e;
        if (gVar.f59109c && !gVar.f59116j && this.f59135d == 3) {
            g4.d dVar3 = this.f59133b;
            int i11 = dVar3.f57112r;
            if (i11 == 2) {
                g4.d dVar4 = dVar3.S;
                if (dVar4 != null) {
                    if (dVar4.f57090e.f59136e.f59116j) {
                        gVar.d((int) ((r5.f59113g * dVar3.f57119y) + 0.5f));
                    }
                }
            } else if (i11 == 3) {
                g gVar2 = dVar3.f57088d.f59136e;
                if (gVar2.f59116j) {
                    int i12 = dVar3.W;
                    if (i12 == -1) {
                        f11 = gVar2.f59113g;
                        f12 = dVar3.V;
                    } else if (i12 == 0) {
                        f13 = gVar2.f59113g * dVar3.V;
                        i5 = (int) (f13 + 0.5f);
                        gVar.d(i5);
                    } else if (i12 != 1) {
                        i5 = 0;
                        gVar.d(i5);
                    } else {
                        f11 = gVar2.f59113g;
                        f12 = dVar3.V;
                    }
                    f13 = f11 / f12;
                    i5 = (int) (f13 + 0.5f);
                    gVar.d(i5);
                }
            }
        }
        f fVar = this.f59139h;
        boolean z11 = fVar.f59109c;
        ArrayList arrayList = fVar.f59118l;
        if (z11) {
            f fVar2 = this.f59140i;
            boolean z12 = fVar2.f59109c;
            ArrayList arrayList2 = fVar2.f59118l;
            if (z12) {
                if (fVar.f59116j && fVar2.f59116j && gVar.f59116j) {
                    return;
                }
                if (!gVar.f59116j && this.f59135d == 3) {
                    g4.d dVar5 = this.f59133b;
                    if (dVar5.f57111q == 0 && !dVar5.v()) {
                        f fVar3 = (f) arrayList.get(0);
                        f fVar4 = (f) arrayList2.get(0);
                        int i13 = fVar3.f59113g + fVar.f59112f;
                        int i14 = fVar4.f59113g + fVar2.f59112f;
                        fVar.d(i13);
                        fVar2.d(i14);
                        gVar.d(i14 - i13);
                        return;
                    }
                }
                if (!gVar.f59116j && this.f59135d == 3 && this.f59132a == 1 && arrayList.size() > 0 && arrayList2.size() > 0) {
                    f fVar5 = (f) arrayList.get(0);
                    int i15 = (((f) arrayList2.get(0)).f59113g + fVar2.f59112f) - (fVar5.f59113g + fVar.f59112f);
                    int i16 = gVar.f59119m;
                    if (i15 < i16) {
                        gVar.d(i15);
                    } else {
                        gVar.d(i16);
                    }
                }
                if (gVar.f59116j && arrayList.size() > 0 && arrayList2.size() > 0) {
                    f fVar6 = (f) arrayList.get(0);
                    f fVar7 = (f) arrayList2.get(0);
                    int i17 = fVar6.f59113g;
                    int i18 = fVar.f59112f + i17;
                    int i19 = fVar7.f59113g;
                    int i21 = fVar2.f59112f + i19;
                    float f14 = this.f59133b.f57089d0;
                    if (fVar6 == fVar7) {
                        f14 = 0.5f;
                    } else {
                        i17 = i18;
                        i19 = i21;
                    }
                    fVar.d((int) ((((i19 - i17) - gVar.f59113g) * f14) + i17 + 0.5f));
                    fVar2.d(fVar.f59113g + gVar.f59113g);
                }
            }
        }
    }

    @Override // h4.o
    public final void d() {
        g4.d dVar;
        g4.d dVar2;
        g4.d dVar3;
        g4.d dVar4;
        f fVar = this.f59124k;
        g4.d dVar5 = this.f59133b;
        boolean z11 = dVar5.f57082a;
        g gVar = this.f59136e;
        if (z11) {
            gVar.d(dVar5.k());
        }
        boolean z12 = gVar.f59116j;
        ArrayList arrayList = gVar.f59117k;
        ArrayList arrayList2 = gVar.f59118l;
        f fVar2 = this.f59140i;
        f fVar3 = this.f59139h;
        if (!z12) {
            g4.d dVar6 = this.f59133b;
            this.f59135d = dVar6.f57109o0[1];
            if (dVar6.D) {
                this.f59125l = new a(this);
            }
            int i5 = this.f59135d;
            if (i5 != 3) {
                if (i5 == 4 && (dVar4 = this.f59133b.S) != null && dVar4.f57109o0[1] == 1) {
                    int iK = (dVar4.k() - this.f59133b.I.e()) - this.f59133b.K.e();
                    o.b(fVar3, dVar4.f57090e.f59139h, this.f59133b.I.e());
                    o.b(fVar2, dVar4.f57090e.f59140i, -this.f59133b.K.e());
                    gVar.d(iK);
                    return;
                }
                if (i5 == 1) {
                    gVar.d(this.f59133b.k());
                }
            }
        } else if (this.f59135d == 4 && (dVar2 = (dVar = this.f59133b).S) != null && dVar2.f57109o0[1] == 1) {
            o.b(fVar3, dVar2.f57090e.f59139h, dVar.I.e());
            o.b(fVar2, dVar2.f57090e.f59140i, -this.f59133b.K.e());
            return;
        }
        boolean z13 = gVar.f59116j;
        if (z13) {
            g4.d dVar7 = this.f59133b;
            if (dVar7.f57082a) {
                g4.c[] cVarArr = dVar7.P;
                g4.c cVar = cVarArr[2];
                g4.c cVar2 = cVar.f57078f;
                if (cVar2 != null && cVarArr[3].f57078f != null) {
                    if (dVar7.v()) {
                        fVar3.f59112f = this.f59133b.P[2].e();
                        fVar2.f59112f = -this.f59133b.P[3].e();
                    } else {
                        f fVarH = o.h(this.f59133b.P[2]);
                        if (fVarH != null) {
                            o.b(fVar3, fVarH, this.f59133b.P[2].e());
                        }
                        f fVarH2 = o.h(this.f59133b.P[3]);
                        if (fVarH2 != null) {
                            o.b(fVar2, fVarH2, -this.f59133b.P[3].e());
                        }
                        fVar3.f59108b = true;
                        fVar2.f59108b = true;
                    }
                    g4.d dVar8 = this.f59133b;
                    if (dVar8.D) {
                        o.b(fVar, fVar3, dVar8.Z);
                        return;
                    }
                    return;
                }
                if (cVar2 != null) {
                    f fVarH3 = o.h(cVar);
                    if (fVarH3 != null) {
                        o.b(fVar3, fVarH3, this.f59133b.P[2].e());
                        o.b(fVar2, fVar3, gVar.f59113g);
                        g4.d dVar9 = this.f59133b;
                        if (dVar9.D) {
                            o.b(fVar, fVar3, dVar9.Z);
                            return;
                        }
                        return;
                    }
                    return;
                }
                g4.c cVar3 = cVarArr[3];
                if (cVar3.f57078f != null) {
                    f fVarH4 = o.h(cVar3);
                    if (fVarH4 != null) {
                        o.b(fVar2, fVarH4, -this.f59133b.P[3].e());
                        o.b(fVar3, fVar2, -gVar.f59113g);
                    }
                    g4.d dVar10 = this.f59133b;
                    if (dVar10.D) {
                        o.b(fVar, fVar3, dVar10.Z);
                        return;
                    }
                    return;
                }
                g4.c cVar4 = cVarArr[4];
                if (cVar4.f57078f != null) {
                    f fVarH5 = o.h(cVar4);
                    if (fVarH5 != null) {
                        o.b(fVar, fVarH5, 0);
                        o.b(fVar3, fVar, -this.f59133b.Z);
                        o.b(fVar2, fVar3, gVar.f59113g);
                        return;
                    }
                    return;
                }
                if ((dVar7 instanceof g4.i) || dVar7.S == null || dVar7.i(7).f57078f != null) {
                    return;
                }
                g4.d dVar11 = this.f59133b;
                o.b(fVar3, dVar11.S.f57090e.f59139h, dVar11.p());
                o.b(fVar2, fVar3, gVar.f59113g);
                g4.d dVar12 = this.f59133b;
                if (dVar12.D) {
                    o.b(fVar, fVar3, dVar12.Z);
                    return;
                }
                return;
            }
        }
        if (z13 || this.f59135d != 3) {
            gVar.b(this);
        } else {
            g4.d dVar13 = this.f59133b;
            int i11 = dVar13.f57112r;
            if (i11 == 2) {
                g4.d dVar14 = dVar13.S;
                if (dVar14 != null) {
                    g gVar2 = dVar14.f57090e.f59136e;
                    arrayList2.add(gVar2);
                    gVar2.f59117k.add(gVar);
                    gVar.f59108b = true;
                    arrayList.add(fVar3);
                    arrayList.add(fVar2);
                }
            } else if (i11 == 3 && !dVar13.v()) {
                g4.d dVar15 = this.f59133b;
                if (dVar15.f57111q != 3) {
                    g gVar3 = dVar15.f57088d.f59136e;
                    arrayList2.add(gVar3);
                    gVar3.f59117k.add(gVar);
                    gVar.f59108b = true;
                    arrayList.add(fVar3);
                    arrayList.add(fVar2);
                }
            }
        }
        g4.d dVar16 = this.f59133b;
        g4.c[] cVarArr2 = dVar16.P;
        g4.c cVar5 = cVarArr2[2];
        g4.c cVar6 = cVar5.f57078f;
        if (cVar6 != null && cVarArr2[3].f57078f != null) {
            if (dVar16.v()) {
                fVar3.f59112f = this.f59133b.P[2].e();
                fVar2.f59112f = -this.f59133b.P[3].e();
            } else {
                f fVarH6 = o.h(this.f59133b.P[2]);
                f fVarH7 = o.h(this.f59133b.P[3]);
                if (fVarH6 != null) {
                    fVarH6.b(this);
                }
                if (fVarH7 != null) {
                    fVarH7.b(this);
                }
                this.f59141j = 4;
            }
            if (this.f59133b.D) {
                c(fVar, fVar3, 1, this.f59125l);
            }
        } else if (cVar6 != null) {
            f fVarH8 = o.h(cVar5);
            if (fVarH8 != null) {
                o.b(fVar3, fVarH8, this.f59133b.P[2].e());
                c(fVar2, fVar3, 1, gVar);
                if (this.f59133b.D) {
                    c(fVar, fVar3, 1, this.f59125l);
                }
                if (this.f59135d == 3) {
                    g4.d dVar17 = this.f59133b;
                    if (dVar17.V > 0.0f) {
                        k kVar = dVar17.f57088d;
                        if (kVar.f59135d == 3) {
                            kVar.f59136e.f59117k.add(gVar);
                            arrayList2.add(this.f59133b.f57088d.f59136e);
                            gVar.f59107a = this;
                        }
                    }
                }
            }
        } else {
            g4.c cVar7 = cVarArr2[3];
            if (cVar7.f57078f != null) {
                f fVarH9 = o.h(cVar7);
                if (fVarH9 != null) {
                    o.b(fVar2, fVarH9, -this.f59133b.P[3].e());
                    c(fVar3, fVar2, -1, gVar);
                    if (this.f59133b.D) {
                        c(fVar, fVar3, 1, this.f59125l);
                    }
                }
            } else {
                g4.c cVar8 = cVarArr2[4];
                if (cVar8.f57078f != null) {
                    f fVarH10 = o.h(cVar8);
                    if (fVarH10 != null) {
                        o.b(fVar, fVarH10, 0);
                        c(fVar3, fVar, -1, this.f59125l);
                        c(fVar2, fVar3, 1, gVar);
                    }
                } else if (!(dVar16 instanceof g4.i) && (dVar3 = dVar16.S) != null) {
                    o.b(fVar3, dVar3.f57090e.f59139h, dVar16.p());
                    c(fVar2, fVar3, 1, gVar);
                    if (this.f59133b.D) {
                        c(fVar, fVar3, 1, this.f59125l);
                    }
                    if (this.f59135d == 3) {
                        g4.d dVar18 = this.f59133b;
                        if (dVar18.V > 0.0f) {
                            k kVar2 = dVar18.f57088d;
                            if (kVar2.f59135d == 3) {
                                kVar2.f59136e.f59117k.add(gVar);
                                arrayList2.add(this.f59133b.f57088d.f59136e);
                                gVar.f59107a = this;
                            }
                        }
                    }
                }
            }
        }
        if (arrayList2.size() == 0) {
            gVar.f59109c = true;
        }
    }

    @Override // h4.o
    public final void e() {
        f fVar = this.f59139h;
        if (fVar.f59116j) {
            this.f59133b.Y = fVar.f59113g;
        }
    }

    @Override // h4.o
    public final void f() {
        this.f59134c = null;
        this.f59139h.c();
        this.f59140i.c();
        this.f59124k.c();
        this.f59136e.c();
        this.f59138g = false;
    }

    @Override // h4.o
    public final boolean k() {
        return this.f59135d != 3 || this.f59133b.f57112r == 0;
    }

    public final void m() {
        this.f59138g = false;
        f fVar = this.f59139h;
        fVar.c();
        fVar.f59116j = false;
        f fVar2 = this.f59140i;
        fVar2.c();
        fVar2.f59116j = false;
        f fVar3 = this.f59124k;
        fVar3.c();
        fVar3.f59116j = false;
        this.f59136e.f59116j = false;
    }

    public final String toString() {
        return "VerticalRun " + this.f59133b.f57095g0;
    }
}
