package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class og3 {
    public final zk2 a;

    public og3(zk2 zk2Var, int i) {
        zk2Var.getClass();
        switch (i) {
            case 1:
                this.a = zk2Var;
                break;
            default:
                this.a = zk2Var;
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object a(defpackage.yd4 r8, boolean r9, defpackage.p92 r10) {
        /*
            r7 = this;
            boolean r0 = r10 instanceof defpackage.fd4
            if (r0 == 0) goto L13
            r0 = r10
            fd4 r0 = (defpackage.fd4) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            fd4 r0 = new fd4
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
            goto L4a
        L2d:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r5
        L33:
            defpackage.br7.v(r10)
            uld r10 = defpackage.wld.a
            java.lang.Object[] r2 = new java.lang.Object[r4]
            java.lang.String r6 = "Fetch current user"
            defpackage.km4.I(r10, r5, r6, r2, r6)
            r0.d = r3
            zk2 r7 = r7.a
            java.lang.Object r7 = r7.r(r8, r9, r0)
            if (r7 != r1) goto L4a
            return r1
        L4a:
            boolean r8 = r7 instanceof defpackage.ajb
            if (r8 != 0) goto L54
            com.medium.android.core.models.CurrentUserEntity r7 = (com.medium.android.core.models.CurrentUserEntity) r7
            rj2 r7 = defpackage.m40.X(r7)
        L54:
            boolean r8 = r7 instanceof defpackage.ajb
            if (r8 != 0) goto L64
            r8 = r7
            rj2 r8 = (defpackage.rj2) r8
            uld r8 = defpackage.wld.a
            java.lang.Object[] r9 = new java.lang.Object[r4]
            java.lang.String r10 = "Fetch current user successful"
            defpackage.km4.I(r8, r5, r10, r9, r10)
        L64:
            java.lang.Throwable r8 = defpackage.bjb.b(r7)
            if (r8 == 0) goto L73
            uld r9 = defpackage.wld.a
            java.lang.Object[] r10 = new java.lang.Object[r4]
            java.lang.String r0 = "Fetch current user failed"
            r9.e(r8, r0, r10)
        L73:
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.og3.a(yd4, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object c(com.medium.android.graphql.type.UserDismissableFlags r8, defpackage.n92 r9) throws java.lang.Throwable {
        /*
            r7 = this;
            boolean r0 = r9 instanceof defpackage.ng3
            if (r0 == 0) goto L13
            r0 = r9
            ng3 r0 = (defpackage.ng3) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            ng3 r0 = new ng3
            r0.<init>(r7, r9)
        L18:
            java.lang.Object r9 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L35
            if (r2 != r4) goto L2f
            com.medium.android.graphql.type.UserDismissableFlags r8 = r0.b
            defpackage.br7.v(r9)
            bjb r9 = (defpackage.bjb) r9
            java.lang.Object r7 = r9.a
            goto L5a
        L2f:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r3
        L35:
            defpackage.br7.v(r9)
            java.lang.StringBuilder r9 = new java.lang.StringBuilder
            java.lang.String r2 = "Dismissing "
            r9.<init>(r2)
            r9.append(r8)
            java.lang.String r9 = r9.toString()
            uld r2 = defpackage.wld.a
            java.lang.Object[] r6 = new java.lang.Object[r5]
            defpackage.km4.I(r2, r3, r9, r6, r9)
            r0.b = r8
            r0.e = r4
            zk2 r7 = r7.a
            java.lang.Object r7 = r7.b(r8, r0)
            if (r7 != r1) goto L5a
            return r1
        L5a:
            boolean r9 = r7 instanceof defpackage.ajb
            java.lang.String r0 = "Dismiss "
            if (r9 != 0) goto L7b
            r9 = r7
            c1e r9 = (defpackage.c1e) r9
            java.lang.StringBuilder r9 = new java.lang.StringBuilder
            r9.<init>(r0)
            r9.append(r8)
            java.lang.String r1 = " successful"
            r9.append(r1)
            java.lang.String r9 = r9.toString()
            uld r1 = defpackage.wld.a
            java.lang.Object[] r2 = new java.lang.Object[r5]
            defpackage.km4.I(r1, r3, r9, r2, r9)
        L7b:
            java.lang.Throwable r9 = defpackage.bjb.b(r7)
            if (r9 == 0) goto L99
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>(r0)
            r1.append(r8)
            java.lang.String r8 = " failed"
            r1.append(r8)
            java.lang.String r8 = r1.toString()
            uld r0 = defpackage.wld.a
            java.lang.Object[] r1 = new java.lang.Object[r5]
            r0.e(r9, r8, r1)
        L99:
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.og3.c(com.medium.android.graphql.type.UserDismissableFlags, n92):java.lang.Object");
    }
}
