package defpackage;

import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rec implements b56 {
    public final a98 a = new a98();
    public final olb b = new olb(5);
    public final u50 c = new u50(12, new at(2, 5, null));

    public rec(String str) {
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x005d, code lost:
    
        if (r8 == r1) goto L25;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r6v0, types: [rec] */
    /* JADX WARN: Type inference failed for: r6v1, types: [y88] */
    /* JADX WARN: Type inference failed for: r6v10 */
    /* JADX WARN: Type inference failed for: r6v4, types: [y88] */
    /* JADX WARN: Type inference failed for: r6v9 */
    @Override // defpackage.b56
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.x45 r7, defpackage.p92 r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.pec
            if (r0 == 0) goto L13
            r0 = r8
            pec r0 = (defpackage.pec) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            pec r0 = new pec
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L41
            if (r2 == r4) goto L37
            if (r2 != r3) goto L31
            java.lang.Object r6 = r0.b
            y88 r6 = (defpackage.y88) r6
            defpackage.br7.v(r8)     // Catch: java.lang.Throwable -> L2f
            goto L60
        L2f:
            r7 = move-exception
            goto L64
        L31:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r5
        L37:
            a98 r6 = r0.c
            java.lang.Object r7 = r0.b
            x45 r7 = (defpackage.x45) r7
            defpackage.br7.v(r8)
            goto L53
        L41:
            defpackage.br7.v(r8)
            r0.b = r7
            a98 r6 = r6.a
            r0.c = r6
            r0.f = r4
            java.lang.Object r8 = r6.m(r0, r5)
            if (r8 != r1) goto L53
            goto L5f
        L53:
            r0.b = r6     // Catch: java.lang.Throwable -> L2f
            r0.c = r5     // Catch: java.lang.Throwable -> L2f
            r0.f = r3     // Catch: java.lang.Throwable -> L2f
            java.lang.Object r8 = r7.invoke(r0)     // Catch: java.lang.Throwable -> L2f
            if (r8 != r1) goto L60
        L5f:
            return r1
        L60:
            r6.f(r5)
            return r8
        L64:
            r6.f(r5)
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rec.a(x45, p92):java.lang.Object");
    }

    @Override // defpackage.b56
    public final Object b(p92 p92Var) {
        return new Integer(((AtomicInteger) this.b.b).get());
    }

    @Override // defpackage.b56
    public final Object c(oz ozVar) {
        return new Integer(((AtomicInteger) this.b.b).incrementAndGet());
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.b56
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(defpackage.b55 r7, defpackage.p92 r8) throws java.lang.Throwable {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.qec
            if (r0 == 0) goto L13
            r0 = r8
            qec r0 = (defpackage.qec) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            qec r0 = new qec
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2e
            boolean r6 = r0.c
            a98 r7 = r0.b
            defpackage.br7.v(r8)     // Catch: java.lang.Throwable -> L2c
            goto L52
        L2c:
            r8 = move-exception
            goto L5d
        L2e:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r4
        L34:
            defpackage.br7.v(r8)
            a98 r6 = r6.a
            boolean r8 = r6.e(r4)
            java.lang.Boolean r2 = java.lang.Boolean.valueOf(r8)     // Catch: java.lang.Throwable -> L58
            r0.b = r6     // Catch: java.lang.Throwable -> L58
            r0.c = r8     // Catch: java.lang.Throwable -> L58
            r0.f = r3     // Catch: java.lang.Throwable -> L58
            java.lang.Object r7 = r7.invoke(r2, r0)     // Catch: java.lang.Throwable -> L58
            if (r7 != r1) goto L4e
            return r1
        L4e:
            r5 = r7
            r7 = r6
            r6 = r8
            r8 = r5
        L52:
            if (r6 == 0) goto L57
            r7.f(r4)
        L57:
            return r8
        L58:
            r7 = move-exception
            r5 = r7
            r7 = r6
            r6 = r8
            r8 = r5
        L5d:
            if (r6 == 0) goto L62
            r7.f(r4)
        L62:
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rec.d(b55, p92):java.lang.Object");
    }

    @Override // defpackage.b56
    public final bo4 e() {
        return this.c;
    }
}
