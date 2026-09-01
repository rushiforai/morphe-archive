package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nka extends p4d implements b55 {
    public do4 b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ pka e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nka(pka pkaVar, n92 n92Var) {
        super(2, n92Var);
        this.e = pkaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        nka nkaVar = new nka(this.e, n92Var);
        nkaVar.d = obj;
        return nkaVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((nka) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x004a, code lost:
    
        if (r0.a(r2, r6) == r1) goto L15;
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
            if (r2 == 0) goto L25
            if (r2 == r4) goto L1b
            if (r2 != r3) goto L15
            defpackage.br7.v(r7)
            goto L4d
        L15:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r5
        L1b:
            do4 r0 = r6.b
            defpackage.br7.v(r7)
            bjb r7 = (defpackage.bjb) r7
            java.lang.Object r7 = r7.a
            goto L3b
        L25:
            defpackage.br7.v(r7)
            pka r7 = r6.e
            fe4 r2 = r7.d
            java.lang.String r7 = r7.b
            r6.d = r5
            r6.b = r0
            r6.c = r4
            java.lang.Object r7 = r2.a(r7, r6)
            if (r7 != r1) goto L3b
            goto L4c
        L3b:
            bjb r2 = new bjb
            r2.<init>(r7)
            r6.d = r5
            r6.b = r5
            r6.c = r3
            java.lang.Object r6 = r0.a(r2, r6)
            if (r6 != r1) goto L4d
        L4c:
            return r1
        L4d:
            c1e r6 = defpackage.c1e.a
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nka.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
