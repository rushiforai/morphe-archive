package g4;

import fa.u;
import fl.l;
import h4.n;
import h4.o;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class e extends d {
    public b[] A0;
    public b[] B0;
    public int C0;
    public boolean D0;
    public boolean E0;
    public WeakReference F0;
    public WeakReference G0;
    public WeakReference H0;
    public WeakReference I0;
    public final HashSet J0;
    public final h4.b K0;

    /* renamed from: p0, reason: collision with root package name */
    public ArrayList f57121p0 = new ArrayList();

    /* renamed from: q0, reason: collision with root package name */
    public final l f57122q0 = new l(this);

    /* renamed from: r0, reason: collision with root package name */
    public final h4.e f57123r0;

    /* renamed from: s0, reason: collision with root package name */
    public int f57124s0;

    /* renamed from: t0, reason: collision with root package name */
    public u f57125t0;

    /* renamed from: u0, reason: collision with root package name */
    public boolean f57126u0;

    /* renamed from: v0, reason: collision with root package name */
    public final e4.c f57127v0;

    /* renamed from: w0, reason: collision with root package name */
    public int f57128w0;

    /* renamed from: x0, reason: collision with root package name */
    public int f57129x0;

    /* renamed from: y0, reason: collision with root package name */
    public int f57130y0;

    /* renamed from: z0, reason: collision with root package name */
    public int f57131z0;

    public e() {
        h4.e eVar = new h4.e();
        eVar.f59099b = true;
        eVar.f59100c = true;
        eVar.f59103f = new ArrayList();
        new ArrayList();
        eVar.f59105h = null;
        eVar.f59106i = new h4.b();
        eVar.f59104g = new ArrayList();
        eVar.f59101d = this;
        eVar.f59102e = this;
        this.f57123r0 = eVar;
        this.f57125t0 = null;
        this.f57126u0 = false;
        this.f57127v0 = new e4.c();
        this.f57130y0 = 0;
        this.f57131z0 = 0;
        this.A0 = new b[4];
        this.B0 = new b[4];
        this.C0 = 257;
        this.D0 = false;
        this.E0 = false;
        this.F0 = null;
        this.G0 = null;
        this.H0 = null;
        this.I0 = null;
        this.J0 = new HashSet();
        this.K0 = new h4.b();
    }

    public static void Q(d dVar, u uVar, h4.b bVar) {
        int i5;
        int i11;
        if (uVar == null) {
            return;
        }
        int i12 = dVar.f57093f0;
        int[] iArr = dVar.f57113s;
        if (i12 == 8 || (dVar instanceof h) || (dVar instanceof a)) {
            bVar.f59090e = 0;
            bVar.f59091f = 0;
            return;
        }
        int[] iArr2 = dVar.f57109o0;
        bVar.f59086a = iArr2[0];
        bVar.f59087b = iArr2[1];
        bVar.f59088c = dVar.n();
        bVar.f59089d = dVar.k();
        bVar.f59094i = false;
        bVar.f59095j = 0;
        boolean z11 = bVar.f59086a == 3;
        boolean z12 = bVar.f59087b == 3;
        boolean z13 = z11 && dVar.V > 0.0f;
        boolean z14 = z12 && dVar.V > 0.0f;
        if (z11 && dVar.q(0) && dVar.f57111q == 0 && !z13) {
            bVar.f59086a = 2;
            if (z12 && dVar.f57112r == 0) {
                bVar.f59086a = 1;
            }
            z11 = false;
        }
        if (z12 && dVar.q(1) && dVar.f57112r == 0 && !z14) {
            bVar.f59087b = 2;
            if (z11 && dVar.f57111q == 0) {
                bVar.f59087b = 1;
            }
            z12 = false;
        }
        if (dVar.x()) {
            bVar.f59086a = 1;
            z11 = false;
        }
        if (dVar.y()) {
            bVar.f59087b = 1;
            z12 = false;
        }
        if (z13) {
            if (iArr[0] == 4) {
                bVar.f59086a = 1;
            } else if (!z12) {
                if (bVar.f59087b == 1) {
                    i11 = bVar.f59089d;
                } else {
                    bVar.f59086a = 2;
                    uVar.f(dVar, bVar);
                    i11 = bVar.f59091f;
                }
                bVar.f59086a = 1;
                bVar.f59088c = (int) (dVar.V * i11);
            }
        }
        if (z14) {
            if (iArr[1] == 4) {
                bVar.f59087b = 1;
            } else if (!z11) {
                if (bVar.f59086a == 1) {
                    i5 = bVar.f59088c;
                } else {
                    bVar.f59087b = 2;
                    uVar.f(dVar, bVar);
                    i5 = bVar.f59090e;
                }
                bVar.f59087b = 1;
                if (dVar.W == -1) {
                    bVar.f59089d = (int) (i5 / dVar.V);
                } else {
                    bVar.f59089d = (int) (dVar.V * i5);
                }
            }
        }
        uVar.f(dVar, bVar);
        dVar.J(bVar.f59090e);
        dVar.G(bVar.f59091f);
        dVar.D = bVar.f59093h;
        dVar.D(bVar.f59092g);
        bVar.f59095j = 0;
    }

    @Override // g4.d
    public final void C(mg.l lVar) {
        super.C(lVar);
        int size = this.f57121p0.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((d) this.f57121p0.get(i5)).C(lVar);
        }
    }

    @Override // g4.d
    public final void K(boolean z11, boolean z12) {
        super.K(z11, z12);
        int size = this.f57121p0.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((d) this.f57121p0.get(i5)).K(z11, z12);
        }
    }

    public final void M(d dVar, int i5) {
        if (i5 == 0) {
            int i11 = this.f57130y0 + 1;
            b[] bVarArr = this.B0;
            if (i11 >= bVarArr.length) {
                this.B0 = (b[]) Arrays.copyOf(bVarArr, bVarArr.length * 2);
            }
            b[] bVarArr2 = this.B0;
            int i12 = this.f57130y0;
            bVarArr2[i12] = new b(dVar, 0, this.f57126u0);
            this.f57130y0 = i12 + 1;
            return;
        }
        if (i5 == 1) {
            int i13 = this.f57131z0 + 1;
            b[] bVarArr3 = this.A0;
            if (i13 >= bVarArr3.length) {
                this.A0 = (b[]) Arrays.copyOf(bVarArr3, bVarArr3.length * 2);
            }
            b[] bVarArr4 = this.A0;
            int i14 = this.f57131z0;
            bVarArr4[i14] = new b(dVar, 1, this.f57126u0);
            this.f57131z0 = i14 + 1;
        }
    }

    public final void N(e4.c cVar) {
        e eVar;
        e4.c cVar2;
        boolean zR = R(64);
        b(cVar, zR);
        int size = this.f57121p0.size();
        boolean z11 = false;
        for (int i5 = 0; i5 < size; i5++) {
            d dVar = (d) this.f57121p0.get(i5);
            boolean[] zArr = dVar.R;
            zArr[0] = false;
            zArr[1] = false;
            if (dVar instanceof a) {
                z11 = true;
            }
        }
        if (z11) {
            for (int i11 = 0; i11 < size; i11++) {
                d dVar2 = (d) this.f57121p0.get(i11);
                if (dVar2 instanceof a) {
                    a aVar = (a) dVar2;
                    for (int i12 = 0; i12 < aVar.f57165q0; i12++) {
                        d dVar3 = aVar.f57164p0[i12];
                        if (aVar.f57055s0 || dVar3.c()) {
                            int i13 = aVar.f57054r0;
                            if (i13 == 0 || i13 == 1) {
                                dVar3.R[0] = true;
                            } else if (i13 == 2 || i13 == 3) {
                                dVar3.R[1] = true;
                            }
                        }
                    }
                }
            }
        }
        HashSet hashSet = this.J0;
        hashSet.clear();
        for (int i14 = 0; i14 < size; i14++) {
            d dVar4 = (d) this.f57121p0.get(i14);
            dVar4.getClass();
            boolean z12 = dVar4 instanceof g;
            if (z12 || (dVar4 instanceof h)) {
                if (z12) {
                    hashSet.add(dVar4);
                } else {
                    dVar4.b(cVar, zR);
                }
            }
        }
        while (hashSet.size() > 0) {
            int size2 = hashSet.size();
            Iterator it = hashSet.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                g gVar = (g) ((d) it.next());
                for (int i15 = 0; i15 < gVar.f57165q0; i15++) {
                    if (hashSet.contains(gVar.f57164p0[i15])) {
                        gVar.b(cVar, zR);
                        hashSet.remove(gVar);
                        break;
                    }
                }
            }
            if (size2 == hashSet.size()) {
                Iterator it2 = hashSet.iterator();
                while (it2.hasNext()) {
                    ((d) it2.next()).b(cVar, zR);
                }
                hashSet.clear();
            }
        }
        if (e4.c.f52134q) {
            HashSet hashSet2 = new HashSet();
            for (int i16 = 0; i16 < size; i16++) {
                d dVar5 = (d) this.f57121p0.get(i16);
                dVar5.getClass();
                if (!(dVar5 instanceof g) && !(dVar5 instanceof h)) {
                    hashSet2.add(dVar5);
                }
            }
            eVar = this;
            cVar2 = cVar;
            eVar.a(this, cVar2, hashSet2, this.f57109o0[0] == 2 ? 0 : 1, false);
            Iterator it3 = hashSet2.iterator();
            while (it3.hasNext()) {
                d dVar6 = (d) it3.next();
                j.b(this, cVar2, dVar6);
                dVar6.b(cVar2, zR);
            }
        } else {
            eVar = this;
            cVar2 = cVar;
            for (int i17 = 0; i17 < size; i17++) {
                d dVar7 = (d) eVar.f57121p0.get(i17);
                if (dVar7 instanceof e) {
                    int[] iArr = dVar7.f57109o0;
                    int i18 = iArr[0];
                    int i19 = iArr[1];
                    if (i18 == 2) {
                        dVar7.H(1);
                    }
                    if (i19 == 2) {
                        dVar7.I(1);
                    }
                    dVar7.b(cVar2, zR);
                    if (i18 == 2) {
                        dVar7.H(i18);
                    }
                    if (i19 == 2) {
                        dVar7.I(i19);
                    }
                } else {
                    j.b(this, cVar2, dVar7);
                    if (!(dVar7 instanceof g) && !(dVar7 instanceof h)) {
                        dVar7.b(cVar2, zR);
                    }
                }
            }
        }
        if (eVar.f57130y0 > 0) {
            j.a(this, cVar2, null, 0);
        }
        if (eVar.f57131z0 > 0) {
            j.a(this, cVar2, null, 1);
        }
    }

    public final boolean O(int i5, boolean z11) {
        boolean z12;
        boolean z13;
        h4.e eVar = this.f57123r0;
        ArrayList arrayList = (ArrayList) eVar.f59103f;
        e eVar2 = (e) eVar.f59101d;
        boolean z14 = false;
        int iJ = eVar2.j(0);
        int[] iArr = eVar2.f57109o0;
        int iJ2 = eVar2.j(1);
        int iO = eVar2.o();
        int iP = eVar2.p();
        if (z11 && (iJ == 2 || iJ2 == 2)) {
            Iterator it = arrayList.iterator();
            while (true) {
                if (!it.hasNext()) {
                    z13 = z11;
                    break;
                }
                o oVar = (o) it.next();
                if (oVar.f59137f == i5 && !oVar.k()) {
                    z13 = false;
                    break;
                }
            }
            if (i5 == 0) {
                if (z13 && iJ == 2) {
                    eVar2.H(1);
                    eVar2.J(eVar.d(eVar2, 0));
                    eVar2.f57088d.f59136e.d(eVar2.n());
                }
            } else if (z13 && iJ2 == 2) {
                eVar2.I(1);
                eVar2.G(eVar.d(eVar2, 1));
                eVar2.f57090e.f59136e.d(eVar2.k());
            }
        }
        if (i5 == 0) {
            int i11 = iArr[0];
            if (i11 == 1 || i11 == 4) {
                int iN = eVar2.n() + iO;
                eVar2.f57088d.f59140i.d(iN);
                eVar2.f57088d.f59136e.d(iN - iO);
                z12 = true;
            }
            z12 = false;
        } else {
            int i12 = iArr[1];
            if (i12 == 1 || i12 == 4) {
                int iK = eVar2.k() + iP;
                eVar2.f57090e.f59140i.d(iK);
                eVar2.f57090e.f59136e.d(iK - iP);
                z12 = true;
            }
            z12 = false;
        }
        eVar.g();
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            o oVar2 = (o) it2.next();
            if (oVar2.f59137f == i5 && (oVar2.f59133b != eVar2 || oVar2.f59138g)) {
                oVar2.e();
            }
        }
        Iterator it3 = arrayList.iterator();
        while (true) {
            if (!it3.hasNext()) {
                z14 = true;
                break;
            }
            o oVar3 = (o) it3.next();
            if (oVar3.f59137f == i5 && (z12 || oVar3.f59133b != eVar2)) {
                if (!oVar3.f59139h.f59116j || !oVar3.f59140i.f59116j || (!(oVar3 instanceof h4.c) && !oVar3.f59136e.f59116j)) {
                    break;
                }
            }
        }
        eVar2.H(iJ);
        eVar2.I(iJ2);
        return z14;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:227:0x03a1  */
    /* JADX WARN: Removed duplicated region for block: B:361:0x0616  */
    /* JADX WARN: Removed duplicated region for block: B:375:0x0645  */
    /* JADX WARN: Removed duplicated region for block: B:400:0x068e  */
    /* JADX WARN: Removed duplicated region for block: B:405:0x069f  */
    /* JADX WARN: Removed duplicated region for block: B:412:0x06ae  */
    /* JADX WARN: Removed duplicated region for block: B:415:0x06b6  */
    /* JADX WARN: Removed duplicated region for block: B:421:0x06d3  */
    /* JADX WARN: Removed duplicated region for block: B:479:0x07d0  */
    /* JADX WARN: Removed duplicated region for block: B:488:0x0811  */
    /* JADX WARN: Removed duplicated region for block: B:494:0x082e A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:499:0x083b A[LOOP:14: B:498:0x0839->B:499:0x083b, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:511:0x08a1  */
    /* JADX WARN: Removed duplicated region for block: B:512:0x08ae  */
    /* JADX WARN: Removed duplicated region for block: B:515:0x08c1  */
    /* JADX WARN: Removed duplicated region for block: B:516:0x08ca  */
    /* JADX WARN: Removed duplicated region for block: B:518:0x08ce  */
    /* JADX WARN: Removed duplicated region for block: B:531:0x0905  */
    /* JADX WARN: Removed duplicated region for block: B:533:0x0909  */
    /* JADX WARN: Removed duplicated region for block: B:534:0x090b  */
    /* JADX WARN: Removed duplicated region for block: B:538:0x091a  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0127  */
    /* JADX WARN: Type inference failed for: r5v10, types: [boolean] */
    /* JADX WARN: Type inference failed for: r5v12 */
    /* JADX WARN: Type inference failed for: r5v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void P() {
        Object[] objArr;
        c cVar;
        int i5;
        boolean z11;
        char c11;
        int i11;
        boolean z12;
        boolean z13;
        boolean z14;
        c cVar2;
        boolean[] zArr;
        boolean z15;
        int iMax;
        ?? r52;
        boolean z16;
        int iMax2;
        boolean z17;
        int i12;
        int i13;
        int iMax3;
        int iMax4;
        int iB;
        int i14;
        n nVar;
        n nVar2;
        boolean z18;
        ArrayList arrayList;
        ArrayList arrayList2;
        u uVar;
        ArrayList arrayList3;
        int i15;
        boolean z19;
        this.X = 0;
        this.Y = 0;
        this.D0 = false;
        this.E0 = false;
        int size = this.f57121p0.size();
        int iMax5 = Math.max(0, n());
        int iMax6 = Math.max(0, k());
        int[] iArr = this.f57109o0;
        int i16 = iArr[1];
        int i17 = iArr[0];
        int i18 = this.f57124s0;
        c cVar3 = this.I;
        c cVar4 = this.H;
        if (i18 == 0 && j.c(this.C0, 1)) {
            u uVar2 = this.f57125t0;
            int i19 = iArr[0];
            int i21 = iArr[1];
            B();
            ArrayList arrayList4 = this.f57121p0;
            int size2 = arrayList4.size();
            for (int i22 = 0; i22 < size2; i22++) {
                ((d) arrayList4.get(i22)).B();
            }
            boolean z21 = this.f57126u0;
            if (i19 == 1) {
                E(0, n());
            } else {
                cVar4.l(0);
                this.X = 0;
            }
            int i23 = 0;
            boolean z22 = false;
            boolean z23 = false;
            while (i23 < size2) {
                int[] iArr2 = iArr;
                d dVar = (d) arrayList4.get(i23);
                int i24 = i23;
                if (dVar instanceof h) {
                    h hVar = (h) dVar;
                    z19 = z22;
                    if (hVar.f57162t0 == 1) {
                        int i25 = hVar.f57159q0;
                        if (i25 != -1) {
                            hVar.M(i25);
                        } else if (hVar.f57160r0 != -1 && x()) {
                            hVar.M(n() - hVar.f57160r0);
                        } else if (x()) {
                            hVar.M((int) ((hVar.f57158p0 * n()) + 0.5f));
                        }
                        z19 = true;
                    }
                } else {
                    z19 = z22;
                    if ((dVar instanceof a) && ((a) dVar).P() == 0) {
                        z22 = z19;
                        z23 = true;
                    }
                    i23 = i24 + 1;
                    iArr = iArr2;
                }
                z22 = z19;
                i23 = i24 + 1;
                iArr = iArr2;
            }
            objArr = iArr;
            if (z22) {
                for (int i26 = 0; i26 < size2; i26 = i15 + 1) {
                    d dVar2 = (d) arrayList4.get(i26);
                    if (dVar2 instanceof h) {
                        h hVar2 = (h) dVar2;
                        i15 = i26;
                        if (hVar2.f57162t0 == 1) {
                            h4.h.c(0, uVar2, hVar2, z21);
                        }
                    } else {
                        i15 = i26;
                    }
                }
            }
            h4.h.c(0, uVar2, this, z21);
            if (z23) {
                for (int i27 = 0; i27 < size2; i27++) {
                    d dVar3 = (d) arrayList4.get(i27);
                    if (dVar3 instanceof a) {
                        a aVar = (a) dVar3;
                        if (aVar.P() == 0 && aVar.O()) {
                            h4.h.c(1, uVar2, aVar, z21);
                        }
                    }
                }
            }
            if (i21 == 1) {
                F(0, k());
            } else {
                cVar3.l(0);
                this.Y = 0;
            }
            int i28 = 0;
            boolean z24 = false;
            boolean z25 = false;
            while (i28 < size2) {
                d dVar4 = (d) arrayList4.get(i28);
                int i29 = i28;
                if (dVar4 instanceof h) {
                    h hVar3 = (h) dVar4;
                    if (hVar3.f57162t0 == 0) {
                        int i31 = hVar3.f57159q0;
                        if (i31 != -1) {
                            hVar3.M(i31);
                        } else if (hVar3.f57160r0 != -1 && y()) {
                            hVar3.M(k() - hVar3.f57160r0);
                        } else if (y()) {
                            hVar3.M((int) ((hVar3.f57158p0 * k()) + 0.5f));
                        }
                        z24 = true;
                    }
                } else if ((dVar4 instanceof a) && ((a) dVar4).P() == 1) {
                    z25 = true;
                }
                i28 = i29 + 1;
            }
            if (z24) {
                for (int i32 = 0; i32 < size2; i32++) {
                    d dVar5 = (d) arrayList4.get(i32);
                    if (dVar5 instanceof h) {
                        h hVar4 = (h) dVar5;
                        if (hVar4.f57162t0 == 0) {
                            h4.h.i(1, uVar2, hVar4);
                        }
                    }
                }
            }
            h4.h.i(0, uVar2, this);
            if (z25) {
                for (int i33 = 0; i33 < size2; i33++) {
                    d dVar6 = (d) arrayList4.get(i33);
                    if (dVar6 instanceof a) {
                        a aVar2 = (a) dVar6;
                        if (aVar2.P() == 1 && aVar2.O()) {
                            h4.h.i(1, uVar2, aVar2);
                        }
                    }
                }
            }
            for (int i34 = 0; i34 < size2; i34++) {
                d dVar7 = (d) arrayList4.get(i34);
                if (dVar7.w() && h4.h.a(dVar7)) {
                    Q(dVar7, uVar2, h4.h.f59120a);
                    if (!(dVar7 instanceof h)) {
                        h4.h.c(0, uVar2, dVar7, z21);
                        h4.h.i(0, uVar2, dVar7);
                    } else if (((h) dVar7).f57162t0 == 0) {
                        h4.h.i(0, uVar2, dVar7);
                    } else {
                        h4.h.c(0, uVar2, dVar7, z21);
                    }
                }
            }
            for (int i35 = 0; i35 < size; i35++) {
                d dVar8 = (d) this.f57121p0.get(i35);
                if (dVar8.w() && !(dVar8 instanceof h) && !(dVar8 instanceof a) && !(dVar8 instanceof g) && !dVar8.E) {
                    int iJ = dVar8.j(0);
                    int iJ2 = dVar8.j(1);
                    if (iJ != 3 || dVar8.f57111q == 1 || iJ2 != 3 || dVar8.f57112r == 1) {
                        Q(dVar8, this.f57125t0, new h4.b());
                    }
                }
            }
        } else {
            objArr = iArr;
        }
        e4.c cVar5 = this.f57127v0;
        if (size > 2 && ((i17 == 2 || i16 == 2) && j.c(this.C0, 1024))) {
            u uVar3 = this.f57125t0;
            ArrayList arrayList5 = this.f57121p0;
            int size3 = arrayList5.size();
            int i36 = 0;
            while (true) {
                if (i36 < size3) {
                    d dVar9 = (d) arrayList5.get(i36);
                    char c12 = objArr[0];
                    char c13 = objArr[1];
                    int i37 = i36;
                    int[] iArr3 = dVar9.f57109o0;
                    cVar = cVar4;
                    if (!h4.h.h(c12, c13, iArr3[0], iArr3[1]) || (dVar9 instanceof g)) {
                        break;
                    }
                    i36 = i37 + 1;
                    cVar4 = cVar;
                } else {
                    cVar = cVar4;
                    int i38 = 0;
                    ArrayList arrayList6 = null;
                    ArrayList arrayList7 = null;
                    ArrayList arrayList8 = null;
                    ArrayList arrayList9 = null;
                    ArrayList arrayList10 = null;
                    ArrayList arrayList11 = null;
                    while (i38 < size3) {
                        int i39 = i38;
                        d dVar10 = (d) arrayList5.get(i38);
                        ArrayList arrayList12 = arrayList6;
                        char c14 = objArr[0];
                        ArrayList arrayList13 = arrayList7;
                        char c15 = objArr[1];
                        ArrayList arrayList14 = arrayList8;
                        int[] iArr4 = dVar10.f57109o0;
                        ArrayList arrayList15 = arrayList9;
                        if (!h4.h.h(c14, c15, iArr4[0], iArr4[1])) {
                            Q(dVar10, uVar3, this.K0);
                        }
                        boolean z26 = dVar10 instanceof h;
                        if (z26) {
                            h hVar5 = (h) dVar10;
                            if (hVar5.f57162t0 == 0) {
                                arrayList8 = arrayList14 == null ? new ArrayList() : arrayList14;
                                arrayList8.add(hVar5);
                            } else {
                                arrayList8 = arrayList14;
                            }
                            z18 = z26;
                            if (hVar5.f57162t0 == 1) {
                                arrayList = arrayList12 == null ? new ArrayList() : arrayList12;
                                arrayList.add(hVar5);
                            } else {
                                arrayList = arrayList12;
                            }
                        } else {
                            z18 = z26;
                            arrayList = arrayList12;
                            arrayList8 = arrayList14;
                        }
                        if (!(dVar10 instanceof i)) {
                            arrayList2 = arrayList;
                            uVar = uVar3;
                            arrayList7 = arrayList13;
                        } else if (dVar10 instanceof a) {
                            a aVar3 = (a) dVar10;
                            if (aVar3.P() == 0) {
                                arrayList3 = arrayList13 == null ? new ArrayList() : arrayList13;
                                arrayList3.add(aVar3);
                            } else {
                                arrayList3 = arrayList13;
                            }
                            arrayList2 = arrayList;
                            uVar = uVar3;
                            if (aVar3.P() == 1) {
                                ArrayList arrayList16 = arrayList15 == null ? new ArrayList() : arrayList15;
                                arrayList16.add(aVar3);
                                arrayList15 = arrayList16;
                            }
                            arrayList7 = arrayList3;
                        } else {
                            arrayList2 = arrayList;
                            uVar = uVar3;
                            i iVar = (i) dVar10;
                            arrayList7 = arrayList13 == null ? new ArrayList() : arrayList13;
                            arrayList7.add(iVar);
                            arrayList9 = arrayList15 == null ? new ArrayList() : arrayList15;
                            arrayList9.add(iVar);
                            if (dVar10.H.f57078f == null && dVar10.J.f57078f == null && !z18 && !(dVar10 instanceof a)) {
                                if (arrayList10 == null) {
                                    arrayList10 = new ArrayList();
                                }
                                ArrayList arrayList17 = arrayList10;
                                arrayList17.add(dVar10);
                                arrayList10 = arrayList17;
                            }
                            if (dVar10.I.f57078f != null && dVar10.K.f57078f == null && dVar10.L.f57078f == null && !z18 && !(dVar10 instanceof a)) {
                                if (arrayList11 == null) {
                                    arrayList11 = new ArrayList();
                                }
                                ArrayList arrayList18 = arrayList11;
                                arrayList18.add(dVar10);
                                arrayList11 = arrayList18;
                            }
                            i38 = i39 + 1;
                            arrayList6 = arrayList2;
                            uVar3 = uVar;
                        }
                        arrayList9 = arrayList15;
                        if (dVar10.H.f57078f == null) {
                            if (arrayList10 == null) {
                            }
                            ArrayList arrayList172 = arrayList10;
                            arrayList172.add(dVar10);
                            arrayList10 = arrayList172;
                        }
                        if (dVar10.I.f57078f != null) {
                        }
                        i38 = i39 + 1;
                        arrayList6 = arrayList2;
                        uVar3 = uVar;
                    }
                    ArrayList arrayList19 = arrayList6;
                    ArrayList arrayList20 = arrayList7;
                    ArrayList arrayList21 = arrayList8;
                    ArrayList arrayList22 = arrayList9;
                    ArrayList arrayList23 = new ArrayList();
                    if (arrayList19 != null) {
                        Iterator it = arrayList19.iterator();
                        while (it.hasNext()) {
                            h4.h.b((h) it.next(), 0, arrayList23, null);
                        }
                    }
                    n nVar3 = null;
                    int i40 = 0;
                    if (arrayList20 != null) {
                        Iterator it2 = arrayList20.iterator();
                        while (it2.hasNext()) {
                            i iVar2 = (i) it2.next();
                            n nVarB = h4.h.b(iVar2, i40, arrayList23, nVar3);
                            iVar2.M(i40, nVarB, arrayList23);
                            nVarB.a(arrayList23);
                            nVar3 = null;
                            i40 = 0;
                        }
                    }
                    HashSet hashSet = i(2).f57073a;
                    if (hashSet != null) {
                        Iterator it3 = hashSet.iterator();
                        while (it3.hasNext()) {
                            h4.h.b(((c) it3.next()).f57076d, 0, arrayList23, null);
                        }
                    }
                    HashSet hashSet2 = i(4).f57073a;
                    if (hashSet2 != null) {
                        Iterator it4 = hashSet2.iterator();
                        while (it4.hasNext()) {
                            h4.h.b(((c) it4.next()).f57076d, 0, arrayList23, null);
                        }
                    }
                    HashSet hashSet3 = i(7).f57073a;
                    if (hashSet3 != null) {
                        Iterator it5 = hashSet3.iterator();
                        while (it5.hasNext()) {
                            h4.h.b(((c) it5.next()).f57076d, 0, arrayList23, null);
                        }
                    }
                    n nVar4 = null;
                    if (arrayList10 != null) {
                        Iterator it6 = arrayList10.iterator();
                        while (it6.hasNext()) {
                            h4.h.b((d) it6.next(), 0, arrayList23, null);
                        }
                    }
                    if (arrayList21 != null) {
                        Iterator it7 = arrayList21.iterator();
                        while (it7.hasNext()) {
                            h4.h.b((h) it7.next(), 1, arrayList23, null);
                        }
                    }
                    int i41 = 1;
                    if (arrayList22 != null) {
                        Iterator it8 = arrayList22.iterator();
                        while (it8.hasNext()) {
                            i iVar3 = (i) it8.next();
                            n nVarB2 = h4.h.b(iVar3, i41, arrayList23, nVar4);
                            iVar3.M(i41, nVarB2, arrayList23);
                            nVarB2.a(arrayList23);
                            nVar4 = null;
                            i41 = 1;
                        }
                    }
                    HashSet hashSet4 = i(3).f57073a;
                    if (hashSet4 != null) {
                        Iterator it9 = hashSet4.iterator();
                        while (it9.hasNext()) {
                            h4.h.b(((c) it9.next()).f57076d, 1, arrayList23, null);
                        }
                    }
                    HashSet hashSet5 = i(6).f57073a;
                    if (hashSet5 != null) {
                        Iterator it10 = hashSet5.iterator();
                        while (it10.hasNext()) {
                            h4.h.b(((c) it10.next()).f57076d, 1, arrayList23, null);
                        }
                    }
                    HashSet hashSet6 = i(5).f57073a;
                    if (hashSet6 != null) {
                        Iterator it11 = hashSet6.iterator();
                        while (it11.hasNext()) {
                            h4.h.b(((c) it11.next()).f57076d, 1, arrayList23, null);
                        }
                    }
                    HashSet hashSet7 = i(7).f57073a;
                    if (hashSet7 != null) {
                        Iterator it12 = hashSet7.iterator();
                        while (it12.hasNext()) {
                            h4.h.b(((c) it12.next()).f57076d, 1, arrayList23, null);
                        }
                    }
                    boolean z27 = true;
                    if (arrayList11 != null) {
                        Iterator it13 = arrayList11.iterator();
                        while (it13.hasNext()) {
                            h4.h.b((d) it13.next(), 1, arrayList23, null);
                        }
                    }
                    int i42 = 0;
                    while (i42 < size3) {
                        d dVar11 = (d) arrayList5.get(i42);
                        int[] iArr5 = dVar11.f57109o0;
                        boolean z28 = z27;
                        if (iArr5[0] == 3 && iArr5[z28 ? 1 : 0] == 3) {
                            int i43 = dVar11.f57107m0;
                            int size4 = arrayList23.size();
                            int i44 = 0;
                            while (true) {
                                if (i44 >= size4) {
                                    i14 = i42;
                                    nVar = null;
                                    break;
                                }
                                i14 = i42;
                                nVar = (n) arrayList23.get(i44);
                                int i45 = size4;
                                if (i43 == nVar.f59128b) {
                                    break;
                                }
                                i44++;
                                size4 = i45;
                                i42 = i14;
                            }
                            int i46 = dVar11.f57108n0;
                            int size5 = arrayList23.size();
                            int i47 = 0;
                            while (true) {
                                if (i47 >= size5) {
                                    nVar2 = null;
                                    break;
                                }
                                nVar2 = (n) arrayList23.get(i47);
                                int i48 = size5;
                                if (i46 == nVar2.f59128b) {
                                    break;
                                }
                                i47++;
                                size5 = i48;
                            }
                            if (nVar != null && nVar2 != null) {
                                nVar.c(0, nVar2);
                                nVar2.f59129c = 2;
                                arrayList23.remove(nVar);
                            }
                        } else {
                            i14 = i42;
                        }
                        i42 = i14 + 1;
                        z27 = true;
                    }
                    if (arrayList23.size() <= 1) {
                        break;
                    }
                    int i49 = 0;
                    if (objArr[0] == 2) {
                        Iterator it14 = arrayList23.iterator();
                        int i51 = 0;
                        n nVar5 = null;
                        while (it14.hasNext()) {
                            n nVar6 = (n) it14.next();
                            if (nVar6.f59129c != 1) {
                                int iB2 = nVar6.b(cVar5, i49);
                                if (iB2 > i51) {
                                    nVar5 = nVar6;
                                    i51 = iB2;
                                }
                                i49 = 0;
                            }
                        }
                        if (nVar5 != null) {
                            H(1);
                            J(i51);
                        } else {
                            nVar5 = null;
                        }
                        if (objArr[1] == 2) {
                            Iterator it15 = arrayList23.iterator();
                            int i52 = 0;
                            n nVar7 = null;
                            while (it15.hasNext()) {
                                n nVar8 = (n) it15.next();
                                if (nVar8.f59129c != 0 && (iB = nVar8.b(cVar5, 1)) > i52) {
                                    nVar7 = nVar8;
                                    i52 = iB;
                                }
                            }
                            if (nVar7 != null) {
                                I(1);
                                G(i52);
                            } else {
                                nVar7 = null;
                            }
                            if (nVar5 != null || nVar7 != null) {
                                if (i17 == 2) {
                                    if (iMax5 >= n() || iMax5 <= 0) {
                                        iMax5 = n();
                                    } else {
                                        J(iMax5);
                                        this.D0 = true;
                                    }
                                }
                                if (i16 == 2) {
                                    if (iMax6 >= k() || iMax6 <= 0) {
                                        iMax6 = k();
                                    } else {
                                        G(iMax6);
                                        this.E0 = true;
                                    }
                                }
                                i5 = iMax5;
                                z11 = true;
                            }
                        }
                    }
                }
            }
            boolean z29 = !R(64) || R(128);
            cVar5.getClass();
            cVar5.f52142h = false;
            if (this.C0 == 0 && z29) {
                c11 = 1;
                cVar5.f52142h = true;
            } else {
                c11 = 1;
            }
            ArrayList arrayList24 = this.f57121p0;
            boolean z31 = objArr[0] != 2 || objArr[c11] == 2;
            this.f57130y0 = 0;
            this.f57131z0 = 0;
            for (i11 = 0; i11 < size; i11++) {
                d dVar12 = (d) this.f57121p0.get(i11);
                if (dVar12 instanceof e) {
                    ((e) dVar12).P();
                }
            }
            boolean zR = R(64);
            z12 = z11;
            int i53 = 0;
            z13 = true;
            while (z13) {
                int i54 = i53 + 1;
                try {
                    cVar5.t();
                    this.f57130y0 = 0;
                    this.f57131z0 = 0;
                    g(cVar5);
                    for (int i55 = 0; i55 < size; i55++) {
                        ((d) this.f57121p0.get(i55)).g(cVar5);
                    }
                    N(cVar5);
                    try {
                        WeakReference weakReference = this.F0;
                        if (weakReference == null || weakReference.get() == null) {
                            z14 = z31;
                        } else {
                            z14 = z31;
                            try {
                                cVar5.f(cVar5.k((c) this.F0.get()), cVar5.k(cVar3), 0, 5);
                                this.F0 = null;
                            } catch (Exception e3) {
                                e = e3;
                                z13 = true;
                                e.printStackTrace();
                                cVar2 = cVar3;
                                System.out.println("EXCEPTION : " + e);
                                boolean[] zArr2 = j.f57166a;
                                if (z13) {
                                }
                                if (z14) {
                                }
                                iMax = Math.max(this.f57083a0, n());
                                if (iMax > n()) {
                                }
                                iMax2 = Math.max(this.f57085b0, k());
                                if (iMax2 > k()) {
                                }
                                if (!z17) {
                                }
                                z12 = z17;
                                i12 = 8;
                                if (i54 <= i12) {
                                }
                                i53 = i54;
                                z31 = z14;
                                cVar3 = cVar2;
                            }
                        }
                        WeakReference weakReference2 = this.H0;
                        if (weakReference2 != null && weakReference2.get() != null) {
                            cVar5.f(cVar5.k(this.K), cVar5.k((c) this.H0.get()), 0, 5);
                            this.H0 = null;
                        }
                        WeakReference weakReference3 = this.G0;
                        if (weakReference3 != null && weakReference3.get() != null) {
                            c cVar6 = cVar;
                            try {
                                cVar = cVar6;
                                cVar5.f(cVar5.k((c) this.G0.get()), cVar5.k(cVar6), 0, 5);
                                this.G0 = null;
                            } catch (Exception e11) {
                                e = e11;
                                cVar = cVar6;
                                z13 = true;
                                e.printStackTrace();
                                cVar2 = cVar3;
                                System.out.println("EXCEPTION : " + e);
                                boolean[] zArr22 = j.f57166a;
                                if (z13) {
                                }
                                if (z14) {
                                    int iMax7 = 0;
                                    int iMax8 = 0;
                                    while (i13 < size) {
                                    }
                                    iMax3 = Math.max(this.f57083a0, iMax7);
                                    iMax4 = Math.max(this.f57085b0, iMax8);
                                    if (i17 == 2) {
                                        J(iMax3);
                                        objArr[0] = 2;
                                        z12 = true;
                                        z15 = true;
                                    }
                                    if (i16 == 2) {
                                        G(iMax4);
                                        objArr[1] = 2;
                                        z12 = true;
                                        z15 = true;
                                    }
                                }
                                iMax = Math.max(this.f57083a0, n());
                                if (iMax > n()) {
                                }
                                iMax2 = Math.max(this.f57085b0, k());
                                if (iMax2 > k()) {
                                }
                                if (!z17) {
                                }
                                z12 = z17;
                                i12 = 8;
                                if (i54 <= i12) {
                                }
                                i53 = i54;
                                z31 = z14;
                                cVar3 = cVar2;
                            }
                        }
                        WeakReference weakReference4 = this.I0;
                        if (weakReference4 != null && weakReference4.get() != null) {
                            try {
                            } catch (Exception e12) {
                                e = e12;
                            }
                            try {
                                cVar5.f(cVar5.k(this.J), cVar5.k((c) this.I0.get()), 0, 5);
                            } catch (Exception e13) {
                                e = e13;
                                z13 = true;
                                e.printStackTrace();
                                cVar2 = cVar3;
                                System.out.println("EXCEPTION : " + e);
                                boolean[] zArr222 = j.f57166a;
                                if (z13) {
                                }
                                if (z14) {
                                }
                                iMax = Math.max(this.f57083a0, n());
                                if (iMax > n()) {
                                }
                                iMax2 = Math.max(this.f57085b0, k());
                                if (iMax2 > k()) {
                                }
                                if (!z17) {
                                }
                                z12 = z17;
                                i12 = 8;
                                if (i54 <= i12) {
                                }
                                i53 = i54;
                                z31 = z14;
                                cVar3 = cVar2;
                            }
                            try {
                                this.I0 = null;
                            } catch (Exception e14) {
                                e = e14;
                                z13 = true;
                                e.printStackTrace();
                                cVar2 = cVar3;
                                System.out.println("EXCEPTION : " + e);
                                boolean[] zArr2222 = j.f57166a;
                                if (z13) {
                                }
                                if (z14) {
                                }
                                iMax = Math.max(this.f57083a0, n());
                                if (iMax > n()) {
                                }
                                iMax2 = Math.max(this.f57085b0, k());
                                if (iMax2 > k()) {
                                }
                                if (!z17) {
                                }
                                z12 = z17;
                                i12 = 8;
                                if (i54 <= i12) {
                                }
                                i53 = i54;
                                z31 = z14;
                                cVar3 = cVar2;
                            }
                        }
                        cVar5.p();
                        cVar2 = cVar3;
                        z13 = true;
                    } catch (Exception e15) {
                        e = e15;
                        z14 = z31;
                    }
                } catch (Exception e16) {
                    e = e16;
                    z14 = z31;
                }
                boolean[] zArr22222 = j.f57166a;
                if (z13) {
                    zArr22222[2] = false;
                    boolean zR2 = R(64);
                    L(cVar5, zR2);
                    int size6 = this.f57121p0.size();
                    int i56 = 0;
                    z15 = false;
                    while (i56 < size6) {
                        d dVar13 = (d) this.f57121p0.get(i56);
                        dVar13.L(cVar5, zR2);
                        boolean[] zArr3 = zArr22222;
                        boolean z32 = zR2;
                        if (dVar13.f57096h != -1 || dVar13.f57098i != -1) {
                            z15 = true;
                        }
                        i56++;
                        zArr22222 = zArr3;
                        zR2 = z32;
                    }
                    zArr = zArr22222;
                } else {
                    zArr = zArr22222;
                    L(cVar5, zR);
                    for (int i57 = 0; i57 < size; i57++) {
                        ((d) this.f57121p0.get(i57)).L(cVar5, zR);
                    }
                    z15 = false;
                }
                if (z14 && i54 < 8 && zArr[2]) {
                    int iMax72 = 0;
                    int iMax82 = 0;
                    for (i13 = 0; i13 < size; i13++) {
                        d dVar14 = (d) this.f57121p0.get(i13);
                        iMax72 = Math.max(iMax72, dVar14.n() + dVar14.X);
                        iMax82 = Math.max(iMax82, dVar14.k() + dVar14.Y);
                    }
                    iMax3 = Math.max(this.f57083a0, iMax72);
                    iMax4 = Math.max(this.f57085b0, iMax82);
                    if (i17 == 2 && n() < iMax3) {
                        J(iMax3);
                        objArr[0] = 2;
                        z12 = true;
                        z15 = true;
                    }
                    if (i16 == 2 && k() < iMax4) {
                        G(iMax4);
                        objArr[1] = 2;
                        z12 = true;
                        z15 = true;
                    }
                }
                iMax = Math.max(this.f57083a0, n());
                if (iMax > n()) {
                    J(iMax);
                    r52 = 1;
                    objArr[0] = 1;
                    z15 = true;
                    z16 = true;
                } else {
                    r52 = 1;
                    z16 = z12;
                }
                iMax2 = Math.max(this.f57085b0, k());
                if (iMax2 > k()) {
                    G(iMax2);
                    objArr[r52] = r52;
                    z17 = r52;
                    z15 = z17;
                } else {
                    z17 = z16;
                }
                if (!z17) {
                    if (objArr[0] == 2 && i5 > 0 && n() > i5) {
                        this.D0 = r52;
                        objArr[0] = r52;
                        J(i5);
                        z17 = r52;
                        z15 = z17;
                    }
                    if (objArr[r52] == 2 && iMax6 > 0 && k() > iMax6) {
                        this.E0 = r52;
                        objArr[r52] = r52;
                        G(iMax6);
                        i12 = 8;
                        z12 = true;
                        z15 = true;
                    }
                    z13 = i54 <= i12 ? false : z15;
                    i53 = i54;
                    z31 = z14;
                    cVar3 = cVar2;
                }
                z12 = z17;
                i12 = 8;
                if (i54 <= i12) {
                }
                i53 = i54;
                z31 = z14;
                cVar3 = cVar2;
            }
            this.f57121p0 = arrayList24;
            if (z12) {
                objArr[0] = i17;
                objArr[1] = i16;
            }
            C(cVar5.f52147m);
        }
        cVar = cVar4;
        i5 = iMax5;
        z11 = false;
        if (R(64)) {
        }
        cVar5.getClass();
        cVar5.f52142h = false;
        if (this.C0 == 0) {
            c11 = 1;
        }
        ArrayList arrayList242 = this.f57121p0;
        if (objArr[0] != 2) {
        }
        this.f57130y0 = 0;
        this.f57131z0 = 0;
        while (i11 < size) {
        }
        boolean zR3 = R(64);
        z12 = z11;
        int i532 = 0;
        z13 = true;
        while (z13) {
        }
        this.f57121p0 = arrayList242;
        if (z12) {
        }
        C(cVar5.f52147m);
    }

    public final boolean R(int i5) {
        return (this.C0 & i5) == i5;
    }

    @Override // g4.d
    public final void z() {
        this.f57127v0.t();
        this.f57128w0 = 0;
        this.f57129x0 = 0;
        this.f57121p0.clear();
        super.z();
    }
}
