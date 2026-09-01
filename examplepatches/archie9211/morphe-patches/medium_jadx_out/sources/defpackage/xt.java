package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xt extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ long d;
    public final /* synthetic */ Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xt(long j, u4d u4dVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 2;
        this.d = j;
        this.e = u4dVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.e;
        switch (i) {
            case 0:
                return new xt((zt) obj2, this.d, n92Var, 0);
            case 1:
                return new xt((ou) obj2, this.d, n92Var, 1);
            default:
                return new xt(this.d, (u4d) obj2, n92Var);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((xt) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x003d, code lost:
    
        if (defpackage.gsa.X(8, r13) == r0) goto L16;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r14) {
        /*
            r13 = this;
            int r0 = r13.b
            c1e r6 = defpackage.c1e.a
            java.lang.Object r1 = r13.e
            r2 = 0
            java.lang.String r3 = "call to 'resume' before 'invoke' with coroutine"
            r5 = 1
            long r7 = r13.d
            switch(r0) {
                case 0: goto L81;
                case 1: goto L55;
                default: goto Lf;
            }
        Lf:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r9 = r13.c
            r10 = 8
            r12 = 2
            if (r9 == 0) goto L29
            if (r9 == r5) goto L25
            if (r9 != r12) goto L20
            defpackage.br7.v(r14)
            goto L41
        L20:
            defpackage.ygf.f(r3)
            r6 = r2
            goto L54
        L25:
            defpackage.br7.v(r14)
            goto L37
        L29:
            defpackage.br7.v(r14)
            long r2 = r7 - r10
            r13.c = r5
            java.lang.Object r2 = defpackage.gsa.X(r2, r13)
            if (r2 != r0) goto L37
            goto L3f
        L37:
            r13.c = r12
            java.lang.Object r2 = defpackage.gsa.X(r10, r13)
            if (r2 != r0) goto L41
        L3f:
            r6 = r0
            goto L54
        L41:
            u4d r1 = (defpackage.u4d) r1
            x51 r0 = r1.c
            if (r0 == 0) goto L54
            androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException r1 = new androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException
            r1.<init>(r7)
            ajb r2 = new ajb
            r2.<init>(r1)
            r0.resumeWith(r2)
        L54:
            return r6
        L55:
            tb2 r9 = defpackage.tb2.COROUTINE_SUSPENDED
            int r0 = r13.c
            if (r0 == 0) goto L66
            if (r0 != r5) goto L61
            defpackage.br7.v(r14)
            goto L80
        L61:
            defpackage.ygf.f(r3)
            r6 = r2
            goto L80
        L66:
            defpackage.br7.v(r14)
            r0 = r1
            ou r0 = (defpackage.ou) r0
            ip8 r1 = new ip8
            r1.<init>(r7)
            wlc r2 = defpackage.jxb.d
            r13.c = r5
            r3 = 0
            r5 = 12
            r4 = r13
            java.lang.Object r0 = defpackage.ou.a(r0, r1, r2, r3, r4, r5)
            if (r0 != r9) goto L80
            r6 = r9
        L80:
            return r6
        L81:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r9 = r13.c
            if (r9 == 0) goto L92
            if (r9 != r5) goto L8d
            defpackage.br7.v(r14)
            goto La2
        L8d:
            defpackage.ygf.f(r3)
            r6 = r2
            goto La2
        L92:
            defpackage.br7.v(r14)
            zt r1 = (defpackage.zt) r1
            cd8 r1 = r1.a
            r13.c = r5
            java.lang.Object r1 = r1.b(r7, r13)
            if (r1 != r0) goto La2
            r6 = r0
        La2:
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xt.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xt(Object obj, long j, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
        this.d = j;
    }
}
