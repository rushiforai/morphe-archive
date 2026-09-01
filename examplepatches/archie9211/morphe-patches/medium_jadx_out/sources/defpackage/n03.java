package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n03 extends p4d implements b55 {
    public do4 b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ z03 e;
    public final /* synthetic */ String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n03(z03 z03Var, String str, n92 n92Var) {
        super(2, n92Var);
        this.e = z03Var;
        this.f = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        n03 n03Var = new n03(this.e, this.f, n92Var);
        n03Var.d = obj;
        return n03Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((n03) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0041, code lost:
    
        if (r0.a(r7, r6) == r1) goto L15;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r7) {
        /*
            r6 = this;
            java.lang.Object r0 = r6.d
            do4 r0 = (defpackage.do4) r0
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r6.c
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L21
            if (r2 == r4) goto L1b
            if (r2 != r3) goto L15
            defpackage.br7.v(r7)
            goto L44
        L15:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r5
        L1b:
            do4 r0 = r6.b
            defpackage.br7.v(r7)
            goto L37
        L21:
            defpackage.br7.v(r7)
            r6.d = r5
            r6.b = r0
            r6.c = r4
            hl0 r7 = defpackage.as7.f
            z03 r2 = r6.e
            java.lang.String r4 = r6.f
            java.lang.Object r7 = r2.b(r4, r7, r6)
            if (r7 != r1) goto L37
            goto L43
        L37:
            r6.d = r5
            r6.b = r5
            r6.c = r3
            java.lang.Object r6 = r0.a(r7, r6)
            if (r6 != r1) goto L44
        L43:
            return r1
        L44:
            c1e r6 = defpackage.c1e.a
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n03.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
