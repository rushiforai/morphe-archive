package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hd8 extends q28 implements ssd, zc8 {
    public zc8 o;
    public cd8 p;
    public hd8 q;
    public final String r;

    public hd8(zc8 zc8Var, cd8 cd8Var) {
        this.o = zc8Var;
        this.p = cd8Var == null ? new cd8() : cd8Var;
        this.r = "androidx.compose.ui.input.nestedscroll.NestedScrollNode";
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    @Override // defpackage.zc8
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object A(long r13, long r15, defpackage.n92 r17) {
        /*
            r12 = this;
            r0 = r17
            boolean r1 = r0 instanceof defpackage.fd8
            if (r1 == 0) goto L16
            r1 = r0
            fd8 r1 = (defpackage.fd8) r1
            int r2 = r1.f
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L16
            int r2 = r2 - r3
            r1.f = r2
        L14:
            r7 = r1
            goto L1e
        L16:
            fd8 r1 = new fd8
            p92 r0 = (defpackage.p92) r0
            r1.<init>(r12, r0)
            goto L14
        L1e:
            java.lang.Object r0 = r7.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r7.f
            r8 = 0
            r9 = 2
            r3 = 1
            if (r2 == 0) goto L44
            if (r2 == r3) goto L39
            if (r2 != r9) goto L33
            long r12 = r7.b
            defpackage.br7.v(r0)
            goto L85
        L33:
            java.lang.String r12 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r12)
            return r8
        L39:
            long r13 = r7.c
            long r2 = r7.b
            defpackage.br7.v(r0)
            r10 = r2
            r2 = r13
            r13 = r10
            goto L59
        L44:
            defpackage.br7.v(r0)
            zc8 r2 = r12.o
            r7.b = r13
            r5 = r15
            r7.c = r5
            r7.f = r3
            r3 = r13
            java.lang.Object r0 = r2.A(r3, r5, r7)
            if (r0 != r1) goto L58
            goto L83
        L58:
            r2 = r15
        L59:
            qre r0 = (defpackage.qre) r0
            long r4 = r0.a
            boolean r0 = r12.n
            if (r0 == 0) goto L69
            if (r0 == 0) goto L67
            hd8 r8 = r12.J0()
        L67:
            r12 = r8
            goto L6c
        L69:
            hd8 r8 = r12.q
            goto L67
        L6c:
            if (r12 == 0) goto L8b
            long r13 = defpackage.qre.e(r13, r4)
            long r2 = defpackage.qre.d(r2, r4)
            r7.b = r4
            r7.f = r9
            r15 = r2
            r17 = r7
            java.lang.Object r0 = r12.A(r13, r15, r17)
            if (r0 != r1) goto L84
        L83:
            return r1
        L84:
            r12 = r4
        L85:
            qre r0 = (defpackage.qre) r0
            long r0 = r0.a
            r4 = r12
            goto L8d
        L8b:
            r0 = 0
        L8d:
            long r12 = defpackage.qre.e(r4, r0)
            qre r14 = new qre
            r14.<init>(r12)
            return r14
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hd8.A(long, long, n92):java.lang.Object");
    }

    @Override // defpackage.q28
    public final void A0() {
        rya ryaVar = new rya();
        br7.A(this, new en(ryaVar, 2));
        hd8 hd8Var = (hd8) ((ssd) ryaVar.a);
        this.q = hd8Var;
        cd8 cd8Var = this.p;
        cd8Var.b = hd8Var;
        if (cd8Var.a == this) {
            cd8Var.a = null;
        }
    }

    public final sb2 I0() {
        hd8 hd8VarJ0 = J0();
        sb2 sb2VarI0 = hd8VarJ0 != null ? hd8VarJ0.I0() : null;
        if (sb2VarI0 != null && o7f.B(sb2VarI0)) {
            return sb2VarI0;
        }
        sb2 sb2Var = this.p.d;
        if (sb2Var != null) {
            return sb2Var;
        }
        ygf.f("in order to access nested coroutine scope you need to attach dispatcher to the `Modifier.nestedScroll` first.");
        return null;
    }

    public final hd8 J0() {
        hj0 hj0Var;
        ssd ssdVar = null;
        if (!this.n) {
            return null;
        }
        if (!this.a.n) {
            b26.b("visitAncestors called on an unattached node");
        }
        q28 q28Var = this.a.e;
        aq6 aq6VarV0 = flb.v0(this);
        loop0: while (true) {
            if (aq6VarV0 == null) {
                break;
            }
            if ((((q28) aq6VarV0.F.g).d & 262144) != 0) {
                while (q28Var != null) {
                    if ((q28Var.c & 262144) != 0) {
                        q28 q28VarQ0 = q28Var;
                        o78 o78Var = null;
                        while (q28VarQ0 != null) {
                            if (q28VarQ0 instanceof ssd) {
                                ssd ssdVar2 = (ssd) q28VarQ0;
                                if (g76.L(this.r, ssdVar2.m()) && hd8.class == ssdVar2.getClass()) {
                                    ssdVar = ssdVar2;
                                    break loop0;
                                }
                            }
                            if ((q28VarQ0.c & 262144) != 0 && (q28VarQ0 instanceof b43)) {
                                int i = 0;
                                for (q28 q28Var2 = ((b43) q28VarQ0).p; q28Var2 != null; q28Var2 = q28Var2.f) {
                                    if ((q28Var2.c & 262144) != 0) {
                                        i++;
                                        if (i == 1) {
                                            q28VarQ0 = q28Var2;
                                        } else {
                                            if (o78Var == null) {
                                                o78Var = new o78(new q28[16]);
                                            }
                                            if (q28VarQ0 != null) {
                                                o78Var.b(q28VarQ0);
                                                q28VarQ0 = null;
                                            }
                                            o78Var.b(q28Var2);
                                        }
                                    }
                                }
                                if (i == 1) {
                                }
                            }
                            q28VarQ0 = flb.q0(o78Var);
                        }
                    }
                    q28Var = q28Var.e;
                }
            }
            aq6VarV0 = aq6VarV0.v();
            q28Var = (aq6VarV0 == null || (hj0Var = aq6VarV0.F) == null) ? null : (ffd) hj0Var.f;
        }
        return (hd8) ssdVar;
    }

    @Override // defpackage.zc8
    public final long K(int i, long j) {
        hd8 hd8VarJ0 = this.n ? J0() : null;
        long jK = hd8VarJ0 != null ? hd8VarJ0.K(i, j) : 0L;
        return ip8.e(jK, this.o.K(i, ip8.d(j, jK)));
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0050, code lost:
    
        if (r9 == r1) goto L27;
     */
    /* JADX WARN: Removed duplicated region for block: B:28:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.zc8
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object j0(long r7, defpackage.n92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.gd8
            if (r0 == 0) goto L13
            r0 = r9
            gd8 r0 = (defpackage.gd8) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L1a
        L13:
            gd8 r0 = new gd8
            p92 r9 = (defpackage.p92) r9
            r0.<init>(r6, r9)
        L1a:
            java.lang.Object r9 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            r4 = 2
            r5 = 1
            if (r2 == 0) goto L3b
            if (r2 == r5) goto L35
            if (r2 != r4) goto L2f
            long r6 = r0.b
            defpackage.br7.v(r9)
            goto L6c
        L2f:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r3
        L35:
            long r7 = r0.b
            defpackage.br7.v(r9)
            goto L53
        L3b:
            defpackage.br7.v(r9)
            boolean r9 = r6.n
            if (r9 == 0) goto L46
            hd8 r3 = r6.J0()
        L46:
            if (r3 == 0) goto L58
            r0.b = r7
            r0.e = r5
            java.lang.Object r9 = r3.j0(r7, r0)
            if (r9 != r1) goto L53
            goto L6a
        L53:
            qre r9 = (defpackage.qre) r9
            long r2 = r9.a
            goto L5a
        L58:
            r2 = 0
        L5a:
            zc8 r6 = r6.o
            long r7 = defpackage.qre.d(r7, r2)
            r0.b = r2
            r0.e = r4
            java.lang.Object r9 = r6.j0(r7, r0)
            if (r9 != r1) goto L6b
        L6a:
            return r1
        L6b:
            r6 = r2
        L6c:
            qre r9 = (defpackage.qre) r9
            long r8 = r9.a
            long r6 = defpackage.qre.e(r6, r8)
            qre r8 = new qre
            r8.<init>(r6)
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hd8.j0(long, n92):java.lang.Object");
    }

    @Override // defpackage.ssd
    public final Object m() {
        return this.r;
    }

    @Override // defpackage.zc8
    public final long n0(long j, long j2, int i) {
        long jN0 = this.o.n0(j, j2, i);
        hd8 hd8VarJ0 = this.n ? J0() : null;
        return ip8.e(jN0, hd8VarJ0 != null ? hd8VarJ0.n0(ip8.e(j, jN0), ip8.d(j2, jN0), i) : 0L);
    }

    @Override // defpackage.q28
    public final void y0() {
        cd8 cd8Var = this.p;
        cd8Var.a = this;
        cd8Var.b = null;
        this.q = null;
        cd8Var.c = new v5f(1, this);
        cd8Var.d = u0();
    }
}
