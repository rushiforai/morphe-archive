package h4;

import fa.u;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

/* loaded from: classes2.dex */
public abstract class h {

    /* renamed from: a, reason: collision with root package name */
    public static final b f59120a = new b();

    public static boolean a(g4.d dVar) {
        int[] iArr = dVar.f57109o0;
        int i5 = iArr[0];
        int i11 = iArr[1];
        g4.d dVar2 = dVar.S;
        g4.e eVar = dVar2 != null ? (g4.e) dVar2 : null;
        if (eVar != null) {
            int i12 = eVar.f57109o0[0];
        }
        if (eVar != null) {
            int i13 = eVar.f57109o0[1];
        }
        boolean z11 = i5 == 1 || dVar.x() || i5 == 2 || (i5 == 3 && dVar.f57111q == 0 && dVar.V == 0.0f && dVar.q(0)) || (i5 == 3 && dVar.f57111q == 1 && dVar.r(0, dVar.n()));
        boolean z12 = i11 == 1 || dVar.y() || i11 == 2 || (i11 == 3 && dVar.f57112r == 0 && dVar.V == 0.0f && dVar.q(1)) || (i11 == 3 && dVar.f57112r == 1 && dVar.r(1, dVar.k()));
        return (dVar.V > 0.0f && (z11 || z12)) || (z11 && z12);
    }

    public static n b(g4.d dVar, int i5, ArrayList arrayList, n nVar) {
        int i11;
        int i12 = i5 == 0 ? dVar.f57107m0 : dVar.f57108n0;
        if (i12 != -1 && (nVar == null || i12 != nVar.f59128b)) {
            int i13 = 0;
            while (true) {
                if (i13 >= arrayList.size()) {
                    break;
                }
                n nVar2 = (n) arrayList.get(i13);
                if (nVar2.f59128b == i12) {
                    if (nVar != null) {
                        nVar.c(i5, nVar2);
                        arrayList.remove(nVar);
                    }
                    nVar = nVar2;
                } else {
                    i13++;
                }
            }
        } else if (i12 != -1) {
            return nVar;
        }
        if (nVar == null) {
            if (dVar instanceof g4.i) {
                g4.i iVar = (g4.i) dVar;
                int i14 = 0;
                while (true) {
                    if (i14 >= iVar.f57165q0) {
                        i11 = -1;
                        break;
                    }
                    g4.d dVar2 = iVar.f57164p0[i14];
                    if ((i5 == 0 && (i11 = dVar2.f57107m0) != -1) || (i5 == 1 && (i11 = dVar2.f57108n0) != -1)) {
                        break;
                    }
                    i14++;
                }
                if (i11 != -1) {
                    int i15 = 0;
                    while (true) {
                        if (i15 >= arrayList.size()) {
                            break;
                        }
                        n nVar3 = (n) arrayList.get(i15);
                        if (nVar3.f59128b == i11) {
                            nVar = nVar3;
                            break;
                        }
                        i15++;
                    }
                }
            }
            if (nVar == null) {
                nVar = new n();
                nVar.f59127a = new ArrayList();
                nVar.f59130d = null;
                nVar.f59131e = -1;
                int i16 = n.f59126f;
                n.f59126f = i16 + 1;
                nVar.f59128b = i16;
                nVar.f59129c = i5;
            }
            arrayList.add(nVar);
        }
        int i17 = nVar.f59128b;
        ArrayList arrayList2 = nVar.f59127a;
        if (arrayList2.contains(dVar)) {
            return nVar;
        }
        arrayList2.add(dVar);
        if (dVar instanceof g4.h) {
            g4.h hVar = (g4.h) dVar;
            hVar.f57161s0.c(hVar.f57162t0 == 0 ? 1 : 0, nVar, arrayList);
        }
        if (i5 == 0) {
            dVar.f57107m0 = i17;
            dVar.H.c(i5, nVar, arrayList);
            dVar.J.c(i5, nVar, arrayList);
        } else {
            dVar.f57108n0 = i17;
            dVar.I.c(i5, nVar, arrayList);
            dVar.L.c(i5, nVar, arrayList);
            dVar.K.c(i5, nVar, arrayList);
        }
        dVar.O.c(i5, nVar, arrayList);
        return nVar;
    }

