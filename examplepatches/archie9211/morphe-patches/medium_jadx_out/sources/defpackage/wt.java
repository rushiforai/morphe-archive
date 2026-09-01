package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wt extends p4d implements b55 {
    public int b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ zt d;
    public final /* synthetic */ long e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wt(boolean z, zt ztVar, long j, n92 n92Var) {
        super(2, n92Var);
        this.c = z;
        this.d = ztVar;
        this.e = j;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new wt(this.c, this.d, this.e, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((wt) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0031, code lost:
    
        if (r11 == r0) goto L18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0044, code lost:
    
        if (r11 == r0) goto L18;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r11) {
        /*
            r10 = this;
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r10.b
            r2 = 2
            r3 = 1
            if (r1 == 0) goto L1b
            if (r1 == r3) goto L17
            if (r1 != r2) goto L10
            defpackage.br7.v(r11)
            goto L47
        L10:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            r10 = 0
            return r10
        L17:
            defpackage.br7.v(r11)
            goto L34
        L1b:
            defpackage.br7.v(r11)
            zt r11 = r10.d
            cd8 r4 = r11.a
            boolean r11 = r10.c
            if (r11 != 0) goto L39
            r10.b = r3
            r5 = 0
            long r7 = r10.e
            r9 = r10
            java.lang.Object r11 = r4.a(r5, r7, r9)
            if (r11 != r0) goto L34
            goto L46
        L34:
            qre r11 = (defpackage.qre) r11
            long r10 = r11.a
            goto L4b
        L39:
            r9 = r10
            r9.b = r2
            long r5 = r9.e
            r7 = 0
            java.lang.Object r11 = r4.a(r5, r7, r9)
            if (r11 != r0) goto L47
        L46:
            return r0
        L47:
            qre r11 = (defpackage.qre) r11
            long r10 = r11.a
        L4b:
            c1e r10 = defpackage.c1e.a
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wt.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
