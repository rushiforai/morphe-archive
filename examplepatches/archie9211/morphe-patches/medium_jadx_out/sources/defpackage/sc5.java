package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sc5 {
    public final ble a;

    public sc5(ble bleVar) {
        this.a = bleVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r9, defpackage.p92 r10) {
        /*
            r8 = this;
            boolean r0 = r10 instanceof defpackage.rc5
            if (r0 == 0) goto L13
            r0 = r10
            rc5 r0 = (defpackage.rc5) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            rc5 r0 = new rc5
            r0.<init>(r8, r10)
        L18:
            java.lang.Object r10 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            r4 = 0
            java.lang.String r5 = "Get user byline data for user with id "
            r6 = 0
            if (r2 == 0) goto L37
            if (r2 != r3) goto L31
            java.lang.String r9 = r0.b
            defpackage.br7.v(r10)
            bjb r10 = (defpackage.bjb) r10
            java.lang.Object r8 = r10.a
            goto L61
        L31:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r6
        L37:
            defpackage.br7.v(r10)
            java.lang.StringBuilder r10 = new java.lang.StringBuilder
            r10.<init>(r5)
            r10.append(r9)
            java.lang.String r2 = "."
            r10.append(r2)
            java.lang.String r10 = r10.toString()
            uld r2 = defpackage.wld.a
            java.lang.Object[] r7 = new java.lang.Object[r4]
            defpackage.km4.I(r2, r6, r10, r7, r10)
            yd4 r10 = defpackage.yd4.CacheFirst
            r0.b = r9
            r0.e = r3
            ble r8 = r8.a
            java.lang.Object r8 = r8.m(r9, r10, r0)
            if (r8 != r1) goto L61
            return r1
        L61:
            boolean r10 = r8 instanceof defpackage.ajb
            if (r10 != 0) goto L9a
            com.medium.android.graphql.GetUserBylineDataQuery$Data r8 = (com.medium.android.graphql.GetUserBylineDataQuery.Data) r8     // Catch: java.lang.Throwable -> L72
            com.medium.android.graphql.GetUserBylineDataQuery$UserResult r8 = r8.getUserResult()     // Catch: java.lang.Throwable -> L72
            if (r8 == 0) goto L74
            com.medium.android.graphql.GetUserBylineDataQuery$OnUser r8 = r8.getOnUser()     // Catch: java.lang.Throwable -> L72
            goto L75
        L72:
            r8 = move-exception
            goto L94
        L74:
            r8 = r6
        L75:
            gae r10 = new gae     // Catch: java.lang.Throwable -> L72
            if (r8 == 0) goto L7e
            java.lang.String r0 = r8.getName()     // Catch: java.lang.Throwable -> L72
            goto L7f
        L7e:
            r0 = r6
        L7f:
            if (r8 == 0) goto L86
            java.lang.String r1 = r8.getUsername()     // Catch: java.lang.Throwable -> L72
            goto L87
        L86:
            r1 = r6
        L87:
            if (r8 == 0) goto L8e
            java.lang.String r8 = r8.getImageId()     // Catch: java.lang.Throwable -> L72
            goto L8f
        L8e:
            r8 = r6
        L8f:
            r10.<init>(r0, r1, r8)     // Catch: java.lang.Throwable -> L72
        L92:
            r8 = r10
            goto L9a
        L94:
            ajb r10 = new ajb
            r10.<init>(r8)
            goto L92
        L9a:
            boolean r10 = r8 instanceof defpackage.ajb
            if (r10 != 0) goto Lae
            r10 = r8
            gae r10 = (defpackage.gae) r10
            java.lang.String r10 = " success."
            java.lang.String r10 = defpackage.ev6.x(r5, r9, r10)
            uld r0 = defpackage.wld.a
            java.lang.Object[] r1 = new java.lang.Object[r4]
            defpackage.km4.I(r0, r6, r10, r1, r10)
        Lae:
            java.lang.Throwable r10 = defpackage.bjb.b(r8)
            if (r10 == 0) goto Lc1
            java.lang.String r0 = " failed."
            java.lang.String r9 = defpackage.ev6.x(r5, r9, r0)
            uld r0 = defpackage.wld.a
            java.lang.Object[] r1 = new java.lang.Object[r4]
            r0.e(r10, r9, r1)
        Lc1:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sc5.a(java.lang.String, p92):java.lang.Object");
    }
}
