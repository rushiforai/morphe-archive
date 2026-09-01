package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cl extends el3 {
    public ul J;
    public hw8 K;
    public iic L;
    public dn4 M;
    public m73 N;

    @Override // defpackage.el3
    public final Object M0(dl3 dl3Var, dl3 dl3Var2) {
        ul ulVar = this.J;
        n92 n92Var = null;
        yk ykVar = new yk(dl3Var, this, n92Var, 0);
        s78 s78Var = s78.Default;
        z78 z78Var = ulVar.b;
        il ilVar = new il(ulVar, ykVar, n92Var, 2);
        z78Var.getClass();
        Object objS = o7f.s(new nz(s78Var, z78Var, ilVar, n92Var, 10), dl3Var2);
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        c1e c1eVar = c1e.a;
        if (objS != tb2Var) {
            objS = c1eVar;
        }
        return objS == tb2Var ? objS : c1eVar;
    }

    @Override // defpackage.el3
    public final void S0(nk3 nk3Var) {
        if (this.n) {
            vx0.c0(u0(), null, null, new j0(this, nk3Var, null, 16), 3);
        }
    }

    @Override // defpackage.el3
    public final boolean a1() {
        return this.J.h.getValue() != null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d1(float r12, defpackage.p92 r13) {
        /*
            r11 = this;
            boolean r0 = r13 instanceof defpackage.zk
            if (r0 == 0) goto L13
            r0 = r13
            zk r0 = (defpackage.zk) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            zk r0 = new zk
            r0.<init>(r11, r13)
        L18:
            java.lang.Object r13 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 2
            if (r2 == 0) goto L37
            r11 = 1
            if (r2 == r11) goto L33
            if (r2 != r3) goto L2c
            oya r11 = r0.b
            defpackage.br7.v(r13)
            goto L72
        L2c:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            r11 = 0
            return r11
        L33:
            defpackage.br7.v(r13)
            return r13
        L37:
            defpackage.br7.v(r13)
            ul r13 = r11.J
            r13.getClass()
            oya r13 = new oya
            r13.<init>()
            r13.a = r12
            ul r2 = r11.J
            bl r4 = new bl
            r9 = 0
            r4.<init>(r11, r13, r12, r9)
            r0.b = r13
            r0.e = r3
            s78 r6 = defpackage.s78.Default
            z78 r7 = r2.b
            il r8 = new il
            r8.<init>(r2, r4, r9, r3)
            r7.getClass()
            nz r5 = new nz
            r10 = 10
            r5.<init>(r6, r7, r8, r9, r10)
            java.lang.Object r11 = defpackage.o7f.s(r5, r0)
            if (r11 != r1) goto L6c
            goto L6e
        L6c:
            c1e r11 = defpackage.c1e.a
        L6e:
            if (r11 != r1) goto L71
            return r1
        L71:
            r11 = r13
        L72:
            float r11 = r11.a
            java.lang.Float r12 = new java.lang.Float
            r12.<init>(r11)
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cl.d1(float, p92):java.lang.Object");
    }

    public final boolean e1() {
        return flb.v0(this).z == ip6.Rtl && this.K == hw8.Horizontal;
    }

    public final void f1(iic iicVar) {
        if (iicVar == null) {
            cud cudVar = gk.a;
            b5 b5Var = gk.b;
            m73 m73Var = flb.v0(this).y;
            this.N = m73Var;
            ul ulVar = this.J;
            iicVar = new iic(new m50(ulVar, b5Var, new ik(m73Var, 0), 8), vx0.b, cudVar);
        }
        this.M = iicVar;
    }

    @Override // defpackage.q28
    public final void y0() {
        f1(this.L);
    }

    @Override // defpackage.el3, defpackage.q28
    public final void z0() {
        H();
        if (this.n) {
            m73 m73Var = flb.v0(this).y;
            m73 m73Var2 = this.N;
            if (m73Var2 == null || !m73Var2.equals(m73Var)) {
                this.N = m73Var;
                f1(this.L);
            }
        }
    }

    @Override // defpackage.el3
    public final void R0(long j) {
    }
}
