package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cd8 {
    public hd8 a;
    public hd8 b;
    public m45 c = new ir(28, this);
    public sb2 d;

    /* JADX WARN: Code restructure failed: missing block: B:26:0x0052, code lost:
    
        if (r0 == r1) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x006b, code lost:
    
        if (r0 == r1) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x006d, code lost:
    
        return r1;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(long r9, long r11, defpackage.p92 r13) {
        /*
            r8 = this;
            boolean r0 = r13 instanceof defpackage.ad8
            if (r0 == 0) goto L14
            r0 = r13
            ad8 r0 = (defpackage.ad8) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.d = r1
        L12:
            r13 = r0
            goto L1a
        L14:
            ad8 r0 = new ad8
            r0.<init>(r8, r13)
            goto L12
        L1a:
            java.lang.Object r0 = r13.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r13.d
            r3 = 0
            r4 = 2
            r5 = 1
            if (r2 == 0) goto L37
            if (r2 == r5) goto L33
            if (r2 != r4) goto L2d
            defpackage.br7.v(r0)
            goto L6e
        L2d:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r3
        L33:
            defpackage.br7.v(r0)
            goto L55
        L37:
            defpackage.br7.v(r0)
            hd8 r0 = r8.a
            if (r0 == 0) goto L43
            hd8 r0 = r0.J0()
            goto L44
        L43:
            r0 = r3
        L44:
            r6 = 0
            if (r0 != 0) goto L5a
            hd8 r8 = r8.b
            if (r8 == 0) goto L72
            r13.d = r5
            java.lang.Object r0 = r8.A(r9, r11, r13)
            if (r0 != r1) goto L55
            goto L6d
        L55:
            qre r0 = (defpackage.qre) r0
            long r6 = r0.a
            goto L72
        L5a:
            hd8 r8 = r8.a
            if (r8 == 0) goto L62
            hd8 r3 = r8.J0()
        L62:
            r8 = r3
            if (r8 == 0) goto L72
            r13.d = r4
            java.lang.Object r0 = r8.A(r9, r11, r13)
            if (r0 != r1) goto L6e
        L6d:
            return r1
        L6e:
            qre r0 = (defpackage.qre) r0
            long r6 = r0.a
        L72:
            qre r8 = new qre
            r8.<init>(r6)
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cd8.a(long, long, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(long r6, defpackage.p92 r8) {
        /*
            r5 = this;
            boolean r0 = r8 instanceof defpackage.bd8
            if (r0 == 0) goto L13
            r0 = r8
            bd8 r0 = (defpackage.bd8) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            bd8 r0 = new bd8
            r0.<init>(r5, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 != r4) goto L28
            defpackage.br7.v(r8)
            goto L44
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2e:
            defpackage.br7.v(r8)
            hd8 r5 = r5.a
            if (r5 == 0) goto L39
            hd8 r3 = r5.J0()
        L39:
            if (r3 == 0) goto L49
            r0.d = r4
            java.lang.Object r8 = r3.j0(r6, r0)
            if (r8 != r1) goto L44
            return r1
        L44:
            qre r8 = (defpackage.qre) r8
            long r5 = r8.a
            goto L4b
        L49:
            r5 = 0
        L4b:
            qre r7 = new qre
            r7.<init>(r5)
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cd8.b(long, p92):java.lang.Object");
    }

    public final sb2 c() {
        sb2 sb2Var = (sb2) this.c.invoke();
        if (sb2Var != null) {
            return sb2Var;
        }
        ygf.f("in order to access nested coroutine scope you need to attach dispatcher to the `Modifier.nestedScroll` first.");
        return null;
    }

    public final hd8 d() {
        hd8 hd8Var = this.a;
        if (hd8Var != null) {
            return hd8Var.J0();
        }
        return null;
    }
}
