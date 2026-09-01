package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ss8 implements do4 {
    public final /* synthetic */ do4 a;
    public final /* synthetic */ rya b;
    public final /* synthetic */ ts8 c;
    public final /* synthetic */ String d;

    public ss8(do4 do4Var, rya ryaVar, ts8 ts8Var, String str) {
        this.a = do4Var;
        this.b = ryaVar;
        this.c = ts8Var;
        this.d = str;
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x0094, code lost:
    
        if (r3.a(r9, r0) != r1) goto L34;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.do4
    /* JADX INFO: renamed from: b, reason: merged with bridge method [inline-methods] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.ps8 r10, defpackage.n92 r11) {
        /*
            r9 = this;
            boolean r0 = r11 instanceof defpackage.rs8
            if (r0 == 0) goto L13
            r0 = r11
            rs8 r0 = (defpackage.rs8) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            rs8 r0 = new rs8
            r0.<init>(r9, r11)
        L18:
            java.lang.Object r11 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            do4 r3 = r9.a
            r4 = 3
            r5 = 2
            rya r6 = r9.b
            r7 = 1
            r8 = 0
            if (r2 == 0) goto L48
            if (r2 == r7) goto L44
            if (r2 == r5) goto L38
            if (r2 != r4) goto L32
            defpackage.br7.v(r11)
            goto L97
        L32:
            java.lang.String r9 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r9)
            return r8
        L38:
            ts8 r9 = r0.c
            rya r10 = r0.b
            defpackage.br7.v(r11)
            bjb r11 = (defpackage.bjb) r11
            java.lang.Object r11 = r11.a
            goto L7f
        L44:
            defpackage.br7.v(r11)
            goto L67
        L48:
            defpackage.br7.v(r11)
            if (r10 == 0) goto L9a
            java.lang.Object r10 = r6.a
            os8 r10 = (defpackage.os8) r10
            boolean r11 = r10 instanceof defpackage.ns8
            if (r11 == 0) goto L5c
            ns8 r10 = (defpackage.ns8) r10
            ns8 r10 = defpackage.ns8.a(r10, r8, r7)
            goto L5e
        L5c:
            ms8 r10 = defpackage.ms8.a
        L5e:
            r0.f = r7
            java.lang.Object r10 = r3.a(r10, r0)
            if (r10 != r1) goto L67
            goto L96
        L67:
            ts8 r10 = r9.c
            hs8 r11 = r10.a
            yd4 r2 = defpackage.yd4.NetworkFirst
            r0.b = r6
            r0.c = r10
            r0.f = r5
            r5 = 5
            java.lang.String r9 = r9.d
            java.lang.Object r11 = r11.c(r5, r0, r2, r9)
            if (r11 != r1) goto L7d
            goto L96
        L7d:
            r9 = r10
            r10 = r6
        L7f:
            r9.getClass()
            os8 r9 = defpackage.ts8.a(r11)
            r10.a = r9
            java.lang.Object r9 = r6.a
            r0.b = r8
            r0.c = r8
            r0.f = r4
            java.lang.Object r9 = r3.a(r9, r0)
            if (r9 != r1) goto L97
        L96:
            return r1
        L97:
            c1e r9 = defpackage.c1e.a
            return r9
        L9a:
            defpackage.ygf.a()
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ss8.a(ps8, n92):java.lang.Object");
    }
}
