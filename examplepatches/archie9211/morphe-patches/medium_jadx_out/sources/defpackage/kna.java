package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kna extends p4d implements b55 {
    public do4 b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ nna e;
    public final /* synthetic */ String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kna(n92 n92Var, nna nnaVar, String str) {
        super(2, n92Var);
        this.e = nnaVar;
        this.f = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        kna knaVar = new kna(n92Var, this.e, this.f);
        knaVar.d = obj;
        return knaVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((kna) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x004e, code lost:
    
        if (r0.a(r2, r7) == r1) goto L15;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r8) {
        /*
            r7 = this;
            java.lang.Object r0 = r7.d
            do4 r0 = (defpackage.do4) r0
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r7.c
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L25
            if (r2 == r4) goto L1b
            if (r2 != r3) goto L15
            defpackage.br7.v(r8)
            goto L51
        L15:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r5
        L1b:
            do4 r0 = r7.b
            defpackage.br7.v(r8)
            bjb r8 = (defpackage.bjb) r8
            java.lang.Object r8 = r8.a
            goto L3f
        L25:
            defpackage.br7.v(r8)
            nna r8 = r7.e
            kla r8 = r8.o
            r7.d = r5
            r7.b = r0
            r7.c = r4
            yd4 r2 = defpackage.yd4.CacheFirst
            r4 = 10
            java.lang.String r6 = r7.f
            java.lang.Object r8 = r8.b(r4, r7, r2, r6)
            if (r8 != r1) goto L3f
            goto L50
        L3f:
            bjb r2 = new bjb
            r2.<init>(r8)
            r7.d = r5
            r7.b = r5
            r7.c = r3
            java.lang.Object r7 = r0.a(r2, r7)
            if (r7 != r1) goto L51
        L50:
            return r1
        L51:
            c1e r7 = defpackage.c1e.a
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kna.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
