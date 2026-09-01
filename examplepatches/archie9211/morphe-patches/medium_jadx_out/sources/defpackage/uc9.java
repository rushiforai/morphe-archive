package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uc9 implements jrd, rsa {
    public final tz7 a;
    public final o42 b;
    public final boolean c;
    public final m70 d;
    public volatile boolean e;

    public uc9(tz7 tz7Var, o42 o42Var, boolean z) {
        tz7Var.getClass();
        this.a = tz7Var;
        this.b = o42Var;
        this.c = z;
        this.d = new m70();
    }

    @Override // defpackage.jrd
    public final Object a(ird irdVar, b55 b55Var, p4d p4dVar) {
        if (this.e) {
            qk7.z(21, "Connection is recycled");
            throw null;
        }
        a42 a42Var = (a42) p4dVar.getContext().o0(this.a);
        if (a42Var != null && a42Var.b == this) {
            return g(irdVar, b55Var, p4dVar);
        }
        qk7.z(21, "Attempted to use connection on a different coroutine");
        throw null;
    }

    @Override // defpackage.jrd
    public final Boolean b(n92 n92Var) {
        if (this.e) {
            qk7.z(21, "Connection is recycled");
            throw null;
        }
        a42 a42Var = (a42) n92Var.getContext().o0(this.a);
        if (a42Var != null && a42Var.b == this) {
            return Boolean.valueOf(!this.d.isEmpty() || this.b.a.k0());
        }
        qk7.z(21, "Attempted to use connection on a different coroutine");
        throw null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.mc9
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(java.lang.String r7, defpackage.x45 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.tc9
            if (r0 == 0) goto L13
            r0 = r9
            tc9 r0 = (defpackage.tc9) r0
            int r1 = r0.g
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.g = r1
            goto L18
        L13:
            tc9 r0 = new tc9
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.e
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.g
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L36
            if (r2 != r3) goto L30
            o42 r7 = r0.d
            x45 r8 = r0.c
            java.lang.String r0 = r0.b
            defpackage.br7.v(r9)
            r9 = r7
            r7 = r0
            goto L62
        L30:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r4
        L36:
            defpackage.br7.v(r9)
            boolean r9 = r6.e
            r2 = 21
            if (r9 != 0) goto L8b
            ib2 r9 = r0.getContext()
            tz7 r5 = r6.a
            gb2 r9 = r9.o0(r5)
            a42 r9 = (defpackage.a42) r9
            if (r9 == 0) goto L85
            uc9 r9 = r9.b
            if (r9 != r6) goto L85
            o42 r9 = r6.b
            r0.b = r7
            r0.c = r8
            r0.d = r9
            r0.g = r3
            java.lang.Object r0 = r9.m(r0, r4)
            if (r0 != r1) goto L62
            return r1
        L62:
            nc9 r0 = new nc9     // Catch: java.lang.Throwable -> L78
            o42 r1 = r6.b     // Catch: java.lang.Throwable -> L78
            gnb r7 = r1.B0(r7)     // Catch: java.lang.Throwable -> L78
            r0.<init>(r6, r7)     // Catch: java.lang.Throwable -> L78
            java.lang.Object r6 = r8.invoke(r0)     // Catch: java.lang.Throwable -> L7a
            defpackage.xz5.F(r0, r4)     // Catch: java.lang.Throwable -> L78
            r9.f(r4)
            return r6
        L78:
            r6 = move-exception
            goto L81
        L7a:
            r6 = move-exception
            throw r6     // Catch: java.lang.Throwable -> L7c
        L7c:
            r7 = move-exception
            defpackage.xz5.F(r0, r6)     // Catch: java.lang.Throwable -> L78
            throw r7     // Catch: java.lang.Throwable -> L78
        L81:
            r9.f(r4)
            throw r6
        L85:
            java.lang.String r6 = "Attempted to use connection on a different coroutine"
            defpackage.qk7.z(r2, r6)
            throw r4
        L8b:
            java.lang.String r6 = "Connection is recycled"
            defpackage.qk7.z(r2, r6)
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uc9.c(java.lang.String, x45, p92):java.lang.Object");
    }

    @Override // defpackage.rsa
    public final anb d() {
        return this.b;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(defpackage.ird r8, defpackage.p92 r9) {
        /*
            r7 = this;
            m70 r0 = r7.d
            java.lang.String r1 = "SAVEPOINT '"
            boolean r2 = r9 instanceof defpackage.qc9
            if (r2 == 0) goto L17
            r2 = r9
            qc9 r2 = (defpackage.qc9) r2
            int r3 = r2.f
            r4 = -2147483648(0xffffffff80000000, float:-0.0)
            r5 = r3 & r4
            if (r5 == 0) goto L17
            int r3 = r3 - r4
            r2.f = r3
            goto L1c
        L17:
            qc9 r2 = new qc9
            r2.<init>(r7, r9)
        L1c:
            java.lang.Object r9 = r2.d
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            int r4 = r2.f
            r5 = 1
            o42 r7 = r7.b
            r6 = 0
            if (r4 == 0) goto L3a
            if (r4 != r5) goto L34
            o42 r8 = r2.c
            ird r2 = r2.b
            defpackage.br7.v(r9)
            r9 = r8
            r8 = r2
            goto L4b
        L34:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r6
        L3a:
            defpackage.br7.v(r9)
            r2.b = r8
            r2.c = r7
            r2.f = r5
            java.lang.Object r9 = r7.m(r2, r6)
            if (r9 != r3) goto L4a
            return r3
        L4a:
            r9 = r7
        L4b:
            int r2 = r0.c     // Catch: java.lang.Throwable -> L69
            boolean r3 = r0.isEmpty()     // Catch: java.lang.Throwable -> L69
            if (r3 == 0) goto L7d
            int[] r1 = defpackage.pc9.a     // Catch: java.lang.Throwable -> L69
            int r8 = r8.ordinal()     // Catch: java.lang.Throwable -> L69
            r8 = r1[r8]     // Catch: java.lang.Throwable -> L69
            if (r8 == r5) goto L77
            r1 = 2
            if (r8 == r1) goto L71
            r1 = 3
            if (r8 != r1) goto L6b
            java.lang.String r8 = "BEGIN EXCLUSIVE TRANSACTION"
            defpackage.qk7.q(r7, r8)     // Catch: java.lang.Throwable -> L69
            goto L91
        L69:
            r7 = move-exception
            goto L9f
        L6b:
            kotlin.NoWhenBranchMatchedException r7 = new kotlin.NoWhenBranchMatchedException     // Catch: java.lang.Throwable -> L69
            r7.<init>()     // Catch: java.lang.Throwable -> L69
            throw r7     // Catch: java.lang.Throwable -> L69
        L71:
            java.lang.String r8 = "BEGIN IMMEDIATE TRANSACTION"
            defpackage.qk7.q(r7, r8)     // Catch: java.lang.Throwable -> L69
            goto L91
        L77:
            java.lang.String r8 = "BEGIN DEFERRED TRANSACTION"
            defpackage.qk7.q(r7, r8)     // Catch: java.lang.Throwable -> L69
            goto L91
        L7d:
            java.lang.StringBuilder r8 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L69
            r8.<init>(r1)     // Catch: java.lang.Throwable -> L69
            r8.append(r2)     // Catch: java.lang.Throwable -> L69
            r1 = 39
            r8.append(r1)     // Catch: java.lang.Throwable -> L69
            java.lang.String r8 = r8.toString()     // Catch: java.lang.Throwable -> L69
            defpackage.qk7.q(r7, r8)     // Catch: java.lang.Throwable -> L69
        L91:
            oc9 r7 = new oc9     // Catch: java.lang.Throwable -> L69
            r7.<init>(r2)     // Catch: java.lang.Throwable -> L69
            r0.addLast(r7)     // Catch: java.lang.Throwable -> L69
            c1e r7 = defpackage.c1e.a     // Catch: java.lang.Throwable -> L69
            r9.f(r6)
            return r7
        L9f:
            r9.f(r6)
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uc9.e(ird, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(boolean r9, defpackage.p92 r10) {
        /*
            r8 = this;
            m70 r0 = r8.d
            java.lang.String r1 = "ROLLBACK TRANSACTION TO SAVEPOINT '"
            java.lang.String r2 = "RELEASE SAVEPOINT '"
            boolean r3 = r10 instanceof defpackage.rc9
            if (r3 == 0) goto L19
            r3 = r10
            rc9 r3 = (defpackage.rc9) r3
            int r4 = r3.f
            r5 = -2147483648(0xffffffff80000000, float:-0.0)
            r6 = r4 & r5
            if (r6 == 0) goto L19
            int r4 = r4 - r5
            r3.f = r4
            goto L1e
        L19:
            rc9 r3 = new rc9
            r3.<init>(r8, r10)
        L1e:
            java.lang.Object r10 = r3.d
            tb2 r4 = defpackage.tb2.COROUTINE_SUSPENDED
            int r5 = r3.f
            r6 = 1
            o42 r8 = r8.b
            r7 = 0
            if (r5 == 0) goto L3a
            if (r5 != r6) goto L34
            boolean r9 = r3.b
            o42 r3 = r3.c
            defpackage.br7.v(r10)
            goto L4b
        L34:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r7
        L3a:
            defpackage.br7.v(r10)
            r3.c = r8
            r3.b = r9
            r3.f = r6
            java.lang.Object r10 = r8.m(r3, r7)
            if (r10 != r4) goto L4a
            return r4
        L4a:
            r3 = r8
        L4b:
            boolean r10 = r0.isEmpty()     // Catch: java.lang.Throwable -> L6a
            if (r10 != 0) goto La7
            java.lang.Object r10 = defpackage.bu1.U0(r0)     // Catch: java.lang.Throwable -> L6a
            oc9 r10 = (defpackage.oc9) r10     // Catch: java.lang.Throwable -> L6a
            r4 = 39
            if (r9 == 0) goto L81
            r10.getClass()     // Catch: java.lang.Throwable -> L6a
            boolean r9 = r0.isEmpty()     // Catch: java.lang.Throwable -> L6a
            if (r9 == 0) goto L6c
            java.lang.String r9 = "END TRANSACTION"
            defpackage.qk7.q(r8, r9)     // Catch: java.lang.Throwable -> L6a
            goto La1
        L6a:
            r8 = move-exception
            goto Laf
        L6c:
            java.lang.StringBuilder r9 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L6a
            r9.<init>(r2)     // Catch: java.lang.Throwable -> L6a
            int r10 = r10.a     // Catch: java.lang.Throwable -> L6a
            r9.append(r10)     // Catch: java.lang.Throwable -> L6a
            r9.append(r4)     // Catch: java.lang.Throwable -> L6a
            java.lang.String r9 = r9.toString()     // Catch: java.lang.Throwable -> L6a
            defpackage.qk7.q(r8, r9)     // Catch: java.lang.Throwable -> L6a
            goto La1
        L81:
            boolean r9 = r0.isEmpty()     // Catch: java.lang.Throwable -> L6a
            if (r9 == 0) goto L8d
            java.lang.String r9 = "ROLLBACK TRANSACTION"
            defpackage.qk7.q(r8, r9)     // Catch: java.lang.Throwable -> L6a
            goto La1
        L8d:
            java.lang.StringBuilder r9 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L6a
            r9.<init>(r1)     // Catch: java.lang.Throwable -> L6a
            int r10 = r10.a     // Catch: java.lang.Throwable -> L6a
            r9.append(r10)     // Catch: java.lang.Throwable -> L6a
            r9.append(r4)     // Catch: java.lang.Throwable -> L6a
            java.lang.String r9 = r9.toString()     // Catch: java.lang.Throwable -> L6a
            defpackage.qk7.q(r8, r9)     // Catch: java.lang.Throwable -> L6a
        La1:
            c1e r8 = defpackage.c1e.a     // Catch: java.lang.Throwable -> L6a
            r3.f(r7)
            return r8
        La7:
            java.lang.IllegalStateException r8 = new java.lang.IllegalStateException     // Catch: java.lang.Throwable -> L6a
            java.lang.String r9 = "Not in a transaction"
            r8.<init>(r9)     // Catch: java.lang.Throwable -> L6a
            throw r8     // Catch: java.lang.Throwable -> L6a
        Laf:
            r3.f(r7)
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uc9.f(boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:42:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x008f A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(defpackage.ird r11, defpackage.b55 r12, defpackage.p92 r13) throws java.lang.Throwable {
        /*
            r10 = this;
            boolean r0 = r13 instanceof defpackage.sc9
            if (r0 == 0) goto L13
            r0 = r13
            sc9 r0 = (defpackage.sc9) r0
            int r1 = r0.g
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.g = r1
            goto L18
        L13:
            sc9 r0 = new sc9
            r0.<init>(r10, r13)
        L18:
            java.lang.Object r13 = r0.e
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.g
            r3 = 0
            r4 = 0
            r5 = 5
            r6 = 3
            r7 = 2
            r8 = 1
            if (r2 == 0) goto L5c
            if (r2 == r8) goto L53
            if (r2 == r7) goto L4b
            if (r2 == r6) goto L45
            r10 = 4
            if (r2 == r10) goto L45
            if (r2 == r5) goto L37
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            return r3
        L37:
            java.lang.Throwable r10 = r0.c
            java.lang.Object r11 = r0.b
            java.lang.Throwable r11 = (java.lang.Throwable) r11
            defpackage.br7.v(r13)     // Catch: android.database.SQLException -> L42
            goto Laa
        L42:
            r12 = move-exception
            goto La5
        L45:
            java.lang.Object r10 = r0.b
            defpackage.br7.v(r13)
            return r10
        L4b:
            int r11 = r0.d
            defpackage.br7.v(r13)     // Catch: java.lang.Throwable -> L51
            goto L81
        L51:
            r11 = move-exception
            goto L90
        L53:
            java.lang.Object r11 = r0.b
            r12 = r11
            b55 r12 = (defpackage.b55) r12
            defpackage.br7.v(r13)
            goto L6e
        L5c:
            defpackage.br7.v(r13)
            if (r11 != 0) goto L63
            ird r11 = defpackage.ird.DEFERRED
        L63:
            r0.b = r12
            r0.g = r8
            java.lang.Object r11 = r10.e(r11, r0)
            if (r11 != r1) goto L6e
            goto L9e
        L6e:
            w49 r11 = new w49     // Catch: java.lang.Throwable -> L51
            r11.<init>(r8, r10)     // Catch: java.lang.Throwable -> L51
            r0.b = r3     // Catch: java.lang.Throwable -> L51
            r0.d = r8     // Catch: java.lang.Throwable -> L51
            r0.g = r7     // Catch: java.lang.Throwable -> L51
            java.lang.Object r13 = r12.invoke(r11, r0)     // Catch: java.lang.Throwable -> L51
            if (r13 != r1) goto L80
            goto L9e
        L80:
            r11 = r8
        L81:
            if (r11 == 0) goto L84
            r4 = r8
        L84:
            r0.b = r13
            r0.g = r6
            java.lang.Object r10 = r10.f(r4, r0)
            if (r10 != r1) goto L8f
            goto L9e
        L8f:
            return r13
        L90:
            throw r11     // Catch: java.lang.Throwable -> L91
        L91:
            r12 = move-exception
            r0.b = r11     // Catch: android.database.SQLException -> La1
            r0.c = r12     // Catch: android.database.SQLException -> La1
            r0.g = r5     // Catch: android.database.SQLException -> La1
            java.lang.Object r10 = r10.f(r4, r0)     // Catch: android.database.SQLException -> La1
            if (r10 != r1) goto L9f
        L9e:
            return r1
        L9f:
            r10 = r12
            goto Laa
        La1:
            r10 = move-exception
            r9 = r12
            r12 = r10
            r10 = r9
        La5:
            if (r11 == 0) goto Lab
            defpackage.kyd.D(r11, r12)
        Laa:
            throw r10
        Lab:
            throw r12
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uc9.g(ird, b55, p92):java.lang.Object");
    }
}
