package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gca extends p4d implements b55 {
    public int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ lca d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gca(lca lcaVar, n92 n92Var) {
        super(2, n92Var);
        this.d = lcaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        gca gcaVar = new gca(this.d, n92Var);
        gcaVar.c = obj;
        return gcaVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((gca) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x0062, code lost:
    
        if (r0.a(r2, r7) == r1) goto L23;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r8) {
        /*
            r7 = this;
            java.lang.Object r0 = r7.c
            do4 r0 = (defpackage.do4) r0
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r7.b
            lca r3 = r7.d
            r4 = 2
            r5 = 1
            r6 = 0
            if (r2 == 0) goto L25
            if (r2 == r5) goto L1d
            if (r2 != r4) goto L17
            defpackage.br7.v(r8)
            goto L65
        L17:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r6
        L1d:
            defpackage.br7.v(r8)
            bjb r8 = (defpackage.bjb) r8
            java.lang.Object r8 = r8.a
            goto L4c
        L25:
            defpackage.br7.v(r8)
            com.medium.android.core.navigation.PublicationReference r8 = r3.b
            boolean r2 = r8 instanceof com.medium.android.core.navigation.PublicationReference.Id
            if (r2 == 0) goto L35
            com.medium.android.core.navigation.PublicationReference$Id r8 = (com.medium.android.core.navigation.PublicationReference.Id) r8
            java.lang.String r8 = r8.getPublicationId()
            goto L4c
        L35:
            boolean r2 = r8 instanceof com.medium.android.core.navigation.PublicationReference.Slug
            if (r2 == 0) goto L68
            rz2 r2 = r3.h
            com.medium.android.core.navigation.PublicationReference$Slug r8 = (com.medium.android.core.navigation.PublicationReference.Slug) r8
            java.lang.String r8 = r8.getPublicationSlug()
            r7.c = r0
            r7.b = r5
            java.lang.Object r8 = r2.M(r8, r7)
            if (r8 != r1) goto L4c
            goto L64
        L4c:
            boolean r2 = r8 instanceof defpackage.ajb
            if (r2 != 0) goto L55
            r2 = r8
            java.lang.String r2 = (java.lang.String) r2
            r3.p = r2
        L55:
            bjb r2 = new bjb
            r2.<init>(r8)
            r7.c = r6
            r7.b = r4
            java.lang.Object r7 = r0.a(r2, r7)
            if (r7 != r1) goto L65
        L64:
            return r1
        L65:
            c1e r7 = defpackage.c1e.a
            return r7
        L68:
            defpackage.ygf.a()
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gca.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
