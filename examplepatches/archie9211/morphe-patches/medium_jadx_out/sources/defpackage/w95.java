package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class w95 {
    public final hs8 a;

    public w95(hs8 hs8Var) {
        this.a = hs8Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(int r6, defpackage.yd4 r7, defpackage.p92 r8) {
        /*
            r5 = this;
            boolean r0 = r8 instanceof defpackage.v95
            if (r0 == 0) goto L13
            r0 = r8
            v95 r0 = (defpackage.v95) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            v95 r0 = new v95
            r0.<init>(r5, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2c
            defpackage.br7.v(r8)
            bjb r8 = (defpackage.bjb) r8
            java.lang.Object r5 = r8.a
            goto L40
        L2c:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r4
        L32:
            defpackage.br7.v(r8)
            r0.d = r3
            hs8 r5 = r5.a
            java.io.Serializable r5 = r5.e(r6, r7, r0)
            if (r5 != r1) goto L40
            return r1
        L40:
            boolean r6 = r5 instanceof defpackage.ajb
            if (r6 != 0) goto L7a
            java.util.List r5 = (java.util.List) r5
            java.util.ArrayList r6 = new java.util.ArrayList
            r6.<init>()
            java.util.Iterator r5 = r5.iterator()
        L4f:
            boolean r7 = r5.hasNext()
            if (r7 == 0) goto L79
            java.lang.Object r7 = r5.next()
            com.medium.android.graphql.FeaturedUsersOnboardingQuery$Node r7 = (com.medium.android.graphql.FeaturedUsersOnboardingQuery.Node) r7
            java.lang.String r8 = r7.getId()
            java.lang.String r0 = r7.getName()
            if (r0 != 0) goto L67
        L65:
            r1 = r4
            goto L73
        L67:
            java.lang.String r7 = r7.getImageId()
            if (r7 != 0) goto L6e
            goto L65
        L6e:
            vc4 r1 = new vc4
            r1.<init>(r8, r0, r7)
        L73:
            if (r1 == 0) goto L4f
            r6.add(r1)
            goto L4f
        L79:
            return r6
        L7a:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w95.a(int, yd4, p92):java.lang.Object");
    }
}