    public static void c(int i5, u uVar, g4.d dVar, boolean z11) {
        g4.c cVar;
        g4.c cVar2;
        boolean z12;
        g4.c cVar3;
        g4.c cVar4;
        if (dVar.f57104l) {
            return;
        }
        if (!(dVar instanceof g4.e) && dVar.w() && a(dVar)) {
            g4.e.Q(dVar, uVar, new b());
        }
        g4.c cVarI = dVar.i(2);
        g4.c cVarI2 = dVar.i(4);
        int iD = cVarI.d();
        int iD2 = cVarI2.d();
        HashSet hashSet = cVarI.f57073a;
        if (hashSet != null && cVarI.f57075c) {
            Iterator it = hashSet.iterator();
            while (it.hasNext()) {
                g4.c cVar5 = (g4.c) it.next();
                g4.d dVar2 = cVar5.f57076d;
                int i11 = i5 + 1;
                boolean zA = a(dVar2);
                g4.c cVar6 = dVar2.H;
                g4.c cVar7 = dVar2.J;
                if (dVar2.w() && zA) {
                    z12 = true;
                    g4.e.Q(dVar2, uVar, new b());
                } else {
                    z12 = true;
                }
                boolean z13 = ((cVar5 == cVar6 && (cVar4 = cVar7.f57078f) != null && cVar4.f57075c) || (cVar5 == cVar7 && (cVar3 = cVar6.f57078f) != null && cVar3.f57075c)) ? z12 : false;
                int i12 = dVar2.f57109o0[0];
                if (i12 != 3 || zA) {
                    if (!dVar2.w()) {
                        if (cVar5 == cVar6 && cVar7.f57078f == null) {
                            int iE = cVar6.e() + iD;
                            dVar2.E(iE, dVar2.n() + iE);
                            c(i11, uVar, dVar2, z11);
                        } else if (cVar5 == cVar7 && cVar6.f57078f == null) {
                            int iE2 = iD - cVar7.e();
                            dVar2.E(iE2 - dVar2.n(), iE2);
                            c(i11, uVar, dVar2, z11);
                        } else if (z13 && !dVar2.u()) {
                            d(i11, uVar, dVar2, z11);
                        }
                    }
                } else if (i12 == 3 && dVar2.f57115u >= 0 && dVar2.f57114t >= 0 && (dVar2.f57093f0 == 8 || (dVar2.f57111q == 0 && dVar2.V == 0.0f))) {
                    if (!dVar2.u() && !dVar2.E && z13 && !dVar2.u()) {
                        e(i11, dVar, uVar, dVar2, z11);
                    }
                }
            }
        }
        if (dVar instanceof g4.h) {
            return;
        }
        HashSet hashSet2 = cVarI2.f57073a;
        if (hashSet2 != null && cVarI2.f57075c) {
            Iterator it2 = hashSet2.iterator();
            while (it2.hasNext()) {
                g4.c cVar8 = (g4.c) it2.next();
                g4.d dVar3 = cVar8.f57076d;
                int i13 = i5 + 1;
                boolean zA2 = a(dVar3);
                g4.c cVar9 = dVar3.H;
                g4.c cVar10 = dVar3.J;
                if (dVar3.w() && zA2) {
                    g4.e.Q(dVar3, uVar, new b());
                }
                boolean z14 = (cVar8 == cVar9 && (cVar2 = cVar10.f57078f) != null && cVar2.f57075c) || (cVar8 == cVar10 && (cVar = cVar9.f57078f) != null && cVar.f57075c);
                int i14 = dVar3.f57109o0[0];
                if (i14 != 3 || zA2) {
                    if (!dVar3.w()) {
                        if (cVar8 == cVar9 && cVar10.f57078f == null) {
                            int iE3 = cVar9.e() + iD2;
                            dVar3.E(iE3, dVar3.n() + iE3);
                            c(i13, uVar, dVar3, z11);
                        } else if (cVar8 == cVar10 && cVar9.f57078f == null) {
                            int iE4 = iD2 - cVar10.e();
                            dVar3.E(iE4 - dVar3.n(), iE4);
                            c(i13, uVar, dVar3, z11);
                        } else if (z14 && !dVar3.u()) {
                            d(i13, uVar, dVar3, z11);
                        }
                    }
                } else if (i14 == 3 && dVar3.f57115u >= 0 && dVar3.f57114t >= 0) {
                    if (dVar3.f57093f0 == 8 || (dVar3.f57111q == 0 && dVar3.V == 0.0f)) {
                        if (!dVar3.u() && !dVar3.E && z14 && !dVar3.u()) {
                            e(i13, dVar, uVar, dVar3, z11);
                        }
                    }
                }
            }
        }
        dVar.f57104l = true;
    }

