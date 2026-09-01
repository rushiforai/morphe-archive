package defpackage;

import android.os.Trace;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p65 implements x12 {
    public int A;
    public int B;
    public boolean C;
    public final o65 D;
    public final ArrayList E;
    public boolean F;
    public egc G;
    public fgc H;
    public igc I;
    public boolean J;
    public i89 K;
    public tj1 L;
    public final y12 M;
    public k65 N;
    public ll4 O;
    public m8c P;
    public final o22 Q;
    public final ib2 R;
    public boolean S;
    public long T;
    public q65 U;
    public final vwa a;
    public final l22 b;
    public final fgc c;
    public final i78 d;
    public final tj1 e;
    public final tj1 f;
    public final md5 g;
    public final q22 h;
    public s65 j;
    public int k;
    public int l;
    public int m;
    public int[] o;
    public i68 p;
    public boolean q;
    public boolean r;
    public k68 v;
    public boolean w;
    public boolean y;
    public final ArrayList i = new ArrayList();
    public final t46 n = new t46();
    public final ArrayList s = new ArrayList();
    public final t46 t = new t46();
    public i89 u = i89.d;
    public final t46 x = new t46();
    public int z = -1;

    public p65(vwa vwaVar, l22 l22Var, fgc fgcVar, i78 i78Var, tj1 tj1Var, tj1 tj1Var2, md5 md5Var, q22 q22Var) {
        this.a = vwaVar;
        this.b = l22Var;
        this.c = fgcVar;
        this.d = i78Var;
        this.e = tj1Var;
        this.f = tj1Var2;
        this.g = md5Var;
        this.h = q22Var;
        this.C = l22Var.f() || l22Var.d();
        this.D = new o65(0, this);
        this.E = new ArrayList();
        egc egcVarM = fgcVar.m();
        egcVarM.c();
        this.G = egcVarM;
        fgc fgcVar2 = new fgc();
        if (l22Var.f()) {
            fgcVar2.f();
        }
        if (l22Var.d()) {
            fgcVar2.k = new k68();
        }
        this.H = fgcVar2;
        igc igcVarP = fgcVar2.p();
        igcVarP.e(true);
        this.I = igcVarP;
        this.M = new y12(this, tj1Var);
        egc egcVarM2 = this.H.m();
        try {
            k65 k65VarA = egcVarM2.a(0);
            egcVarM2.c();
            this.N = k65VarA;
            this.O = new ll4();
            this.Q = new o22(this);
            ib2 ib2VarJ = l22Var.j();
            ib2 ib2VarA = A();
            this.R = ib2VarJ.j0(ib2VarA == null ? zx3.a : ib2VarA);
        } catch (Throwable th) {
            egcVarM2.c();
            throw th;
        }
    }

    public static final int O(int i, int i2, p65 p65Var, boolean z) throws Throwable {
        int i3;
        long[] jArr;
        int i4;
        long[] jArr2;
        int i5;
        int i6;
        egc egcVar;
        egc egcVar2 = p65Var.G;
        int i7 = 0;
        if (egcVar2.j(i)) {
            int i8 = egcVar2.i(i);
            Object objP = egcVar2.p(i, egcVar2.b);
            if (i8 == 206 && g76.L(objP, b22.e)) {
                Object objH = egcVar2.h(i, 0);
                t65 t65Var = objH instanceof t65 ? (t65) objH : null;
                p3b p3bVar = t65Var != null ? t65Var.a : null;
                m65 m65Var = p3bVar instanceof m65 ? (m65) p3bVar : null;
                if (m65Var != null) {
                    g78 g78Var = m65Var.a.e;
                    Object[] objArr = g78Var.b;
                    long[] jArr3 = g78Var.a;
                    int length = jArr3.length - 2;
                    if (length >= 0) {
                        int i9 = 0;
                        while (true) {
                            long j = jArr3[i9];
                            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                                int i10 = 8;
                                int i11 = 8 - ((~(i9 - length)) >>> 31);
                                int i12 = i7;
                                while (i12 < i11) {
                                    if ((255 & j) < 128) {
                                        p65 p65Var2 = (p65) objArr[(i9 << 3) + i12];
                                        fgc fgcVar = p65Var2.c;
                                        if (fgcVar.b <= 0 || (fgcVar.a[1] & 67108864) == 0) {
                                            jArr2 = jArr3;
                                            i5 = i7;
                                            i6 = i10;
                                        } else {
                                            q22 q22Var = p65Var2.h;
                                            synchronized (q22Var.d) {
                                                q22Var.p();
                                                i6 = i10;
                                                f78 f78Var = q22Var.n;
                                                q22Var.n = tp7.q();
                                                try {
                                                    q22Var.v.f0(f78Var);
                                                } finally {
                                                }
                                            }
                                            tj1 tj1Var = new tj1();
                                            p65Var2.L = tj1Var;
                                            egc egcVarM = p65Var2.c.m();
                                            try {
                                                p65Var2.G = egcVarM;
                                                y12 y12Var = p65Var2.M;
                                                tj1 tj1Var2 = y12Var.b;
                                                try {
                                                    y12Var.b = tj1Var;
                                                    p65Var2.N(0);
                                                    y12 y12Var2 = p65Var2.M;
                                                    y12Var2.b();
                                                    jArr2 = jArr3;
                                                    try {
                                                        if (y12Var2.c) {
                                                            egcVar = egcVarM;
                                                            try {
                                                                y12Var2.b.s.I(yu8.d);
                                                                if (y12Var2.c) {
                                                                    y12Var2.d(false);
                                                                    y12Var2.d(false);
                                                                    y12Var2.b.s.I(iu8.d);
                                                                    i5 = 0;
                                                                    y12Var2.c = false;
                                                                }
                                                                y12Var.b = tj1Var2;
                                                                egcVar.c();
                                                            } catch (Throwable th) {
                                                                th = th;
                                                                y12Var.b = tj1Var2;
                                                                throw th;
                                                            }
                                                        } else {
                                                            egcVar = egcVarM;
                                                        }
                                                        y12Var.b = tj1Var2;
                                                        egcVar.c();
                                                    } catch (Throwable th2) {
                                                        th = th2;
                                                        egcVar.c();
                                                        throw th;
                                                    }
                                                    i5 = 0;
                                                } catch (Throwable th3) {
                                                    th = th3;
                                                    egcVar = egcVarM;
                                                }
                                            } catch (Throwable th4) {
                                                th = th4;
                                                egcVar = egcVarM;
                                            }
                                        }
                                        p65Var.b.r(p65Var2.h);
                                    } else {
                                        jArr2 = jArr3;
                                        i5 = i7;
                                        i6 = i10;
                                    }
                                    j >>= i6;
                                    i12++;
                                    i10 = i6;
                                    i7 = i5;
                                    jArr3 = jArr2;
                                }
                                jArr = jArr3;
                                i4 = i7;
                                if (i11 != i10) {
                                    break;
                                }
                            } else {
                                jArr = jArr3;
                                i4 = i7;
                            }
                            if (i9 == length) {
                                break;
                            }
                            i9++;
                            i7 = i4;
                            jArr3 = jArr;
                        }
                    }
                }
                return egcVar2.o(i);
            }
            i3 = 1;
            if (!egcVar2.l(i)) {
                return egcVar2.o(i);
            }
        } else {
            i3 = 1;
            if (egcVar2.d(i)) {
                int i13 = egcVar2.b[(i * 5) + 3] + i;
                int iO = 0;
                for (int i14 = i + 1; i14 < i13; i14 += egcVar2.b[(i14 * 5) + 3]) {
                    boolean zL = egcVar2.l(i14);
                    if (zL) {
                        p65Var.M.c();
                        y12 y12Var3 = p65Var.M;
                        Object objN = egcVar2.n(i14);
                        y12Var3.c();
                        y12Var3.h.add(objN);
                    }
                    iO += O(i14, zL ? 0 : i2 + iO, p65Var, zL || z);
                    if (zL) {
                        p65Var.M.c();
                        p65Var.M.a();
                    }
                }
                if (!egcVar2.l(i)) {
                    return iO;
                }
            } else if (!egcVar2.l(i)) {
                return egcVar2.o(i);
            }
        }
        return i3;
    }

    public final o22 A() {
        if (this.b.k()) {
            return this.Q;
        }
        return null;
    }

    public final boolean B() {
        mwa mwaVarY;
        return (this.S || this.y || this.w || (mwaVarY = y()) == null || (mwaVarY.b & 8) != 0) ? false : true;
    }

    public final void C(ArrayList arrayList) {
        p65 p65Var = this;
        tj1 tj1Var = p65Var.f;
        y12 y12Var = p65Var.M;
        tj1 tj1Var2 = y12Var.b;
        try {
            y12Var.b = tj1Var;
            tj1Var.s.I(wu8.d);
            int size = arrayList.size();
            int i = 0;
            while (i < size) {
                f09 f09Var = (f09) arrayList.get(i);
                s48 s48Var = (s48) f09Var.a;
                s48Var.getClass();
                k65 k65VarR = n01.R(null);
                fgc fgcVarA = hgc.a(null);
                int iD = fgcVarA.d(k65VarR);
                p46 p46Var = new p46();
                y12Var.b();
                qv8 qv8Var = y12Var.b.s;
                qv8Var.I(fu8.d);
                gq7.T(qv8Var, 0, p46Var, 1, k65VarR);
                if (fgcVarA == p65Var.H) {
                    if (!p65Var.I.w) {
                        b22.a("Check failed");
                    }
                    p65Var.w();
                }
                egc egcVarM = fgcVarA.m();
                try {
                    egcVarM.r(iD);
                    y12Var.f = iD;
                    tj1 tj1Var3 = new tj1();
                    p65Var.H(null, null, null, ey3.a, new le0(p65Var, tj1Var3, egcVarM, s48Var));
                    tj1 tj1Var4 = y12Var.b;
                    tj1Var4.getClass();
                    if (!tj1Var3.s.H()) {
                        qv8 qv8Var2 = tj1Var4.s;
                        qv8Var2.I(au8.d);
                        gq7.T(qv8Var2, 0, tj1Var3, 1, p46Var);
                    }
                    egcVarM.c();
                    y12Var.b.s.I(yu8.d);
                    i++;
                    p65Var = this;
                } catch (Throwable th) {
                    egcVarM.c();
                    throw th;
                }
            }
            y12Var.b();
            y12Var.b.s.I(ju8.d);
            y12Var.f = 0;
            y12Var.b = tj1Var2;
        } catch (Throwable th2) {
            y12Var.b = tj1Var2;
            throw th2;
        }
    }

    public final void D(i89 i89Var, Object obj) {
        W(126665345, null);
        E();
        k0(obj);
        long j = this.T;
        try {
            this.T = 126665345L;
            if (this.S) {
                igc.y(this.I);
            }
            boolean z = (this.S || g76.L(this.G.f(), i89Var)) ? false : true;
            if (z) {
                K(i89Var);
            }
            T(b22.c, Mp4VideoDirectory.TAG_TEMPORAL_QUALITY, i89Var, 0);
            this.K = null;
            boolean z2 = this.w;
            this.w = z;
            w2g.z(this, new mz1(new l23(21, obj), true, -59194059));
            this.w = z2;
        } finally {
        }
    }

    public final Object E() {
        boolean z = this.S;
        uob uobVar = w12.a;
        if (!z) {
            Object objM = this.G.m();
            if (!this.y || (objM instanceof sjb)) {
                return objM;
            }
        } else if (this.r) {
            b22.a("A call to createNode(), emitNode() or useNode() expected");
            return uobVar;
        }
        return uobVar;
    }

    public final List F() {
        l22 l22Var = this.b;
        k22 k22VarH = l22Var.h();
        q22 q22Var = y30.C(k22VarH) ? (q22) k22VarH : null;
        if (q22Var != null) {
            fgc fgcVar = q22Var.f;
            egc egcVarM = hgc.a(fgcVar).m();
            try {
                Integer numL = sgg.L(egcVarM, l22Var, 0, egcVarM.c);
                if (numL != null) {
                    egcVarM = hgc.a(fgcVar).m();
                    try {
                        ArrayList arrayListC0 = sgg.c0(egcVarM, numL.intValue(), 0);
                        egcVarM.c();
                        return bu1.Q0(q22Var.v.F(), arrayListC0);
                    } finally {
                    }
                }
            } finally {
            }
        }
        return ey3.a;
    }

    public final int G(int i) {
        int iQ = this.G.q(i) + 1;
        int i2 = 0;
        while (iQ < i) {
            if (!this.G.k(iQ)) {
                i2++;
            }
            iQ += this.G.b[(iQ * 5) + 3];
        }
        return i2;
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0055 A[Catch: all -> 0x0024, TRY_LEAVE, TryCatch #0 {all -> 0x0024, blocks: (B:3:0x0005, B:6:0x0012, B:8:0x0020, B:12:0x0029, B:11:0x0026, B:15:0x0030, B:20:0x003c, B:22:0x0044, B:24:0x004a, B:25:0x004e, B:26:0x004f, B:28:0x0055, B:21:0x0040), top: B:33:0x0005, inners: #1 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object H(defpackage.q22 r9, defpackage.q22 r10, java.lang.Integer r11, java.util.List r12, defpackage.m45 r13) {
        /*
            r8 = this;
            boolean r0 = r8.F
            int r1 = r8.k
            r2 = 1
            r8.F = r2     // Catch: java.lang.Throwable -> L24
            r2 = 0
            r8.k = r2     // Catch: java.lang.Throwable -> L24
            int r3 = r12.size()     // Catch: java.lang.Throwable -> L24
            r4 = r2
        Lf:
            r5 = 0
            if (r4 >= r3) goto L2c
            java.lang.Object r6 = r12.get(r4)     // Catch: java.lang.Throwable -> L24
            f09 r6 = (defpackage.f09) r6     // Catch: java.lang.Throwable -> L24
            java.lang.Object r7 = r6.a     // Catch: java.lang.Throwable -> L24
            mwa r7 = (defpackage.mwa) r7     // Catch: java.lang.Throwable -> L24
            java.lang.Object r6 = r6.b     // Catch: java.lang.Throwable -> L24
            if (r6 == 0) goto L26
            r8.e0(r7, r6)     // Catch: java.lang.Throwable -> L24
            goto L29
        L24:
            r9 = move-exception
            goto L5e
        L26:
            r8.e0(r7, r5)     // Catch: java.lang.Throwable -> L24
        L29:
            int r4 = r4 + 1
            goto Lf
        L2c:
            if (r9 == 0) goto L55
            if (r11 == 0) goto L35
            int r11 = r11.intValue()     // Catch: java.lang.Throwable -> L24
            goto L36
        L35:
            r11 = -1
        L36:
            if (r10 == 0) goto L4f
            if (r10 == r9) goto L4f
            if (r11 < 0) goto L4f
            r9.r = r10     // Catch: java.lang.Throwable -> L24
            r9.s = r11     // Catch: java.lang.Throwable -> L24
            java.lang.Object r10 = r13.invoke()     // Catch: java.lang.Throwable -> L49
            r9.r = r5     // Catch: java.lang.Throwable -> L24
            r9.s = r2     // Catch: java.lang.Throwable -> L24
            goto L53
        L49:
            r10 = move-exception
            r9.r = r5     // Catch: java.lang.Throwable -> L24
            r9.s = r2     // Catch: java.lang.Throwable -> L24
            throw r10     // Catch: java.lang.Throwable -> L24
        L4f:
            java.lang.Object r10 = r13.invoke()     // Catch: java.lang.Throwable -> L24
        L53:
            if (r10 != 0) goto L59
        L55:
            java.lang.Object r10 = r13.invoke()     // Catch: java.lang.Throwable -> L24
        L59:
            r8.F = r0
            r8.k = r1
            return r10
        L5e:
            r8.F = r0
            r8.k = r1
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p65.H(q22, q22, java.lang.Integer, java.util.List, m45):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:88:0x01b8, code lost:
    
        r17 = r1;
     */
    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:10:0x003e  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x028b  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x0322  */
    /* JADX WARN: Removed duplicated region for block: B:163:0x032b  */
    /* JADX WARN: Removed duplicated region for block: B:166:0x0339  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0120  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x012b  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0139  */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void I() {
        /*
            Method dump skipped, instruction units count: 887
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p65.I():void");
    }

    public final void J() throws Throwable {
        int i;
        N(this.G.g);
        y12 y12Var = this.M;
        y12Var.d(false);
        t46 t46Var = y12Var.d;
        p65 p65Var = y12Var.a;
        egc egcVar = p65Var.G;
        if (egcVar.c > 0 && t46Var.a(-2) != (i = egcVar.i)) {
            if (!y12Var.c && y12Var.e) {
                y12Var.d(false);
                y12Var.b.s.I(mu8.d);
                y12Var.c = true;
            }
            if (i > 0) {
                k65 k65VarA = egcVar.a(i);
                t46Var.c(i);
                y12Var.d(false);
                qv8 qv8Var = y12Var.b.s;
                qv8Var.I(lu8.d);
                gq7.S(qv8Var, 0, k65VarA);
                y12Var.c = true;
            }
        }
        y12Var.b.s.I(uu8.d);
        int i2 = y12Var.f;
        egc egcVar2 = p65Var.G;
        y12Var.f = egcVar2.b[(egcVar2.g * 5) + 3] + i2;
    }

    public final void K(i89 i89Var) {
        k68 k68Var = this.v;
        if (k68Var == null) {
            k68Var = new k68();
            this.v = k68Var;
        }
        k68Var.i(this.G.g, i89Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void L(int r7, int r8, int r9) {
        /*
            r6 = this;
            egc r0 = r6.G
            if (r7 != r8) goto L5
            goto L1a
        L5:
            if (r7 == r9) goto L6b
            if (r8 != r9) goto Lb
            goto L6b
        Lb:
            int r1 = r0.q(r7)
            if (r1 != r8) goto L14
            r9 = r8
            goto L6b
        L14:
            int r1 = r0.q(r8)
            if (r1 != r7) goto L1c
        L1a:
            r9 = r7
            goto L6b
        L1c:
            int r1 = r0.q(r7)
            int r2 = r0.q(r8)
            if (r1 != r2) goto L2b
            int r9 = r0.q(r7)
            goto L6b
        L2b:
            r1 = 0
            r2 = r7
            r3 = r1
        L2e:
            if (r2 <= 0) goto L39
            if (r2 == r9) goto L39
            int r2 = r0.q(r2)
            int r3 = r3 + 1
            goto L2e
        L39:
            r2 = r8
            r4 = r1
        L3b:
            if (r2 <= 0) goto L46
            if (r2 == r9) goto L46
            int r2 = r0.q(r2)
            int r4 = r4 + 1
            goto L3b
        L46:
            int r9 = r3 - r4
            r5 = r7
            r2 = r1
        L4a:
            if (r2 >= r9) goto L53
            int r5 = r0.q(r5)
            int r2 = r2 + 1
            goto L4a
        L53:
            int r4 = r4 - r3
            r9 = r8
        L55:
            if (r1 >= r4) goto L5e
            int r9 = r0.q(r9)
            int r1 = r1 + 1
            goto L55
        L5e:
            r1 = r9
            r9 = r5
        L60:
            if (r9 == r1) goto L6b
            int r9 = r0.q(r9)
            int r1 = r0.q(r1)
            goto L60
        L6b:
            if (r7 <= 0) goto L7f
            if (r7 == r9) goto L7f
            boolean r1 = r0.l(r7)
            if (r1 == 0) goto L7a
            y12 r1 = r6.M
            r1.a()
        L7a:
            int r7 = r0.q(r7)
            goto L6b
        L7f:
            r6.o(r8, r9)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p65.L(int, int, int):void");
    }

    public final Object M() {
        boolean z = this.S;
        uob uobVar = w12.a;
        if (!z) {
            Object objM = this.G.m();
            if (!this.y || (objM instanceof sjb)) {
                return objM instanceof t65 ? ((t65) objM).a : objM;
            }
        } else if (this.r) {
            b22.a("A call to createNode(), emitNode() or useNode() expected");
            return uobVar;
        }
        return uobVar;
    }

    public final void N(int i) throws Throwable {
        boolean zL = this.G.l(i);
        y12 y12Var = this.M;
        if (zL) {
            y12Var.c();
            Object objN = this.G.n(i);
            y12Var.c();
            y12Var.h.add(objN);
        }
        O(i, 0, this, zL);
        y12Var.c();
        if (zL) {
            y12Var.a();
        }
    }

    public final boolean P(int i, boolean z) {
        mwa mwaVarY;
        if ((i & 1) == 0 && (this.S || this.y)) {
            m8c m8cVar = this.P;
            if (m8cVar != null && (mwaVarY = y()) != null && m8cVar.a()) {
                int i2 = mwaVarY.b;
                if ((i2 & 512) != 0) {
                    return true;
                }
                int i3 = i2 | 1;
                mwaVarY.b = i3;
                mwaVarY.b = (this.y ? i2 | 129 : i3 & (-129)) | 256;
                qv8 qv8Var = this.M.b.s;
                qv8Var.I(tu8.d);
                gq7.S(qv8Var, 0, mwaVarY);
                this.b.q(mwaVarY);
                return false;
            }
        } else if (!z && B()) {
            return false;
        }
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00cd  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void Q() {
        /*
            Method dump skipped, instruction units count: 249
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p65.Q():void");
    }

    public final void R() {
        egc egcVar = this.G;
        int i = egcVar.i;
        this.l = i >= 0 ? egcVar.b[(i * 5) + 1] & 67108863 : 0;
        egcVar.t();
    }

    public final void S() {
        if (this.l != 0) {
            b22.a("No nodes can be emitted before calling skipAndEndGroup");
        }
        if (this.S) {
            return;
        }
        mwa mwaVarY = y();
        if (mwaVarY != null) {
            int i = mwaVarY.b;
            if ((i & 128) == 0) {
                mwaVarY.b = i | 16;
            }
        }
        if (this.s.isEmpty()) {
            R();
        } else {
            I();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00c4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void T(java.lang.Object r29, int r30, java.lang.Object r31, int r32) {
        /*
            Method dump skipped, instruction units count: 937
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p65.T(java.lang.Object, int, java.lang.Object, int):void");
    }

    public final void U() {
        T(null, -127, null, 0);
    }

    public final void V(int i, xt8 xt8Var) {
        T(xt8Var, i, null, 0);
    }

    public final void W(int i, Object obj) {
        T(obj, i, null, 0);
    }

    public final void X(Object obj, boolean z) {
        if (z) {
            egc egcVar = this.G;
            if (egcVar.k <= 0) {
                if ((egcVar.b[(egcVar.g * 5) + 1] & 1073741824) == 0) {
                    xx9.a("Expected a node group");
                }
                egcVar.u();
                return;
            }
            return;
        }
        if (obj != null && this.G.f() != obj) {
            y12 y12Var = this.M;
            y12Var.getClass();
            y12Var.d(false);
            qv8 qv8Var = y12Var.b.s;
            qv8Var.I(dv8.d);
            gq7.S(qv8Var, 0, obj);
        }
        this.G.u();
    }

    public final void Y(int i) {
        int i2;
        int i3;
        if (this.j != null) {
            T(null, i, null, 0);
            return;
        }
        if (this.r) {
            b22.a("A call to createNode(), emitNode() or useNode() expected");
        }
        this.T = Long.rotateLeft(Long.rotateLeft(this.T, 3) ^ ((long) i), 3) ^ ((long) this.m);
        this.m++;
        egc egcVar = this.G;
        boolean z = this.S;
        uob uobVar = w12.a;
        if (z) {
            egcVar.k++;
            this.I.P(uobVar, uobVar, false, i);
            v(false, null);
            return;
        }
        if (egcVar.g() == i && ((i3 = egcVar.g) >= egcVar.h || (egcVar.b[(i3 * 5) + 1] & 536870912) == 0)) {
            egcVar.u();
            v(false, null);
            return;
        }
        if (egcVar.k <= 0 && (i2 = egcVar.g) != egcVar.h) {
            int i4 = this.k;
            J();
            this.M.e(i4, egcVar.s());
            ht2.B0(i2, egcVar.g, this.s);
        }
        egcVar.k++;
        this.S = true;
        this.K = null;
        if (this.I.w) {
            igc igcVarP = this.H.p();
            this.I = igcVarP;
            igcVarP.L();
            this.J = false;
            this.K = null;
        }
        igc igcVar = this.I;
        igcVar.d();
        int i5 = igcVar.t;
        igcVar.P(uobVar, uobVar, false, i);
        this.N = igcVar.b(i5);
        v(false, null);
    }

    public final void Z(int i) {
        T(null, i, null, 0);
    }

    public final void a() {
        i();
        this.i.clear();
        this.n.b = 0;
        this.t.b = 0;
        this.x.b = 0;
        this.v = null;
        ll4 ll4Var = this.O;
        ll4Var.e.F();
        ll4Var.d.F();
        this.T = 0L;
        this.A = 0;
        this.r = false;
        this.S = false;
        this.y = false;
        this.F = false;
        this.z = -1;
        egc egcVar = this.G;
        if (!egcVar.f) {
            egcVar.c();
        }
        if (this.I.w) {
            return;
        }
        w();
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x006e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.p65 a0(int r7) {
        /*
            r6 = this;
            r6.Y(r7)
            boolean r7 = r6.S
            md5 r0 = r6.g
            java.util.ArrayList r1 = r6.E
            q22 r2 = r6.h
            if (r7 == 0) goto L26
            mwa r7 = new mwa
            r7.<init>(r2)
            r1.add(r7)
            r6.k0(r7)
            int r1 = r6.B
            r7.e = r1
            int r1 = r7.b
            r1 = r1 & (-17)
            r7.b = r1
            r0.c()
            return r6
        L26:
            egc r7 = r6.G
            int r7 = r7.i
            java.util.ArrayList r3 = r6.s
            int r7 = defpackage.ht2.l0(r7, r3)
            if (r7 < 0) goto L39
            java.lang.Object r7 = r3.remove(r7)
            r76 r7 = (defpackage.r76) r7
            goto L3a
        L39:
            r7 = 0
        L3a:
            egc r3 = r6.G
            java.lang.Object r3 = r3.m()
            uob r4 = defpackage.w12.a
            boolean r4 = defpackage.g76.L(r3, r4)
            if (r4 == 0) goto L51
            mwa r3 = new mwa
            r3.<init>(r2)
            r6.k0(r3)
            goto L56
        L51:
            r3.getClass()
            mwa r3 = (defpackage.mwa) r3
        L56:
            r2 = 0
            r4 = 1
            if (r7 != 0) goto L6e
            int r7 = r3.b
            r5 = r7 & 64
            if (r5 == 0) goto L62
            r5 = r4
            goto L63
        L62:
            r5 = r2
        L63:
            if (r5 == 0) goto L69
            r7 = r7 & (-65)
            r3.b = r7
        L69:
            if (r5 == 0) goto L6c
            goto L6e
        L6c:
            r7 = r2
            goto L6f
        L6e:
            r7 = r4
        L6f:
            int r5 = r3.b
            if (r7 == 0) goto L76
            r7 = r5 | 8
            goto L78
        L76:
            r7 = r5 & (-9)
        L78:
            r3.b = r7
            r1.add(r3)
            int r7 = r6.B
            r3.e = r7
            int r7 = r3.b
            r7 = r7 & (-17)
            r3.b = r7
            r0.c()
            int r7 = r3.b
            r0 = r7 & 256(0x100, float:3.59E-43)
            if (r0 == 0) goto Lba
            r7 = r7 & (-257(0xfffffffffffffeff, float:NaN))
            r7 = r7 | 512(0x200, float:7.17E-43)
            r3.b = r7
            y12 r7 = r6.M
            tj1 r7 = r7.b
            qv8 r7 = r7.s
            zu8 r0 = defpackage.zu8.d
            r7.I(r0)
            defpackage.gq7.S(r7, r2, r3)
            boolean r7 = r6.y
            if (r7 != 0) goto Lba
            int r7 = r3.b
            r0 = r7 & 128(0x80, float:1.8E-43)
            if (r0 == 0) goto Lba
            r6.y = r4
            egc r0 = r6.G
            int r0 = r0.i
            r6.z = r0
            r7 = r7 | 1024(0x400, float:1.435E-42)
            r3.b = r7
        Lba:
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p65.a0(int):p65");
    }

    public final void b(b55 b55Var, Object obj) {
        if (this.S) {
            qv8 qv8Var = this.O.d;
            qv8Var.I(ev8.d);
            gq7.S(qv8Var, 0, obj);
            b55Var.getClass();
            pwd.B(2, b55Var);
            gq7.S(qv8Var, 1, b55Var);
            return;
        }
        y12 y12Var = this.M;
        y12Var.b();
        qv8 qv8Var2 = y12Var.b.s;
        qv8Var2.I(ev8.d);
        b55Var.getClass();
        pwd.B(2, b55Var);
        gq7.T(qv8Var2, 0, obj, 1, b55Var);
    }

    public final void b0(Object obj) {
        if (!this.S && this.G.g() == 207 && !g76.L(this.G.f(), obj) && this.z < 0) {
            this.z = this.G.g;
            this.y = true;
        }
        T(null, Mp4VideoDirectory.TAG_VERTICAL_RESOLUTION, obj, 0);
    }

    public final boolean c(float f) {
        Object objE = E();
        if ((objE instanceof Float) && f == ((Number) objE).floatValue()) {
            return false;
        }
        k0(Float.valueOf(f));
        return true;
    }

    public final void c0() {
        T(null, 125, null, 2);
        this.r = true;
    }

    public final boolean d(int i) {
        Object objE = E();
        if ((objE instanceof Integer) && i == ((Number) objE).intValue()) {
            return false;
        }
        k0(Integer.valueOf(i));
        return true;
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    public final void d0() {
        this.m = 0;
        this.G = this.c.m();
        T(null, 100, null, 0);
        l22 l22Var = this.b;
        l22Var.t();
        i89 i89VarI = l22Var.i();
        this.x.c(this.w ? 1 : 0);
        this.w = f(i89VarI);
        this.K = null;
        if (!this.q) {
            this.q = l22Var.e();
        }
        boolean zF = this.C;
        if (!zF) {
            zF = l22Var.f();
            this.C = zF;
        }
        if (zF) {
            sn3 sn3Var = p22.a;
            sn3Var.getClass();
            i89VarI = i89VarI.b(sn3Var, new nqc(A()));
        }
        this.u = i89VarI;
        Set set = (Set) m40.U(i89VarI, m36.a);
        if (set != null) {
            set.add(x());
            l22Var.o(set);
        }
        long jG = l22Var.g();
        T(null, (int) (jG ^ (jG >>> 32)), null, 0);
    }

    public final boolean e(long j) {
        Object objE = E();
        if ((objE instanceof Long) && j == ((Number) objE).longValue()) {
            return false;
        }
        k0(Long.valueOf(j));
        return true;
    }

    public final boolean e0(mwa mwaVar, Object obj) {
        k65 k65Var = mwaVar.c;
        if (k65Var == null) {
            return false;
        }
        int iD = this.G.a.d(n01.R(k65Var));
        if (!this.F || iD < this.G.g) {
            return false;
        }
        ArrayList arrayList = this.s;
        int iL0 = ht2.l0(iD, arrayList);
        if (iL0 < 0) {
            int i = -(iL0 + 1);
            if (!(obj instanceof j83)) {
                obj = null;
            }
            arrayList.add(i, new r76(mwaVar, iD, obj));
            return true;
        }
        r76 r76Var = (r76) arrayList.get(iL0);
        if (!(obj instanceof j83)) {
            r76Var.c = null;
            return true;
        }
        Object obj2 = r76Var.c;
        if (obj2 == null) {
            r76Var.c = obj;
            return true;
        }
        if (obj2 instanceof g78) {
            ((g78) obj2).a(obj);
            return true;
        }
        g78 g78Var = iqb.a;
        g78 g78Var2 = new g78(2);
        g78Var2.k(obj2);
        g78Var2.k(obj);
        r76Var.c = g78Var2;
        return true;
    }

    public final boolean f(Object obj) {
        if (g76.L(E(), obj)) {
            return false;
        }
        k0(obj);
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0091  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void f0(defpackage.f78 r18) {
        /*
            r17 = this;
            r0 = r17
            r1 = r18
            java.util.ArrayList r0 = r0.s
            int r2 = defpackage.d46.K(r0)
        La:
            r4 = -1
            if (r4 >= r2) goto L36
            java.lang.Object r4 = r0.get(r2)
            r76 r4 = (defpackage.r76) r4
            mwa r5 = r4.a
            k65 r5 = r5.c
            if (r5 == 0) goto L1e
            k65 r3 = defpackage.n01.R(r5)
            goto L1f
        L1e:
            r3 = 0
        L1f:
            if (r3 == 0) goto L30
            boolean r5 = r3.a()
            if (r5 == 0) goto L30
            int r5 = r4.b
            int r3 = r3.a
            if (r5 == r3) goto L33
            r4.b = r3
            goto L33
        L30:
            r0.remove(r2)
        L33:
            int r2 = r2 + (-1)
            goto La
        L36:
            java.lang.Object[] r2 = r1.b
            java.lang.Object[] r4 = r1.c
            long[] r1 = r1.a
            int r5 = r1.length
            int r5 = r5 + (-2)
            if (r5 < 0) goto L96
            r6 = 0
            r7 = r6
        L43:
            r8 = r1[r7]
            long r10 = ~r8
            r12 = 7
            long r10 = r10 << r12
            long r10 = r10 & r8
            r12 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r10 = r10 & r12
            int r10 = (r10 > r12 ? 1 : (r10 == r12 ? 0 : -1))
            if (r10 == 0) goto L91
            int r10 = r7 - r5
            int r10 = ~r10
            int r10 = r10 >>> 31
            r11 = 8
            int r10 = 8 - r10
            r12 = r6
        L5d:
            if (r12 >= r10) goto L8f
            r13 = 255(0xff, double:1.26E-321)
            long r13 = r13 & r8
            r15 = 128(0x80, double:6.3E-322)
            int r13 = (r13 > r15 ? 1 : (r13 == r15 ? 0 : -1))
            if (r13 >= 0) goto L8b
            int r13 = r7 << 3
            int r13 = r13 + r12
            r14 = r2[r13]
            r13 = r4[r13]
            r14.getClass()
            mwa r14 = (defpackage.mwa) r14
            k65 r15 = r14.c
            if (r15 == 0) goto L8b
            k65 r15 = defpackage.n01.R(r15)
            int r15 = r15.a
            cd7 r3 = defpackage.cd7.j
            if (r13 != r3) goto L83
            r13 = 0
        L83:
            r76 r3 = new r76
            r3.<init>(r14, r15, r13)
            r0.add(r3)
        L8b:
            long r8 = r8 >> r11
            int r12 = r12 + 1
            goto L5d
        L8f:
            if (r10 != r11) goto L96
        L91:
            if (r7 == r5) goto L96
            int r7 = r7 + 1
            goto L43
        L96:
            g r1 = defpackage.ht2.g
            defpackage.eu1.m0(r0, r1)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p65.f0(f78):void");
    }

    public final boolean g(boolean z) {
        Object objE = E();
        if ((objE instanceof Boolean) && z == ((Boolean) objE).booleanValue()) {
            return false;
        }
        k0(Boolean.valueOf(z));
        return true;
    }

    public final void g0(int i, int i2) {
        if (l0(i) != i2) {
            if (i < 0) {
                i68 i68Var = this.p;
                if (i68Var == null) {
                    i68Var = new i68();
                    this.p = i68Var;
                }
                i68Var.f(i, i2);
                return;
            }
            int[] iArr = this.o;
            if (iArr == null) {
                iArr = new int[this.G.c];
                k80.p0(-1, 0, 6, iArr);
                this.o = iArr;
            }
            iArr[i] = i2;
        }
    }

    public final boolean h(Object obj) {
        if (E() == obj) {
            return false;
        }
        k0(obj);
        return true;
    }

    public final void h0(int i, int i2) {
        int iL0 = l0(i);
        if (iL0 != i2) {
            int i3 = i2 - iL0;
            ArrayList arrayList = this.i;
            int size = arrayList.size() - 1;
            while (i != -1) {
                int iL02 = l0(i) + i3;
                g0(i, iL02);
                int i4 = size;
                while (true) {
                    if (-1 < i4) {
                        s65 s65Var = (s65) arrayList.get(i4);
                        if (s65Var != null && s65Var.a(i, iL02)) {
                            size = i4 - 1;
                            break;
                        }
                        i4--;
                    } else {
                        break;
                    }
                }
                egc egcVar = this.G;
                if (i < 0) {
                    i = egcVar.i;
                } else if (egcVar.l(i)) {
                    return;
                } else {
                    i = this.G.q(i);
                }
            }
        }
    }

    public final void i() {
        this.j = null;
        this.k = 0;
        this.l = 0;
        this.T = 0L;
        this.r = false;
        y12 y12Var = this.M;
        y12Var.c = false;
        y12Var.d.b = 0;
        y12Var.f = 0;
        y12Var.e = true;
        y12Var.g = 0;
        y12Var.h.clear();
        y12Var.i = -1;
        y12Var.j = -1;
        y12Var.k = -1;
        y12Var.l = 0;
        this.E.clear();
        this.o = null;
        this.p = null;
    }

    public final i89 i0(i89 i89Var, i89 i89Var2) {
        i89Var.getClass();
        h89 h89Var = new h89(i89Var);
        h89Var.putAll(i89Var2);
        i89 i89VarH = h89Var.h();
        V(Mp4VideoDirectory.TAG_WIDTH, b22.d);
        E();
        k0(i89VarH);
        E();
        k0(i89Var2);
        p(false);
        return i89VarH;
    }

    public final Object j(d8a d8aVar) {
        return m40.U(l(), d8aVar);
    }

    public final void j0(Object obj) {
        if (obj instanceof p3b) {
            t65 t65Var = new t65((p3b) obj, this.m - 1);
            if (this.S) {
                qv8 qv8Var = this.M.b.s;
                qv8Var.I(su8.d);
                gq7.S(qv8Var, 0, t65Var);
            }
            this.d.add(obj);
            obj = t65Var;
        }
        k0(obj);
    }

    public final void k(m45 m45Var) {
        if (!this.r) {
            b22.a("A call to createNode(), emitNode() or useNode() expected was not expected");
        }
        this.r = false;
        if (!this.S) {
            b22.a("createNode() can only be called when inserting");
        }
        t46 t46Var = this.n;
        int i = t46Var.a[t46Var.b - 1];
        igc igcVar = this.I;
        k65 k65VarB = igcVar.b(igcVar.v);
        this.l++;
        ll4 ll4Var = this.O;
        qv8 qv8Var = ll4Var.d;
        qv8Var.I(nu8.e);
        gq7.S(qv8Var, 0, m45Var);
        qv8Var.f[qv8Var.g - qv8Var.d[qv8Var.e - 1].b] = i;
        gq7.S(qv8Var, 1, k65VarB);
        qv8 qv8Var2 = ll4Var.e;
        qv8Var2.I(nu8.f);
        qv8Var2.f[qv8Var2.g - qv8Var2.d[qv8Var2.e - 1].b] = i;
        gq7.S(qv8Var2, 0, k65VarB);
    }

    public final void k0(Object obj) {
        if (this.S) {
            igc igcVar = this.I;
            if (igcVar.n <= 0 || igcVar.i == igcVar.k) {
                igcVar.E(obj);
                return;
            }
            k68 k68Var = igcVar.s;
            if (k68Var == null) {
                k68Var = new k68();
            }
            igcVar.s = k68Var;
            int i = igcVar.v;
            Object objB = k68Var.b(i);
            if (objB == null) {
                objB = new x68();
                k68Var.i(i, objB);
            }
            ((x68) objB).a(obj);
            return;
        }
        egc egcVar = this.G;
        boolean z = egcVar.n;
        y12 y12Var = this.M;
        if (!z) {
            k65 k65VarA = egcVar.a(egcVar.i);
            qv8 qv8Var = y12Var.b.s;
            qv8Var.I(zt8.d);
            gq7.T(qv8Var, 0, k65VarA, 1, obj);
            return;
        }
        int iD = (egcVar.l - hgc.d(egcVar.i, egcVar.b)) - 1;
        if (y12Var.a.G.i - y12Var.f >= 0) {
            y12Var.d(true);
            qv8 qv8Var2 = y12Var.b.s;
            qv8Var2.I(nu8.h);
            gq7.S(qv8Var2, 0, obj);
            qv8Var2.f[qv8Var2.g - qv8Var2.d[qv8Var2.e - 1].b] = iD;
            return;
        }
        egc egcVar2 = this.G;
        k65 k65VarA2 = egcVar2.a(egcVar2.i);
        qv8 qv8Var3 = y12Var.b.s;
        qv8Var3.I(nu8.g);
        gq7.T(qv8Var3, 0, obj, 1, k65VarA2);
        qv8Var3.f[qv8Var3.g - qv8Var3.d[qv8Var3.e - 1].b] = iD;
    }

    public final i89 l() {
        i89 i89Var;
        i89 i89Var2 = this.K;
        if (i89Var2 != null) {
            return i89Var2;
        }
        int iQ = this.G.i;
        boolean z = this.S;
        xt8 xt8Var = b22.c;
        if (z && this.J) {
            int iD = this.I.v;
            while (iD > 0) {
                if (this.I.r(iD) == 202 && g76.L(this.I.s(iD), xt8Var)) {
                    Object objP = this.I.p(iD);
                    objP.getClass();
                    i89 i89Var3 = (i89) objP;
                    this.K = i89Var3;
                    return i89Var3;
                }
                igc igcVar = this.I;
                iD = igcVar.D(iD, igcVar.b);
            }
        }
        if (this.G.c > 0) {
            while (iQ > 0) {
                if (this.G.i(iQ) == 202) {
                    egc egcVar = this.G;
                    if (g76.L(egcVar.p(iQ, egcVar.b), xt8Var)) {
                        k68 k68Var = this.v;
                        if (k68Var == null || (i89Var = (i89) k68Var.b(iQ)) == null) {
                            egc egcVar2 = this.G;
                            Object objB = egcVar2.b(iQ, egcVar2.b);
                            objB.getClass();
                            i89Var = (i89) objB;
                        }
                        this.K = i89Var;
                        return i89Var;
                    }
                }
                iQ = this.G.q(iQ);
            }
        }
        i89 i89Var4 = this.u;
        this.K = i89Var4;
        return i89Var4;
    }

    public final int l0(int i) {
        int i2;
        if (i >= 0) {
            int[] iArr = this.o;
            return (iArr == null || (i2 = iArr[i]) < 0) ? this.G.o(i) : i2;
        }
        i68 i68Var = this.p;
        if (i68Var != null && i68Var.c(i) >= 0) {
            int iC = i68Var.c(i);
            if (iC >= 0) {
                return i68Var.c[iC];
            }
            ywb.h(b09.w(i, "Cannot find value for key "));
        }
        return 0;
    }

    public final n12 m() {
        Collection collection;
        if (!this.b.k()) {
            return null;
        }
        f17 f17VarB = d46.B();
        igc igcVar = this.I;
        f17VarB.addAll(sgg.C(igcVar, null, igcVar.t, null));
        egc egcVar = this.G;
        boolean z = egcVar.f;
        int[] iArr = egcVar.b;
        if (z || egcVar.c == 0) {
            collection = ey3.a;
        } else {
            jta jtaVar = new jta(egcVar);
            int iQ = egcVar.i;
            Object objValueOf = Integer.valueOf(egcVar.l - hgc.d(iQ, iArr));
            while (iQ >= 0) {
                jtaVar.g(egcVar.i(iQ), egcVar.k(iQ) ? egcVar.p(iQ, iArr) : w12.a, egcVar.a.r(iQ), objValueOf);
                objValueOf = egcVar.a(iQ);
                iQ = egcVar.q(iQ);
            }
            collection = jtaVar.a;
        }
        f17VarB.addAll(collection);
        f17VarB.addAll(F());
        return new n12(d46.w(f17VarB), this.C);
    }

    public final void m0() {
        if (!this.r) {
            b22.a("A call to createNode(), emitNode() or useNode() expected was not expected");
        }
        this.r = false;
        if (this.S) {
            b22.a("useNode() called while inserting");
        }
        egc egcVar = this.G;
        Object objN = egcVar.n(egcVar.i);
        y12 y12Var = this.M;
        y12Var.c();
        y12Var.h.add(objN);
        if (this.y && (objN instanceof f12)) {
            y12Var.b();
            y12Var.b.s.I(gv8.d);
        }
    }

    public final void n(f78 f78Var, b55 b55Var) {
        ArrayList arrayList = this.s;
        if (this.F) {
            b22.a("Reentrant composition is not supported");
        }
        this.g.c();
        Trace.beginSection("Compose:recompose");
        try {
            long jG = uic.h().g();
            this.B = (int) (jG ^ (jG >>> 32));
            this.v = null;
            f0(f78Var);
            this.k = 0;
            this.F = true;
            try {
                d0();
                Object objE = E();
                if (objE != b55Var && b55Var != null) {
                    k0(b55Var);
                }
                o65 o65Var = this.D;
                o78 o78VarA = bjc.a();
                try {
                    o78VarA.b(o65Var);
                    xt8 xt8Var = b22.a;
                    if (b55Var != null) {
                        V(200, xt8Var);
                        w2g.z(this, b55Var);
                        p(false);
                    } else if (!this.w || objE == null || objE.equals(w12.a)) {
                        Q();
                    } else {
                        V(200, xt8Var);
                        pwd.B(2, objE);
                        w2g.z(this, (b55) objE);
                        p(false);
                    }
                    o78VarA.m(o78VarA.c - 1);
                    u();
                    this.F = false;
                    arrayList.clear();
                    if (!this.I.w) {
                        b22.a("Check failed");
                    }
                    w();
                } catch (Throwable th) {
                    o78VarA.m(o78VarA.c - 1);
                    throw th;
                }
            } finally {
            }
        } finally {
            Trace.endSection();
        }
    }

    public final void o(int i, int i2) {
        if (i <= 0 || i == i2) {
            return;
        }
        o(this.G.q(i), i2);
        if (this.G.l(i)) {
            Object objN = this.G.n(i);
            y12 y12Var = this.M;
            y12Var.c();
            y12Var.h.add(objN);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:150:0x039e  */
    /* JADX WARN: Removed duplicated region for block: B:202:0x0510  */
    /* JADX WARN: Type inference failed for: r3v19 */
    /* JADX WARN: Type inference failed for: r3v29, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r3v32 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void p(boolean r43) {
        /*
            Method dump skipped, instruction units count: 1608
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p65.p(boolean):void");
    }

    public final void q() {
        p(false);
        mwa mwaVarY = y();
        if (mwaVarY != null) {
            int i = mwaVarY.b;
            if ((i & 1) != 0) {
                mwaVarY.b = i | 2;
            }
        }
    }

    public final void r() {
        p(false);
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0085 A[EDGE_INSN: B:61:0x0085->B:29:0x0085 BREAK  A[LOOP:0: B:16:0x003f->B:28:0x0081], EDGE_INSN: B:62:0x0085->B:29:0x0085 BREAK  A[LOOP:0: B:16:0x003f->B:28:0x0081]] */
    /* JADX WARN: Removed duplicated region for block: B:32:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0101  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.mwa s() {
        /*
            Method dump skipped, instruction units count: 262
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p65.s():mwa");
    }

    public final void t() {
        if (this.F || this.z != 0) {
            xx9.a("Cannot disable reuse from root if it was caused by other groups");
        }
        this.z = -1;
        this.y = false;
    }

    public final void u() {
        p(false);
        this.b.c();
        p(false);
        y12 y12Var = this.M;
        if (y12Var.c) {
            y12Var.d(false);
            y12Var.d(false);
            y12Var.b.s.I(iu8.d);
            y12Var.c = false;
        }
        y12Var.b();
        if (y12Var.d.b != 0) {
            b22.a("Missed recording an endGroup()");
        }
        if (!this.i.isEmpty()) {
            b22.a("Start/end imbalance");
        }
        i();
        this.G.c();
        this.w = this.x.b() != 0;
    }

    public final void v(boolean z, s65 s65Var) {
        this.i.add(this.j);
        this.j = s65Var;
        int i = this.l;
        t46 t46Var = this.n;
        t46Var.c(i);
        t46Var.c(this.m);
        t46Var.c(this.k);
        if (z) {
            this.k = 0;
        }
        this.l = 0;
        this.m = 0;
    }

    public final void w() {
        fgc fgcVar = new fgc();
        if (this.C) {
            fgcVar.f();
        }
        if (this.b.d()) {
            fgcVar.k = new k68();
        }
        this.H = fgcVar;
        igc igcVarP = fgcVar.p();
        igcVarP.e(true);
        this.I = igcVarP;
    }

    public final n22 x() {
        q65 q65Var = this.U;
        if (q65Var != null) {
            return q65Var;
        }
        q65 q65Var2 = new q65(this.h);
        this.U = q65Var2;
        return q65Var2;
    }

    public final mwa y() {
        if (this.A != 0) {
            return null;
        }
        ArrayList arrayList = this.E;
        if (arrayList.isEmpty()) {
            return null;
        }
        return (mwa) y30.m(1, arrayList);
    }

    public final boolean z() {
        if (!B() || this.w) {
            return true;
        }
        mwa mwaVarY = y();
        return (mwaVarY == null || (mwaVarY.b & 4) == 0) ? false : true;
    }
}
