package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mb7 extends t99 implements tk7, de, g48 {
    public boolean C;
    public final eq6 f;
    public boolean g;
    public boolean k;
    public boolean l;
    public boolean m;
    public f72 n;
    public x45 p;
    public of5 q;
    public boolean v;
    public Object y;
    public int h = Integer.MAX_VALUE;
    public int i = Integer.MAX_VALUE;
    public yp6 j = yp6.NotUsed;
    public long o = 0;
    public jb7 r = jb7.IsNotPlaced;
    public final bq6 s = new bq6(this, 1);
    public final o78 t = new o78(new mb7[16]);
    public boolean u = true;
    public final lb7 w = new lb7(this, 0);
    public boolean x = true;
    public long z = h72.b(0, 0, 0, 0, 15);
    public final lb7 A = new lb7(this, 2);
    public final lb7 B = new lb7(this, 1);

    public mb7(eq6 eq6Var) {
        this.f = eq6Var;
        this.y = eq6Var.p.s;
    }

    @Override // defpackage.de
    public final void A(ce ceVar) {
        o78 o78VarZ = this.f.a.z();
        Object[] objArr = o78VarZ.a;
        int i = o78VarZ.c;
        for (int i2 = 0; i2 < i; i2++) {
            mb7 mb7Var = ((aq6) objArr[i2]).G.q;
            mb7Var.getClass();
            ceVar.invoke(mb7Var);
        }
    }

    @Override // defpackage.g48
    public final void B(boolean z) {
        hb7 hb7VarM0;
        eq6 eq6Var = this.f;
        hb7 hb7VarM02 = eq6Var.a().M0();
        if (Boolean.valueOf(z).equals(hb7VarM02 != null ? Boolean.valueOf(hb7VarM02.i) : null) || (hb7VarM0 = eq6Var.a().M0()) == null) {
            return;
        }
        hb7VarM0.i = z;
    }

    @Override // defpackage.de
    public final void C() {
        this.v = true;
        bq6 bq6Var = this.s;
        bq6Var.h();
        eq6 eq6Var = this.f;
        boolean z = eq6Var.f;
        aq6 aq6Var = eq6Var.a;
        if (z) {
            o78 o78VarZ = aq6Var.z();
            Object[] objArr = o78VarZ.a;
            int i = o78VarZ.c;
            for (int i2 = 0; i2 < i; i2++) {
                aq6 aq6Var2 = (aq6) objArr[i2];
                eq6 eq6Var2 = aq6Var2.G;
                if (eq6Var2.e && aq6Var2.s() == yp6.InMeasureBlock) {
                    mb7 mb7Var = eq6Var2.q;
                    mb7Var.getClass();
                    mb7 mb7Var2 = eq6Var2.q;
                    f72 f72Var = mb7Var2 != null ? mb7Var2.n : null;
                    f72Var.getClass();
                    if (mb7Var.v0(f72Var.a)) {
                        aq6.T(aq6Var, false, 7);
                    }
                }
            }
        }
        k26 k26Var = e().X;
        k26Var.getClass();
        if (eq6Var.g || (!this.k && !k26Var.k && eq6Var.f)) {
            eq6Var.f = false;
            wp6 wp6Var = eq6Var.d;
            eq6Var.d = wp6.LookaheadLayingOut;
            eq6Var.i(false);
            px8 snapshotObserver = ((mn) dq6.a(aq6Var)).getSnapshotObserver();
            snapshotObserver.getClass();
            snapshotObserver.a.d(aq6Var, zu2.D, this.w);
            eq6Var.d = wp6Var;
            if (eq6Var.m && k26Var.k) {
                requestLayout();
            }
            eq6Var.g = false;
        }
        if (bq6Var.d) {
            bq6Var.e = true;
        }
        if (bq6Var.b && bq6Var.e()) {
            bq6Var.g();
        }
        this.v = false;
    }

    @Override // defpackage.de
    public final void K() {
        aq6.T(this.f.a, false, 7);
    }

    @Override // defpackage.tk7
    public final int L(int i) {
        r0();
        hb7 hb7VarM0 = this.f.a().M0();
        hb7VarM0.getClass();
        return hb7VarM0.L(i);
    }

    @Override // defpackage.t99
    public final int M(yd ydVar) {
        eq6 eq6Var = this.f;
        aq6 aq6VarV = eq6Var.a.v();
        wp6 wp6Var = aq6VarV != null ? aq6VarV.G.d : null;
        wp6 wp6Var2 = wp6.LookaheadMeasuring;
        bq6 bq6Var = this.s;
        if (wp6Var == wp6Var2) {
            bq6Var.c = true;
        } else {
            aq6 aq6VarV2 = eq6Var.a.v();
            if ((aq6VarV2 != null ? aq6VarV2.G.d : null) == wp6.LookaheadLayingOut) {
                bq6Var.d = true;
            }
        }
        this.k = true;
        hb7 hb7VarM0 = eq6Var.a().M0();
        hb7VarM0.getClass();
        int iM = hb7VarM0.M(ydVar);
        this.k = false;
        return iM;
    }

    @Override // defpackage.t99
    public final int P() {
        hb7 hb7VarM0 = this.f.a().M0();
        hb7VarM0.getClass();
        return hb7VarM0.P();
    }

    @Override // defpackage.t99
    public final int R() {
        hb7 hb7VarM0 = this.f.a().M0();
        hb7VarM0.getClass();
        return hb7VarM0.R();
    }

    @Override // defpackage.t99
    public final void X(long j, float f, x45 x45Var) throws Throwable {
        u0(j, x45Var, null);
    }

    @Override // defpackage.tk7
    public final int a(int i) {
        r0();
        hb7 hb7VarM0 = this.f.a().M0();
        hb7VarM0.getClass();
        return hb7VarM0.a(i);
    }

    @Override // defpackage.t99
    public final void a0(long j, float f, of5 of5Var) throws Throwable {
        u0(j, null, of5Var);
    }

    @Override // defpackage.de
    public final bq6 c() {
        return this.s;
    }

    @Override // defpackage.de
    public final l26 e() {
        return (l26) this.f.a.F.d;
    }

    @Override // defpackage.de
    public final de g() {
        eq6 eq6Var;
        aq6 aq6VarV = this.f.a.v();
        if (aq6VarV == null || (eq6Var = aq6VarV.G) == null) {
            return null;
        }
        return eq6Var.q;
    }

    public final boolean j0() {
        eq6 eq6Var = this.f;
        return dm2.L(eq6Var.a) || eq6Var.c;
    }

    @Override // defpackage.tk7
    public final int k(int i) {
        r0();
        hb7 hb7VarM0 = this.f.a().M0();
        hb7VarM0.getClass();
        return hb7VarM0.k(i);
    }

    @Override // defpackage.de
    public final int l() {
        return this.i;
    }

    public final void l0(boolean z) {
        if (z && j0()) {
            return;
        }
        if (z || j0()) {
            this.r = jb7.IsNotPlaced;
            o78 o78VarZ = this.f.a.z();
            Object[] objArr = o78VarZ.a;
            int i = o78VarZ.c;
            for (int i2 = 0; i2 < i; i2++) {
                mb7 mb7Var = ((aq6) objArr[i2]).G.q;
                mb7Var.getClass();
                mb7Var.l0(true);
            }
        }
    }

    @Override // defpackage.tk7
    public final int n(int i) {
        r0();
        hb7 hb7VarM0 = this.f.a().M0();
        hb7VarM0.getClass();
        return hb7VarM0.n(i);
    }

    public final void n0() {
        jb7 jb7Var = this.r;
        eq6 eq6Var = this.f;
        boolean z = eq6Var.c;
        aq6 aq6Var = eq6Var.a;
        if (z) {
            this.r = jb7.IsPlacedInApproach;
        } else {
            this.r = jb7.IsPlacedInLookahead;
        }
        if (jb7Var != jb7.IsPlacedInLookahead && eq6Var.e) {
            aq6.T(aq6Var, true, 6);
        }
        o78 o78VarZ = aq6Var.z();
        Object[] objArr = o78VarZ.a;
        int i = o78VarZ.c;
        for (int i2 = 0; i2 < i; i2++) {
            aq6 aq6Var2 = (aq6) objArr[i2];
            mb7 mb7Var = aq6Var2.G.q;
            if (mb7Var == null) {
                ay0.e("Error: Child node's lookahead pass delegate cannot be null when in a lookahead scope.");
                return;
            }
            if (mb7Var.i != Integer.MAX_VALUE) {
                mb7Var.n0();
                aq6.W(aq6Var2);
            }
        }
    }

    public final void o0() {
        eq6 eq6Var = this.f;
        if (eq6Var.o > 0) {
            o78 o78VarZ = eq6Var.a.z();
            Object[] objArr = o78VarZ.a;
            int i = o78VarZ.c;
            for (int i2 = 0; i2 < i; i2++) {
                aq6 aq6Var = (aq6) objArr[i2];
                eq6 eq6Var2 = aq6Var.G;
                if ((eq6Var2.m || eq6Var2.n) && !eq6Var2.f) {
                    aq6Var.S(false);
                }
                mb7 mb7Var = eq6Var2.q;
                if (mb7Var != null) {
                    mb7Var.o0();
                }
            }
        }
    }

    public final void r0() {
        eq6 eq6Var = this.f;
        aq6.T(eq6Var.a, false, 7);
        aq6 aq6Var = eq6Var.a;
        aq6 aq6VarV = aq6Var.v();
        if (aq6VarV == null || aq6Var.C != yp6.NotUsed) {
            return;
        }
        int i = kb7.a[aq6VarV.G.d.ordinal()];
        aq6Var.C = i != 2 ? i != 3 ? aq6VarV.C : yp6.InLayoutBlock : yp6.InMeasureBlock;
    }

    @Override // defpackage.de
    public final void requestLayout() {
        this.f.a.S(false);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0027  */
    @Override // defpackage.tk7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.t99 s(long r7) {
        /*
            r6 = this;
            eq6 r0 = r6.f
            aq6 r1 = r0.a
            aq6 r2 = r0.a
            aq6 r1 = r1.v()
            r3 = 0
            if (r1 == 0) goto L12
            eq6 r1 = r1.G
            wp6 r1 = r1.d
            goto L13
        L12:
            r1 = r3
        L13:
            wp6 r4 = defpackage.wp6.LookaheadMeasuring
            if (r1 == r4) goto L27
            aq6 r1 = r2.v()
            if (r1 == 0) goto L22
            eq6 r1 = r1.G
            wp6 r1 = r1.d
            goto L23
        L22:
            r1 = r3
        L23:
            wp6 r4 = defpackage.wp6.LookaheadLayingOut
            if (r1 != r4) goto L2a
        L27:
            r1 = 0
            r0.b = r1
        L2a:
            aq6 r0 = r2.v()
            if (r0 == 0) goto L69
            eq6 r0 = r0.G
            yp6 r1 = r6.j
            yp6 r4 = defpackage.yp6.NotUsed
            if (r1 == r4) goto L42
            boolean r1 = r2.E
            if (r1 == 0) goto L3d
            goto L42
        L3d:
            java.lang.String r1 = "measure() may not be called multiple times on the same Measurable. If you want to get the content size of the Measurable before calculating the final constraints, please use methods like minIntrinsicWidth()/maxIntrinsicWidth() and minIntrinsicHeight()/maxIntrinsicHeight()"
            defpackage.b26.b(r1)
        L42:
            wp6 r1 = r0.d
            int[] r5 = defpackage.kb7.a
            int r1 = r1.ordinal()
            r1 = r5[r1]
            r5 = 1
            if (r1 == r5) goto L64
            r5 = 2
            if (r1 == r5) goto L64
            r5 = 3
            if (r1 == r5) goto L61
            r5 = 4
            if (r1 != r5) goto L59
            goto L61
        L59:
            java.lang.String r6 = "Measurable could be only measured from the parent's measure or layout block. Parents state is "
            wp6 r7 = r0.d
            defpackage.rd6.g(r6, r7)
            return r3
        L61:
            yp6 r0 = defpackage.yp6.InLayoutBlock
            goto L66
        L64:
            yp6 r0 = defpackage.yp6.InMeasureBlock
        L66:
            r6.j = r0
            goto L6d
        L69:
            yp6 r4 = defpackage.yp6.NotUsed
            r6.j = r4
        L6d:
            yp6 r0 = r2.C
            if (r0 != r4) goto L74
            r2.e()
        L74:
            r6.v0(r7)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mb7.s(long):t99");
    }

    public final void s0() {
        wp6 wp6Var;
        this.C = true;
        eq6 eq6Var = this.f;
        aq6 aq6VarV = eq6Var.a.v();
        jb7 jb7Var = this.r;
        if ((jb7Var != jb7.IsPlacedInLookahead && !eq6Var.c) || (jb7Var != jb7.IsPlacedInApproach && eq6Var.c)) {
            n0();
            if (this.g && aq6VarV != null) {
                aq6VarV.S(false);
            }
        }
        if (aq6VarV != null) {
            eq6 eq6Var2 = aq6VarV.G;
            if (!this.g && ((wp6Var = eq6Var2.d) == wp6.LayingOut || wp6Var == wp6.LookaheadLayingOut)) {
                if (this.i != Integer.MAX_VALUE) {
                    b26.b("Place was called on a node which was placed already");
                }
                int i = eq6Var2.h;
                this.i = i;
                eq6Var2.h = i + 1;
            }
        } else {
            this.i = 0;
        }
        C();
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x006f A[Catch: all -> 0x001b, TryCatch #0 {all -> 0x001b, blocks: (B:3:0x0007, B:5:0x000d, B:7:0x0013, B:9:0x0018, B:12:0x001e, B:14:0x0022, B:15:0x0027, B:17:0x0036, B:19:0x003a, B:22:0x0040, B:21:0x003e, B:23:0x0043, B:25:0x004d, B:30:0x0057, B:32:0x0088, B:31:0x006f), top: B:36:0x0007 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void u0(long r10, defpackage.x45 r12, defpackage.of5 r13) throws java.lang.Throwable {
        /*
            r9 = this;
            eq6 r0 = r9.f
            aq6 r1 = r0.a
            aq6 r2 = r0.a
            r3 = 0
            aq6 r4 = r1.v()     // Catch: java.lang.Throwable -> L1b
            if (r4 == 0) goto L12
            eq6 r4 = r4.G     // Catch: java.lang.Throwable -> L1b
            wp6 r4 = r4.d     // Catch: java.lang.Throwable -> L1b
            goto L13
        L12:
            r4 = r3
        L13:
            wp6 r5 = defpackage.wp6.LookaheadLayingOut     // Catch: java.lang.Throwable -> L1b
            r6 = 0
            if (r4 != r5) goto L1e
            r0.c = r6     // Catch: java.lang.Throwable -> L1b
            goto L1e
        L1b:
            r9 = move-exception
            goto L91
        L1e:
            boolean r4 = r2.Q     // Catch: java.lang.Throwable -> L1b
            if (r4 == 0) goto L27
            java.lang.String r4 = "place is called on a deactivated node"
            defpackage.b26.a(r4)     // Catch: java.lang.Throwable -> L1b
        L27:
            r0.d = r5     // Catch: java.lang.Throwable -> L1b
            r4 = 1
            r9.l = r4     // Catch: java.lang.Throwable -> L1b
            r9.C = r6     // Catch: java.lang.Throwable -> L1b
            long r7 = r9.o     // Catch: java.lang.Throwable -> L1b
            boolean r5 = defpackage.k46.b(r10, r7)     // Catch: java.lang.Throwable -> L1b
            if (r5 != 0) goto L43
            boolean r5 = r0.n     // Catch: java.lang.Throwable -> L1b
            if (r5 != 0) goto L3e
            boolean r5 = r0.m     // Catch: java.lang.Throwable -> L1b
            if (r5 == 0) goto L40
        L3e:
            r0.f = r4     // Catch: java.lang.Throwable -> L1b
        L40:
            r9.o0()     // Catch: java.lang.Throwable -> L1b
        L43:
            mx8 r5 = defpackage.dq6.a(r2)     // Catch: java.lang.Throwable -> L1b
            r9.o = r10     // Catch: java.lang.Throwable -> L1b
            boolean r7 = r0.f     // Catch: java.lang.Throwable -> L1b
            if (r7 != 0) goto L6f
            jb7 r7 = r9.r     // Catch: java.lang.Throwable -> L1b
            jb7 r8 = defpackage.jb7.IsNotPlaced     // Catch: java.lang.Throwable -> L1b
            if (r7 == r8) goto L54
            goto L55
        L54:
            r4 = r6
        L55:
            if (r4 == 0) goto L6f
            eh8 r2 = r0.a()     // Catch: java.lang.Throwable -> L1b
            hb7 r2 = r2.M0()     // Catch: java.lang.Throwable -> L1b
            r2.getClass()     // Catch: java.lang.Throwable -> L1b
            long r4 = r2.e     // Catch: java.lang.Throwable -> L1b
            long r10 = defpackage.k46.d(r10, r4)     // Catch: java.lang.Throwable -> L1b
            r2.E0(r10)     // Catch: java.lang.Throwable -> L1b
            r9.s0()     // Catch: java.lang.Throwable -> L1b
            goto L88
        L6f:
            r0.h(r6)     // Catch: java.lang.Throwable -> L1b
            bq6 r10 = r9.s     // Catch: java.lang.Throwable -> L1b
            r10.g = r6     // Catch: java.lang.Throwable -> L1b
            mn r5 = (defpackage.mn) r5     // Catch: java.lang.Throwable -> L1b
            px8 r10 = r5.getSnapshotObserver()     // Catch: java.lang.Throwable -> L1b
            lb7 r11 = r9.B     // Catch: java.lang.Throwable -> L1b
            r10.getClass()     // Catch: java.lang.Throwable -> L1b
            zu2 r4 = defpackage.zu2.C     // Catch: java.lang.Throwable -> L1b
            gjc r10 = r10.a     // Catch: java.lang.Throwable -> L1b
            r10.d(r2, r4, r11)     // Catch: java.lang.Throwable -> L1b
        L88:
            r9.p = r12     // Catch: java.lang.Throwable -> L1b
            r9.q = r13     // Catch: java.lang.Throwable -> L1b
            wp6 r9 = defpackage.wp6.Idle     // Catch: java.lang.Throwable -> L1b
            r0.d = r9     // Catch: java.lang.Throwable -> L1b
            return
        L91:
            r1.Y(r9)
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mb7.u0(long, x45, of5):void");
    }

    public final boolean v0(long j) {
        eq6 eq6Var = this.f;
        aq6 aq6Var = eq6Var.a;
        aq6 aq6Var2 = eq6Var.a;
        try {
            if (aq6Var.Q) {
                b26.a("measure is called on a deactivated node");
            }
            aq6 aq6VarV = aq6Var2.v();
            aq6Var2.E = aq6Var2.E || (aq6VarV != null && aq6VarV.E);
            if (!aq6Var2.G.e) {
                f72 f72Var = this.n;
                if (f72Var == null ? false : f72.b(f72Var.a, j)) {
                    mx8 mx8Var = aq6Var2.n;
                    if (mx8Var != null) {
                        ((mn) mx8Var).l(aq6Var2, true);
                    }
                    aq6Var2.X();
                    return false;
                }
            }
            this.n = new f72(j);
            e0(j);
            this.s.f = false;
            o78 o78VarZ = aq6Var2.z();
            Object[] objArr = o78VarZ.a;
            int i = o78VarZ.c;
            for (int i2 = 0; i2 < i; i2++) {
                mb7 mb7Var = ((aq6) objArr[i2]).G.q;
                mb7Var.getClass();
                mb7Var.s.c = false;
            }
            long j2 = this.m ? this.c : -9223372034707292160L;
            this.m = true;
            hb7 hb7VarM0 = eq6Var.a().M0();
            if (hb7VarM0 == null) {
                b26.b("Lookahead result from lookaheadRemeasure cannot be null");
            }
            eq6Var.c(j);
            d0((((long) hb7VarM0.a) << 32) | (((long) hb7VarM0.b) & 4294967295L));
            return (((int) (j2 >> 32)) == hb7VarM0.a && ((int) (j2 & 4294967295L)) == hb7VarM0.b) ? false : true;
        } catch (Throwable th) {
            aq6Var.Y(th);
            throw null;
        }
    }

    @Override // defpackage.t99, defpackage.tk7
    public final Object w() {
        return this.y;
    }
}
