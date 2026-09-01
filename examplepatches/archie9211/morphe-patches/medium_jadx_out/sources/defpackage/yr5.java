package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yr5 extends q28 implements ub9 {
    public m68 o;
    public sr5 p;

    @Override // defpackage.q28
    public final void A0() {
        K0();
    }

    @Override // defpackage.ub9
    public final void H() {
        K0();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object I0(defpackage.p92 r5) {
        /*
            r4 = this;
            boolean r0 = r5 instanceof defpackage.vr5
            if (r0 == 0) goto L13
            r0 = r5
            vr5 r0 = (defpackage.vr5) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            vr5 r0 = new vr5
            r0.<init>(r4, r5)
        L18:
            java.lang.Object r5 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L30
            if (r2 != r3) goto L29
            sr5 r0 = r0.b
            defpackage.br7.v(r5)
            goto L4a
        L29:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L30:
            defpackage.br7.v(r5)
            sr5 r5 = r4.p
            if (r5 != 0) goto L4c
            sr5 r5 = new sr5
            r5.<init>()
            m68 r2 = r4.o
            r0.b = r5
            r0.e = r3
            java.lang.Object r0 = r2.b(r5, r0)
            if (r0 != r1) goto L49
            return r1
        L49:
            r0 = r5
        L4a:
            r4.p = r0
        L4c:
            c1e r4 = defpackage.c1e.a
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yr5.I0(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object J0(defpackage.p92 r6) {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.wr5
            if (r0 == 0) goto L13
            r0 = r6
            wr5 r0 = (defpackage.wr5) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            wr5 r0 = new wr5
            r0.<init>(r5, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 != r4) goto L28
            defpackage.br7.v(r6)
            goto L45
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2e:
            defpackage.br7.v(r6)
            sr5 r6 = r5.p
            if (r6 == 0) goto L47
            tr5 r2 = new tr5
            r2.<init>(r6)
            m68 r6 = r5.o
            r0.d = r4
            java.lang.Object r6 = r6.b(r2, r0)
            if (r6 != r1) goto L45
            return r1
        L45:
            r5.p = r3
        L47:
            c1e r5 = defpackage.c1e.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yr5.J0(p92):java.lang.Object");
    }

    public final void K0() {
        sr5 sr5Var = this.p;
        if (sr5Var != null) {
            this.o.c(new tr5(sr5Var));
            this.p = null;
        }
    }

    @Override // defpackage.ub9
    public final boolean l0() {
        return false;
    }

    @Override // defpackage.ub9
    public final long n() {
        return iqd.a;
    }

    @Override // defpackage.ub9
    public final void o0() {
        K0();
    }

    @Override // defpackage.ub9
    public final void y(lb9 lb9Var, mb9 mb9Var, long j) {
        if (mb9Var == mb9.Main) {
            int i = lb9Var.f;
            n92 n92Var = null;
            if (i == 4) {
                vx0.c0(u0(), null, null, new xr5(this, n92Var, 0), 3);
            } else if (i == 5) {
                vx0.c0(u0(), null, null, new xr5(this, n92Var, 1), 3);
            }
        }
    }

    @Override // defpackage.q28
    public final void z0() {
        K0();
    }

    @Override // defpackage.ub9
    public final void M() {
    }
}
