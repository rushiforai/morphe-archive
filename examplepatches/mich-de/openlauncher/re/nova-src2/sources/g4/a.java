package g4;

import b.c0;

/* loaded from: classes2.dex */
public final class a extends i {

    /* renamed from: r0, reason: collision with root package name */
    public int f57054r0;

    /* renamed from: s0, reason: collision with root package name */
    public boolean f57055s0;

    /* renamed from: t0, reason: collision with root package name */
    public int f57056t0;

    /* renamed from: u0, reason: collision with root package name */
    public boolean f57057u0;

    public final boolean O() {
        int i5;
        int i11;
        int i12;
        boolean z11 = true;
        int i13 = 0;
        while (true) {
            i5 = this.f57165q0;
            if (i13 >= i5) {
                break;
            }
            d dVar = this.f57164p0[i13];
            if ((this.f57055s0 || dVar.c()) && ((((i11 = this.f57054r0) == 0 || i11 == 1) && !dVar.x()) || (((i12 = this.f57054r0) == 2 || i12 == 3) && !dVar.y()))) {
                z11 = false;
            }
            i13++;
        }
        if (!z11 || i5 <= 0) {
            return false;
        }
        int iMax = 0;
        boolean z12 = false;
        for (int i14 = 0; i14 < this.f57165q0; i14++) {
            d dVar2 = this.f57164p0[i14];
            if (this.f57055s0 || dVar2.c()) {
                if (!z12) {
                    int i15 = this.f57054r0;
                    if (i15 == 0) {
                        iMax = dVar2.i(2).d();
                    } else if (i15 == 1) {
                        iMax = dVar2.i(4).d();
                    } else if (i15 == 2) {
                        iMax = dVar2.i(3).d();
                    } else if (i15 == 3) {
                        iMax = dVar2.i(5).d();
                    }
                    z12 = true;
                }
                int i16 = this.f57054r0;
                if (i16 == 0) {
                    iMax = Math.min(iMax, dVar2.i(2).d());
                } else if (i16 == 1) {
                    iMax = Math.max(iMax, dVar2.i(4).d());
                } else if (i16 == 2) {
                    iMax = Math.min(iMax, dVar2.i(3).d());
                } else if (i16 == 3) {
                    iMax = Math.max(iMax, dVar2.i(5).d());
                }
            }
        }
        int i17 = iMax + this.f57056t0;
        int i18 = this.f57054r0;
        if (i18 == 0 || i18 == 1) {
            E(i17, i17);
        } else {
            F(i17, i17);
        }
        this.f57057u0 = true;
        return true;
    }

    public final int P() {
        int i5 = this.f57054r0;
        if (i5 == 0 || i5 == 1) {
            return 0;
        }
        return (i5 == 2 || i5 == 3) ? 1 : -1;
    }

