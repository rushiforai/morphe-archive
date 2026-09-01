package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mu2 implements tt2 {
    public final wg4 a;
    public final yl3 b;
    public final sb2 c;
    public final u50 d;
    public int f;
    public enc g;
    public final n0c i;
    public final o2b l;
    public final a98 e = new a98();
    public final olb h = new olb(10);
    public final w5d j = new w5d(new yt2(this, 1));
    public final w5d k = new w5d(new yt2(this, 0));

    public mu2(wg4 wg4Var, List list, yl3 yl3Var, sb2 sb2Var) {
        this.a = wg4Var;
        this.b = yl3Var;
        this.c = sb2Var;
        n92 n92Var = null;
        this.d = new u50(12, new l0(this, n92Var, 29));
        this.i = new n0c(this, list);
        this.l = new o2b(sb2Var, new ce(15, this), new r91(this, n92Var, 20));
    }

    @Override // defpackage.tt2
    public final Object a(b55 b55Var, p92 p92Var) {
        q5e q5eVar = (q5e) p92Var.getContext().o0(hpe.j);
        if (q5eVar != null) {
            q5eVar.a(this);
        }
        return vx0.m0(new q5e(q5eVar, this), new ku2(this, b55Var, null, 0), p92Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.p92 r6) {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.cu2
            if (r0 == 0) goto L13
            r0 = r6
            cu2 r0 = (defpackage.cu2) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            cu2 r0 = new cu2
            r0.<init>(r5, r6)
        L18:
            java.lang.Object r6 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2e
            a98 r5 = r0.c
            mu2 r0 = r0.b
            defpackage.br7.v(r6)
            r6 = r5
            r5 = r0
            goto L46
        L2e:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r4
        L34:
            defpackage.br7.v(r6)
            r0.b = r5
            a98 r6 = r5.e
            r0.c = r6
            r0.f = r3
            java.lang.Object r0 = r6.m(r0, r4)
            if (r0 != r1) goto L46
            return r1
        L46:
            int r0 = r5.f     // Catch: java.lang.Throwable -> L56
            int r0 = r0 + (-1)
            r5.f = r0     // Catch: java.lang.Throwable -> L56
            if (r0 != 0) goto L5a
            enc r0 = r5.g     // Catch: java.lang.Throwable -> L56
            if (r0 == 0) goto L58
            r0.m(r4)     // Catch: java.lang.Throwable -> L56
            goto L58
        L56:
            r5 = move-exception
            goto L60
        L58:
            r5.g = r4     // Catch: java.lang.Throwable -> L56
        L5a:
            r6.f(r4)
            c1e r5 = defpackage.c1e.a
            return r5
        L60:
            r6.f(r4)
            throw r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mu2.b(p92):java.lang.Object");
    }

    public final b56 c() {
        return (b56) this.k.getValue();
    }

    /* JADX WARN: Can't wrap try/catch for region: R(8:0|2|(2:4|(1:6)(1:7))(0)|8|(8:68|(1:(1:(2:18|19))(3:20|21|22))|13|14|62|(1:64)(1:65)|66|67)(5:23|73|24|(3:26|71|27)(3:37|(1:39)(1:40)|(2:42|(2:44|(1:46))(2:53|54))(2:55|(2:57|58)(2:59|60)))|50)|47|69|48) */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x006f, code lost:
    
        if (r9 == r1) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0072, code lost:
    
        r8 = r11;
        r11 = r9;
        r9 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00b3, code lost:
    
        if (r9 == r1) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x00b6, code lost:
    
        r9 = th;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r9v0, types: [mu2] */
    /* JADX WARN: Type inference failed for: r9v10 */
    /* JADX WARN: Type inference failed for: r9v12 */
    /* JADX WARN: Type inference failed for: r9v16 */
    /* JADX WARN: Type inference failed for: r9v23 */
    /* JADX WARN: Type inference failed for: r9v24 */
    /* JADX WARN: Type inference failed for: r9v25 */
    /* JADX WARN: Type inference failed for: r9v4 */
    /* JADX WARN: Type inference failed for: r9v6, types: [mu2] */
    /* JADX WARN: Type inference failed for: r9v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(defpackage.vy7 r10, defpackage.p92 r11) {
        /*
            Method dump skipped, instruction units count: 230
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mu2.d(vy7, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(defpackage.p92 r6) {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.eu2
            if (r0 == 0) goto L13
            r0 = r6
            eu2 r0 = (defpackage.eu2) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            eu2 r0 = new eu2
            r0.<init>(r5, r6)
        L18:
            java.lang.Object r6 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2e
            a98 r5 = r0.c
            mu2 r0 = r0.b
            defpackage.br7.v(r6)
            r6 = r5
            r5 = r0
            goto L46
        L2e:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r4
        L34:
            defpackage.br7.v(r6)
            r0.b = r5
            a98 r6 = r5.e
            r0.c = r6
            r0.f = r3
            java.lang.Object r0 = r6.m(r0, r4)
            if (r0 != r1) goto L46
            return r1
        L46:
            int r0 = r5.f     // Catch: java.lang.Throwable -> L5c
            int r0 = r0 + r3
            r5.f = r0     // Catch: java.lang.Throwable -> L5c
            if (r0 != r3) goto L5e
            sb2 r0 = r5.c     // Catch: java.lang.Throwable -> L5c
            zt2 r1 = new zt2     // Catch: java.lang.Throwable -> L5c
            r1.<init>(r5, r4, r3)     // Catch: java.lang.Throwable -> L5c
            r2 = 3
            enc r0 = defpackage.vx0.c0(r0, r4, r4, r1, r2)     // Catch: java.lang.Throwable -> L5c
            r5.g = r0     // Catch: java.lang.Throwable -> L5c
            goto L5e
        L5c:
            r5 = move-exception
            goto L64
        L5e:
            r6.f(r4)
            c1e r5 = defpackage.c1e.a
            return r5
        L64:
            r6.f(r4)
            throw r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mu2.e(p92):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x0061, code lost:
    
        if (r2.f0(r0) == r1) goto L26;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(defpackage.p92 r7) throws java.lang.Throwable {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.fu2
            if (r0 == 0) goto L13
            r0 = r7
            fu2 r0 = (defpackage.fu2) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            fu2 r0 = new fu2
            r0.<init>(r6, r7)
        L18:
            java.lang.Object r7 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 2
            r4 = 1
            if (r2 == 0) goto L3d
            if (r2 == r4) goto L37
            if (r2 != r3) goto L30
            int r6 = r0.c
            mu2 r0 = r0.b
            defpackage.br7.v(r7)     // Catch: java.lang.Throwable -> L2e
            goto L64
        L2e:
            r7 = move-exception
            goto L6c
        L30:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L37:
            mu2 r6 = r0.b
            defpackage.br7.v(r7)
            goto L4f
        L3d:
            defpackage.br7.v(r7)
            b56 r7 = r6.c()
            r0.b = r6
            r0.f = r4
            java.lang.Object r7 = r7.b(r0)
            if (r7 != r1) goto L4f
            goto L63
        L4f:
            java.lang.Number r7 = (java.lang.Number) r7
            int r7 = r7.intValue()
            n0c r2 = r6.i     // Catch: java.lang.Throwable -> L67
            r0.b = r6     // Catch: java.lang.Throwable -> L67
            r0.c = r7     // Catch: java.lang.Throwable -> L67
            r0.f = r3     // Catch: java.lang.Throwable -> L67
            java.lang.Object r6 = r2.f0(r0)     // Catch: java.lang.Throwable -> L67
            if (r6 != r1) goto L64
        L63:
            return r1
        L64:
            c1e r6 = defpackage.c1e.a
            return r6
        L67:
            r0 = move-exception
            r5 = r0
            r0 = r6
            r6 = r7
            r7 = r5
        L6c:
            olb r0 = r0.h
            cta r1 = new cta
            r1.<init>(r6, r7)
            r0.y(r1)
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mu2.f(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x00c2  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(boolean r10, defpackage.n92 r11) {
        /*
            Method dump skipped, instruction units count: 206
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mu2.g(boolean, n92):java.lang.Object");
    }

    @Override // defpackage.tt2
    public final bo4 getData() {
        return this.d;
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x00ac A[Catch: CorruptionException -> 0x005f, TryCatch #3 {CorruptionException -> 0x005f, blocks: (B:19:0x005a, B:54:0x0108, B:24:0x0068, B:51:0x00eb, B:32:0x0085, B:40:0x00ac, B:42:0x00b2, B:36:0x008f, B:48:0x00d9), top: B:83:0x0022 }] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00c8  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0107  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0147 A[Catch: all -> 0x0173, TryCatch #1 {all -> 0x0173, blocks: (B:61:0x0135, B:63:0x0147, B:64:0x014f), top: B:80:0x0135 }] */
    /* JADX WARN: Removed duplicated region for block: B:64:0x014f A[Catch: all -> 0x0173, TRY_LEAVE, TryCatch #1 {all -> 0x0173, blocks: (B:61:0x0135, B:63:0x0147, B:64:0x014f), top: B:80:0x0135 }] */
    /* JADX WARN: Removed duplicated region for block: B:67:0x015f  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0167  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object h(boolean r11, defpackage.p92 r12) {
        /*
            Method dump skipped, instruction units count: 396
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mu2.h(boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object i(java.lang.Object r11, boolean r12, defpackage.p92 r13) {
        /*
            r10 = this;
            boolean r0 = r13 instanceof defpackage.lu2
            if (r0 == 0) goto L13
            r0 = r13
            lu2 r0 = (defpackage.lu2) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            lu2 r0 = new lu2
            r0.<init>(r10, r13)
        L18:
            java.lang.Object r13 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L30
            if (r2 != r3) goto L29
            pya r10 = r0.b
            defpackage.br7.v(r13)
            goto L55
        L29:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            r10 = 0
            return r10
        L30:
            defpackage.br7.v(r13)
            pya r5 = new pya
            r5.<init>()
            w5d r13 = r10.j
            java.lang.Object r13 = r13.getValue()
            zg4 r13 = (defpackage.zg4) r13
            oz r4 = new oz
            r9 = 0
            r6 = r10
            r7 = r11
            r8 = r12
            r4.<init>(r5, r6, r7, r8, r9)
            r0.b = r5
            r0.e = r3
            java.lang.Object r10 = r13.b(r4, r0)
            if (r10 != r1) goto L54
            return r1
        L54:
            r10 = r5
        L55:
            int r10 = r10.a
            java.lang.Integer r11 = new java.lang.Integer
            r11.<init>(r10)
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mu2.i(java.lang.Object, boolean, p92):java.lang.Object");
    }
}
