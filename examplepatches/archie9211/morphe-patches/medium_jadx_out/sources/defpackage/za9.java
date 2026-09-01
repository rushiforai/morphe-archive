package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class za9 {
    public static final sn3 a = new sn3(1, b18.g);

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.tb2 a(defpackage.fx6 r5, defpackage.ra r6, defpackage.p92 r7) {
        /*
            boolean r0 = r7 instanceof defpackage.xa9
            if (r0 == 0) goto L13
            r0 = r7
            xa9 r0 = (defpackage.xa9) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.c = r1
            goto L18
        L13:
            xa9 r0 = new xa9
            r0.<init>(r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.c
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 == r4) goto L2a
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2a:
            defpackage.br7.v(r7)
            goto L57
        L2e:
            defpackage.br7.v(r7)
            q28 r7 = r5.a
            boolean r7 = r7.n
            if (r7 == 0) goto L5f
            mx8 r7 = defpackage.flb.w0(r5)
            aq6 r5 = defpackage.flb.v0(r5)
            w22 r5 = r5.B
            i89 r5 = (defpackage.i89) r5
            r5.getClass()
            sn3 r2 = defpackage.za9.a
            java.lang.Object r5 = defpackage.m40.U(r5, r2)
            if (r5 != 0) goto L5b
            r0.c = r4
            tb2 r5 = b(r7, r6, r0)
            if (r5 != r1) goto L57
            return r1
        L57:
            defpackage.z72.b()
            return r3
        L5b:
            defpackage.rd6.m()
            return r3
        L5f:
            java.lang.String r5 = "establishTextInputSession called from an unattached node"
            defpackage.ay0.e(r5)
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.za9.a(fx6, ra, p92):tb2");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.tb2 b(defpackage.mx8 r5, defpackage.b55 r6, defpackage.p92 r7) {
        /*
            boolean r0 = r7 instanceof defpackage.ya9
            if (r0 == 0) goto L13
            r0 = r7
            ya9 r0 = (defpackage.ya9) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.c = r1
            goto L18
        L13:
            ya9 r0 = new ya9
            r0.<init>(r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.c
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L38
            if (r2 == r4) goto L34
            r5 = 2
            if (r2 == r5) goto L2d
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2d:
            defpackage.br7.v(r7)
            defpackage.z72.b()
            return r3
        L34:
            defpackage.br7.v(r7)
            goto L46
        L38:
            defpackage.br7.v(r7)
            r0.c = r4
            mn r5 = (defpackage.mn) r5
            tb2 r5 = r5.K(r6, r0)
            if (r5 != r1) goto L46
            return r1
        L46:
            defpackage.z72.b()
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.za9.b(mx8, b55, p92):tb2");
    }
}
