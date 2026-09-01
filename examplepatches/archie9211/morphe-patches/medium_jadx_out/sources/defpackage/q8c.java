package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class q8c {
    public final nfb a;

    public q8c(nfb nfbVar, int i) {
        nfbVar.getClass();
        switch (i) {
            case 1:
                this.a = nfbVar;
                break;
            case 2:
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
            boolean r0 = r8 instanceof defpackage.p8c
            if (r0 == 0) goto L13
            r0 = r8
            p8c r0 = (defpackage.p8c) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            p8c r0 = new p8c
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
            java.lang.Object r5 = r5.o(r6, r7, r0)
            if (r5 != r1) goto L48
            return r1
        L48:
            boolean r8 = r5 instanceof defpackage.ajb
            r0 = 0
            java.lang.String r1 = ", response id: "
            if (r8 != 0) goto L5f
            r8 = r5
            c1e r8 = (defpackage.c1e) r8
            java.lang.String r8 = "Show catalog response success. Catalog id: "
            java.lang.String r8 = defpackage.lv8.r(r8, r6, r1, r7)
            uld r2 = defpackage.wld.a
            java.lang.Object[] r4 = new java.lang.Object[r0]
            defpackage.km4.I(r2, r3, r8, r4, r8)
        L5f:
            java.lang.Throwable r8 = defpackage.bjb.b(r5)
            if (r8 == 0) goto L72
            java.lang.String r2 = "Show catalog response failure. Catalog id: "
            java.lang.String r6 = defpackage.lv8.r(r2, r6, r1, r7)
            uld r7 = defpackage.wld.a
            java.lang.Object[] r0 = new java.lang.Object[r0]
            r7.e(r8, r6, r0)
        L72:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q8c.a(java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object b(java.lang.String r6, boolean r7, defpackage.p92 r8) {
        /*
            r5 = this;
            boolean r0 = r8 instanceof defpackage.wmd
            if (r0 == 0) goto L13
            r0 = r8
            wmd r0 = (defpackage.wmd) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            wmd r0 = new wmd
            r0.<init>(r5, r8)
        L18:
            java.lang.Object r8 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L36
            if (r2 != r4) goto L30
            boolean r7 = r0.c
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
            java.lang.Object r5 = r5.g(r6, r7, r0)
            if (r5 != r1) goto L48
            return r1
        L48:
            boolean r8 = r5 instanceof defpackage.ajb
            r0 = 0
            java.lang.String r1 = ", isHidden: "
            if (r8 != 0) goto L6d
            r8 = r5
            c1e r8 = (defpackage.c1e) r8
            java.lang.StringBuilder r8 = new java.lang.StringBuilder
            java.lang.String r2 = "Toggle hide catalog responses success. Catalog id: "
            r8.<init>(r2)
            r8.append(r6)
            r8.append(r1)
            r8.append(r7)
            java.lang.String r8 = r8.toString()
            uld r2 = defpackage.wld.a
            java.lang.Object[] r4 = new java.lang.Object[r0]
            defpackage.km4.I(r2, r3, r8, r4, r8)
        L6d:
            java.lang.Throwable r8 = defpackage.bjb.b(r5)
            if (r8 == 0) goto L8e
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            java.lang.String r3 = "Toggle hide catalog responses failure. Catalog id: "
            r2.<init>(r3)
            r2.append(r6)
            r2.append(r1)
            r2.append(r7)
            java.lang.String r6 = r2.toString()
            uld r7 = defpackage.wld.a
            java.lang.Object[] r0 = new java.lang.Object[r0]
            r7.e(r8, r6, r0)
        L8e:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q8c.b(java.lang.String, boolean, p92):java.lang.Object");
    }
}
