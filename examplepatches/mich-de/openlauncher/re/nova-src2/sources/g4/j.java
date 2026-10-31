package g4;

import java.util.ArrayList;

/* loaded from: classes2.dex */
public abstract class j {

    /* renamed from: a, reason: collision with root package name */
    public static final boolean[] f57166a = new boolean[3];

    /* JADX WARN: Removed duplicated region for block: B:188:0x0292  */
    /* JADX WARN: Removed duplicated region for block: B:205:0x02db  */
    /* JADX WARN: Removed duplicated region for block: B:232:0x0376  */
    /* JADX WARN: Removed duplicated region for block: B:234:0x0392  */
    /* JADX WARN: Removed duplicated region for block: B:406:0x06a7  */
    /* JADX WARN: Removed duplicated region for block: B:409:0x06b2  */
    /* JADX WARN: Removed duplicated region for block: B:410:0x06b5  */
    /* JADX WARN: Removed duplicated region for block: B:413:0x06bb  */
    /* JADX WARN: Removed duplicated region for block: B:414:0x06be  */
    /* JADX WARN: Removed duplicated region for block: B:416:0x06c2  */
    /* JADX WARN: Removed duplicated region for block: B:421:0x06d2  */
    /* JADX WARN: Removed duplicated region for block: B:423:0x06d6 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:433:0x06f2 A[ADDED_TO_REGION, REMOVE, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0114  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void a(e eVar, e4.c cVar, ArrayList arrayList, int i5) {
        int i11;
        b[] bVarArr;
        int i12;
        int i13;
        c[] cVarArr;
        boolean z11;
        d dVar;
        float f11;
        boolean z12;
        boolean z13;
        int i14;
        d dVar2;
        e4.c cVar2;
        d dVar3;
        e4.f fVar;
        c cVar3;
        e4.f fVar2;
        d dVar4;
        int i15;
        c cVar4;
        e4.f fVar3;
        d dVar5;
        c[] cVarArr2;
        d dVar6;
        int i16;
        e4.f fVar4;
        int size;
        ArrayList arrayList2;
        int i17;
        d dVar7;
        int i18;
        float f12;
        int i19;
        float f13;
        d dVar8;
        int i21;
        boolean z14;
        int i22;
        int i23;
        d dVar9;
        e eVar2 = eVar;
        e4.c cVar5 = cVar;
        ArrayList arrayList3 = arrayList;
        if (i5 == 0) {
            i11 = eVar2.f57130y0;
            bVarArr = eVar2.B0;
            i12 = 0;
        } else {
            i11 = eVar2.f57131z0;
            bVarArr = eVar2.A0;
            i12 = 2;
        }
        int i24 = i11;
        b[] bVarArr2 = bVarArr;
        int i25 = 0;
        while (i25 < i24) {
            b bVar = bVarArr2[i25];
            boolean z15 = bVar.f57072q;
            d dVar10 = bVar.f57058a;
            c[] cVarArr3 = dVar10.P;
            int i26 = 3;
            int i27 = 8;
            float f14 = 0.0f;
            if (z15) {
                i13 = i25;
            } else {
                int i28 = bVar.f57069l;
                int i29 = i28 * 2;
                d dVar11 = dVar10;
                d dVar12 = dVar11;
                boolean z16 = false;
                while (!z16) {
                    bVar.f57066i++;
                    d[] dVarArr = dVar11.f57105l0;
                    c[] cVarArr4 = dVar11.P;
                    dVarArr[i28] = null;
                    dVar11.f57103k0[i28] = null;
                    if (dVar11.f57093f0 != i27) {
                        dVar11.j(i28);
                        cVarArr4[i29].e();
                        int i31 = i29 + 1;
                        cVarArr4[i31].e();
                        cVarArr4[i29].e();
                        cVarArr4[i31].e();
                        if (bVar.f57059b == null) {
                            bVar.f57059b = dVar11;
                        }
                        bVar.f57061d = dVar11;
                        int i32 = dVar11.f57109o0[i28];
                        if (i32 == i26) {
                            int i33 = dVar11.f57113s[i28];
                            if (i33 == 0 || i33 == i26 || i33 == 2) {
                                bVar.f57067j++;
                                float f15 = dVar11.f57101j0[i28];
                                if (f15 > 0.0f) {
                                    i22 = i25;
                                    bVar.f57068k += f15;
                                } else {
                                    i22 = i25;
                                }
                                i23 = i28;
                                if (dVar11.f57093f0 != 8 && i32 == 3 && (i33 == 0 || i33 == 3)) {
                                    if (f15 < 0.0f) {
                                        bVar.n = true;
                                    } else {
                                        bVar.o = true;
                                    }
                                    if (bVar.f57065h == null) {
                                        bVar.f57065h = new ArrayList();
                                    }
                                    bVar.f57065h.add(dVar11);
                                }
                                if (bVar.f57063f == null) {
                                    bVar.f57063f = dVar11;
                                }
                                d dVar13 = bVar.f57064g;
                                if (dVar13 != null) {
                                    dVar13.f57103k0[i23] = dVar11;
                                }
                                bVar.f57064g = dVar11;
                            } else {
                                i22 = i25;
                                i23 = i28;
                            }
                            if (i23 == 0) {
                                if (dVar11.f57111q == 0 && dVar11.f57114t == 0) {
                                    int i34 = dVar11.f57115u;
                                }
                            } else if (dVar11.f57112r == 0 && dVar11.f57117w == 0) {
                                int i35 = dVar11.f57118x;
                            }
                        } else {
                            i22 = i25;
                            i23 = i28;
                        }
                    }
                    d dVar14 = dVar12;
                    if (dVar14 != dVar11) {
                        dVar14.f57105l0[i23] = dVar11;
                    }
                    c cVar6 = cVarArr4[i29 + 1].f57078f;
                    if (cVar6 != null) {
                        dVar9 = cVar6.f57076d;
                        c cVar7 = dVar9.P[i29].f57078f;
                        if (cVar7 == null || cVar7.f57076d != dVar11) {
                            dVar9 = null;
                        }
                    }
                    if (dVar9 == null) {
                        dVar9 = dVar11;
                        z16 = true;
                    }
                    dVar12 = dVar11;
                    i28 = i23;
                    i26 = 3;
                    i27 = 8;
                    dVar11 = dVar9;
                    i25 = i22;
                }
                i13 = i25;
                int i36 = i28;
                d dVar15 = bVar.f57059b;
                if (dVar15 != null) {
                    dVar15.P[i29].e();
                }
                d dVar16 = bVar.f57061d;
                if (dVar16 != null) {
                    dVar16.P[i29 + 1].e();
                }
                bVar.f57060c = dVar11;
                if (i36 == 0 && bVar.f57070m) {
                    bVar.f57062e = dVar11;
                } else {
                    bVar.f57062e = dVar10;
                }
                bVar.f57071p = bVar.o && bVar.n;
            }
            bVar.f57072q = true;
            if (arrayList3 == null || arrayList3.contains(dVar10)) {
                d dVar17 = bVar.f57060c;
                d dVar18 = bVar.f57059b;
                d dVar19 = bVar.f57061d;
                d dVar20 = bVar.f57062e;
                float f16 = bVar.f57068k;
                int[] iArr = eVar2.f57109o0;
                c[] cVarArr5 = eVar2.P;
                boolean z17 = iArr[i5] == 2;
                if (i5 == 0) {
                    int i37 = dVar20.f57097h0;
                    boolean z18 = i37 == 0;
                    cVarArr = cVarArr3;
                    boolean z19 = i37 == 1;
                    z11 = i37 == 2;
                    dVar = dVar10;
                    f11 = f16;
                    z13 = z19;
                    z12 = z18;
                } else {
                    cVarArr = cVarArr3;
                    int i38 = dVar20.f57099i0;
                    boolean z21 = i38 == 0;
                    boolean z22 = i38 == 1;
                    z11 = i38 == 2;
                    dVar = dVar10;
                    f11 = f16;
                    z12 = z21;
                    z13 = z22;
                }
                boolean z23 = false;
                while (!z23) {
                    c[] cVarArr6 = dVar.P;
                    int[] iArr2 = dVar.f57109o0;
                    c cVar8 = cVarArr6[i12];
                    int i39 = z11 ? 1 : 4;
                    int iE = cVar8.e();
                    boolean z24 = z17;
                    boolean z25 = z11;
                    boolean z26 = iArr2[i5] == 3 && dVar.f57113s[i5] == 0;
                    c cVar9 = cVar8.f57078f;
                    if (cVar9 != null && dVar != dVar10) {
                        iE = cVar9.e() + iE;
                    }
                    int i40 = iE;
                    if (z25 && dVar != dVar10 && dVar != dVar18) {
                        i39 = 8;
                    }
                    d dVar21 = dVar10;
                    c cVar10 = cVar8.f57078f;
                    if (cVar10 != null) {
                        if (dVar == dVar18) {
                            z14 = z26;
                            cVar5.f(cVar8.f57081i, cVar10.f57081i, i40, 6);
                        } else {
                            z14 = z26;
                            cVar5.f(cVar8.f57081i, cVar10.f57081i, i40, 8);
                        }
                        if (z14 && !z25) {
                            i39 = 5;
                        }
                        cVar5.e(cVar8.f57081i, cVar8.f57078f.f57081i, i40, (dVar == dVar18 && z25 && dVar.R[i5]) ? 5 : i39);
                    }
                    if (z24) {
                        if (dVar.f57093f0 == 8 || iArr2[i5] != 3) {
                            i21 = 0;
                        } else {
                            i21 = 0;
                            cVar5.f(cVarArr6[i12 + 1].f57081i, cVarArr6[i12].f57081i, 0, 5);
                        }
                        cVar5.f(cVarArr6[i12].f57081i, cVarArr5[i12].f57081i, i21, 8);
                    }
                    c cVar11 = cVarArr6[i12 + 1].f57078f;
                    if (cVar11 != null) {
                        dVar8 = cVar11.f57076d;
                        c cVar12 = dVar8.P[i12].f57078f;
                        if (cVar12 == null || cVar12.f57076d != dVar) {
                            dVar8 = null;
                        }
                    }
                    if (dVar8 != null) {
                        dVar = dVar8;
                    } else {
                        z23 = true;
                    }
                    dVar10 = dVar21;
                    z17 = z24;
                    z11 = z25;
                }
                boolean z27 = z17;
                boolean z28 = z11;
                if (dVar19 != null) {
                    int i41 = i12 + 1;
                    if (dVar17.P[i41].f57078f != null) {
                        c cVar13 = dVar19.P[i41];
                        if (dVar19.f57109o0[i5] == 3 && dVar19.f57113s[i5] == 0 && !z28) {
                            c cVar14 = cVar13.f57078f;
                            if (cVar14.f57076d == eVar2) {
                                cVar5.e(cVar13.f57081i, cVar14.f57081i, -cVar13.e(), 5);
                            }
                            cVar5.g(cVar13.f57081i, dVar17.P[i41].f57078f.f57081i, -cVar13.e(), 6);
                        } else {
                            if (z28) {
                                c cVar15 = cVar13.f57078f;
                                if (cVar15.f57076d == eVar2) {
                                    cVar5.e(cVar13.f57081i, cVar15.f57081i, -cVar13.e(), 4);
                                }
                            }
                            cVar5.g(cVar13.f57081i, dVar17.P[i41].f57078f.f57081i, -cVar13.e(), 6);
                        }
                    }
                }
                if (z27) {
                    int i42 = i12 + 1;
                    e4.f fVar5 = cVarArr5[i42].f57081i;
                    c cVar16 = dVar17.P[i42];
                    cVar5.f(fVar5, cVar16.f57081i, cVar16.e(), 8);
                }
                ArrayList arrayList4 = bVar.f57065h;
                if (arrayList4 != null && (size = arrayList4.size()) > 1) {
                    if (bVar.n && !bVar.f57071p) {
                        f11 = bVar.f57067j;
                    }
                    d dVar22 = null;
                    float f17 = 0.0f;
                    int i43 = 0;
                    while (i43 < size) {
                        d dVar23 = (d) arrayList4.get(i43);
                        float[] fArr = dVar23.f57101j0;
                        c[] cVarArr7 = dVar23.P;
                        float f18 = fArr[i5];
                        if (f18 >= f14) {
                            arrayList2 = arrayList4;
                            i17 = size;
                            if (f18 != f14) {
                                f13 = f17;
                                cVar5.e(cVarArr7[i12 + 1].f57081i, cVarArr7[i12].f57081i, 0, 8);
                                i18 = i43;
                                f12 = f14;
                                f17 = f13;
                                i19 = i24;
                            } else {
                                float f19 = f17;
                                if (dVar22 != null) {
                                    c[] cVarArr8 = dVar22.P;
                                    e4.f fVar6 = cVarArr8[i12].f57081i;
                                    int i44 = i12 + 1;
                                    e4.f fVar7 = cVarArr8[i44].f57081i;
                                    e4.f fVar8 = cVarArr7[i12].f57081i;
                                    e4.f fVar9 = cVarArr7[i44].f57081i;
                                    e4.b bVarL = cVar5.l();
                                    dVar7 = dVar23;
                                    float f21 = f14;
                                    bVarL.f52130b = f21;
                                    f12 = f21;
                                    if (f11 == f21 || f19 == f18) {
                                        i18 = i43;
                                        i19 = i24;
                                        bVarL.f52132d.g(fVar6, 1.0f);
                                        bVarL.f52132d.g(fVar7, -1.0f);
                                        bVarL.f52132d.g(fVar9, 1.0f);
                                        bVarL.f52132d.g(fVar8, -1.0f);
                                    } else {
                                        if (f19 == f12) {
                                            bVarL.f52132d.g(fVar6, 1.0f);
                                            bVarL.f52132d.g(fVar7, -1.0f);
                                        } else if (f18 == f14) {
                                            bVarL.f52132d.g(fVar8, 1.0f);
                                            bVarL.f52132d.g(fVar9, -1.0f);
                                        } else {
                                            i18 = i43;
                                            float f22 = (f19 / f11) / (f18 / f11);
                                            i19 = i24;
                                            bVarL.f52132d.g(fVar6, 1.0f);
                                            bVarL.f52132d.g(fVar7, -1.0f);
                                            bVarL.f52132d.g(fVar9, f22);
                                            bVarL.f52132d.g(fVar8, -f22);
                                        }
                                        i18 = i43;
                                        i19 = i24;
                                    }
                                    cVar5.c(bVarL);
                                } else {
                                    dVar7 = dVar23;
                                    i18 = i43;
                                    f12 = f14;
                                    i19 = i24;
                                }
                                f17 = f18;
                                dVar22 = dVar7;
                            }
                        } else if (bVar.f57071p) {
                            arrayList2 = arrayList4;
                            i17 = size;
                            cVar5.e(cVarArr7[i12 + 1].f57081i, cVarArr7[i12].f57081i, 0, 4);
                            f13 = f17;
                            i18 = i43;
                            f12 = f14;
                            f17 = f13;
                            i19 = i24;
                        } else {
                            f18 = 1.0f;
                            arrayList2 = arrayList4;
                            i17 = size;
                            if (f18 != f14) {
                            }
                        }
                        i43 = i18 + 1;
                        i24 = i19;
                        arrayList4 = arrayList2;
                        size = i17;
                        f14 = f12;
                    }
                }
                i14 = i24;
                if (dVar18 == null || !(dVar18 == dVar19 || z28)) {
                    dVar2 = dVar19;
                    if (!z12 || dVar18 == null) {
                        c[] cVarArr9 = cVarArr;
                        int i45 = 8;
                        if (z13 && dVar18 != null) {
                            int i46 = bVar.f57067j;
                            boolean z29 = i46 > 0 && bVar.f57066i == i46;
                            d dVar24 = dVar18;
                            d dVar25 = dVar24;
                            while (dVar25 != null) {
                                c[] cVarArr10 = dVar25.P;
                                d dVar26 = dVar25.f57105l0[i5];
                                while (dVar26 != null && dVar26.f57093f0 == i45) {
                                    dVar26 = dVar26.f57105l0[i5];
                                }
                                if (dVar25 == dVar18 || dVar25 == dVar2 || dVar26 == null) {
                                    dVar3 = dVar24;
                                } else {
                                    if (dVar26 == dVar2) {
                                        dVar26 = null;
                                    }
                                    c cVar17 = cVarArr10[i12];
                                    e4.f fVar10 = cVar17.f57081i;
                                    int i47 = i12 + 1;
                                    e4.f fVar11 = dVar24.P[i47].f57081i;
                                    int iE2 = cVar17.e();
                                    int iE3 = cVarArr10[i47].e();
                                    if (dVar26 != null) {
                                        cVar3 = dVar26.P[i12];
                                        fVar2 = cVar3.f57081i;
                                        c cVar18 = cVar3.f57078f;
                                        fVar = cVar18 != null ? cVar18.f57081i : null;
                                    } else {
                                        c cVar19 = dVar2.P[i12];
                                        e4.f fVar12 = cVar19 != null ? cVar19.f57081i : null;
                                        fVar = cVarArr10[i47].f57081i;
                                        cVar3 = cVar19;
                                        fVar2 = fVar12;
                                    }
                                    if (cVar3 != null) {
                                        iE3 += cVar3.e();
                                    }
                                    int iE4 = iE2 + dVar24.P[i47].e();
                                    d dVar27 = dVar26;
                                    e4.f fVar13 = fVar2;
                                    int i48 = z29 ? 8 : 4;
                                    if (fVar10 == null || fVar11 == null || fVar13 == null || fVar == null) {
                                        dVar3 = dVar24;
                                        dVar4 = dVar27;
                                    } else {
                                        dVar4 = dVar27;
                                        e4.f fVar14 = fVar;
                                        dVar3 = dVar24;
                                        cVar.b(fVar10, fVar11, iE4, 0.5f, fVar13, fVar14, iE3, i48);
                                    }
                                    dVar26 = dVar4;
                                }
                                if (dVar25.f57093f0 != 8) {
                                    dVar3 = dVar25;
                                }
                                dVar25 = dVar26;
                                dVar24 = dVar3;
                                i45 = 8;
                            }
                            cVar2 = cVar;
                            c cVar20 = dVar18.P[i12];
                            c cVar21 = cVarArr9[i12].f57078f;
                            int i49 = i12 + 1;
                            c cVar22 = dVar2.P[i49];
                            c cVar23 = dVar17.P[i49].f57078f;
                            if (cVar21 != null) {
                                if (dVar18 != dVar2) {
                                    cVar2.e(cVar20.f57081i, cVar21.f57081i, cVar20.e(), 5);
                                } else if (cVar23 != null) {
                                    cVar2.b(cVar20.f57081i, cVar21.f57081i, cVar20.e(), 0.5f, cVar22.f57081i, cVar23.f57081i, cVar22.e(), 5);
                                }
                            }
                            if (cVar23 != null && dVar18 != dVar2) {
                                cVar2.e(cVar22.f57081i, cVar23.f57081i, -cVar22.e(), 5);
                            }
                        }
                        if ((z12 || z13) && dVar18 != null && dVar18 != dVar2) {
                            c[] cVarArr11 = dVar18.P;
                            c cVar24 = cVarArr11[i12];
                            if (dVar2 == null) {
                                dVar2 = dVar18;
                            }
                            c[] cVarArr12 = dVar2.P;
                            int i51 = i12 + 1;
                            c cVar25 = cVarArr12[i51];
                            c cVar26 = cVar24.f57078f;
                            fVar4 = cVar26 != null ? cVar26.f57081i : null;
                            c cVar27 = cVar25.f57078f;
                            e4.f fVar15 = cVar27 != null ? cVar27.f57081i : null;
                            if (dVar17 != dVar2) {
                                c cVar28 = dVar17.P[i51].f57078f;
                                fVar15 = cVar28 != null ? cVar28.f57081i : null;
                            }
                            if (dVar18 == dVar2) {
                                cVar25 = cVarArr11[i51];
                            }
                            if (fVar4 != null && fVar15 != null) {
                                cVar2.b(cVar24.f57081i, fVar4, cVar24.e(), 0.5f, fVar15, cVar25.f57081i, cVarArr12[i51].e(), 5);
                            }
                        }
                    } else {
                        int i52 = bVar.f57067j;
                        boolean z31 = i52 > 0 && bVar.f57066i == i52;
                        d dVar28 = dVar18;
                        d dVar29 = dVar28;
                        while (dVar28 != null) {
                            c[] cVarArr13 = dVar28.P;
                            d dVar30 = dVar28.f57105l0[i5];
                            while (true) {
                                if (dVar30 == null) {
                                    i15 = 8;
                                    break;
                                }
                                i15 = 8;
                                if (dVar30.f57093f0 != 8) {
                                    break;
                                } else {
                                    dVar30 = dVar30.f57105l0[i5];
                                }
                            }
                            if (dVar30 != null || dVar28 == dVar2) {
                                c cVar29 = cVarArr13[i12];
                                e4.f fVar16 = cVar29.f57081i;
                                c cVar30 = cVar29.f57078f;
                                e4.f fVar17 = cVar30 != null ? cVar30.f57081i : null;
                                if (dVar29 != dVar28) {
                                    fVar17 = dVar29.P[i12 + 1].f57081i;
                                } else if (dVar28 == dVar18) {
                                    c cVar31 = cVarArr[i12].f57078f;
                                    fVar17 = cVar31 != null ? cVar31.f57081i : null;
                                }
                                int iE5 = cVar29.e();
                                int i53 = i12 + 1;
                                int iE6 = cVarArr13[i53].e();
                                if (dVar30 != null) {
                                    cVar4 = dVar30.P[i12];
                                    fVar3 = cVar4.f57081i;
                                } else {
                                    cVar4 = dVar17.P[i53].f57078f;
                                    fVar3 = cVar4 != null ? cVar4.f57081i : null;
                                }
                                e4.f fVar18 = cVarArr13[i53].f57081i;
                                if (cVar4 != null) {
                                    iE6 += cVar4.e();
                                }
                                int iE7 = dVar29.P[i53].e() + iE5;
                                if (fVar16 == null || fVar17 == null || fVar3 == null || fVar18 == null) {
                                    dVar5 = dVar30;
                                    cVarArr2 = cVarArr;
                                    dVar6 = dVar29;
                                    i16 = 8;
                                } else {
                                    if (dVar28 == dVar18) {
                                        iE7 = dVar18.P[i12].e();
                                    }
                                    if (dVar28 == dVar2) {
                                        iE6 = dVar2.P[i53].e();
                                    }
                                    dVar5 = dVar30;
                                    cVarArr2 = cVarArr;
                                    dVar6 = dVar29;
                                    i16 = 8;
                                    cVar.b(fVar16, fVar17, iE7, 0.5f, fVar3, fVar18, iE6, z31 ? 8 : 5);
                                }
                            } else {
                                dVar5 = dVar30;
                                cVarArr2 = cVarArr;
                                dVar6 = dVar29;
                                i16 = i15;
                            }
                            if (dVar28.f57093f0 != i16) {
                                dVar6 = dVar28;
                            }
                            dVar28 = dVar5;
                            dVar29 = dVar6;
                            cVarArr = cVarArr2;
                        }
                    }
                } else {
                    c cVar32 = cVarArr[i12];
                    int i54 = i12 + 1;
                    c cVar33 = dVar17.P[i54];
                    c cVar34 = cVar32.f57078f;
                    e4.f fVar19 = cVar34 != null ? cVar34.f57081i : null;
                    c cVar35 = cVar33.f57078f;
                    e4.f fVar20 = cVar35 != null ? cVar35.f57081i : null;
                    c cVar36 = dVar18.P[i12];
                    if (dVar19 != null) {
                        cVar33 = dVar19.P[i54];
                    }
                    if (fVar19 == null || fVar20 == null) {
                        dVar2 = dVar19;
                    } else {
                        float f23 = i5 == 0 ? dVar20.f57087c0 : dVar20.f57089d0;
                        int iE8 = cVar36.e();
                        int iE9 = cVar33.e();
                        e4.f fVar21 = cVar36.f57081i;
                        e4.f fVar22 = cVar33.f57081i;
                        e4.f fVar23 = fVar19;
                        dVar2 = dVar19;
                        cVar5.b(fVar21, fVar23, iE8, f23, fVar20, fVar22, iE9, 7);
                    }
                }
                cVar2 = cVar;
                if (z12) {
                    c[] cVarArr112 = dVar18.P;
                    c cVar242 = cVarArr112[i12];
                    if (dVar2 == null) {
                    }
                    c[] cVarArr122 = dVar2.P;
                    int i512 = i12 + 1;
                    c cVar252 = cVarArr122[i512];
                    c cVar262 = cVar242.f57078f;
                    if (cVar262 != null) {
                    }
                    c cVar272 = cVar252.f57078f;
                    if (cVar272 != null) {
                    }
                    if (dVar17 != dVar2) {
                    }
                    if (dVar18 == dVar2) {
                    }
                    if (fVar4 != null) {
                    }
                } else {
                    c[] cVarArr1122 = dVar18.P;
                    c cVar2422 = cVarArr1122[i12];
                    if (dVar2 == null) {
                    }
                    c[] cVarArr1222 = dVar2.P;
                    int i5122 = i12 + 1;
                    c cVar2522 = cVarArr1222[i5122];
                    c cVar2622 = cVar2422.f57078f;
                    if (cVar2622 != null) {
                    }
                    c cVar2722 = cVar2522.f57078f;
                    if (cVar2722 != null) {
                    }
                    if (dVar17 != dVar2) {
                    }
                    if (dVar18 == dVar2) {
                    }
                    if (fVar4 != null) {
                    }
                }
            } else {
                i14 = i24;
            }
            i25 = i13 + 1;
            eVar2 = eVar;
            cVar5 = cVar;
            arrayList3 = arrayList;
            i24 = i14;
        }
    }

    public static void b(e eVar, e4.c cVar, d dVar) {
        dVar.n = -1;
        c cVar2 = dVar.L;
        int[] iArr = dVar.f57109o0;
        c cVar3 = dVar.K;
        c cVar4 = dVar.I;
        c cVar5 = dVar.J;
        c cVar6 = dVar.H;
        dVar.o = -1;
        int[] iArr2 = eVar.f57109o0;
        if (iArr2[0] != 2 && iArr[0] == 4) {
            int i5 = cVar6.f57079g;
            int iN = eVar.n() - cVar5.f57079g;
            cVar6.f57081i = cVar.k(cVar6);
            cVar5.f57081i = cVar.k(cVar5);
            cVar.d(cVar6.f57081i, i5);
            cVar.d(cVar5.f57081i, iN);
            dVar.n = 2;
            dVar.X = i5;
            int i11 = iN - i5;
            dVar.T = i11;
            int i12 = dVar.f57083a0;
            if (i11 < i12) {
                dVar.T = i12;
            }
        }
        if (iArr2[1] == 2 || iArr[1] != 4) {
            return;
        }
        int i13 = cVar4.f57079g;
        int iK = eVar.k() - cVar3.f57079g;
        cVar4.f57081i = cVar.k(cVar4);
        cVar3.f57081i = cVar.k(cVar3);
        cVar.d(cVar4.f57081i, i13);
        cVar.d(cVar3.f57081i, iK);
        if (dVar.Z > 0 || dVar.f57093f0 == 8) {
            e4.f fVarK = cVar.k(cVar2);
            cVar2.f57081i = fVarK;
            cVar.d(fVarK, dVar.Z + i13);
        }
        dVar.o = 2;
        dVar.Y = i13;
        int i14 = iK - i13;
        dVar.U = i14;
        int i15 = dVar.f57085b0;
        if (i14 < i15) {
            dVar.U = i15;
        }
    }

    public static final boolean c(int i5, int i11) {
        return (i5 & i11) == i11;
    }
}
