package g4;

import fa.u;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class g extends i {
    public h4.b A0;
    public u B0;
    public int C0;
    public int D0;
    public int E0;
    public int F0;
    public int G0;
    public int H0;
    public float I0;
    public float J0;
    public float K0;
    public float L0;
    public float M0;
    public float N0;
    public int O0;
    public int P0;
    public int Q0;
    public int R0;
    public int S0;
    public int T0;
    public int U0;
    public ArrayList V0;
    public d[] W0;
    public d[] X0;
    public int[] Y0;
    public d[] Z0;

    /* renamed from: a1, reason: collision with root package name */
    public int f57148a1;

    /* renamed from: r0, reason: collision with root package name */
    public int f57149r0;

    /* renamed from: s0, reason: collision with root package name */
    public int f57150s0;

    /* renamed from: t0, reason: collision with root package name */
    public int f57151t0;

    /* renamed from: u0, reason: collision with root package name */
    public int f57152u0;

    /* renamed from: v0, reason: collision with root package name */
    public int f57153v0;

    /* renamed from: w0, reason: collision with root package name */
    public int f57154w0;

    /* renamed from: x0, reason: collision with root package name */
    public boolean f57155x0;

    /* renamed from: y0, reason: collision with root package name */
    public int f57156y0;

    /* renamed from: z0, reason: collision with root package name */
    public int f57157z0;

    @Override // g4.i
    public final void N() {
        for (int i5 = 0; i5 < this.f57165q0; i5++) {
            d dVar = this.f57164p0[i5];
            if (dVar != null) {
                dVar.E = true;
            }
        }
    }

    public final int O(d dVar, int i5) {
        d dVar2;
        if (dVar != null) {
            int[] iArr = dVar.f57109o0;
            if (iArr[1] == 3) {
                int i11 = dVar.f57112r;
                if (i11 != 0) {
                    if (i11 == 2) {
                        int i12 = (int) (dVar.f57119y * i5);
                        if (i12 != dVar.k()) {
                            dVar.f57094g = true;
                            Q(iArr[0], dVar.n(), 1, i12, dVar);
                        }
                        return i12;
                    }
                    dVar2 = dVar;
                    if (i11 == 1) {
                        return dVar2.k();
                    }
                    if (i11 == 3) {
                        return (int) ((dVar2.n() * dVar2.V) + 0.5f);
                    }
                }
            } else {
                dVar2 = dVar;
            }
            return dVar2.k();
        }
        return 0;
    }

    public final int P(d dVar, int i5) {
        d dVar2;
        if (dVar != null) {
            int[] iArr = dVar.f57109o0;
            if (iArr[0] == 3) {
                int i11 = dVar.f57111q;
                if (i11 != 0) {
                    if (i11 == 2) {
                        int i12 = (int) (dVar.f57116v * i5);
                        if (i12 != dVar.n()) {
                            dVar.f57094g = true;
                            Q(1, i12, iArr[1], dVar.k(), dVar);
                        }
                        return i12;
                    }
                    dVar2 = dVar;
                    if (i11 == 1) {
                        return dVar2.n();
                    }
                    if (i11 == 3) {
                        return (int) ((dVar2.k() * dVar2.V) + 0.5f);
                    }
                }
            } else {
                dVar2 = dVar;
            }
            return dVar2.n();
        }
        return 0;
    }

    public final void Q(int i5, int i11, int i12, int i13, d dVar) {
        u uVar;
        d dVar2;
        h4.b bVar = this.A0;
        while (true) {
            uVar = this.B0;
            if (uVar != null || (dVar2 = this.S) == null) {
                break;
            } else {
                this.B0 = ((e) dVar2).f57125t0;
            }
        }
        bVar.f59086a = i5;
        bVar.f59087b = i12;
        bVar.f59088c = i11;
        bVar.f59089d = i13;
        uVar.f(dVar, bVar);
        dVar.J(bVar.f59090e);
        dVar.G(bVar.f59091f);
        dVar.D = bVar.f59093h;
        dVar.D(bVar.f59092g);
    }

    @Override // g4.d
    public final void b(e4.c cVar, boolean z11) {
        d dVar;
        float f11;
        int i5;
        ArrayList arrayList = this.V0;
        super.b(cVar, z11);
        d dVar2 = this.S;
        boolean z12 = dVar2 != null && ((e) dVar2).f57126u0;
        int i11 = this.S0;
        if (i11 != 0) {
            if (i11 == 1) {
                int size = arrayList.size();
                int i12 = 0;
                while (i12 < size) {
                    ((f) arrayList.get(i12)).b(i12, z12, i12 == size + (-1));
                    i12++;
                }
            } else if (i11 != 2) {
                if (i11 == 3) {
                    int size2 = arrayList.size();
                    int i13 = 0;
                    while (i13 < size2) {
                        ((f) arrayList.get(i13)).b(i13, z12, i13 == size2 + (-1));
                        i13++;
                    }
                }
            } else if (this.Y0 != null && this.X0 != null && this.W0 != null) {
                for (int i14 = 0; i14 < this.f57148a1; i14++) {
                    this.Z0[i14].A();
                }
                int[] iArr = this.Y0;
                int i15 = iArr[0];
                int i16 = iArr[1];
                float f12 = this.I0;
                d dVar3 = null;
                int i17 = 0;
                while (i17 < i15) {
                    if (z12) {
                        i5 = (i15 - i17) - 1;
                        f11 = 1.0f - this.I0;
                    } else {
                        f11 = f12;
                        i5 = i17;
                    }
                    d dVar4 = this.X0[i5];
                    if (dVar4 != null) {
                        c cVar2 = dVar4.H;
                        if (dVar4.f57093f0 != 8) {
                            if (i17 == 0) {
                                dVar4.f(cVar2, this.H, this.f57153v0);
                                dVar4.f57097h0 = this.C0;
                                dVar4.f57087c0 = f11;
                            }
                            if (i17 == i15 - 1) {
                                dVar4.f(dVar4.J, this.J, this.f57154w0);
                            }
                            if (i17 > 0 && dVar3 != null) {
                                c cVar3 = dVar3.J;
                                dVar4.f(cVar2, cVar3, this.O0);
                                dVar3.f(cVar3, cVar2, 0);
                            }
                            dVar3 = dVar4;
                        }
                    }
                    i17++;
                    f12 = f11;
                }
                for (int i18 = 0; i18 < i16; i18++) {
                    d dVar5 = this.W0[i18];
                    if (dVar5 != null) {
                        c cVar4 = dVar5.I;
                        if (dVar5.f57093f0 != 8) {
                            if (i18 == 0) {
                                dVar5.f(cVar4, this.I, this.f57149r0);
                                dVar5.f57099i0 = this.D0;
                                dVar5.f57089d0 = this.J0;
                            }
                            if (i18 == i16 - 1) {
                                dVar5.f(dVar5.K, this.K, this.f57150s0);
                            }
                            if (i18 > 0 && dVar3 != null) {
                                c cVar5 = dVar3.K;
                                dVar5.f(cVar4, cVar5, this.P0);
                                dVar3.f(cVar5, cVar4, 0);
                            }
                            dVar3 = dVar5;
                        }
                    }
                }
                for (int i19 = 0; i19 < i15; i19++) {
                    for (int i21 = 0; i21 < i16; i21++) {
                        int i22 = (i21 * i15) + i19;
                        if (this.U0 == 1) {
                            i22 = (i19 * i16) + i21;
                        }
                        d[] dVarArr = this.Z0;
                        if (i22 < dVarArr.length && (dVar = dVarArr[i22]) != null && dVar.f57093f0 != 8) {
                            d dVar6 = this.X0[i19];
                            d dVar7 = this.W0[i21];
                            if (dVar != dVar6) {
                                dVar.f(dVar.H, dVar6.H, 0);
                                dVar.f(dVar.J, dVar6.J, 0);
                            }
                            if (dVar != dVar7) {
                                dVar.f(dVar.I, dVar7.I, 0);
                                dVar.f(dVar.K, dVar7.K, 0);
                            }
                        }
                    }
                }
            }
        } else if (arrayList.size() > 0) {
            ((f) arrayList.get(0)).b(0, z12, true);
        }
        this.f57155x0 = false;
    }
}
