package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rd4 {
    public final gn9 a;

    public rd4(gn9 gn9Var) {
        gn9Var.getClass();
        this.a = gn9Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r9, defpackage.yd4 r10, boolean r11, defpackage.p92 r12) {
        /*
            r8 = this;
            boolean r0 = r12 instanceof defpackage.qd4
            if (r0 == 0) goto L14
            r0 = r12
            qd4 r0 = (defpackage.qd4) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.e = r1
        L12:
            r5 = r0
            goto L1a
        L14:
            qd4 r0 = new qd4
            r0.<init>(r8, r12)
            goto L12
        L1a:
            java.lang.Object r12 = r5.c
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r5.e
            r2 = 1
            r7 = 0
            if (r1 == 0) goto L36
            if (r1 != r2) goto L30
            java.lang.String r9 = r5.b
            defpackage.br7.v(r12)
            bjb r12 = (defpackage.bjb) r12
            java.lang.Object r8 = r12.a
            goto L4b
        L30:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r7
        L36:
            defpackage.br7.v(r12)
            r5.b = r9
            r5.e = r2
            gn9 r1 = r8.a
            r6 = 2
            r2 = r9
            r3 = r10
            r4 = r11
            java.lang.Object r8 = defpackage.gn9.f(r1, r2, r3, r4, r5, r6)
            if (r8 != r0) goto L4a
            return r0
        L4a:
            r9 = r2
        L4b:
            boolean r10 = r8 instanceof defpackage.ajb
            if (r10 != 0) goto L71
            com.medium.android.graphql.FullPostQuery$Data r8 = (com.medium.android.graphql.FullPostQuery.Data) r8     // Catch: java.lang.Throwable -> L5c
            com.medium.android.graphql.FullPostQuery$Post r8 = r8.getPost()     // Catch: java.lang.Throwable -> L5c
            if (r8 == 0) goto L5f
            com.medium.android.graphql.fragment.FullPostData r8 = r8.getFullPostData()     // Catch: java.lang.Throwable -> L5c
            goto L60
        L5c:
            r0 = move-exception
            r8 = r0
            goto L6b
        L5f:
            r8 = r7
        L60:
            if (r8 == 0) goto L63
            goto L71
        L63:
            java.lang.String r8 = "FullPostData is null"
            java.lang.IllegalArgumentException r10 = new java.lang.IllegalArgumentException     // Catch: java.lang.Throwable -> L5c
            r10.<init>(r8)     // Catch: java.lang.Throwable -> L5c
            throw r10     // Catch: java.lang.Throwable -> L5c
        L6b:
            ajb r10 = new ajb
            r10.<init>(r8)
            r8 = r10
        L71:
            boolean r10 = r8 instanceof defpackage.ajb
            r11 = 0
            java.lang.String r12 = "Full post data for post "
            if (r10 != 0) goto L89
            r10 = r8
            com.medium.android.graphql.fragment.FullPostData r10 = (com.medium.android.graphql.fragment.FullPostData) r10
            java.lang.String r10 = " fetched successfully"
            java.lang.String r10 = defpackage.ev6.x(r12, r9, r10)
            uld r0 = defpackage.wld.a
            java.lang.Object[] r1 = new java.lang.Object[r11]
            defpackage.km4.I(r0, r7, r10, r1, r10)
        L89:
            java.lang.Throwable r10 = defpackage.bjb.b(r8)
            if (r10 == 0) goto L9c
            java.lang.String r0 = " fetch failed"
            java.lang.String r9 = defpackage.ev6.x(r12, r9, r0)
            uld r12 = defpackage.wld.a
            java.lang.Object[] r11 = new java.lang.Object[r11]
            r12.e(r10, r9, r11)
        L9c:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rd4.a(java.lang.String, yd4, boolean, p92):java.lang.Object");
    }
}
