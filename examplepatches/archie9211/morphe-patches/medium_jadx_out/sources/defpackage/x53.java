package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x53 {
    public final nfb a;

    public x53(nfb nfbVar, int i) {
        nfbVar.getClass();
        switch (i) {
            case 1:
                this.a = nfbVar;
                break;
            default:
                this.a = nfbVar;
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object a(java.lang.String r6, java.lang.String r7, defpackage.p92 r8) {
        /*
            r5 = this;
            boolean r0 = r8 instanceof defpackage.o9c
            if (r0 == 0) goto L13
            r0 = r8
            o9c r0 = (defpackage.o9c) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            o9c r0 = new o9c
            r0.<init>(r5, r8)
        L18:
            java.lang.Object r8 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L36
            if (r2 != r4) goto L30
            java.lang.String r7 = r0.c
            java.lang.String r6 = r0.b
            defpackage.br7.v(r8)
            bjb r8 = (defpackage.bjb) r8
            java.lang.Object r5 = r8.a
            goto L48
        L30:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L36:
            defpackage.br7.v(r8)
            r0.b = r6
            r0.c = r7
            r0.f = r4
            nfb r5 = r5.a
            java.lang.Object r5 = r5.p(r6, r7, r0)
            if (r5 != r1) goto L48
            return r1
        L48:
            boolean r8 = r5 instanceof defpackage.ajb
            r0 = 0
            java.lang.String r1 = ", response id: "
            if (r8 != 0) goto L5f
            r8 = r5
            c1e r8 = (defpackage.c1e) r8
            java.lang.String r8 = "Show post response success. Root Post id: "
            java.lang.String r8 = defpackage.lv8.r(r8, r6, r1, r7)
            uld r2 = defpackage.wld.a
            java.lang.Object[] r4 = new java.lang.Object[r0]
            defpackage.km4.I(r2, r3, r8, r4, r8)
        L5f:
            java.lang.Throwable r8 = defpackage.bjb.b(r5)
            if (r8 == 0) goto L72
            java.lang.String r2 = "Show post response failure. Root Post id: "
            java.lang.String r6 = defpackage.lv8.r(r2, r6, r1, r7)
            uld r7 = defpackage.wld.a
            java.lang.Object[] r0 = new java.lang.Object[r0]
            r7.e(r8, r6, r0)
        L72:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.x53.a(java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object b(java.lang.String r7, defpackage.p92 r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.w53
            if (r0 == 0) goto L13
            r0 = r8
            w53 r0 = (defpackage.w53) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            w53 r0 = new w53
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L35
            if (r2 != r3) goto L2e
            java.lang.String r7 = r0.b
            defpackage.br7.v(r8)
            bjb r8 = (defpackage.bjb) r8
            java.lang.Object r6 = r8.a
            goto L52
        L2e:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L35:
            defpackage.br7.v(r8)
            uld r8 = defpackage.wld.a
            java.lang.String r2 = "Deleting response: "
            java.lang.String r2 = defpackage.ka1.r(r2, r7)
            java.lang.Object[] r5 = new java.lang.Object[r4]
            r8.a(r2, r5)
            r0.b = r7
            r0.e = r3
            nfb r6 = r6.a
            java.lang.Object r6 = r6.a(r7, r0)
            if (r6 != r1) goto L52
            return r1
        L52:
            boolean r8 = r6 instanceof defpackage.ajb
            if (r8 != 0) goto L66
            r8 = r6
            c1e r8 = (defpackage.c1e) r8
            uld r8 = defpackage.wld.a
            java.lang.String r0 = "Successfully deleted response: "
            java.lang.String r7 = defpackage.ka1.r(r0, r7)
            java.lang.Object[] r0 = new java.lang.Object[r4]
            r8.a(r7, r0)
        L66:
            java.lang.Throwable r7 = defpackage.bjb.b(r6)
            if (r7 == 0) goto L75
            uld r8 = defpackage.wld.a
            java.lang.String r0 = "Failed to delete response"
            java.lang.Object[] r1 = new java.lang.Object[r4]
            r8.e(r7, r0, r1)
        L75:
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.x53.b(java.lang.String, p92):java.lang.Object");
    }
}
