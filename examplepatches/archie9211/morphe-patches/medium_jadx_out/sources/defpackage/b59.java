package defpackage;

import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b59 implements jrd, rsa {
    public final b55 a;
    public final anb b;
    public final AtomicInteger c;
    public ird d;

    public b59(b55 b55Var, anb anbVar) {
        anbVar.getClass();
        this.a = b55Var;
        this.b = anbVar;
        this.c = new AtomicInteger(0);
    }

    @Override // defpackage.jrd
    public final Object a(ird irdVar, b55 b55Var, p4d p4dVar) {
        return this.a.invoke(new ml(this, irdVar, b55Var, null, 3), p4dVar);
    }

    @Override // defpackage.jrd
    public final Boolean b(n92 n92Var) {
        return Boolean.valueOf(this.d != null || this.b.k0());
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
            boolean r0 = r9 instanceof defpackage.z49
            if (r0 == 0) goto L13
            r0 = r9
            z49 r0 = (defpackage.z49) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            z49 r0 = new z49
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L39
            if (r2 == r4) goto L31
            if (r2 != r3) goto L2b
            defpackage.br7.v(r9)
            return r9
        L2b:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r5
        L31:
            x45 r8 = r0.c
            java.lang.String r7 = r0.b
            defpackage.br7.v(r9)
            goto L49
        L39:
            defpackage.br7.v(r9)
            r0.b = r7
            r0.c = r8
            r0.f = r4
            java.lang.Boolean r9 = r6.b(r0)
            if (r9 != r1) goto L49
            goto L64
        L49:
            java.lang.Boolean r9 = (java.lang.Boolean) r9
            boolean r9 = r9.booleanValue()
            if (r9 == 0) goto L66
            a59 r9 = new a59
            r9.<init>(r6, r7, r8, r5)
            r0.b = r5
            r0.c = r5
            r0.f = r3
            b55 r6 = r6.a
            java.lang.Object r6 = r6.invoke(r9, r0)
            if (r6 != r1) goto L65
        L64:
            return r1
        L65:
            return r6
        L66:
            anb r6 = r6.b
            gnb r6 = r6.B0(r7)
            java.lang.Object r7 = r8.invoke(r6)     // Catch: java.lang.Throwable -> L74
            defpackage.xz5.F(r6, r5)
            return r7
        L74:
            r7 = move-exception
            throw r7     // Catch: java.lang.Throwable -> L76
        L76:
            r8 = move-exception
            defpackage.xz5.F(r6, r7)
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b59.c(java.lang.String, x45, p92):java.lang.Object");
    }

    @Override // defpackage.rsa
    public final anb d() {
        return this.b;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(defpackage.ird r9, defpackage.b55 r10, defpackage.p92 r11) {
        /*
            r8 = this;
            boolean r0 = r11 instanceof defpackage.y49
            if (r0 == 0) goto L13
            r0 = r11
            y49 r0 = (defpackage.y49) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            y49 r0 = new y49
            r0.<init>(r8, r11)
        L18:
            java.lang.Object r11 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            java.lang.String r3 = "ROLLBACK TRANSACTION"
            r4 = 0
            java.util.concurrent.atomic.AtomicInteger r5 = r8.c
            r6 = 1
            anb r7 = r8.b
            if (r2 == 0) goto L38
            if (r2 != r6) goto L32
            int r6 = r0.b
            defpackage.br7.v(r11)     // Catch: java.lang.Throwable -> L30
            goto L79
        L30:
            r9 = move-exception
            goto L8d
        L32:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r4
        L38:
            defpackage.br7.v(r11)
            int[] r11 = defpackage.x49.a
            int r2 = r9.ordinal()
            r11 = r11[r2]
            if (r11 == r6) goto L5b
            r2 = 2
            if (r11 == r2) goto L55
            r2 = 3
            if (r11 != r2) goto L51
            java.lang.String r11 = "BEGIN EXCLUSIVE TRANSACTION"
            defpackage.qk7.q(r7, r11)
            goto L60
        L51:
            defpackage.ygf.a()
            return r4
        L55:
            java.lang.String r11 = "BEGIN IMMEDIATE TRANSACTION"
            defpackage.qk7.q(r7, r11)
            goto L60
        L5b:
            java.lang.String r11 = "BEGIN DEFERRED TRANSACTION"
            defpackage.qk7.q(r7, r11)
        L60:
            int r11 = r5.incrementAndGet()
            if (r11 <= 0) goto L68
            r8.d = r9
        L68:
            w49 r9 = new w49     // Catch: java.lang.Throwable -> L30
            r11 = 0
            r9.<init>(r11, r8)     // Catch: java.lang.Throwable -> L30
            r0.b = r6     // Catch: java.lang.Throwable -> L30
            r0.e = r6     // Catch: java.lang.Throwable -> L30
            java.lang.Object r11 = r10.invoke(r9, r0)     // Catch: java.lang.Throwable -> L30
            if (r11 != r1) goto L79
            return r1
        L79:
            int r9 = r5.decrementAndGet()
            if (r9 != 0) goto L81
            r8.d = r4
        L81:
            if (r6 == 0) goto L89
            java.lang.String r8 = "END TRANSACTION"
            defpackage.qk7.q(r7, r8)
            return r11
        L89:
            defpackage.qk7.q(r7, r3)
            return r11
        L8d:
            throw r9     // Catch: java.lang.Throwable -> L8e
        L8e:
            r10 = move-exception
            int r11 = r5.decrementAndGet()     // Catch: android.database.SQLException -> L98
            if (r11 != 0) goto L9a
            r8.d = r4     // Catch: android.database.SQLException -> L98
            goto L9a
        L98:
            r8 = move-exception
            goto L9e
        L9a:
            defpackage.qk7.q(r7, r3)     // Catch: android.database.SQLException -> L98
            goto La1
        L9e:
            defpackage.kyd.D(r9, r8)
        La1:
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b59.e(ird, b55, p92):java.lang.Object");
    }
}
