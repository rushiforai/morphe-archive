package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s53 {
    public final ble a;

    public /* synthetic */ s53(ble bleVar) {
        this.a = bleVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object a(java.lang.String r9, defpackage.p92 r10) {
        /*
            r8 = this;
            boolean r0 = r10 instanceof defpackage.r53
            if (r0 == 0) goto L13
            r0 = r10
            r53 r0 = (defpackage.r53) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            r53 r0 = new r53
            r0.<init>(r8, r10)
        L18:
            java.lang.Object r10 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            r4 = 0
            r5 = 0
            java.lang.String r6 = "Delete post with id "
            if (r2 == 0) goto L37
            if (r2 != r3) goto L31
            java.lang.String r9 = r0.b
            defpackage.br7.v(r10)
            bjb r10 = (defpackage.bjb) r10
            java.lang.Object r8 = r10.a
            goto L4f
        L31:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r5
        L37:
            java.lang.String r10 = defpackage.wgd.u(r10, r6, r9)
            uld r2 = defpackage.wld.a
            java.lang.Object[] r7 = new java.lang.Object[r4]
            defpackage.km4.I(r2, r5, r10, r7, r10)
            r0.b = r9
            r0.e = r3
            ble r8 = r8.a
            java.lang.Object r8 = r8.b(r9, r0)
            if (r8 != r1) goto L4f
            return r1
        L4f:
            boolean r10 = r8 instanceof defpackage.ajb
            if (r10 != 0) goto L63
            r10 = r8
            c1e r10 = (defpackage.c1e) r10
            java.lang.String r10 = " successful"
            java.lang.String r10 = defpackage.ev6.x(r6, r9, r10)
            uld r0 = defpackage.wld.a
            java.lang.Object[] r1 = new java.lang.Object[r4]
            defpackage.km4.I(r0, r5, r10, r1, r10)
        L63:
            java.lang.Throwable r10 = defpackage.bjb.b(r8)
            if (r10 == 0) goto L76
            java.lang.String r0 = " failed"
            java.lang.String r9 = defpackage.ev6.x(r6, r9, r0)
            uld r0 = defpackage.wld.a
            java.lang.Object[] r1 = new java.lang.Object[r4]
            r0.e(r10, r9, r1)
        L76:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.s53.a(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object b(java.lang.String r8, defpackage.yd4 r9, defpackage.p92 r10) {
        /*
            r7 = this;
            boolean r0 = r10 instanceof defpackage.qe4
            if (r0 == 0) goto L13
            r0 = r10
            qe4 r0 = (defpackage.qe4) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            qe4 r0 = new qe4
            r0.<init>(r7, r10)
        L18:
            java.lang.Object r10 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            r5 = 0
            if (r2 == 0) goto L33
            if (r2 != r3) goto L2d
            defpackage.br7.v(r10)
            bjb r10 = (defpackage.bjb) r10
            java.lang.Object r7 = r10.a
            goto L4b
        L2d:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r5
        L33:
            java.lang.String r2 = "Fetch user: "
            java.lang.String r10 = defpackage.wgd.u(r10, r2, r8)
            uld r2 = defpackage.wld.a
            java.lang.Object[] r6 = new java.lang.Object[r4]
            defpackage.km4.I(r2, r5, r10, r6, r10)
            r0.d = r3
            ble r7 = r7.a
            java.lang.Object r7 = r7.q(r8, r9, r0)
            if (r7 != r1) goto L4b
            return r1
        L4b:
            boolean r8 = r7 instanceof defpackage.ajb
            if (r8 != 0) goto L5b
            r8 = r7
            com.medium.android.graphql.fragment.UserProfileData r8 = (com.medium.android.graphql.fragment.UserProfileData) r8
            uld r8 = defpackage.wld.a
            java.lang.Object[] r9 = new java.lang.Object[r4]
            java.lang.String r10 = "Fetch user successful"
            defpackage.km4.I(r8, r5, r10, r9, r10)
        L5b:
            java.lang.Throwable r8 = defpackage.bjb.b(r7)
            if (r8 == 0) goto L6a
            uld r9 = defpackage.wld.a
            java.lang.Object[] r10 = new java.lang.Object[r4]
            java.lang.String r0 = "Fetch current user failed"
            r9.e(r8, r0, r10)
        L6a:
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.s53.b(java.lang.String, yd4, p92):java.lang.Object");
    }
}
