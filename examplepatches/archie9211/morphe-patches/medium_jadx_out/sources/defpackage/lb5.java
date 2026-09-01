package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lb5 {
    public final gn9 a;

    public lb5(gn9 gn9Var, int i) {
        gn9Var.getClass();
        switch (i) {
            case 1:
                this.a = gn9Var;
                break;
            case 2:
                this.a = gn9Var;
                break;
            default:
                this.a = gn9Var;
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object a(java.lang.String r9, java.lang.String r10, defpackage.p92 r11) {
        /*
            r8 = this;
            boolean r0 = r11 instanceof defpackage.x0e
            if (r0 == 0) goto L13
            r0 = r11
            x0e r0 = (defpackage.x0e) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            x0e r0 = new x0e
            r0.<init>(r8, r11)
        L18:
            java.lang.Object r11 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            r4 = 0
            r5 = 0
            java.lang.String r6 = "Unhide repost note for postId="
            if (r2 == 0) goto L37
            if (r2 != r3) goto L31
            java.lang.String r9 = r0.b
            defpackage.br7.v(r11)
            bjb r11 = (defpackage.bjb) r11
            java.lang.Object r8 = r11.a
            goto L62
        L31:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r5
        L37:
            defpackage.br7.v(r11)
            java.lang.StringBuilder r11 = new java.lang.StringBuilder
            r11.<init>(r6)
            r11.append(r9)
            java.lang.String r2 = " userId="
            r11.append(r2)
            r11.append(r10)
            java.lang.String r11 = r11.toString()
            uld r2 = defpackage.wld.a
            java.lang.Object[] r7 = new java.lang.Object[r4]
            defpackage.km4.I(r2, r5, r11, r7, r11)
            r0.b = r9
            r0.e = r3
            gn9 r8 = r8.a
            java.lang.Object r8 = r8.z(r9, r10, r0)
            if (r8 != r1) goto L62
            return r1
        L62:
            boolean r10 = r8 instanceof defpackage.ajb
            if (r10 != 0) goto L76
            r10 = r8
            c1e r10 = (defpackage.c1e) r10
            java.lang.String r10 = " successful"
            java.lang.String r10 = defpackage.ev6.x(r6, r9, r10)
            uld r11 = defpackage.wld.a
            java.lang.Object[] r0 = new java.lang.Object[r4]
            defpackage.km4.I(r11, r5, r10, r0, r10)
        L76:
            java.lang.Throwable r10 = defpackage.bjb.b(r8)
            if (r10 == 0) goto L89
            java.lang.String r11 = " failed"
            java.lang.String r9 = defpackage.ev6.x(r6, r9, r11)
            uld r11 = defpackage.wld.a
            java.lang.Object[] r0 = new java.lang.Object[r4]
            r11.e(r10, r9, r0)
        L89:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lb5.a(java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object b(java.lang.String r5, boolean r6, defpackage.p92 r7) {
        /*
            r4 = this;
            boolean r0 = r7 instanceof defpackage.kb5
            if (r0 == 0) goto L13
            r0 = r7
            kb5 r0 = (defpackage.kb5) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            kb5 r0 = new kb5
            r0.<init>(r4, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            defpackage.br7.v(r7)
            bjb r7 = (defpackage.bjb) r7
            java.lang.Object r4 = r7.a
            goto L47
        L2b:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L32:
            defpackage.br7.v(r7)
            if (r6 == 0) goto L3a
            yd4 r6 = defpackage.yd4.NetworkFirst
            goto L3c
        L3a:
            yd4 r6 = defpackage.yd4.CacheFirst
        L3c:
            r0.d = r3
            gn9 r4 = r4.a
            java.lang.Object r4 = r4.l(r5, r6, r0)
            if (r4 != r1) goto L47
            return r1
        L47:
            boolean r5 = r4 instanceof defpackage.ajb
            if (r5 != 0) goto L57
            com.medium.android.graphql.fragment.PostRepostCountData r4 = (com.medium.android.graphql.fragment.PostRepostCountData) r4
            int r4 = r4.getRepostCount()
            java.lang.Integer r5 = new java.lang.Integer
            r5.<init>(r4)
            return r5
        L57:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lb5.b(java.lang.String, boolean, p92):java.lang.Object");
    }
}
