package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sa implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public sa(do4 do4Var, ms msVar, h00 h00Var, lt5 lt5Var, long j) {
        this.a = 27;
        this.d = do4Var;
        this.b = h00Var;
        this.c = lt5Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0034  */
    /* JADX WARN: Removed duplicated region for block: B:173:0x0322  */
    /* JADX WARN: Removed duplicated region for block: B:194:0x037b  */
    /* JADX WARN: Removed duplicated region for block: B:215:0x03cb  */
    /* JADX WARN: Removed duplicated region for block: B:286:0x0586  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00e5  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x010c  */
    @Override // defpackage.do4
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.Object r29, defpackage.n92 r30) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 2198
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sa.a(java.lang.Object, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:51:0x00eb A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object b(defpackage.fb0 r13, defpackage.n92 r14) {
        /*
            Method dump skipped, instruction units count: 240
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sa.b(fb0, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00f7 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00f8 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object c(defpackage.gd4 r21, defpackage.n92 r22) {
        /*
            Method dump skipped, instruction units count: 257
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sa.c(gd4, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x00ab A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object d(defpackage.yt4 r20, defpackage.n92 r21) {
        /*
            r19 = this;
            r0 = r19
            r1 = r20
            r2 = r21
            java.lang.Object r3 = r0.d
            do4 r3 = (defpackage.do4) r3
            boolean r4 = r2 instanceof defpackage.pu4
            if (r4 == 0) goto L1d
            r4 = r2
            pu4 r4 = (defpackage.pu4) r4
            int r5 = r4.e
            r6 = -2147483648(0xffffffff80000000, float:-0.0)
            r7 = r5 & r6
            if (r7 == 0) goto L1d
            int r5 = r5 - r6
            r4.e = r5
            goto L22
        L1d:
            pu4 r4 = new pu4
            r4.<init>(r0, r2)
        L22:
            java.lang.Object r2 = r4.c
            tb2 r5 = defpackage.tb2.COROUTINE_SUSPENDED
            int r6 = r4.e
            c1e r7 = defpackage.c1e.a
            r8 = 3
            r9 = 2
            r10 = 1
            r11 = 0
            if (r6 == 0) goto L4a
            if (r6 == r10) goto L44
            if (r6 == r9) goto L40
            if (r6 != r8) goto L3a
            defpackage.br7.v(r2)
            return r7
        L3a:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r11
        L40:
            defpackage.br7.v(r2)
            return r7
        L44:
            do4 r3 = r4.b
            defpackage.br7.v(r2)
            goto L62
        L4a:
            defpackage.br7.v(r2)
            boolean r2 = r1 instanceof defpackage.wt4
            if (r2 == 0) goto L6d
            java.lang.Object r0 = r0.b
            qu4 r0 = (defpackage.qu4) r0
            yd4 r1 = defpackage.yd4.NetworkOnly
            r4.b = r3
            r4.e = r10
            java.lang.Object r2 = r0.h(r1, r4)
            if (r2 != r5) goto L62
            goto Laa
        L62:
            r4.b = r11
            r4.e = r9
            java.lang.Object r0 = r3.a(r2, r4)
            if (r0 != r5) goto Lab
            goto Laa
        L6d:
            boolean r2 = r1 instanceof defpackage.xt4
            if (r2 == 0) goto Lac
            java.lang.Object r0 = r0.c
            ju4 r0 = (defpackage.ju4) r0
            r0.getClass()
            gu4 r0 = (defpackage.gu4) r0
            xt4 r1 = (defpackage.xt4) r1
            boolean r1 = r1.a
            java.lang.String r10 = r0.a
            com.medium.android.core.models.EntityType r11 = r0.b
            java.lang.String r12 = r0.c
            java.lang.String r13 = r0.d
            zw7 r14 = r0.e
            java.lang.String r15 = r0.f
            boolean r2 = r0.h
            gen.model.SourceParameter r0 = r0.i
            r10.getClass()
            r11.getClass()
            r0.getClass()
            gu4 r9 = new gu4
            r18 = r0
            r16 = r1
            r17 = r2
            r9.<init>(r10, r11, r12, r13, r14, r15, r16, r17, r18)
            r4.e = r8
            java.lang.Object r0 = r3.a(r9, r4)
            if (r0 != r5) goto Lab
        Laa:
            return r5
        Lab:
            return r7
        Lac:
            defpackage.ygf.a()
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sa.d(yt4, n92):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x00a5, code lost:
    
        if (r0.a(r10, r2) != r3) goto L36;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object e(defpackage.ct8 r11, defpackage.n92 r12) {
        /*
            r10 = this;
            java.lang.Object r0 = r10.d
            do4 r0 = (defpackage.do4) r0
            java.lang.Object r1 = r10.c
            rya r1 = (defpackage.rya) r1
            boolean r2 = r12 instanceof defpackage.dt8
            if (r2 == 0) goto L1b
            r2 = r12
            dt8 r2 = (defpackage.dt8) r2
            int r3 = r2.f
            r4 = -2147483648(0xffffffff80000000, float:-0.0)
            r5 = r3 & r4
            if (r5 == 0) goto L1b
            int r3 = r3 - r4
            r2.f = r3
            goto L20
        L1b:
            dt8 r2 = new dt8
            r2.<init>(r10, r12)
        L20:
            java.lang.Object r12 = r2.d
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            int r4 = r2.f
            r5 = 4
            r6 = 3
            r7 = 2
            r8 = 1
            r9 = 0
            if (r4 == 0) goto L50
            if (r4 == r8) goto L4c
            if (r4 == r7) goto L4c
            if (r4 == r6) goto L40
            if (r4 != r5) goto L3a
            defpackage.br7.v(r12)
            goto La8
        L3a:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            return r9
        L40:
            et8 r10 = r2.c
            rya r11 = r2.b
            defpackage.br7.v(r12)
            bjb r12 = (defpackage.bjb) r12
            java.lang.Object r12 = r12.a
            goto L90
        L4c:
            defpackage.br7.v(r12)
            goto L7a
        L50:
            defpackage.br7.v(r12)
            if (r11 == 0) goto Lab
            java.lang.Object r11 = r1.a
            bt8 r11 = (defpackage.bt8) r11
            boolean r12 = r11 instanceof defpackage.at8
            if (r12 == 0) goto L6f
            at8 r11 = (defpackage.at8) r11
            java.util.List r11 = r11.a
            at8 r12 = new at8
            r12.<init>(r11, r8)
            r2.f = r8
            java.lang.Object r11 = r0.a(r12, r2)
            if (r11 != r3) goto L7a
            goto La7
        L6f:
            r2.f = r7
            zs8 r11 = defpackage.zs8.a
            java.lang.Object r11 = r0.a(r11, r2)
            if (r11 != r3) goto L7a
            goto La7
        L7a:
            java.lang.Object r10 = r10.b
            et8 r10 = (defpackage.et8) r10
            hs8 r11 = r10.a
            yd4 r12 = defpackage.yd4.NetworkFirst
            r2.b = r1
            r2.c = r10
            r2.f = r6
            java.lang.Object r12 = r11.d(r12, r2)
            if (r12 != r3) goto L8f
            goto La7
        L8f:
            r11 = r1
        L90:
            r10.getClass()
            bt8 r10 = defpackage.et8.a(r12)
            r11.a = r10
            java.lang.Object r10 = r1.a
            r2.b = r9
            r2.c = r9
            r2.f = r5
            java.lang.Object r10 = r0.a(r10, r2)
            if (r10 != r3) goto La8
        La7:
            return r3
        La8:
            c1e r10 = defpackage.c1e.a
            return r10
        Lab:
            defpackage.ygf.a()
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sa.e(ct8, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0021  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object f(final defpackage.lk9 r14, defpackage.n92 r15) {
        /*
            Method dump skipped, instruction units count: 235
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sa.f(lk9, n92):java.lang.Object");
    }

    public /* synthetic */ sa(do4 do4Var, Object obj, Object obj2, int i) {
        this.a = i;
        this.d = do4Var;
        this.b = obj;
        this.c = obj2;
    }

    public /* synthetic */ sa(rya ryaVar, do4 do4Var, Object obj, int i) {
        this.a = i;
        this.c = ryaVar;
        this.d = do4Var;
        this.b = obj;
    }

    public /* synthetic */ sa(Serializable serializable, do4 do4Var, Object obj, int i) {
        this.a = i;
        this.b = serializable;
        this.d = do4Var;
        this.c = obj;
    }

    public /* synthetic */ sa(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }
}
