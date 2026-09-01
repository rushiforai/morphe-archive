package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nhc {
    public final a98 a = new a98();
    public final k49 b = qo7.u(null);

    public static Object c(nhc nhcVar, String str, String str2, bhc bhcVar, n92 n92Var, int i) {
        if ((i & 2) != 0) {
            str2 = null;
        }
        boolean z = (i & 4) == 0;
        if ((i & 8) != 0) {
            bhcVar = str2 == null ? bhc.Short : bhc.Indefinite;
        }
        nhcVar.getClass();
        return nhcVar.b(new khc(str, str2, z, bhcVar), n92Var);
    }

    public final ihc a() {
        return (ihc) this.b.getValue();
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x006f, code lost:
    
        if (r9 == r1) goto L25;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r7v0, types: [nhc] */
    /* JADX WARN: Type inference failed for: r7v1, types: [y88] */
    /* JADX WARN: Type inference failed for: r7v4, types: [y88] */
    /* JADX WARN: Type inference failed for: r7v8 */
    /* JADX WARN: Type inference failed for: r7v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.dic r8, defpackage.n92 r9) {
        /*
            r7 = this;
            boolean r0 = r9 instanceof defpackage.mhc
            if (r0 == 0) goto L13
            r0 = r9
            mhc r0 = (defpackage.mhc) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            mhc r0 = new mhc
            r0.<init>(r7, r9)
        L18:
            java.lang.Object r9 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            k49 r3 = r7.b
            r4 = 2
            r5 = 1
            r6 = 0
            if (r2 == 0) goto L3f
            if (r2 == r5) goto L37
            if (r2 != r4) goto L31
            y88 r7 = r0.c
            defpackage.br7.v(r9)     // Catch: java.lang.Throwable -> L2f
            goto L72
        L2f:
            r8 = move-exception
            goto L7b
        L31:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r6
        L37:
            y88 r7 = r0.c
            dic r8 = r0.b
            defpackage.br7.v(r9)
            goto L51
        L3f:
            defpackage.br7.v(r9)
            r0.b = r8
            a98 r7 = r7.a
            r0.c = r7
            r0.f = r5
            java.lang.Object r9 = r7.m(r0, r6)
            if (r9 != r1) goto L51
            goto L71
        L51:
            r0.b = r8     // Catch: java.lang.Throwable -> L2f
            r0.c = r7     // Catch: java.lang.Throwable -> L2f
            r0.f = r4     // Catch: java.lang.Throwable -> L2f
            x51 r9 = new x51     // Catch: java.lang.Throwable -> L2f
            n92 r0 = defpackage.pwd.Q(r0)     // Catch: java.lang.Throwable -> L2f
            r9.<init>(r5, r0)     // Catch: java.lang.Throwable -> L2f
            r9.s()     // Catch: java.lang.Throwable -> L2f
            ihc r0 = new ihc     // Catch: java.lang.Throwable -> L2f
            r0.<init>(r8, r9)     // Catch: java.lang.Throwable -> L2f
            r3.setValue(r0)     // Catch: java.lang.Throwable -> L2f
            java.lang.Object r9 = r9.q()     // Catch: java.lang.Throwable -> L2f
            if (r9 != r1) goto L72
        L71:
            return r1
        L72:
            r3.setValue(r6)     // Catch: java.lang.Throwable -> L79
            r7.f(r6)
            return r9
        L79:
            r8 = move-exception
            goto L7f
        L7b:
            r3.setValue(r6)     // Catch: java.lang.Throwable -> L79
            throw r8     // Catch: java.lang.Throwable -> L79
        L7f:
            r7.f(r6)
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nhc.b(dic, n92):java.lang.Object");
    }
}
