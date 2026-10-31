package g4;

/* loaded from: classes2.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public int f57132a;

    /* renamed from: d, reason: collision with root package name */
    public c f57135d;

    /* renamed from: e, reason: collision with root package name */
    public c f57136e;

    /* renamed from: f, reason: collision with root package name */
    public c f57137f;

    /* renamed from: g, reason: collision with root package name */
    public c f57138g;

    /* renamed from: h, reason: collision with root package name */
    public int f57139h;

    /* renamed from: i, reason: collision with root package name */
    public int f57140i;

    /* renamed from: j, reason: collision with root package name */
    public int f57141j;

    /* renamed from: k, reason: collision with root package name */
    public int f57142k;

    /* renamed from: q, reason: collision with root package name */
    public int f57146q;

    /* renamed from: r, reason: collision with root package name */
    public final /* synthetic */ g f57147r;

    /* renamed from: b, reason: collision with root package name */
    public d f57133b = null;

    /* renamed from: c, reason: collision with root package name */
    public int f57134c = 0;

    /* renamed from: l, reason: collision with root package name */
    public int f57143l = 0;

    /* renamed from: m, reason: collision with root package name */
    public int f57144m = 0;
    public int n = 0;
    public int o = 0;

    /* renamed from: p, reason: collision with root package name */
    public int f57145p = 0;

    public f(g gVar, int i5, c cVar, c cVar2, c cVar3, c cVar4, int i11) {
        this.f57147r = gVar;
        this.f57132a = i5;
        this.f57135d = cVar;
        this.f57136e = cVar2;
        this.f57137f = cVar3;
        this.f57138g = cVar4;
        this.f57139h = gVar.f57153v0;
        this.f57140i = gVar.f57149r0;
        this.f57141j = gVar.f57154w0;
        this.f57142k = gVar.f57150s0;
        this.f57146q = i11;
    }

    public final void a(d dVar) {
        int i5 = this.f57132a;
        g gVar = this.f57147r;
        if (i5 == 0) {
            int iP = gVar.P(dVar, this.f57146q);
            if (dVar.f57109o0[0] == 3) {
                this.f57145p++;
                iP = 0;
            }
            this.f57143l = iP + (dVar.f57093f0 != 8 ? gVar.O0 : 0) + this.f57143l;
            int iO = gVar.O(dVar, this.f57146q);
            if (this.f57133b == null || this.f57134c < iO) {
                this.f57133b = dVar;
                this.f57134c = iO;
                this.f57144m = iO;
            }
        } else {
            int iP2 = gVar.P(dVar, this.f57146q);
            int iO2 = gVar.O(dVar, this.f57146q);
            if (dVar.f57109o0[1] == 3) {
                this.f57145p++;
                iO2 = 0;
            }
            this.f57144m = iO2 + (dVar.f57093f0 != 8 ? gVar.P0 : 0) + this.f57144m;
            if (this.f57133b == null || this.f57134c < iP2) {
                this.f57133b = dVar;
                this.f57134c = iP2;
                this.f57143l = iP2;
            }
        }
        this.o++;
    }

    public final void b(int i5, boolean z11, boolean z12) {
        g gVar;
        int i11;
        int i12;
        d dVar;
        boolean z13;
        int i13;
        int i14;
        char c11;
        float f11;
        float f12;
        float f13;
        int i15;
        float f14;
        float f15;
        int i16;
        int i17 = this.o;
        int i18 = 0;
        while (true) {
            gVar = this.f57147r;
            if (i18 >= i17 || (i16 = this.n + i18) >= gVar.f57148a1) {
                break;
            }
            d dVar2 = gVar.Z0[i16];
            if (dVar2 != null) {
                dVar2.A();
            }
            i18++;
        }
        if (i17 == 0 || this.f57133b == null) {
            return;
        }
        boolean z14 = z12 && i5 == 0;
        int i19 = -1;
        int i21 = -1;
        for (int i22 = 0; i22 < i17; i22++) {
            int i23 = this.n + (z11 ? (i17 - 1) - i22 : i22);
            if (i23 >= gVar.f57148a1) {
                break;
            }
            d dVar3 = gVar.Z0[i23];
            if (dVar3 != null && dVar3.f57093f0 == 0) {
                if (i19 == -1) {
                    i19 = i22;
                }
                i21 = i22;
            }
        }
        if (this.f57132a == 0) {
            d dVar4 = this.f57133b;
            dVar4.f57099i0 = gVar.D0;
            c cVar = dVar4.K;
            c cVar2 = dVar4.I;
            int i24 = this.f57140i;
            if (i5 > 0) {
                i24 += gVar.P0;
            }
            cVar2.a(this.f57136e, i24);
            if (z12) {
                cVar.a(this.f57138g, this.f57142k);
            }
            if (i5 > 0) {
                this.f57136e.f57076d.K.a(cVar2, 0);
            }
            if (gVar.R0 != 3 || dVar4.D) {
                dVar = dVar4;
            } else {
                for (int i25 = 0; i25 < i17; i25++) {
                    int i26 = this.n + (z11 ? (i17 - 1) - i25 : i25);
                    if (i26 >= gVar.f57148a1) {
                        break;
                    }
                    dVar = gVar.Z0[i26];
                    if (dVar.D) {
                        break;
                    }
                }
                dVar = dVar4;
            }
            int i27 = 0;
            d dVar5 = null;
            while (i27 < i17) {
                int i28 = z11 ? (i17 - 1) - i27 : i27;
                int i29 = this.n + i28;
                if (i29 >= gVar.f57148a1) {
                    return;
                }
                d dVar6 = gVar.Z0[i29];
                if (dVar6 == null) {
                    i14 = i17;
                    z13 = z14;
                    i13 = i21;
                    c11 = 3;
                } else {
                    c cVar3 = dVar6.K;
                    c cVar4 = dVar6.I;
                    c cVar5 = dVar6.H;
                    z13 = z14;
                    if (i27 == 0) {
                        i13 = i21;
                        dVar6.f(cVar5, this.f57135d, this.f57139h);
                    } else {
                        i13 = i21;
                    }
                    if (i28 == 0) {
                        int i31 = gVar.C0;
                        if (z11) {
                            f11 = 1.0f;
                            f12 = 1.0f - gVar.I0;
                        } else {
                            f11 = 1.0f;
                            f12 = gVar.I0;
                        }
                        if (this.n == 0) {
                            i15 = gVar.E0;
                            f13 = f12;
                            if (i15 != -1) {
                                if (z11) {
                                    f15 = gVar.K0;
                                    f14 = f11 - f15;
                                    dVar6.f57097h0 = i15;
                                    dVar6.f57087c0 = f14;
                                } else {
                                    f14 = gVar.K0;
                                    dVar6.f57097h0 = i15;
                                    dVar6.f57087c0 = f14;
                                }
                            }
                        } else {
                            f13 = f12;
                        }
                        if (!z12 || (i15 = gVar.G0) == -1) {
                            i15 = i31;
                            f14 = f13;
                        } else if (z11) {
                            f15 = gVar.M0;
                            f14 = f11 - f15;
                        } else {
                            f14 = gVar.M0;
                        }
                        dVar6.f57097h0 = i15;
                        dVar6.f57087c0 = f14;
                    }
                    if (i27 == i17 - 1) {
                        i14 = i17;
                        dVar6.f(dVar6.J, this.f57137f, this.f57141j);
                    } else {
                        i14 = i17;
                    }
                    if (dVar5 != null) {
                        c cVar6 = dVar5.J;
                        cVar5.a(cVar6, gVar.O0);
                        if (i27 == i19) {
                            int i32 = this.f57139h;
                            if (cVar5.h()) {
                                cVar5.f57080h = i32;
                            }
                        }
                        cVar6.a(cVar5, 0);
                        if (i27 == i13 + 1) {
                            int i33 = this.f57141j;
                            if (cVar6.h()) {
                                cVar6.f57080h = i33;
                            }
                        }
                    }
                    if (dVar6 != dVar4) {
                        int i34 = gVar.R0;
                        c11 = 3;
                        if (i34 == 3 && dVar.D && dVar6 != dVar && dVar6.D) {
                            dVar6.L.a(dVar.L, 0);
                        } else if (i34 == 0) {
                            cVar4.a(cVar2, 0);
                        } else if (i34 == 1) {
                            cVar3.a(cVar, 0);
                        } else if (z13) {
                            cVar4.a(this.f57136e, this.f57140i);
                            cVar3.a(this.f57138g, this.f57142k);
                        } else {
                            cVar4.a(cVar2, 0);
                            cVar3.a(cVar, 0);
                        }
                    } else {
                        c11 = 3;
                    }
                    dVar5 = dVar6;
                }
                i27++;
                z14 = z13;
                i21 = i13;
                i17 = i14;
            }
            return;
        }
        int i35 = i17;
        boolean z15 = z14;
        int i36 = i21;
        d dVar7 = this.f57133b;
        dVar7.f57097h0 = gVar.C0;
        c cVar7 = dVar7.H;
        c cVar8 = dVar7.J;
        int i37 = this.f57139h;
        if (i5 > 0) {
            i37 += gVar.O0;
        }
        if (z11) {
            cVar8.a(this.f57137f, i37);
            if (z12) {
                cVar7.a(this.f57135d, this.f57141j);
            }
            if (i5 > 0) {
                this.f57137f.f57076d.H.a(cVar8, 0);
            }
        } else {
            cVar7.a(this.f57135d, i37);
            if (z12) {
                cVar8.a(this.f57137f, this.f57141j);
            }
            if (i5 > 0) {
                this.f57135d.f57076d.J.a(cVar7, 0);
            }
        }
        int i38 = 0;
        d dVar8 = null;
        while (true) {
            int i39 = i35;
            if (i38 >= i39 || (i11 = this.n + i38) >= gVar.f57148a1) {
                return;
            }
            d dVar9 = gVar.Z0[i11];
            if (dVar9 == null) {
                i35 = i39;
            } else {
                c cVar9 = dVar9.I;
                c cVar10 = dVar9.J;
                c cVar11 = dVar9.H;
                if (i38 == 0) {
                    dVar9.f(cVar9, this.f57136e, this.f57140i);
                    int i40 = gVar.D0;
                    float f16 = gVar.J0;
                    if (this.n == 0) {
                        int i41 = gVar.F0;
                        i35 = i39;
                        i12 = -1;
                        if (i41 != -1) {
                            f16 = gVar.L0;
                        }
                        i40 = i41;
                        dVar9.f57099i0 = i40;
                        dVar9.f57089d0 = f16;
                    } else {
                        i35 = i39;
                        i12 = -1;
                    }
                    if (z12 && (i41 = gVar.H0) != i12) {
                        f16 = gVar.N0;
                        i40 = i41;
                    }
                    dVar9.f57099i0 = i40;
                    dVar9.f57089d0 = f16;
                } else {
                    i35 = i39;
                }
                if (i38 == i35 - 1) {
                    dVar9.f(dVar9.K, this.f57138g, this.f57142k);
                }
                if (dVar8 != null) {
                    c cVar12 = dVar8.K;
                    cVar9.a(cVar12, gVar.P0);
                    if (i38 == i19) {
                        int i42 = this.f57140i;
                        if (cVar9.h()) {
                            cVar9.f57080h = i42;
                        }
                    }
                    cVar12.a(cVar9, 0);
                    if (i38 == i36 + 1) {
                        int i43 = this.f57142k;
                        if (cVar12.h()) {
                            cVar12.f57080h = i43;
                        }
                    }
                }
                if (dVar9 == dVar7) {
                    dVar8 = dVar9;
                } else if (z11) {
                    int i44 = gVar.Q0;
                    if (i44 == 0) {
                        cVar10.a(cVar8, 0);
                    } else if (i44 == 1) {
                        cVar11.a(cVar7, 0);
                    } else if (i44 == 2) {
                        cVar11.a(cVar7, 0);
                        cVar10.a(cVar8, 0);
                    }
                    dVar8 = dVar9;
                } else {
                    int i45 = gVar.Q0;
                    if (i45 == 0) {
                        cVar11.a(cVar7, 0);
                    } else if (i45 == 1) {
                        cVar10.a(cVar8, 0);
                    } else if (i45 == 2) {
                        if (z15) {
                            cVar11.a(this.f57135d, this.f57139h);
                            cVar10.a(this.f57137f, this.f57141j);
                        } else {
                            cVar11.a(cVar7, 0);
                            cVar10.a(cVar8, 0);
                        }
                    }
                    dVar8 = dVar9;
                }
            }
            i38++;
        }
    }

    public final int c() {
        return this.f57132a == 1 ? this.f57144m - this.f57147r.P0 : this.f57144m;
    }

    public final int d() {
        return this.f57132a == 0 ? this.f57143l - this.f57147r.O0 : this.f57143l;
    }

    public final void e(int i5) {
        g gVar;
        int i11;
        int i12 = this.f57145p;
        if (i12 == 0) {
            return;
        }
        int i13 = this.o;
        int i14 = i5 / i12;
        int i15 = 0;
        while (true) {
            gVar = this.f57147r;
            if (i15 >= i13 || (i11 = this.n + i15) >= gVar.f57148a1) {
                break;
            }
            d dVar = gVar.Z0[i11];
            if (this.f57132a == 0) {
                if (dVar != null) {
                    int[] iArr = dVar.f57109o0;
                    if (iArr[0] == 3 && dVar.f57111q == 0) {
                        gVar.Q(1, i14, iArr[1], dVar.k(), dVar);
                    }
                }
            } else if (dVar != null) {
                int[] iArr2 = dVar.f57109o0;
                if (iArr2[1] == 3 && dVar.f57112r == 0) {
                    int i16 = i14;
                    gVar.Q(iArr2[0], dVar.n(), 1, i16, dVar);
                    i14 = i16;
                }
            }
            i15++;
        }
        this.f57143l = 0;
        this.f57144m = 0;
        this.f57133b = null;
        this.f57134c = 0;
        int i17 = this.o;
        for (int i18 = 0; i18 < i17; i18++) {
            int i19 = this.n + i18;
            if (i19 >= gVar.f57148a1) {
                return;
            }
            d dVar2 = gVar.Z0[i19];
            if (this.f57132a == 0) {
                int iN = dVar2.n();
                int i21 = gVar.O0;
                if (dVar2.f57093f0 == 8) {
                    i21 = 0;
                }
                this.f57143l = iN + i21 + this.f57143l;
                int iO = gVar.O(dVar2, this.f57146q);
                if (this.f57133b == null || this.f57134c < iO) {
                    this.f57133b = dVar2;
                    this.f57134c = iO;
                    this.f57144m = iO;
                }
            } else {
                int iP = gVar.P(dVar2, this.f57146q);
                int iO2 = gVar.O(dVar2, this.f57146q);
                int i22 = gVar.P0;
                if (dVar2.f57093f0 == 8) {
                    i22 = 0;
                }
                this.f57144m = iO2 + i22 + this.f57144m;
                if (this.f57133b == null || this.f57134c < iP) {
                    this.f57133b = dVar2;
                    this.f57134c = iP;
                    this.f57143l = iP;
                }
            }
        }
    }

    public final void f(int i5, c cVar, c cVar2, c cVar3, c cVar4, int i11, int i12, int i13, int i14, int i15) {
        this.f57132a = i5;
        this.f57135d = cVar;
        this.f57136e = cVar2;
        this.f57137f = cVar3;
        this.f57138g = cVar4;
        this.f57139h = i11;
        this.f57140i = i12;
        this.f57141j = i13;
        this.f57142k = i14;
        this.f57146q = i15;
    }
}