    public static void d(int i5, u uVar, g4.d dVar, boolean z11) {
        float f11 = dVar.f57087c0;
        g4.c cVar = dVar.H;
        int iD = cVar.f57078f.d();
        g4.c cVar2 = dVar.J;
        int iD2 = cVar2.f57078f.d();
        int iE = cVar.e() + iD;
        int iE2 = iD2 - cVar2.e();
        if (iD == iD2) {
            f11 = 0.5f;
        } else {
            iD = iE;
            iD2 = iE2;
        }
        int iN = dVar.n();
        int i11 = (iD2 - iD) - iN;
        if (iD > iD2) {
            i11 = (iD - iD2) - iN;
        }
        int i12 = ((int) (i11 > 0 ? (f11 * i11) + 0.5f : f11 * i11)) + iD;
        int i13 = i12 + iN;
        if (iD > iD2) {
            i13 = i12 - iN;
        }
        dVar.E(i12, i13);
        c(i5 + 1, uVar, dVar, z11);
    }

    public static void e(int i5, g4.d dVar, u uVar, g4.d dVar2, boolean z11) {
        float f11 = dVar2.f57087c0;
        g4.c cVar = dVar2.H;
        int iE = cVar.e() + cVar.f57078f.d();
        g4.c cVar2 = dVar2.J;
        int iD = cVar2.f57078f.d() - cVar2.e();
        if (iD >= iE) {
            int iN = dVar2.n();
            if (dVar2.f57093f0 != 8) {
                int i11 = dVar2.f57111q;
                if (i11 == 2) {
                    iN = (int) (dVar2.f57087c0 * 0.5f * (dVar instanceof g4.e ? dVar.n() : dVar.S.n()));
                } else if (i11 == 0) {
                    iN = iD - iE;
                }
                iN = Math.max(dVar2.f57114t, iN);
                int i12 = dVar2.f57115u;
                if (i12 > 0) {
                    iN = Math.min(i12, iN);
                }
            }
            int i13 = iE + ((int) ((f11 * ((iD - iE) - iN)) + 0.5f));
            dVar2.E(i13, iN + i13);
            c(i5 + 1, uVar, dVar2, z11);
        }
    }

    public static void f(int i5, u uVar, g4.d dVar) {
        float f11 = dVar.f57089d0;
        g4.c cVar = dVar.I;
        int iD = cVar.f57078f.d();
        g4.c cVar2 = dVar.K;
        int iD2 = cVar2.f57078f.d();
        int iE = cVar.e() + iD;
        int iE2 = iD2 - cVar2.e();
        if (iD == iD2) {
            f11 = 0.5f;
        } else {
            iD = iE;
            iD2 = iE2;
        }
        int iK = dVar.k();
        int i11 = (iD2 - iD) - iK;
        if (iD > iD2) {
            i11 = (iD - iD2) - iK;
        }
        int i12 = (int) (i11 > 0 ? (f11 * i11) + 0.5f : f11 * i11);
        int i13 = iD + i12;
        int i14 = i13 + iK;
        if (iD > iD2) {
            i13 = iD - i12;
            i14 = i13 - iK;
        }
        dVar.F(i13, i14);
        i(i5 + 1, uVar, dVar);
    }

