package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o0 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ m68 d;
    public final /* synthetic */ h0a e;
    public final /* synthetic */ r0 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ o0(m68 m68Var, h0a h0aVar, r0 r0Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = m68Var;
        this.e = h0aVar;
        this.f = r0Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new o0(this.d, this.e, this.f, n92Var, 0);
            default:
                return new o0(this.d, this.e, this.f, n92Var, 1);
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
        return ((o0) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x003d, code lost:
    
        if (r3.b(r8, r10) == r0) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x006f, code lost:
    
        if (r3.b(r8, r10) == r0) goto L31;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r11) {
        /*
            r10 = this;
            int r0 = r10.b
            c1e r1 = defpackage.c1e.a
            r0 r2 = r10.f
            m68 r3 = r10.d
            r4 = 0
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            r6 = 1
            r7 = 2
            h0a r8 = r10.e
            switch(r0) {
                case 0: goto L44;
                default: goto L12;
            }
        L12:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r9 = r10.c
            if (r9 == 0) goto L29
            if (r9 == r6) goto L25
            if (r9 != r7) goto L20
            defpackage.br7.v(r11)
            goto L41
        L20:
            defpackage.ygf.f(r5)
            r1 = r4
            goto L43
        L25:
            defpackage.br7.v(r11)
            goto L37
        L29:
            defpackage.br7.v(r11)
            long r4 = defpackage.vo1.a
            r10.c = r6
            java.lang.Object r11 = defpackage.gsa.X(r4, r10)
            if (r11 != r0) goto L37
            goto L3f
        L37:
            r10.c = r7
            java.lang.Object r10 = r3.b(r8, r10)
            if (r10 != r0) goto L41
        L3f:
            r1 = r0
            goto L43
        L41:
            r2.C = r8
        L43:
            return r1
        L44:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r9 = r10.c
            if (r9 == 0) goto L5b
            if (r9 == r6) goto L57
            if (r9 != r7) goto L52
            defpackage.br7.v(r11)
            goto L73
        L52:
            defpackage.ygf.f(r5)
            r1 = r4
            goto L75
        L57:
            defpackage.br7.v(r11)
            goto L69
        L5b:
            defpackage.br7.v(r11)
            long r4 = defpackage.vo1.a
            r10.c = r6
            java.lang.Object r11 = defpackage.gsa.X(r4, r10)
            if (r11 != r0) goto L69
            goto L71
        L69:
            r10.c = r7
            java.lang.Object r10 = r3.b(r8, r10)
            if (r10 != r0) goto L73
        L71:
            r1 = r0
            goto L75
        L73:
            r2.G = r8
        L75:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.o0.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
