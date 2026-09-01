package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mpa extends b43 implements zc8 {
    public boolean q;
    public m45 r;
    public boolean s;
    public npa t;
    public float u;
    public final hd8 v = new hd8(this, null);
    public final g49 w = new g49(0.0f);
    public final g49 x = new g49(0.0f);

    public mpa(boolean z, m45 m45Var, boolean z2, npa npaVar, float f) {
        this.q = z;
        this.r = m45Var;
        this.s = z2;
        this.t = npaVar;
        this.u = f;
    }

    @Override // defpackage.zc8
    public final Object A(long j, long j2, n92 n92Var) {
        return ev6.H();
    }

    @Override // defpackage.zc8
    public final long K(int i, long j) {
        if (!this.t.a.e() && this.s && i == 1 && Float.intBitsToFloat((int) (4294967295L & j)) < 0.0f) {
            return N0(j);
        }
        return 0L;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object L0(defpackage.p92 r10) {
        /*
            r9 = this;
            boolean r0 = r10 instanceof defpackage.hpa
            if (r0 == 0) goto L14
            r0 = r10
            hpa r0 = (defpackage.hpa) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.d = r1
        L12:
            r5 = r0
            goto L1a
        L14:
            hpa r0 = new hpa
            r0.<init>(r9, r10)
            goto L12
        L1a:
            java.lang.Object r10 = r5.b
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r5.d
            c1e r7 = defpackage.c1e.a
            r2 = 1
            r8 = 0
            if (r1 == 0) goto L36
            if (r1 != r2) goto L2f
            defpackage.br7.v(r10)     // Catch: java.lang.Throwable -> L2c
            goto L53
        L2c:
            r0 = move-exception
            r10 = r0
            goto L5a
        L2f:
            java.lang.String r9 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r9)
            r9 = 0
            return r9
        L36:
            defpackage.br7.v(r10)
            npa r10 = r9.t     // Catch: java.lang.Throwable -> L2c
            r5.d = r2     // Catch: java.lang.Throwable -> L2c
            ou r1 = r10.a     // Catch: java.lang.Throwable -> L2c
            java.lang.Float r2 = new java.lang.Float     // Catch: java.lang.Throwable -> L2c
            r2.<init>(r8)     // Catch: java.lang.Throwable -> L2c
            r4 = 0
            r6 = 14
            r3 = 0
            java.lang.Object r10 = defpackage.ou.a(r1, r2, r3, r4, r5, r6)     // Catch: java.lang.Throwable -> L2c
            if (r10 != r0) goto L4f
            goto L50
        L4f:
            r10 = r7
        L50:
            if (r10 != r0) goto L53
            return r0
        L53:
            r9.Q0(r8)
            r9.R0(r8)
            return r7
        L5a:
            r9.Q0(r8)
            r9.R0(r8)
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mpa.L0(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object M0(defpackage.p92 r9) {
        /*
            r8 = this;
            boolean r0 = r9 instanceof defpackage.ipa
            if (r0 == 0) goto L14
            r0 = r9
            ipa r0 = (defpackage.ipa) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.d = r1
        L12:
            r5 = r0
            goto L1a
        L14:
            ipa r0 = new ipa
            r0.<init>(r8, r9)
            goto L12
        L1a:
            java.lang.Object r9 = r5.b
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r5.d
            c1e r7 = defpackage.c1e.a
            r2 = 1
            if (r1 == 0) goto L35
            if (r1 != r2) goto L2e
            defpackage.br7.v(r9)     // Catch: java.lang.Throwable -> L2b
            goto L54
        L2b:
            r0 = move-exception
            r9 = r0
            goto L69
        L2e:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            r8 = 0
            return r8
        L35:
            defpackage.br7.v(r9)
            npa r9 = r8.t     // Catch: java.lang.Throwable -> L2b
            r5.d = r2     // Catch: java.lang.Throwable -> L2b
            ou r1 = r9.a     // Catch: java.lang.Throwable -> L2b
            java.lang.Float r2 = new java.lang.Float     // Catch: java.lang.Throwable -> L2b
            r9 = 1065353216(0x3f800000, float:1.0)
            r2.<init>(r9)     // Catch: java.lang.Throwable -> L2b
            r4 = 0
            r6 = 14
            r3 = 0
            java.lang.Object r9 = defpackage.ou.a(r1, r2, r3, r4, r5, r6)     // Catch: java.lang.Throwable -> L2b
            if (r9 != r0) goto L50
            goto L51
        L50:
            r9 = r7
        L51:
            if (r9 != r0) goto L54
            return r0
        L54:
            boolean r9 = r8.n
            if (r9 == 0) goto L68
            int r9 = r8.O0()
            float r9 = (float) r9
            r8.Q0(r9)
            int r9 = r8.O0()
            float r9 = (float) r9
            r8.R0(r9)
        L68:
            return r7
        L69:
            boolean r0 = r8.n
            if (r0 == 0) goto L7d
            int r0 = r8.O0()
            float r0 = (float) r0
            r8.Q0(r0)
            int r0 = r8.O0()
            float r0 = (float) r0
            r8.R0(r0)
        L7d:
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mpa.M0(p92):java.lang.Object");
    }

    public final long N0(long j) {
        float fG;
        float fO0;
        if (this.q) {
            fG = 0.0f;
        } else {
            g49 g49Var = this.x;
            float fIntBitsToFloat = Float.intBitsToFloat((int) (j & 4294967295L)) + g49Var.g();
            if (fIntBitsToFloat < 0.0f) {
                fIntBitsToFloat = 0.0f;
            }
            fG = fIntBitsToFloat - g49Var.g();
            Q0(fIntBitsToFloat);
            if (g49Var.g() * 0.5f <= O0()) {
                fO0 = g49Var.g() * 0.5f;
            } else {
                float fU = iq7.u(Math.abs((g49Var.g() * 0.5f) / O0()) - 1.0f, 0.0f, 2.0f);
                fO0 = O0() + (O0() * (fU - (((float) Math.pow(fU, 2.0d)) / 4.0f)));
            }
            R0(fO0);
        }
        return (((long) Float.floatToRawIntBits(0.0f)) << 32) | (4294967295L & ((long) Float.floatToRawIntBits(fG)));
    }

    public final int O0() {
        return flb.v0(this).y.i0(this.u);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object P0(float r7, defpackage.p92 r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.lpa
            if (r0 == 0) goto L13
            r0 = r8
            lpa r0 = (defpackage.lpa) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            lpa r0 = new lpa
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L31
            if (r2 != r3) goto L2a
            float r7 = r0.b
            defpackage.br7.v(r8)
            goto L6f
        L2a:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L31:
            defpackage.br7.v(r8)
            boolean r8 = r6.q
            if (r8 == 0) goto L3e
            java.lang.Float r6 = new java.lang.Float
            r6.<init>(r4)
            return r6
        L3e:
            g49 r8 = r6.x
            float r2 = r8.g()
            r5 = 1056964608(0x3f000000, float:0.5)
            float r2 = r2 * r5
            int r5 = r6.O0()
            float r5 = (float) r5
            int r2 = (r2 > r5 ? 1 : (r2 == r5 ? 0 : -1))
            if (r2 <= 0) goto L55
            m45 r2 = r6.r
            r2.invoke()
        L55:
            float r8 = r8.g()
            int r8 = (r8 > r4 ? 1 : (r8 == r4 ? 0 : -1))
            if (r8 != 0) goto L5f
        L5d:
            r7 = r4
            goto L64
        L5f:
            int r8 = (r7 > r4 ? 1 : (r7 == r4 ? 0 : -1))
            if (r8 >= 0) goto L64
            goto L5d
        L64:
            r0.b = r7
            r0.e = r3
            java.lang.Object r8 = r6.L0(r0)
            if (r8 != r1) goto L6f
            return r1
        L6f:
            r6.Q0(r4)
            java.lang.Float r6 = new java.lang.Float
            r6.<init>(r7)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mpa.P0(float, p92):java.lang.Object");
    }

    public final void Q0(float f) {
        this.x.h(f);
    }

    public final void R0(float f) {
        this.w.h(f);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.zc8
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object j0(long r5, defpackage.n92 r7) {
        /*
            r4 = this;
            boolean r0 = r7 instanceof defpackage.kpa
            if (r0 == 0) goto L13
            r0 = r7
            kpa r0 = (defpackage.kpa) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L1a
        L13:
            kpa r0 = new kpa
            p92 r7 = (defpackage.p92) r7
            r0.<init>(r4, r7)
        L1a:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L30
            if (r2 != r3) goto L29
            defpackage.br7.v(r7)
            goto L40
        L29:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L30:
            defpackage.br7.v(r7)
            float r5 = defpackage.qre.c(r5)
            r0.d = r3
            java.lang.Object r7 = r4.P0(r5, r0)
            if (r7 != r1) goto L40
            return r1
        L40:
            java.lang.Number r7 = (java.lang.Number) r7
            float r4 = r7.floatValue()
            r5 = 0
            long r4 = defpackage.ok7.u(r5, r4)
            qre r6 = new qre
            r6.<init>(r4)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mpa.j0(long, n92):java.lang.Object");
    }

    @Override // defpackage.zc8
    public final long n0(long j, long j2, int i) {
        if (this.t.a.e() || !this.s) {
            return 0L;
        }
        int i2 = 1;
        if (i != 1) {
            return 0L;
        }
        long jN0 = N0(j2);
        vx0.c0(u0(), null, null, new jpa(this, null, i2), 3);
        return jN0;
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }

    @Override // defpackage.q28
    public final void y0() {
        I0(this.v);
        vx0.c0(u0(), null, null, new jpa(this, null, 0), 3);
        R0(this.q ? O0() : 0.0f);
    }
}