    public static void g(int i5, g4.d dVar, u uVar, g4.d dVar2) {
        float f11 = dVar2.f57089d0;
        g4.c cVar = dVar2.I;
        int iE = cVar.e() + cVar.f57078f.d();
        g4.c cVar2 = dVar2.K;
        int iD = cVar2.f57078f.d() - cVar2.e();
        if (iD >= iE) {
            int iK = dVar2.k();
            if (dVar2.f57093f0 != 8) {
                int i11 = dVar2.f57112r;
                if (i11 == 2) {
                    iK = (int) (f11 * 0.5f * (dVar instanceof g4.e ? dVar.k() : dVar.S.k()));
                } else if (i11 == 0) {
                    iK = iD - iE;
                }
                iK = Math.max(dVar2.f57117w, iK);
                int i12 = dVar2.f57118x;
                if (i12 > 0) {
                    iK = Math.min(i12, iK);
                }
            }
            int i13 = iE + ((int) ((f11 * ((iD - iE) - iK)) + 0.5f));
            dVar2.F(i13, iK + i13);
            i(i5 + 1, uVar, dVar2);
        }
    }

    public static boolean h(int i5, int i11, int i12, int i13) {
        return (i12 == 1 || i12 == 2 || (i12 == 4 && i5 != 2)) || (i13 == 1 || i13 == 2 || (i13 == 4 && i11 != 2));
    }