    @Override // g4.d
    public final void b(e4.c cVar, boolean z11) {
        boolean z12;
        int i5;
        int i11;
        c[] cVarArr = this.P;
        c cVar2 = this.H;
        cVarArr[0] = cVar2;
        int i12 = 2;
        c cVar3 = this.I;
        cVarArr[2] = cVar3;
        c cVar4 = this.J;
        cVarArr[1] = cVar4;
        c cVar5 = this.K;
        cVarArr[3] = cVar5;
        for (c cVar6 : cVarArr) {
            cVar6.f57081i = cVar.k(cVar6);
        }
        int i13 = this.f57054r0;
        if (i13 < 0 || i13 >= 4) {
            return;
        }
        c cVar7 = cVarArr[i13];
        if (!this.f57057u0) {
            O();
        }
        if (this.f57057u0) {
            this.f57057u0 = false;
            int i14 = this.f57054r0;
            if (i14 == 0 || i14 == 1) {
                cVar.d(cVar2.f57081i, this.X);
                cVar.d(cVar4.f57081i, this.X);
                return;
            } else {
                if (i14 == 2 || i14 == 3) {
                    cVar.d(cVar3.f57081i, this.Y);
                    cVar.d(cVar5.f57081i, this.Y);
                    return;
                }
                return;
            }
        }
        for (int i15 = 0; i15 < this.f57165q0; i15++) {
            d dVar = this.f57164p0[i15];
            if ((this.f57055s0 || dVar.c()) && ((((i11 = this.f57054r0) == 0 || i11 == 1) && dVar.f57109o0[0] == 3 && dVar.H.f57078f != null && dVar.J.f57078f != null) || ((i11 == 2 || i11 == 3) && dVar.f57109o0[1] == 3 && dVar.I.f57078f != null && dVar.K.f57078f != null))) {
                z12 = true;
                break;
            }
        }
        z12 = false;
        boolean z13 = cVar2.g() || cVar4.g();
        boolean z14 = cVar3.g() || cVar5.g();
        int i16 = !(!z12 && (((i5 = this.f57054r0) == 0 && z13) || ((i5 == 2 && z14) || ((i5 == 1 && z13) || (i5 == 3 && z14))))) ? 4 : 5;
        int i17 = 0;
        while (i17 < this.f57165q0) {
            d dVar2 = this.f57164p0[i17];
            if (this.f57055s0 || dVar2.c()) {
                e4.f fVarK = cVar.k(dVar2.P[this.f57054r0]);
                c[] cVarArr2 = dVar2.P;
                int i18 = this.f57054r0;
                c cVar8 = cVarArr2[i18];
                cVar8.f57081i = fVarK;
                c cVar9 = cVar8.f57078f;
                int i19 = (cVar9 == null || cVar9.f57076d != this) ? 0 : cVar8.f57079g;
                if (i18 == 0 || i18 == i12) {
                    e4.f fVar = cVar7.f57081i;
                    int i21 = this.f57056t0 - i19;
                    e4.b bVarL = cVar.l();
                    e4.f fVarM = cVar.m();
                    fVarM.f52158d = 0;
                    bVarL.c(fVar, fVarK, fVarM, i21);
                    cVar.c(bVarL);
                } else {
                    e4.f fVar2 = cVar7.f57081i;
                    int i22 = this.f57056t0 + i19;
                    e4.b bVarL2 = cVar.l();
                    e4.f fVarM2 = cVar.m();
                    fVarM2.f52158d = 0;
                    bVarL2.b(fVar2, fVarK, fVarM2, i22);
                    cVar.c(bVarL2);
                }
                cVar.e(cVar7.f57081i, fVarK, this.f57056t0 + i19, i16);
            }
            i17++;
            i12 = 2;
        }
        int i23 = this.f57054r0;
        if (i23 == 0) {
            cVar.e(cVar4.f57081i, cVar2.f57081i, 0, 8);
            cVar.e(cVar2.f57081i, this.S.J.f57081i, 0, 4);
            cVar.e(cVar2.f57081i, this.S.H.f57081i, 0, 0);
            return;
        }
        if (i23 == 1) {
            cVar.e(cVar2.f57081i, cVar4.f57081i, 0, 8);
            cVar.e(cVar2.f57081i, this.S.H.f57081i, 0, 4);
            cVar.e(cVar2.f57081i, this.S.J.f57081i, 0, 0);
        } else if (i23 == 2) {
            cVar.e(cVar5.f57081i, cVar3.f57081i, 0, 8);
            cVar.e(cVar3.f57081i, this.S.K.f57081i, 0, 4);
            cVar.e(cVar3.f57081i, this.S.I.f57081i, 0, 0);
        } else if (i23 == 3) {
            cVar.e(cVar3.f57081i, cVar5.f57081i, 0, 8);
            cVar.e(cVar3.f57081i, this.S.I.f57081i, 0, 4);
            cVar.e(cVar3.f57081i, this.S.K.f57081i, 0, 0);
        }
    }

    @Override // g4.d
    public final boolean c() {
        return true;
    }

    @Override // g4.d
    public final String toString() {
        String strQ = c0.q(new StringBuilder("[Barrier] "), this.f57095g0, " {");
        for (int i5 = 0; i5 < this.f57165q0; i5++) {
            d dVar = this.f57164p0[i5];
            if (i5 > 0) {
                strQ = c0.E(strQ, ", ");
            }
            StringBuilder sbQ = a2.c.q(strQ);
            sbQ.append(dVar.f57095g0);
            strQ = sbQ.toString();
        }
        return c0.E(strQ, "}");
    }

    @Override // g4.d
    public final boolean x() {
        return this.f57057u0;
    }

    @Override // g4.d
    public final boolean y() {
        return this.f57057u0;
    }
}
