package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fja extends p4d implements b55 {
    public rya b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ gja e;
    public final /* synthetic */ String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fja(gja gjaVar, String str, n92 n92Var) {
        super(2, n92Var);
        this.e = gjaVar;
        this.f = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        fja fjaVar = new fja(this.e, this.f, n92Var);
        fjaVar.d = obj;
        return fjaVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((fja) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x00b8, code lost:
    
        if (defpackage.r6c.m(r12, r5, r11) != r1) goto L32;
     */
    /* JADX WARN: Removed duplicated region for block: B:23:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00a7 A[PHI: r2
      0x00a7: PHI (r2v4 rya) = (r2v3 rya), (r2v3 rya), (r2v7 rya) binds: [B:27:0x00a4, B:24:0x0090, B:12:0x0029] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r12) {
        /*
            r11 = this;
            java.lang.Object r0 = r11.d
            do4 r0 = (defpackage.do4) r0
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r11.c
            java.lang.String r3 = r11.f
            r4 = 5
            r5 = 4
            r6 = 3
            r7 = 2
            r8 = 1
            gja r9 = r11.e
            r10 = 0
            if (r2 == 0) goto L40
            if (r2 == r8) goto L3a
            if (r2 == r7) goto L30
            if (r2 == r6) goto L29
            if (r2 == r5) goto L29
            if (r2 == r4) goto L24
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r10
        L24:
            defpackage.br7.v(r12)
            goto Lbb
        L29:
            rya r2 = r11.b
            defpackage.br7.v(r12)
            goto La7
        L30:
            rya r2 = r11.b
            defpackage.br7.v(r12)
            bjb r12 = (defpackage.bjb) r12
            java.lang.Object r12 = r12.a
            goto L66
        L3a:
            rya r2 = r11.b
            defpackage.br7.v(r12)
            goto L55
        L40:
            rya r2 = defpackage.ev6.p(r12)
            via r12 = defpackage.via.a
            r2.a = r12
            r11.d = r0
            r11.b = r2
            r11.c = r8
            java.lang.Object r12 = r0.a(r12, r11)
            if (r12 != r1) goto L55
            goto Lba
        L55:
            kla r12 = r9.a
            yd4 r8 = defpackage.yd4.CacheFirst
            r11.d = r0
            r11.b = r2
            r11.c = r7
            java.lang.Object r12 = r12.e(r3, r8, r11)
            if (r12 != r1) goto L66
            goto Lba
        L66:
            java.lang.Throwable r7 = defpackage.bjb.b(r12)
            if (r7 != 0) goto L93
            com.medium.android.graphql.PublicationHomeQuery$Publication r12 = (com.medium.android.graphql.PublicationHomeQuery.Publication) r12
            bja r5 = new bja
            java.lang.String r7 = r12.getName()
            com.medium.android.graphql.PublicationHomeQuery$Homepage r12 = r12.getHomepage()
            com.medium.android.graphql.fragment.PublicationSections r12 = r12.getPublicationSections()
            java.util.ArrayList r12 = defpackage.gja.a(r12)
            r8 = 0
            r5.<init>(r7, r12, r8)
            r2.a = r5
            r11.d = r0
            r11.b = r2
            r11.c = r6
            java.lang.Object r12 = r0.a(r5, r11)
            if (r12 != r1) goto La7
            goto Lba
        L93:
            uia r12 = new uia
            r12.<init>(r7)
            r2.a = r12
            r11.d = r0
            r11.b = r2
            r11.c = r5
            java.lang.Object r12 = r0.a(r12, r11)
            if (r12 != r1) goto La7
            goto Lba
        La7:
            r6c r12 = r9.b
            eja r5 = new eja
            r5.<init>(r2, r0, r9, r3)
            r11.d = r10
            r11.b = r10
            r11.c = r4
            tb2 r11 = defpackage.r6c.m(r12, r5, r11)
            if (r11 != r1) goto Lbb
        Lba:
            return r1
        Lbb:
            defpackage.z72.b()
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fja.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
