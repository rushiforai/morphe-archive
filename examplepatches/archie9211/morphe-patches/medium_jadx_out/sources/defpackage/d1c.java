package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d1c {
    public static final double f = Math.random();
    public static final /* synthetic */ int g = 0;
    public final xj4 a;
    public final hk4 b;
    public final o1c c;
    public final h34 d;
    public final ib2 e;

    public d1c(xj4 xj4Var, hk4 hk4Var, o1c o1cVar, h34 h34Var, ib2 ib2Var) {
        xj4Var.getClass();
        hk4Var.getClass();
        o1cVar.getClass();
        h34Var.getClass();
        ib2Var.getClass();
        this.a = xj4Var;
        this.b = hk4Var;
        this.c = o1cVar;
        this.d = h34Var;
        this.e = ib2Var;
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x007b, code lost:
    
        if (r6.b(r0) == r1) goto L31;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.p92 r7) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.c1c
            if (r0 == 0) goto L13
            r0 = r7
            c1c r0 = (defpackage.c1c) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            c1c r0 = new c1c
            r0.<init>(r6, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 2
            r4 = 1
            java.lang.String r5 = "FirebaseSessions"
            o1c r6 = r6.c
            if (r2 == 0) goto L39
            if (r2 == r4) goto L35
            if (r2 != r3) goto L2e
            defpackage.br7.v(r7)
            goto L7e
        L2e:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L35:
            defpackage.br7.v(r7)
            goto L47
        L39:
            defpackage.br7.v(r7)
            wk4 r7 = defpackage.wk4.a
            r0.d = r4
            java.lang.Object r7 = r7.b(r0)
            if (r7 != r1) goto L47
            goto L7d
        L47:
            java.util.Map r7 = (java.util.Map) r7
            java.util.Collection r7 = r7.values()
            java.lang.Iterable r7 = (java.lang.Iterable) r7
            boolean r2 = r7 instanceof java.util.Collection
            if (r2 == 0) goto L5d
            r2 = r7
            java.util.Collection r2 = (java.util.Collection) r2
            boolean r2 = r2.isEmpty()
            if (r2 == 0) goto L5d
            goto Lb3
        L5d:
            java.util.Iterator r7 = r7.iterator()
        L61:
            boolean r2 = r7.hasNext()
            if (r2 == 0) goto Lb3
            java.lang.Object r2 = r7.next()
            gc2 r2 = (defpackage.gc2) r2
            ft2 r2 = r2.a
            boolean r2 = r2.a()
            if (r2 == 0) goto L61
            r0.d = r3
            java.lang.Object r7 = r6.b(r0)
            if (r7 != r1) goto L7e
        L7d:
            return r1
        L7e:
            g2c r7 = r6.a
            java.lang.Boolean r7 = r7.a()
            if (r7 == 0) goto L8b
        L86:
            boolean r4 = r7.booleanValue()
            goto L94
        L8b:
            g2c r7 = r6.b
            java.lang.Boolean r7 = r7.a()
            if (r7 == 0) goto L94
            goto L86
        L94:
            if (r4 != 0) goto L9e
            java.lang.String r6 = "Sessions SDK disabled through settings API. Events will not be sent."
            android.util.Log.d(r5, r6)
            java.lang.Boolean r6 = java.lang.Boolean.FALSE
            return r6
        L9e:
            double r0 = defpackage.d1c.f
            double r6 = r6.a()
            int r6 = (r0 > r6 ? 1 : (r0 == r6 ? 0 : -1))
            if (r6 > 0) goto Lab
            java.lang.Boolean r6 = java.lang.Boolean.TRUE
            return r6
        Lab:
            java.lang.String r6 = "Sessions SDK has dropped this session due to sampling."
            android.util.Log.d(r5, r6)
            java.lang.Boolean r6 = java.lang.Boolean.FALSE
            return r6
        Lb3:
            java.lang.String r6 = "Sessions SDK disabled through data collection. Events will not be sent."
            android.util.Log.d(r5, r6)
            java.lang.Boolean r6 = java.lang.Boolean.FALSE
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.d1c.a(p92):java.lang.Object");
    }
}
