package defpackage;

import java.util.ArrayList;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class k78 extends oic {
    public static final int[] n = new int[0];
    public final x45 e;
    public final x45 f;
    public int g;
    public g78 h;
    public ArrayList i;
    public sic j;
    public int[] k;
    public int l;
    public boolean m;

    public k78(long j, sic sicVar, x45 x45Var, x45 x45Var2) {
        super(j, sicVar);
        this.e = x45Var;
        this.f = x45Var2;
        this.j = sic.e;
        this.k = n;
        this.l = 1;
    }

    public final void A(long j) {
        synchronized (uic.c) {
            this.j = this.j.q(j);
        }
    }

    public final void B(sic sicVar) {
        synchronized (uic.c) {
            this.j = this.j.p(sicVar);
        }
    }

    public void C(g78 g78Var) {
        this.h = g78Var;
    }

    public k78 D(x45 x45Var, x45 x45Var2) {
        xc8 xc8Var;
        if (this.c) {
            xx9.a("Cannot use a disposed snapshot");
        }
        if (this.m && this.d < 0) {
            xx9.b("Unsupported operation on a disposed or applied snapshot");
        }
        A(g());
        Object obj = uic.c;
        synchronized (obj) {
            long j = uic.e;
            uic.e = j + 1;
            uic.d = uic.d.q(j);
            sic sicVarD = d();
            r(sicVarD.q(j));
            xc8Var = new xc8(j, uic.a(sicVarD, g() + 1, j), uic.i(x45Var, e(), true), uic.j(x45Var2, i()), this);
        }
        if (this.m || this.c) {
            return xc8Var;
        }
        long jG = g();
        synchronized (obj) {
            long j2 = uic.e;
            uic.e = j2 + 1;
            s(j2);
            uic.d = uic.d.q(g());
        }
        r(uic.a(d(), jG + 1, g()));
        return xc8Var;
    }

    @Override // defpackage.oic
    public final void b() {
        uic.d = uic.d.f(g()).d(this.j);
    }

    @Override // defpackage.oic
    public void c() {
        if (this.c) {
            return;
        }
        this.c = true;
        synchronized (uic.c) {
            o();
        }
        l();
    }

    @Override // defpackage.oic
    public boolean f() {
        return false;
    }

    @Override // defpackage.oic
    public int h() {
        return this.g;
    }

    @Override // defpackage.oic
    public x45 i() {
        return this.f;
    }

    @Override // defpackage.oic
    public void k() {
        this.l++;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x008c  */
    @Override // defpackage.oic
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void l() {
        /*
            r17 = this;
            r0 = r17
            int r1 = r0.l
            if (r1 <= 0) goto L7
            goto Lc
        L7:
            java.lang.String r1 = "no pending nested snapshots"
            defpackage.xx9.a(r1)
        Lc:
            int r1 = r0.l
            int r1 = r1 + (-1)
            r0.l = r1
            if (r1 != 0) goto L94
            boolean r1 = r0.m
            if (r1 != 0) goto L94
            g78 r1 = r0.x()
            if (r1 == 0) goto L91
            boolean r2 = r0.m
            if (r2 == 0) goto L27
            java.lang.String r2 = "Unsupported operation on a snapshot that has been applied"
            defpackage.xx9.b(r2)
        L27:
            r2 = 0
            r0.C(r2)
            long r2 = r0.g()
            java.lang.Object[] r4 = r1.b
            long[] r1 = r1.a
            int r5 = r1.length
            int r5 = r5 + (-2)
            if (r5 < 0) goto L91
            r7 = 0
        L39:
            r8 = r1[r7]
            long r10 = ~r8
            r12 = 7
            long r10 = r10 << r12
            long r10 = r10 & r8
            r12 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r10 = r10 & r12
            int r10 = (r10 > r12 ? 1 : (r10 == r12 ? 0 : -1))
            if (r10 == 0) goto L8c
            int r10 = r7 - r5
            int r10 = ~r10
            int r10 = r10 >>> 31
            r11 = 8
            int r10 = 8 - r10
            r12 = 0
        L53:
            if (r12 >= r10) goto L8a
            r13 = 255(0xff, double:1.26E-321)
            long r13 = r13 & r8
            r15 = 128(0x80, double:6.3E-322)
            int r13 = (r13 > r15 ? 1 : (r13 == r15 ? 0 : -1))
            if (r13 >= 0) goto L86
            int r13 = r7 << 3
            int r13 = r13 + r12
            r13 = r4[r13]
            dqc r13 = (defpackage.dqc) r13
            fqc r13 = r13.d()
        L69:
            if (r13 == 0) goto L86
            long r14 = r13.a
            int r16 = (r14 > r2 ? 1 : (r14 == r2 ? 0 : -1))
            if (r16 == 0) goto L7d
            sic r6 = r0.j
            java.lang.Long r14 = java.lang.Long.valueOf(r14)
            boolean r6 = defpackage.bu1.p0(r6, r14)
            if (r6 == 0) goto L83
        L7d:
            dsb r6 = defpackage.uic.a
            r14 = 0
            r13.a = r14
        L83:
            fqc r13 = r13.b
            goto L69
        L86:
            long r8 = r8 >> r11
            int r12 = r12 + 1
            goto L53
        L8a:
            if (r10 != r11) goto L91
        L8c:
            if (r7 == r5) goto L91
            int r7 = r7 + 1
            goto L39
        L91:
            r0.a()
        L94:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.k78.l():void");
    }

    @Override // defpackage.oic
    public void m() {
        if (this.m || this.c) {
            return;
        }
        v();
    }

    @Override // defpackage.oic
    public void n(dqc dqcVar) {
        g78 g78VarX = x();
        if (g78VarX == null) {
            g78 g78Var = iqb.a;
            g78VarX = new g78();
            C(g78VarX);
        }
        g78VarX.a(dqcVar);
    }

    @Override // defpackage.oic
    public final void p() {
        int length = this.k.length;
        for (int i = 0; i < length; i++) {
            uic.u(this.k[i]);
        }
        o();
    }

    @Override // defpackage.oic
    public void t(int i) {
        this.g = i;
    }

    @Override // defpackage.oic
    public oic u(x45 x45Var) {
        yc8 yc8Var;
        if (this.c) {
            xx9.a("Cannot use a disposed snapshot");
        }
        if (this.m && this.d < 0) {
            xx9.b("Unsupported operation on a disposed or applied snapshot");
        }
        long jG = g();
        A(g());
        Object obj = uic.c;
        synchronized (obj) {
            long j = uic.e;
            uic.e = j + 1;
            uic.d = uic.d.q(j);
            yc8Var = new yc8(j, uic.a(d(), jG + 1, j), uic.i(x45Var, e(), true), this);
        }
        if (this.m || this.c) {
            return yc8Var;
        }
        long jG2 = g();
        synchronized (obj) {
            long j2 = uic.e;
            uic.e = j2 + 1;
            s(j2);
            uic.d = uic.d.q(g());
        }
        r(uic.a(d(), jG2 + 1, g()));
        return yc8Var;
    }

    public final void v() {
        A(g());
        if (this.m || this.c) {
            return;
        }
        long jG = g();
        synchronized (uic.c) {
            long j = uic.e;
            uic.e = j + 1;
            s(j);
            uic.d = uic.d.q(g());
        }
        r(uic.a(d(), jG + 1, g()));
    }

    /* JADX WARN: Removed duplicated region for block: B:59:0x0106  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x010b  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0145  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.fo7 w() {
        /*
            Method dump skipped, instruction units count: 363
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.k78.w():fo7");
    }

    public g78 x() {
        return this.h;
    }

    @Override // defpackage.oic
    /* JADX INFO: renamed from: y, reason: merged with bridge method [inline-methods] */
    public x45 e() {
        return this.e;
    }

    public final fo7 z(long j, g78 g78Var, HashMap map, sic sicVar) {
        ArrayList arrayList;
        ArrayList arrayListQ0;
        ArrayList arrayList2;
        sic sicVar2;
        Object[] objArr;
        long[] jArr;
        sic sicVar3;
        Object[] objArr2;
        long[] jArr2;
        int i;
        long j2;
        ArrayList arrayList3;
        fqc fqcVarF;
        sic sicVarP = d().q(g()).p(this.j);
        Object[] objArr3 = g78Var.b;
        long[] jArr3 = g78Var.a;
        int length = jArr3.length - 2;
        if (length >= 0) {
            int i2 = 0;
            arrayList2 = null;
            arrayListQ0 = null;
            while (true) {
                long j3 = jArr3[i2];
                if ((((~j3) << 7) & j3 & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i3 = 8 - ((~(i2 - length)) >>> 31);
                    int i4 = 0;
                    while (i4 < i3) {
                        if ((j3 & 255) < 128) {
                            objArr2 = objArr3;
                            dqc dqcVar = (dqc) objArr3[(i2 << 3) + i4];
                            jArr2 = jArr3;
                            fqc fqcVarD = dqcVar.d();
                            i = i4;
                            ArrayList arrayList4 = arrayList2;
                            fqc fqcVarS = uic.s(fqcVarD, j, sicVar);
                            if (fqcVarS == null) {
                                arrayList3 = arrayListQ0;
                                j2 = j3;
                            } else {
                                arrayList3 = arrayListQ0;
                                j2 = j3;
                                fqc fqcVarS2 = uic.s(fqcVarD, g(), sicVarP);
                                if (fqcVarS2 != null && fqcVarS2.a != 1 && !fqcVarS.equals(fqcVarS2)) {
                                    sicVar3 = sicVarP;
                                    fqc fqcVarS3 = uic.s(fqcVarD, g(), d());
                                    if (fqcVarS3 == null) {
                                        uic.r();
                                        throw null;
                                    }
                                    if (map == null || (fqcVarF = (fqc) map.get(fqcVarS)) == null) {
                                        fqcVarF = dqcVar.f(fqcVarS2, fqcVarS, fqcVarS3);
                                    }
                                    if (fqcVarF == null) {
                                        return new pic(this);
                                    }
                                    if (!fqcVarF.equals(fqcVarS3)) {
                                        if (fqcVarF.equals(fqcVarS)) {
                                            ArrayList arrayList5 = arrayList4 == null ? new ArrayList() : arrayList4;
                                            arrayList5.add(new f09(dqcVar, fqcVarS.b(g())));
                                            arrayListQ0 = arrayList3 == null ? new ArrayList() : arrayList3;
                                            arrayListQ0.add(dqcVar);
                                            arrayList2 = arrayList5;
                                        } else {
                                            arrayList2 = arrayList4 == null ? new ArrayList() : arrayList4;
                                            arrayList2.add(!fqcVarF.equals(fqcVarS2) ? new f09(dqcVar, fqcVarF) : new f09(dqcVar, fqcVarS2.b(g())));
                                        }
                                    }
                                    arrayListQ0 = arrayList3;
                                }
                                arrayList2 = arrayList4;
                                arrayListQ0 = arrayList3;
                            }
                            sicVar3 = sicVarP;
                            arrayList2 = arrayList4;
                            arrayListQ0 = arrayList3;
                        } else {
                            sicVar3 = sicVarP;
                            objArr2 = objArr3;
                            jArr2 = jArr3;
                            i = i4;
                            j2 = j3;
                        }
                        j3 = j2 >> 8;
                        i4 = i + 1;
                        jArr3 = jArr2;
                        objArr3 = objArr2;
                        sicVarP = sicVar3;
                    }
                    sicVar2 = sicVarP;
                    objArr = objArr3;
                    jArr = jArr3;
                    if (i3 != 8) {
                        break;
                    }
                } else {
                    sicVar2 = sicVarP;
                    objArr = objArr3;
                    jArr = jArr3;
                }
                if (i2 == length) {
                    arrayList = arrayList2;
                    break;
                }
                i2++;
                jArr3 = jArr;
                objArr3 = objArr;
                sicVarP = sicVar2;
            }
        } else {
            arrayList = null;
            arrayListQ0 = null;
        }
        arrayList2 = arrayList;
        if (arrayList2 != null) {
            v();
            int size = arrayList2.size();
            for (int i5 = 0; i5 < size; i5++) {
                f09 f09Var = (f09) arrayList2.get(i5);
                dqc dqcVar2 = (dqc) f09Var.a;
                fqc fqcVar = (fqc) f09Var.b;
                fqcVar.a = j;
                synchronized (uic.c) {
                    fqcVar.b = dqcVar2.d();
                    dqcVar2.m(fqcVar);
                }
            }
        }
        if (arrayListQ0 != null) {
            int size2 = arrayListQ0.size();
            for (int i6 = 0; i6 < size2; i6++) {
                g78Var.l((dqc) arrayListQ0.get(i6));
            }
            ArrayList arrayList6 = this.i;
            if (arrayList6 != null) {
                arrayListQ0 = bu1.Q0(arrayListQ0, arrayList6);
            }
            this.i = arrayListQ0;
        }
        return qic.c;
    }
}
