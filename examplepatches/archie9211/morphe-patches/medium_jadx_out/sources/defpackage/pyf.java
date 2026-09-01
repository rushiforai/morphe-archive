package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pyf extends p4d implements x45 {
    public fdg b;
    public int c;
    public final /* synthetic */ fdg d;
    public final /* synthetic */ nig e;
    public final /* synthetic */ String f;
    public final /* synthetic */ ms g;
    public final /* synthetic */ String h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pyf(fdg fdgVar, nig nigVar, String str, ms msVar, String str2, n92 n92Var) {
        super(1, n92Var);
        this.d = fdgVar;
        this.e = nigVar;
        this.f = str;
        this.g = msVar;
        this.h = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        return new pyf(this.d, this.e, this.f, this.g, this.h, n92Var);
    }

    @Override // defpackage.x45
    public final /* bridge */ /* synthetic */ Object invoke(Object obj) {
        return ((pyf) create((n92) obj)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x003f, code lost:
    
        if (((defpackage.ycg) r9).a.invoke(r1, r8) == r0) goto L16;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r9) throws java.lang.Exception {
        /*
            r8 = this;
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r8.c
            r6 = 0
            r2 = 1
            if (r1 == 0) goto L14
            if (r1 == r2) goto Le
            defpackage.br7.v(r9)     // Catch: java.lang.Exception -> L45
            goto L42
        Le:
            fdg r1 = r8.b
            defpackage.br7.v(r9)     // Catch: java.lang.Exception -> L45
            goto L32
        L14:
            defpackage.br7.v(r9)
            fdg r1 = r8.d     // Catch: java.lang.Exception -> L45
            nig r5 = r8.e     // Catch: java.lang.Exception -> L45
            ms r3 = r8.g     // Catch: java.lang.Exception -> L45
            java.lang.String r4 = r8.h     // Catch: java.lang.Exception -> L45
            r8.b = r1     // Catch: java.lang.Exception -> L45
            r8.c = r2     // Catch: java.lang.Exception -> L45
            kyc r2 = new kyc     // Catch: java.lang.Exception -> L45
            r7 = 16
            r2.<init>(r3, r4, r5, r6, r7)     // Catch: java.lang.Exception -> L45
            ycg r9 = new ycg     // Catch: java.lang.Exception -> L45
            r9.<init>(r2)     // Catch: java.lang.Exception -> L45
            if (r9 != r0) goto L32
            goto L41
        L32:
            ycg r9 = (defpackage.ycg) r9     // Catch: java.lang.Exception -> L45
            r8.b = r6     // Catch: java.lang.Exception -> L45
            r2 = 2
            r8.c = r2     // Catch: java.lang.Exception -> L45
            b55 r9 = r9.a     // Catch: java.lang.Exception -> L45
            java.lang.Object r8 = r9.invoke(r1, r8)     // Catch: java.lang.Exception -> L45
            if (r8 != r0) goto L42
        L41:
            return r0
        L42:
            c1e r8 = defpackage.c1e.a
            return r8
        L45:
            r0 = move-exception
            r8 = r0
            r8.getMessage()
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pyf.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
