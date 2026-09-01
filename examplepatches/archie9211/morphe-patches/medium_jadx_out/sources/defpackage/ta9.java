package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ta9 extends p4d implements b55 {
    public y88 b;
    public va9 c;
    public int d;
    public final /* synthetic */ va9 e;
    public final /* synthetic */ b55 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ta9(va9 va9Var, b55 b55Var, n92 n92Var) {
        super(2, n92Var);
        this.e = va9Var;
        this.f = b55Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new ta9(this.e, this.f, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((ta9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x0087 A[RETURN] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r10) throws java.lang.Throwable {
        /*
            r9 = this;
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r9.d
            r2 = 3
            r3 = 2
            r4 = 1
            r5 = 0
            if (r1 == 0) goto L2c
            if (r1 == r4) goto L23
            if (r1 == r3) goto L1a
            if (r1 != r2) goto L14
            defpackage.br7.v(r10)
            return r10
        L14:
            java.lang.String r9 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r9)
            return r5
        L1a:
            y88 r1 = r9.b
            defpackage.br7.v(r10)     // Catch: java.lang.Throwable -> L20
            goto L67
        L20:
            r9 = move-exception
            goto L88
        L23:
            va9 r1 = r9.c
            y88 r4 = r9.b
            defpackage.br7.v(r10)
            r10 = r4
            goto L40
        L2c:
            defpackage.br7.v(r10)
            va9 r1 = r9.e
            a98 r10 = r1.e
            r9.b = r10
            r9.c = r1
            r9.d = r4
            java.lang.Object r4 = r10.m(r9, r5)
            if (r4 != r0) goto L40
            goto L86
        L40:
            android.view.textclassifier.TextClassifier r4 = r1.f     // Catch: java.lang.Throwable -> L4b
            if (r4 == 0) goto L4e
            boolean r6 = r4.isDestroyed()     // Catch: java.lang.Throwable -> L4b
            if (r6 == 0) goto L6c
            goto L4e
        L4b:
            r9 = move-exception
            r1 = r10
            goto L88
        L4e:
            lo5 r4 = new lo5     // Catch: java.lang.Throwable -> L4b
            r6 = 15
            r4.<init>(r1, r5, r6)     // Catch: java.lang.Throwable -> L4b
            r9.b = r10     // Catch: java.lang.Throwable -> L4b
            r9.c = r5     // Catch: java.lang.Throwable -> L4b
            r9.d = r3     // Catch: java.lang.Throwable -> L4b
            r6 = 300(0x12c, double:1.48E-321)
            java.lang.Object r1 = defpackage.wo7.A(r6, r4, r9)     // Catch: java.lang.Throwable -> L4b
            if (r1 != r0) goto L64
            goto L86
        L64:
            r8 = r1
            r1 = r10
            r10 = r8
        L67:
            android.view.textclassifier.TextClassifier r4 = defpackage.lg8.c(r10)     // Catch: java.lang.Throwable -> L20
            r10 = r1
        L6c:
            r10.f(r5)
            kd7 r10 = new kd7
            b55 r1 = r9.f
            r3 = 16
            r10.<init>(r4, r1, r5, r3)
            r9.b = r5
            r9.c = r5
            r9.d = r2
            r1 = 200(0xc8, double:9.9E-322)
            java.lang.Object r9 = defpackage.wo7.A(r1, r10, r9)
            if (r9 != r0) goto L87
        L86:
            return r0
        L87:
            return r9
        L88:
            r1.f(r5)
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ta9.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
