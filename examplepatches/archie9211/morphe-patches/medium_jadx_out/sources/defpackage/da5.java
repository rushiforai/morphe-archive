package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class da5 {
    public final zk2 a;

    public da5(zk2 zk2Var) {
        zk2Var.getClass();
        this.a = zk2Var;
    }

    public static /* synthetic */ Object b(da5 da5Var, yd4 yd4Var, p92 p92Var, int i) {
        if ((i & 1) != 0) {
            yd4Var = yd4.CacheFirst;
        }
        return da5Var.a(yd4Var, p92Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.yd4 r6, defpackage.p92 r7) {
        /*
            r5 = this;
            boolean r0 = r7 instanceof defpackage.ca5
            if (r0 == 0) goto L13
            r0 = r7
            ca5 r0 = (defpackage.ca5) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ca5 r0 = new ca5
            r0.<init>(r5, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L32
            if (r2 != r4) goto L2c
            defpackage.br7.v(r7)
            bjb r7 = (defpackage.bjb) r7
            java.lang.Object r5 = r7.a
            goto L41
        L2c:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L32:
            defpackage.br7.v(r7)
            r0.d = r4
            zk2 r5 = r5.a
            r7 = 0
            java.lang.Object r5 = r5.s(r6, r7, r0)
            if (r5 != r1) goto L41
            return r1
        L41:
            boolean r6 = r5 instanceof defpackage.ajb
            if (r6 != 0) goto L4f
            com.medium.android.graphql.MembershipStatusQuery$Membership r5 = (com.medium.android.graphql.MembershipStatusQuery.Membership) r5
            if (r5 == 0) goto L4e
            ww7 r5 = defpackage.di7.a(r5)
            return r5
        L4e:
            return r3
        L4f:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.da5.a(yd4, p92):java.lang.Object");
    }
}
