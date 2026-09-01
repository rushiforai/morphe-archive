package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class i3e extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ k3e d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i3e(k3e k3eVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = k3eVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        k3e k3eVar = this.d;
        switch (i) {
            case 0:
                return new i3e(k3eVar, n92Var, 0);
            default:
                return new i3e(k3eVar, n92Var, 1);
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
        return ((i3e) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x0042, code lost:
    
        if (r8 == r0) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0053, code lost:
    
        if (r8 == r0) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0056, code lost:
    
        return r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x008b, code lost:
    
        if (r8 == r0) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x009c, code lost:
    
        if (r8 == r0) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x009f, code lost:
    
        return r0;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r9) {
        /*
            r8 = this;
            int r0 = r8.b
            r1 = 0
            java.lang.String r2 = "call to 'resume' before 'invoke' with coroutine"
            c1e r3 = defpackage.c1e.a
            r4 = 1
            r5 = 2
            k3e r6 = r8.d
            switch(r0) {
                case 0: goto L57;
                default: goto Le;
            }
        Le:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r7 = r8.c
            if (r7 == 0) goto L21
            if (r7 == r4) goto L18
            if (r7 != r5) goto L1d
        L18:
            defpackage.br7.v(r9)
        L1b:
            r1 = r3
            goto L56
        L1d:
            defpackage.ygf.f(r2)
            goto L56
        L21:
            defpackage.br7.v(r9)
            atb r9 = r6.e()
            uid r9 = r9.a
            mx r9 = r9.a
            java.lang.String r9 = r9.b
            boolean r9 = defpackage.muc.b0(r9)
            if (r9 == 0) goto L45
            n57 r9 = r6.b
            r8.c = r4
            n0c r9 = r9.b
            java.lang.Object r8 = r9.c0(r8)
            if (r8 != r0) goto L41
            goto L42
        L41:
            r8 = r3
        L42:
            if (r8 != r0) goto L1b
            goto L55
        L45:
            n57 r9 = r6.c
            r8.c = r5
            n0c r9 = r9.b
            java.lang.Object r8 = r9.c0(r8)
            if (r8 != r0) goto L52
            goto L53
        L52:
            r8 = r3
        L53:
            if (r8 != r0) goto L1b
        L55:
            r1 = r0
        L56:
            return r1
        L57:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r7 = r8.c
            if (r7 == 0) goto L6a
            if (r7 == r4) goto L61
            if (r7 != r5) goto L66
        L61:
            defpackage.br7.v(r9)
        L64:
            r1 = r3
            goto L9f
        L66:
            defpackage.ygf.f(r2)
            goto L9f
        L6a:
            defpackage.br7.v(r9)
            atb r9 = r6.e()
            uid r9 = r9.a
            mx r9 = r9.a
            java.lang.String r9 = r9.b
            boolean r9 = defpackage.muc.b0(r9)
            if (r9 == 0) goto L8e
            n57 r9 = r6.b
            r8.c = r4
            n0c r9 = r9.b
            java.lang.Object r8 = r9.D(r8)
            if (r8 != r0) goto L8a
            goto L8b
        L8a:
            r8 = r3
        L8b:
            if (r8 != r0) goto L64
            goto L9e
        L8e:
            n57 r9 = r6.c
            r8.c = r5
            n0c r9 = r9.b
            java.lang.Object r8 = r9.D(r8)
            if (r8 != r0) goto L9b
            goto L9c
        L9b:
            r8 = r3
        L9c:
            if (r8 != r0) goto L64
        L9e:
            r1 = r0
        L9f:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.i3e.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
