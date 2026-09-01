package defpackage;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c72 extends b72 {
    public int u0;
    public int y0;
    public int z0;
    public ArrayList r0 = new ArrayList();
    public m50 s0 = new m50(this);
    public w73 t0 = new w73(this);
    public ro0 v0 = null;
    public boolean w0 = false;
    public wz6 x0 = new wz6();
    public int A0 = 0;
    public int B0 = 0;
    public pj1[] C0 = new pj1[4];
    public pj1[] D0 = new pj1[4];
    public int E0 = 257;
    public boolean F0 = false;
    public boolean G0 = false;
    public WeakReference H0 = null;
    public WeakReference I0 = null;
    public WeakReference J0 = null;
    public WeakReference K0 = null;
    public HashSet L0 = new HashSet();
    public qo0 M0 = new qo0();

    public static void b0(b72 b72Var, ro0 ro0Var, qo0 qo0Var) {
        int i;
        int i2;
        if (ro0Var == null) {
            return;
        }
        int i3 = b72Var.i0;
        int[] iArr = b72Var.u;
        if (i3 == 8 || (b72Var instanceof sh5) || (b72Var instanceof bn0)) {
            qo0Var.e = 0;
            qo0Var.f = 0;
            return;
        }
        a72[] a72VarArr = b72Var.U;
        qo0Var.a = a72VarArr[0];
        qo0Var.b = a72VarArr[1];
        qo0Var.c = b72Var.r();
        qo0Var.d = b72Var.l();
        qo0Var.i = false;
        qo0Var.j = 0;
        a72 a72Var = qo0Var.a;
        a72 a72Var2 = a72.MATCH_CONSTRAINT;
        boolean z = a72Var == a72Var2;
        boolean z2 = qo0Var.b == a72Var2;
        boolean z3 = z && b72Var.Y > 0.0f;
        boolean z4 = z2 && b72Var.Y > 0.0f;
        if (z && b72Var.u(0) && b72Var.s == 0 && !z3) {
            qo0Var.a = a72.WRAP_CONTENT;
            if (z2 && b72Var.t == 0) {
                qo0Var.a = a72.FIXED;
            }
            z = false;
        }
        if (z2 && b72Var.u(1) && b72Var.t == 0 && !z4) {
            qo0Var.b = a72.WRAP_CONTENT;
            if (z && b72Var.s == 0) {
                qo0Var.b = a72.FIXED;
            }
            z2 = false;
        }
        if (b72Var.B()) {
            qo0Var.a = a72.FIXED;
            z = false;
        }
        if (b72Var.C()) {
            qo0Var.b = a72.FIXED;
            z2 = false;
        }
        if (z3) {
            if (iArr[0] == 4) {
                qo0Var.a = a72.FIXED;
            } else if (!z2) {
                a72 a72Var3 = qo0Var.b;
                a72 a72Var4 = a72.FIXED;
                if (a72Var3 == a72Var4) {
                    i2 = qo0Var.d;
                } else {
                    qo0Var.a = a72.WRAP_CONTENT;
                    ro0Var.b(b72Var, qo0Var);
                    i2 = qo0Var.f;
                }
                qo0Var.a = a72Var4;
                qo0Var.c = (int) (b72Var.Y * i2);
            }
        }
        if (z4) {
            if (iArr[1] == 4) {
                qo0Var.b = a72.FIXED;
            } else if (!z) {
                a72 a72Var5 = qo0Var.a;
                a72 a72Var6 = a72.FIXED;
                if (a72Var5 == a72Var6) {
                    i = qo0Var.c;
                } else {
                    qo0Var.b = a72.WRAP_CONTENT;
                    ro0Var.b(b72Var, qo0Var);
                    i = qo0Var.e;
                }
                qo0Var.b = a72Var6;
                int i4 = b72Var.Z;
                float f = b72Var.Y;
                if (i4 == -1) {
                    qo0Var.d = (int) (i / f);
                } else {
                    qo0Var.d = (int) (f * i);
                }
            }
        }
        ro0Var.b(b72Var, qo0Var);
        b72Var.S(qo0Var.e);
        b72Var.N(qo0Var.f);
        b72Var.F = qo0Var.h;
        b72Var.J(qo0Var.g);
        qo0Var.j = 0;
    }

    @Override // defpackage.b72
    public final void D() {
        this.x0.t();
        this.y0 = 0;
        this.z0 = 0;
        this.r0.clear();
        super.D();
    }

    @Override // defpackage.b72
    public final void G(m50 m50Var) {
        super.G(m50Var);
        int size = this.r0.size();
        for (int i = 0; i < size; i++) {
            ((b72) this.r0.get(i)).G(m50Var);
        }
    }

    @Override // defpackage.b72
    public final void T(boolean z, boolean z2) {
        super.T(z, z2);
        int size = this.r0.size();
        for (int i = 0; i < size; i++) {
            ((b72) this.r0.get(i)).T(z, z2);
        }
    }

    public final void V(b72 b72Var) {
        this.r0.add(b72Var);
        c72 c72Var = b72Var.V;
        if (c72Var != null) {
            c72Var.r0.remove(b72Var);
            b72Var.D();
        }
        b72Var.V = this;
    }

    public final void W(b72 b72Var, int i) {
        if (i == 0) {
            int i2 = this.A0 + 1;
            pj1[] pj1VarArr = this.D0;
            if (i2 >= pj1VarArr.length) {
                pj1VarArr = (pj1[]) Arrays.copyOf(pj1VarArr, pj1VarArr.length * 2);
                this.D0 = pj1VarArr;
            }
            int i3 = this.A0;
            pj1VarArr[i3] = new pj1(b72Var, 0, this.w0);
            this.A0 = i3 + 1;
            return;
        }
        if (i == 1) {
            int i4 = this.B0 + 1;
            pj1[] pj1VarArr2 = this.C0;
            if (i4 >= pj1VarArr2.length) {
                pj1VarArr2 = (pj1[]) Arrays.copyOf(pj1VarArr2, pj1VarArr2.length * 2);
                this.C0 = pj1VarArr2;
            }
            int i5 = this.B0;
            pj1VarArr2[i5] = new pj1(b72Var, 1, this.w0);
            this.B0 = i5 + 1;
        }
    }

    public final void X(wz6 wz6Var) {
        c72 c72Var;
        wz6 wz6Var2;
        HashSet hashSet = this.L0;
        boolean zC0 = c0(64);
        c(wz6Var, zC0);
        int size = this.r0.size();
        boolean z = false;
        for (int i = 0; i < size; i++) {
            b72 b72Var = (b72) this.r0.get(i);
            boolean[] zArr = b72Var.T;
            zArr[0] = false;
            zArr[1] = false;
            if (b72Var instanceof bn0) {
                z = true;
            }
        }
        if (z) {
            for (int i2 = 0; i2 < size; i2++) {
                b72 b72Var2 = (b72) this.r0.get(i2);
                if (b72Var2 instanceof bn0) {
                    bn0 bn0Var = (bn0) b72Var2;
                    for (int i3 = 0; i3 < bn0Var.s0; i3++) {
                        b72 b72Var3 = bn0Var.r0[i3];
                        if (bn0Var.u0 || b72Var3.d()) {
                            int i4 = bn0Var.t0;
                            if (i4 == 0 || i4 == 1) {
                                b72Var3.T[0] = true;
                            } else if (i4 == 2 || i4 == 3) {
                                b72Var3.T[1] = true;
                            }
                        }
                    }
                }
            }
        }
        hashSet.clear();
        for (int i5 = 0; i5 < size; i5++) {
            b72 b72Var4 = (b72) this.r0.get(i5);
            b72Var4.getClass();
            boolean z2 = b72Var4 instanceof dwe;
            if (z2 || (b72Var4 instanceof sh5)) {
                if (z2) {
                    hashSet.add(b72Var4);
                } else {
                    b72Var4.c(wz6Var, zC0);
                }
            }
        }
        while (hashSet.size() > 0) {
            int size2 = hashSet.size();
            Iterator it2 = hashSet.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    break;
                }
                dwe dweVar = (dwe) ((b72) it2.next());
                for (int i6 = 0; i6 < dweVar.s0; i6++) {
                    if (hashSet.contains(dweVar.r0[i6])) {
                        dweVar.c(wz6Var, zC0);
                        hashSet.remove(dweVar);
                        break;
                    }
                }
            }
            if (size2 == hashSet.size()) {
                Iterator it3 = hashSet.iterator();
                while (it3.hasNext()) {
                    ((b72) it3.next()).c(wz6Var, zC0);
                }
                hashSet.clear();
            }
        }
        if (wz6.q) {
            HashSet<b72> hashSet2 = new HashSet();
            for (int i7 = 0; i7 < size; i7++) {
                b72 b72Var5 = (b72) this.r0.get(i7);
                b72Var5.getClass();
                if (!(b72Var5 instanceof dwe) && !(b72Var5 instanceof sh5)) {
                    hashSet2.add(b72Var5);
                }
            }
            c72Var = this;
            wz6Var2 = wz6Var;
            c72Var.b(this, wz6Var2, hashSet2, this.U[0] == a72.WRAP_CONTENT ? 0 : 1, false);
            for (b72 b72Var6 : hashSet2) {
                bgf.v(c72Var, wz6Var2, b72Var6);
                b72Var6.c(wz6Var2, zC0);
            }
        } else {
            c72Var = this;
            wz6Var2 = wz6Var;
            for (int i8 = 0; i8 < size; i8++) {
                b72 b72Var7 = (b72) c72Var.r0.get(i8);
                if (b72Var7 instanceof c72) {
                    a72[] a72VarArr = b72Var7.U;
                    a72 a72Var = a72VarArr[0];
                    a72 a72Var2 = a72VarArr[1];
                    a72 a72Var3 = a72.WRAP_CONTENT;
                    if (a72Var == a72Var3) {
                        b72Var7.O(a72.FIXED);
                    }
                    if (a72Var2 == a72Var3) {
                        b72Var7.Q(a72.FIXED);
                    }
                    b72Var7.c(wz6Var2, zC0);
                    if (a72Var == a72Var3) {
                        b72Var7.O(a72Var);
                    }
                    if (a72Var2 == a72Var3) {
                        b72Var7.Q(a72Var2);
                    }
                } else {
                    bgf.v(c72Var, wz6Var2, b72Var7);
                    if (!(b72Var7 instanceof dwe) && !(b72Var7 instanceof sh5)) {
                        b72Var7.c(wz6Var2, zC0);
                    }
                }
            }
        }
        if (c72Var.A0 > 0) {
            gsa.T(c72Var, wz6Var2, null, 0);
        }
        if (c72Var.B0 > 0) {
            gsa.T(c72Var, wz6Var2, null, 1);
        }
    }

    public final boolean Y(int i, boolean z) {
        boolean z2;
        a72 a72Var;
        w73 w73Var = this.t0;
        ArrayList<m3f> arrayList = (ArrayList) w73Var.f;
        c72 c72Var = (c72) w73Var.d;
        boolean z3 = false;
        a72 a72VarK = c72Var.k(0);
        a72 a72VarK2 = c72Var.k(1);
        int iS = c72Var.s();
        int iT = c72Var.t();
        if (z && (a72VarK == (a72Var = a72.WRAP_CONTENT) || a72VarK2 == a72Var)) {
            Iterator it2 = arrayList.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    break;
                }
                m3f m3fVar = (m3f) it2.next();
                if (m3fVar.f == i && !m3fVar.k()) {
                    z = false;
                    break;
                }
            }
            if (i == 0) {
                if (z && a72VarK == a72.WRAP_CONTENT) {
                    c72Var.O(a72.FIXED);
                    c72Var.S(w73Var.d(c72Var, 0));
                    c72Var.d.e.d(c72Var.r());
                }
            } else if (z && a72VarK2 == a72.WRAP_CONTENT) {
                c72Var.Q(a72.FIXED);
                c72Var.N(w73Var.d(c72Var, 1));
                c72Var.e.e.d(c72Var.l());
            }
        }
        a72[] a72VarArr = c72Var.U;
        if (i == 0) {
            a72 a72Var2 = a72VarArr[0];
            if (a72Var2 == a72.FIXED || a72Var2 == a72.MATCH_PARENT) {
                int iR = c72Var.r() + iS;
                c72Var.d.i.d(iR);
                c72Var.d.e.d(iR - iS);
                z2 = true;
            }
            z2 = false;
        } else {
            a72 a72Var3 = a72VarArr[1];
            if (a72Var3 == a72.FIXED || a72Var3 == a72.MATCH_PARENT) {
                int iL = c72Var.l() + iT;
                c72Var.e.i.d(iL);
                c72Var.e.e.d(iL - iT);
                z2 = true;
            }
            z2 = false;
        }
        w73Var.v();
        for (m3f m3fVar2 : arrayList) {
            if (m3fVar2.f == i && (m3fVar2.b != c72Var || m3fVar2.g)) {
                m3fVar2.e();
            }
        }
        Iterator it3 = arrayList.iterator();
        while (true) {
            if (!it3.hasNext()) {
                z3 = true;
                break;
            }
            m3f m3fVar3 = (m3f) it3.next();
            if (m3fVar3.f == i && (z2 || m3fVar3.b != c72Var)) {
                if (!m3fVar3.h.j || !m3fVar3.i.j || (!(m3fVar3 instanceof rj1) && !m3fVar3.e.j)) {
                    break;
                }
            }
        }
        c72Var.O(a72VarK);
        c72Var.Q(a72VarK2);
        return z3;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:225:0x03a2  */
    /* JADX WARN: Removed duplicated region for block: B:359:0x0626  */
    /* JADX WARN: Removed duplicated region for block: B:373:0x065a  */
    /* JADX WARN: Removed duplicated region for block: B:466:0x07b7  */
    /* JADX WARN: Removed duplicated region for block: B:471:0x07d9  */
    /* JADX WARN: Removed duplicated region for block: B:480:0x0816  */
    /* JADX WARN: Removed duplicated region for block: B:486:0x0830 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:501:0x0894  */
    /* JADX WARN: Removed duplicated region for block: B:504:0x08a6  */
    /* JADX WARN: Removed duplicated region for block: B:507:0x08c1  */
    /* JADX WARN: Removed duplicated region for block: B:508:0x08cc  */
    /* JADX WARN: Removed duplicated region for block: B:510:0x08cf  */
    /* JADX WARN: Removed duplicated region for block: B:522:0x0904 A[PHI: r12 r13
      0x0904: PHI (r12v7 ??) = (r12v6 ??), (r12v10 ??), (r12v10 ??), (r12v10 ??) binds: [B:509:0x08cd, B:517:0x08ec, B:518:0x08ee, B:520:0x08f4] A[DONT_GENERATE, DONT_INLINE]
      0x0904: PHI (r13v7 boolean) = (r13v6 boolean), (r13v9 boolean), (r13v9 boolean), (r13v9 boolean) binds: [B:509:0x08cd, B:517:0x08ec, B:518:0x08ee, B:520:0x08f4] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:524:0x0908  */
    /* JADX WARN: Removed duplicated region for block: B:525:0x090a  */
    /* JADX WARN: Type inference failed for: r12v10 */
    /* JADX WARN: Type inference failed for: r12v11 */
    /* JADX WARN: Type inference failed for: r12v12 */
    /* JADX WARN: Type inference failed for: r12v13 */
    /* JADX WARN: Type inference failed for: r12v28 */
    /* JADX WARN: Type inference failed for: r12v29 */
    /* JADX WARN: Type inference failed for: r12v30 */
    /* JADX WARN: Type inference failed for: r12v31 */
    /* JADX WARN: Type inference failed for: r12v32 */
    /* JADX WARN: Type inference failed for: r12v33 */
    /* JADX WARN: Type inference failed for: r12v6 */
    /* JADX WARN: Type inference failed for: r12v7 */
    /* JADX WARN: Type inference failed for: r12v8 */
    /* JADX WARN: Type inference failed for: r14v0 */
    /* JADX WARN: Type inference failed for: r14v1 */
    /* JADX WARN: Type inference failed for: r14v13 */
    /* JADX WARN: Type inference failed for: r14v14 */
    /* JADX WARN: Type inference failed for: r14v15 */
    /* JADX WARN: Type inference failed for: r14v2 */
    /* JADX WARN: Type inference failed for: r14v3 */
    /* JADX WARN: Type inference failed for: r14v4 */
    /* JADX WARN: Type inference failed for: r14v5 */
    /* JADX WARN: Type inference failed for: r14v58 */
    /* JADX WARN: Type inference failed for: r14v59 */
    /* JADX WARN: Type inference failed for: r14v60 */
    /* JADX WARN: Type inference failed for: r32v0, types: [b72, c72] */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v12, types: [boolean] */
    /* JADX WARN: Type inference failed for: r7v14 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void Z() {
        /*
            Method dump skipped, instruction units count: 2342
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.c72.Z():void");
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void a0(int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        int i8;
        int i9;
        int i10;
        int i11;
        int i12;
        ro0 ro0Var;
        int i13;
        boolean zY;
        int i14;
        int i15;
        ArrayList arrayList;
        int i16;
        ro0 ro0Var2;
        int i17;
        int i18;
        int i19;
        ro0 ro0Var3;
        int i20;
        int i21;
        int i22;
        pr5 pr5Var;
        bte bteVar;
        boolean z;
        int i23;
        int i24;
        int i25;
        int i26;
        boolean z2;
        boolean z3;
        this.y0 = i6;
        this.z0 = i7;
        m50 m50Var = this.s0;
        c72 c72Var = (c72) m50Var.d;
        ArrayList arrayList2 = (ArrayList) m50Var.b;
        ro0 ro0Var4 = this.v0;
        w73 w73Var = this.t0;
        int size = this.r0.size();
        int iR = r();
        int iL = l();
        boolean zX = bgf.x(i, 128);
        int i27 = (zX || bgf.x(i, 64)) ? 1 : 0;
        if (i27 != 0) {
            int i28 = 0;
            while (i28 < size) {
                i9 = 0;
                b72 b72Var = (b72) this.r0.get(i28);
                i10 = 1;
                a72[] a72VarArr = b72Var.U;
                int i29 = i27;
                a72 a72Var = a72VarArr[0];
                i8 = size;
                a72 a72Var2 = a72.MATCH_CONSTRAINT;
                boolean z4 = (a72Var == a72Var2) && (a72VarArr[1] == a72Var2) && b72Var.Y > 0.0f;
                if ((b72Var.y() && z4) || ((b72Var.z() && z4) || (b72Var instanceof dwe) || b72Var.y() || b72Var.z())) {
                    i11 = 0;
                    break;
                } else {
                    i28++;
                    i27 = i29;
                    size = i8;
                }
            }
            i8 = size;
            i9 = 0;
            i10 = 1;
            i11 = i27;
        } else {
            i8 = size;
            i9 = 0;
            i10 = 1;
            i11 = i27;
        }
        int i30 = i11 & (((i2 == 1073741824 && i4 == 1073741824) || zX) ? i10 : i9);
        if (i30 != 0) {
            int[] iArr = this.D;
            int iMin = Math.min(iArr[i9], i3);
            int iMin2 = Math.min(iArr[i10], i5);
            if (i2 != 1073741824 || r() == iMin) {
                z = i10;
            } else {
                S(iMin);
                boolean z5 = i10;
                w73Var.b = z5;
                z = z5;
            }
            if (i4 == 1073741824 && l() != iMin2) {
                N(iMin2);
                w73Var.b = z;
            }
            if (i2 == 1073741824 && i4 == 1073741824) {
                ArrayList<m3f> arrayList3 = (ArrayList) w73Var.f;
                c72 c72Var2 = (c72) w73Var.d;
                if (w73Var.b || w73Var.c) {
                    for (b72 b72Var2 : c72Var2.r0) {
                        b72Var2.i();
                        b72Var2.a = i9;
                        b72Var2.d.n();
                        b72Var2.e.m();
                        i30 = i30;
                        i9 = 0;
                    }
                    i12 = i30;
                    c72Var2.i();
                    i25 = 0;
                    c72Var2.a = false;
                    c72Var2.d.n();
                    c72Var2.e.m();
                    w73Var.c = false;
                } else {
                    i12 = i30;
                    i25 = i9;
                }
                w73Var.b((c72) w73Var.e);
                c72Var2.a0 = i25;
                a72[] a72VarArr2 = c72Var2.U;
                c72Var2.b0 = i25;
                a72 a72VarK = c72Var2.k(i25);
                a72 a72VarK2 = c72Var2.k(1);
                if (w73Var.b) {
                    w73Var.c();
                }
                int iS = c72Var2.s();
                int iT = c72Var2.t();
                ro0Var = ro0Var4;
                c72Var2.d.h.d(iS);
                c72Var2.e.h.d(iT);
                w73Var.v();
                a72 a72Var3 = a72.WRAP_CONTENT;
                if (a72VarK == a72Var3 || a72VarK2 == a72Var3) {
                    if (zX) {
                        Iterator it2 = arrayList3.iterator();
                        while (true) {
                            if (it2.hasNext()) {
                                if (!((m3f) it2.next()).k()) {
                                    zX = false;
                                    break;
                                }
                            } else {
                                break;
                            }
                        }
                    }
                    if (zX && a72VarK == a72.WRAP_CONTENT) {
                        c72Var2.O(a72.FIXED);
                        i26 = iS;
                        c72Var2.S(w73Var.d(c72Var2, 0));
                        c72Var2.d.e.d(c72Var2.r());
                    } else {
                        i26 = iS;
                    }
                    if (zX && a72VarK2 == a72.WRAP_CONTENT) {
                        c72Var2.Q(a72.FIXED);
                        c72Var2.N(w73Var.d(c72Var2, 1));
                        c72Var2.e.e.d(c72Var2.l());
                    }
                } else {
                    i26 = iS;
                }
                a72 a72Var4 = a72VarArr2[0];
                a72 a72Var5 = a72.FIXED;
                if (a72Var4 == a72Var5 || a72Var4 == a72.MATCH_PARENT) {
                    int iR2 = c72Var2.r() + i26;
                    c72Var2.d.i.d(iR2);
                    c72Var2.d.e.d(iR2 - i26);
                    w73Var.v();
                    a72 a72Var6 = a72VarArr2[1];
                    if (a72Var6 == a72Var5 || a72Var6 == a72.MATCH_PARENT) {
                        int iL2 = c72Var2.l() + iT;
                        c72Var2.e.i.d(iL2);
                        c72Var2.e.e.d(iL2 - iT);
                    }
                    w73Var.v();
                    z2 = true;
                } else {
                    z2 = false;
                }
                for (m3f m3fVar : arrayList3) {
                    if (m3fVar.b != c72Var2 || m3fVar.g) {
                        m3fVar.e();
                    }
                }
                for (m3f m3fVar2 : arrayList3) {
                    if (z2 || m3fVar2.b != c72Var2) {
                        if (!m3fVar2.h.j || ((!m3fVar2.i.j && !(m3fVar2 instanceof th5)) || (!m3fVar2.e.j && !(m3fVar2 instanceof rj1) && !(m3fVar2 instanceof th5)))) {
                            z3 = false;
                            break;
                        }
                    }
                }
                z3 = true;
                c72Var2.O(a72VarK);
                c72Var2.Q(a72VarK2);
                zY = z3;
                i24 = 1073741824;
                i13 = 2;
            } else {
                i12 = i30;
                ro0Var = ro0Var4;
                c72 c72Var3 = (c72) w73Var.d;
                if (w73Var.b) {
                    for (b72 b72Var3 : c72Var3.r0) {
                        b72Var3.i();
                        b72Var3.a = false;
                        pr5 pr5Var2 = b72Var3.d;
                        pr5Var2.e.j = false;
                        pr5Var2.g = false;
                        pr5Var2.n();
                        bte bteVar2 = b72Var3.e;
                        bteVar2.e.j = false;
                        bteVar2.g = false;
                        bteVar2.m();
                    }
                    i23 = 0;
                    c72Var3.i();
                    c72Var3.a = false;
                    pr5 pr5Var3 = c72Var3.d;
                    pr5Var3.e.j = false;
                    pr5Var3.g = false;
                    pr5Var3.n();
                    bte bteVar3 = c72Var3.e;
                    bteVar3.e.j = false;
                    bteVar3.g = false;
                    bteVar3.m();
                    w73Var.c();
                } else {
                    i23 = 0;
                }
                w73Var.b((c72) w73Var.e);
                c72Var3.a0 = i23;
                c72Var3.b0 = i23;
                c72Var3.d.h.d(i23);
                c72Var3.e.h.d(i23);
                i24 = 1073741824;
                if (i2 == 1073741824) {
                    zY = Y(i23, zX);
                    i13 = 1;
                } else {
                    i13 = 0;
                    zY = true;
                }
                if (i4 == 1073741824) {
                    zY &= Y(1, zX);
                    i13++;
                }
            }
            if (zY) {
                T(i2 == i24, i4 == i24);
            }
        } else {
            i12 = i30;
            ro0Var = ro0Var4;
            i13 = 0;
            zY = false;
        }
        if (zY && i13 == 2) {
            return;
        }
        int i31 = this.E0;
        if (i8 > 0) {
            boolean zC0 = c0(64);
            ro0 ro0Var5 = this.v0;
            int i32 = 0;
            for (int size2 = this.r0.size(); i32 < size2; size2 = i22) {
                b72 b72Var4 = (b72) this.r0.get(i32);
                if ((b72Var4 instanceof sh5) || (b72Var4 instanceof bn0) || b72Var4.G || (zC0 && (pr5Var = b72Var4.d) != null && (bteVar = b72Var4.e) != null && pr5Var.e.j && bteVar.e.j)) {
                    i22 = size2;
                } else {
                    a72 a72VarK3 = b72Var4.k(0);
                    a72 a72VarK4 = b72Var4.k(1);
                    a72 a72Var7 = a72.MATCH_CONSTRAINT;
                    i22 = size2;
                    boolean z6 = a72VarK3 == a72Var7 && b72Var4.s != 1 && a72VarK4 == a72Var7 && b72Var4.t != 1;
                    if (!z6 && c0(1) && !(b72Var4 instanceof dwe)) {
                        if (a72VarK3 == a72Var7 && b72Var4.s == 0 && a72VarK4 != a72Var7 && !b72Var4.y()) {
                            z6 = true;
                        }
                        if (a72VarK4 == a72Var7 && b72Var4.t == 0 && a72VarK3 != a72Var7 && !b72Var4.y()) {
                            z6 = true;
                        }
                        if ((a72VarK3 == a72Var7 || a72VarK4 == a72Var7) && b72Var4.Y > 0.0f) {
                            z6 = true;
                        }
                    }
                    if (!z6) {
                        m50Var.H(0, ro0Var5, b72Var4);
                    }
                    i32++;
                }
                i32++;
            }
            i14 = 0;
            ro0Var5.a();
        } else {
            i14 = 0;
        }
        m50Var.S(this);
        int size3 = arrayList2.size();
        if (i8 > 0) {
            m50Var.R(this, i14, iR, iL);
        }
        if (size3 > 0) {
            a72[] a72VarArr3 = this.U;
            a72 a72Var8 = a72VarArr3[i14];
            a72 a72Var9 = a72.WRAP_CONTENT;
            int i33 = a72Var8 == a72Var9 ? 1 : i14;
            int i34 = a72VarArr3[1] == a72Var9 ? 1 : i14;
            int iMax = Math.max(r(), c72Var.d0);
            int iMax2 = Math.max(l(), c72Var.e0);
            int iMax3 = iMax;
            int i35 = i14;
            int i36 = i35;
            while (i35 < size3) {
                b72 b72Var5 = (b72) arrayList2.get(i35);
                if (b72Var5 instanceof dwe) {
                    int iR3 = b72Var5.r();
                    int iL3 = b72Var5.l();
                    i18 = i34;
                    i19 = i35;
                    ro0Var3 = ro0Var;
                    int i37 = i36 | (m50Var.H(1, ro0Var3, b72Var5) ? 1 : 0);
                    int iR4 = b72Var5.r();
                    int iL4 = b72Var5.l();
                    if (iR4 != iR3) {
                        b72Var5.S(iR4);
                        if (i33 != 0 && b72Var5.s() + b72Var5.W > iMax3) {
                            iMax3 = Math.max(iMax3, b72Var5.j(k52.RIGHT).e() + b72Var5.s() + b72Var5.W);
                        }
                        i20 = 1;
                    } else {
                        i20 = i37;
                    }
                    if (iL4 != iL3) {
                        b72Var5.N(iL4);
                        if (i18 != 0 && b72Var5.t() + b72Var5.X > iMax2) {
                            iMax2 = Math.max(iMax2, b72Var5.j(k52.BOTTOM).e() + b72Var5.t() + b72Var5.X);
                        }
                        i21 = 1;
                    } else {
                        i21 = i20;
                    }
                    i36 = (((dwe) b72Var5).x0 ? 1 : 0) | i21;
                } else {
                    i18 = i34;
                    i19 = i35;
                    ro0Var3 = ro0Var;
                }
                i35 = i19 + 1;
                ro0Var = ro0Var3;
                i34 = i18;
            }
            int i38 = i34;
            int i39 = 0;
            while (true) {
                ro0 ro0Var6 = ro0Var;
                if (i39 >= 2) {
                    break;
                }
                int i40 = i36;
                int i41 = 0;
                while (i41 < size3) {
                    b72 b72Var6 = (b72) arrayList2.get(i41);
                    if ((!(b72Var6 instanceof jj5) || (b72Var6 instanceof dwe)) && !(b72Var6 instanceof sh5)) {
                        i15 = size3;
                        if (b72Var6.i0 != 8 && ((i12 == 0 || !b72Var6.d.e.j || !b72Var6.e.e.j) && !(b72Var6 instanceof dwe))) {
                            int iR5 = b72Var6.r();
                            int iL5 = b72Var6.l();
                            arrayList = arrayList2;
                            int i42 = b72Var6.c0;
                            i16 = i33;
                            int i43 = (m50Var.H(i39 == 1 ? 2 : 1, ro0Var6, b72Var6) ? 1 : 0) | i40;
                            int iR6 = b72Var6.r();
                            ro0Var2 = ro0Var6;
                            int iL6 = b72Var6.l();
                            if (iR6 != iR5) {
                                b72Var6.S(iR6);
                                if (i16 != 0 && b72Var6.s() + b72Var6.W > iMax3) {
                                    iMax3 = Math.max(iMax3, b72Var6.j(k52.RIGHT).e() + b72Var6.s() + b72Var6.W);
                                }
                                i43 = 1;
                            }
                            if (iL6 != iL5) {
                                b72Var6.N(iL6);
                                if (i38 != 0 && b72Var6.t() + b72Var6.X > iMax2) {
                                    iMax2 = Math.max(iMax2, b72Var6.j(k52.BOTTOM).e() + b72Var6.t() + b72Var6.X);
                                }
                                i17 = 1;
                            } else {
                                i17 = i43;
                            }
                            i40 = (!b72Var6.F || i42 == b72Var6.c0) ? i17 : 1;
                        }
                        i41++;
                        size3 = i15;
                        i33 = i16;
                        arrayList2 = arrayList;
                        ro0Var6 = ro0Var2;
                    } else {
                        i15 = size3;
                    }
                    ro0Var2 = ro0Var6;
                    arrayList = arrayList2;
                    i16 = i33;
                    i41++;
                    size3 = i15;
                    i33 = i16;
                    arrayList2 = arrayList;
                    ro0Var6 = ro0Var2;
                }
                int i44 = size3;
                ro0Var = ro0Var6;
                ArrayList arrayList4 = arrayList2;
                int i45 = i33;
                if (i40 == 0) {
                    break;
                }
                i39++;
                m50Var.R(this, i39, iR, iL);
                size3 = i44;
                i33 = i45;
                arrayList2 = arrayList4;
                i36 = 0;
            }
        }
        this.E0 = i31;
        wz6.q = c0(512);
    }

    public final boolean c0(int i) {
        return (this.E0 & i) == i;
    }

    @Override // defpackage.b72
    public final void o(StringBuilder sb) {
        sb.append(this.k + ":{\n");
        StringBuilder sb2 = new StringBuilder("  actualWidth:");
        sb2.append(this.W);
        sb.append(sb2.toString());
        sb.append("\n");
        sb.append("  actualHeight:" + this.X);
        sb.append("\n");
        Iterator it2 = this.r0.iterator();
        while (it2.hasNext()) {
            ((b72) it2.next()).o(sb);
            sb.append(",\n");
        }
        sb.append("}");
    }
}
