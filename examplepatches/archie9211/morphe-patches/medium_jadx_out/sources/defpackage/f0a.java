package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f0a implements m73 {
    public final /* synthetic */ m73 a;
    public boolean b;
    public boolean c;
    public final a98 d = new a98();

    public f0a(m73 m73Var) {
        this.a = m73Var;
    }

    @Override // defpackage.m73
    public final long J(float f) {
        return this.a.J(f);
    }

    @Override // defpackage.m73
    public final float N(int i) {
        return this.a.N(i);
    }

    @Override // defpackage.m73
    public final float Q(float f) {
        return this.a.Q(f);
    }

    @Override // defpackage.m73
    public final float U() {
        return this.a.U();
    }

    @Override // defpackage.m73
    public final float Z(float f) {
        return this.a.Z(f);
    }

    public final void a() {
        this.c = true;
        a98 a98Var = this.d;
        if (a98Var.d()) {
            a98Var.f(null);
        }
    }

    @Override // defpackage.m73
    public final float b() {
        return this.a.b();
    }

    public final void c() {
        this.b = true;
        a98 a98Var = this.d;
        if (a98Var.d()) {
            a98Var.f(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(defpackage.p92 r6) {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.d0a
            if (r0 == 0) goto L13
            r0 = r6
            d0a r0 = (defpackage.d0a) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            d0a r0 = new d0a
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
            goto L3c
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2e:
            defpackage.br7.v(r6)
            r0.d = r4
            a98 r6 = r5.d
            java.lang.Object r6 = r6.m(r0, r3)
            if (r6 != r1) goto L3c
            return r1
        L3c:
            r6 = 0
            r5.b = r6
            r5.c = r6
            c1e r5 = defpackage.c1e.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f0a.d(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(defpackage.p92 r7) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.e0a
            if (r0 == 0) goto L13
            r0 = r7
            e0a r0 = (defpackage.e0a) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            e0a r0 = new e0a
            r0.<init>(r6, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            a98 r4 = r6.d
            r5 = 1
            if (r2 == 0) goto L30
            if (r2 != r5) goto L2a
            defpackage.br7.v(r7)
            goto L44
        L2a:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r3
        L30:
            defpackage.br7.v(r7)
            boolean r7 = r6.b
            if (r7 != 0) goto L47
            boolean r7 = r6.c
            if (r7 != 0) goto L47
            r0.d = r5
            java.lang.Object r7 = r4.m(r0, r3)
            if (r7 != r1) goto L44
            return r1
        L44:
            r4.f(r3)
        L47:
            boolean r6 = r6.b
            java.lang.Boolean r6 = java.lang.Boolean.valueOf(r6)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f0a.e(p92):java.lang.Object");
    }

    @Override // defpackage.m73
    public final int i0(float f) {
        return this.a.i0(f);
    }

    @Override // defpackage.m73
    public final long m0(long j) {
        return this.a.m0(j);
    }

    @Override // defpackage.m73
    public final float p0(long j) {
        return this.a.p0(j);
    }

    @Override // defpackage.m73
    public final long r(long j) {
        return this.a.r(j);
    }

    @Override // defpackage.m73
    public final float z(long j) {
        return this.a.z(j);
    }
}
