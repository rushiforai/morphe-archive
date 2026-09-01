package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mna extends p4d implements b55 {
    public do4 b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ nna e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mna(nna nnaVar, n92 n92Var) {
        super(2, n92Var);
        this.e = nnaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        mna mnaVar = new mna(this.e, n92Var);
        mnaVar.d = obj;
        return mnaVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((mna) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x005f, code lost:
    
        if (r0.a(r2, r7) == r1) goto L20;
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
            goto L62
        L15:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r5
        L1b:
            do4 r0 = r7.b
            defpackage.br7.v(r8)
            bjb r8 = (defpackage.bjb) r8
            java.lang.Object r8 = r8.a
            goto L50
        L25:
            defpackage.br7.v(r8)
            nna r8 = r7.e
            com.medium.android.core.navigation.PublicationReference r2 = r8.b
            boolean r6 = r2 instanceof com.medium.android.core.navigation.PublicationReference.Id
            if (r6 == 0) goto L37
            com.medium.android.core.navigation.PublicationReference$Id r2 = (com.medium.android.core.navigation.PublicationReference.Id) r2
            java.lang.String r8 = r2.getPublicationId()
            goto L50
        L37:
            boolean r6 = r2 instanceof com.medium.android.core.navigation.PublicationReference.Slug
            if (r6 == 0) goto L65
            rz2 r8 = r8.k
            com.medium.android.core.navigation.PublicationReference$Slug r2 = (com.medium.android.core.navigation.PublicationReference.Slug) r2
            java.lang.String r2 = r2.getPublicationSlug()
            r7.d = r5
            r7.b = r0
            r7.c = r4
            java.lang.Object r8 = r8.M(r2, r7)
            if (r8 != r1) goto L50
            goto L61
        L50:
            bjb r2 = new bjb
            r2.<init>(r8)
            r7.d = r5
            r7.b = r5
            r7.c = r3
            java.lang.Object r7 = r0.a(r2, r7)
            if (r7 != r1) goto L62
        L61:
            return r1
        L62:
            c1e r7 = defpackage.c1e.a
            return r7
        L65:
            defpackage.ygf.a()
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mna.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