    public static void i(int i5, u uVar, g4.d dVar) {
        boolean z11;
        g4.c cVar;
        g4.c cVar2;
        g4.c cVar3;
        g4.c cVar4;
        if (dVar.f57106m) {
            return;
        }
        if (!(dVar instanceof g4.e) && dVar.w() && a(dVar)) {
            g4.e.Q(dVar, uVar, new b());
        }
        g4.c cVarI = dVar.i(3);
        g4.c cVarI2 = dVar.i(5);
        int iD = cVarI.d();
        int iD2 = cVarI2.d();
        HashSet hashSet = cVarI.f57073a;
        if (hashSet != null && cVarI.f57075c) {
            Iterator it = hashSet.iterator();
            while (it.hasNext()) {
                g4.c cVar5 = (g4.c) it.next();
                g4.d dVar2 = cVar5.f57076d;
                int i11 = i5 + 1;
                boolean zA = a(dVar2);
                g4.c cVar6 = dVar2.I;
                g4.c cVar7 = dVar2.K;
                if (dVar2.w() && zA) {
                    g4.e.Q(dVar2, uVar, new b());
                }
                boolean z12 = (cVar5 == cVar6 && (cVar4 = cVar7.f57078f) != null && cVar4.f57075c) || (cVar5 == cVar7 && (cVar3 = cVar6.f57078f) != null && cVar3.f57075c);
                int i12 = dVar2.f57109o0[1];
                if (i12 != 3 || zA) {
                    if (!dVar2.w()) {
                        if (cVar5 == cVar6 && cVar7.f57078f == null) {
                            int iE = cVar6.e() + iD;
                            dVar2.F(iE, dVar2.k() + iE);
                            i(i11, uVar, dVar2);
                        } else if (cVar5 == cVar7 && cVar6.f57078f == null) {
                            int iE2 = iD - cVar7.e();
                            dVar2.F(iE2 - dVar2.k(), iE2);
                            i(i11, uVar, dVar2);
                        } else if (z12 && !dVar2.v()) {
                            f(i11, uVar, dVar2);
                        }
                    }
                } else if (i12 == 3 && dVar2.f57118x >= 0 && dVar2.f57117w >= 0 && (dVar2.f57093f0 == 8 || (dVar2.f57112r == 0 && dVar2.V == 0.0f))) {
                    if (!dVar2.v() && !dVar2.E && z12 && !dVar2.v()) {
                        g(i11, dVar, uVar, dVar2);
                    }
                }
            }
        }
        boolean z13 = true;
        z13 = true;
        z13 = true;
        if (dVar instanceof g4.h) {
            return;
        }
        HashSet hashSet2 = cVarI2.f57073a;
        if (hashSet2 != null && cVarI2.f57075c) {
            Iterator it2 = hashSet2.iterator();
            while (it2.hasNext()) {
                g4.c cVar8 = (g4.c) it2.next();
                g4.d dVar3 = cVar8.f57076d;
                int i13 = i5 + 1;
                boolean zA2 = a(dVar3);
                g4.c cVar9 = dVar3.I;
                g4.c cVar10 = dVar3.K;
                if (dVar3.w() && zA2) {
                    g4.e.Q(dVar3, uVar, new b());
                }
                boolean z14 = (cVar8 == cVar9 && (cVar2 = cVar10.f57078f) != null && cVar2.f57075c) || (cVar8 == cVar10 && (cVar = cVar9.f57078f) != null && cVar.f57075c);
                int i14 = dVar3.f57109o0[1];
                if (i14 != 3 || zA2) {
                    if (!dVar3.w()) {
                        if (cVar8 == cVar9 && cVar10.f57078f == null) {
                            int iE3 = cVar9.e() + iD2;
                            dVar3.F(iE3, dVar3.k() + iE3);
                            i(i13, uVar, dVar3);
                        } else if (cVar8 == cVar10 && cVar9.f57078f == null) {
                            int iE4 = iD2 - cVar10.e();
                            dVar3.F(iE4 - dVar3.k(), iE4);
                            i(i13, uVar, dVar3);
                        } else if (z14 && !dVar3.v()) {
                            f(i13, uVar, dVar3);
                        }
                    }
                } else if (i14 == 3 && dVar3.f57118x >= 0 && dVar3.f57117w >= 0 && (dVar3.f57093f0 == 8 || (dVar3.f57112r == 0 && dVar3.V == 0.0f))) {
                    if (!dVar3.v() && !dVar3.E && z14 && !dVar3.v()) {
                        g(i13, dVar, uVar, dVar3);
                    }
                }
            }
        }
        g4.c cVarI3 = dVar.i(6);
        if (cVarI3.f57073a != null && cVarI3.f57075c) {
            int iD3 = cVarI3.d();
            Iterator it3 = cVarI3.f57073a.iterator();
            while (it3.hasNext()) {
                g4.c cVar11 = (g4.c) it3.next();
                g4.d dVar4 = cVar11.f57076d;
                int i15 = i5 + 1;
                boolean zA3 = a(dVar4);
                g4.c cVar12 = dVar4.L;
                if (dVar4.w() && zA3) {
                    g4.e.Q(dVar4, uVar, new b());
                }
                if (dVar4.f57109o0[z13 ? 1 : 0] != 3 || zA3) {
                    if (!dVar4.w()) {
                        if (cVar11 == cVar12) {
                            int iE5 = cVar11.e() + iD3;
                            if (dVar4.D) {
                                int i16 = iE5 - dVar4.Z;
                                int i17 = dVar4.U + i16;
                                dVar4.Y = i16;
                                dVar4.I.l(i16);
                                dVar4.K.l(i17);
                                cVar12.l(iE5);
                                z11 = z13 ? 1 : 0;
                                dVar4.f57102k = z11;
                            } else {
                                z11 = z13 ? 1 : 0;
                            }
                            i(i15, uVar, dVar4);
                        }
                        z13 = z11;
                    }
                }
                z11 = z13 ? 1 : 0;
                z13 = z11;
            }
        }
        dVar.f57106m = z13;
    }
}
