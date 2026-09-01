package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class aha extends p4d implements b55 {
    public Object b;
    public int c;
    public final /* synthetic */ fha d;
    public final /* synthetic */ eea e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public aha(fha fhaVar, eea eeaVar, n92 n92Var) {
        super(2, n92Var);
        this.d = fhaVar;
        this.e = eeaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new aha(this.d, this.e, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((aha) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x0082, code lost:
    
        if (r11.a(r2, r10) == r0) goto L32;
     */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0073  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r11) {
        /*
            r10 = this;
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r10.c
            r2 = 0
            r3 = 3
            eea r4 = r10.e
            fha r5 = r10.d
            r6 = 2
            r7 = 1
            if (r1 == 0) goto L2f
            if (r1 == r7) goto L26
            if (r1 == r6) goto L20
            if (r1 != r3) goto L19
            defpackage.br7.v(r11)
            goto L85
        L19:
            r10 = 0
            java.lang.String r10 = com.medium.android.donkey.main.Wv.MaAxRJinch.msprGLl
            defpackage.ygf.f(r10)
            return r2
        L20:
            java.lang.Object r1 = r10.b
            defpackage.br7.v(r11)
            goto L6d
        L26:
            defpackage.br7.v(r11)
            bjb r11 = (defpackage.bjb) r11
            java.lang.Object r11 = r11.a
        L2d:
            r1 = r11
            goto L54
        L2f:
            defpackage.br7.v(r11)
            gl9 r11 = r5.m
            java.lang.String r1 = r5.b
            int[] r8 = defpackage.zga.a
            int r9 = r4.ordinal()
            r8 = r8[r9]
            if (r8 == r7) goto L49
            if (r8 != r6) goto L45
            com.medium.android.graphql.type.PostVisibilityType r2 = com.medium.android.graphql.type.PostVisibilityType.UNLISTED
            goto L4b
        L45:
            defpackage.ygf.a()
            return r2
        L49:
            com.medium.android.graphql.type.PostVisibilityType r2 = com.medium.android.graphql.type.PostVisibilityType.PUBLIC
        L4b:
            r10.c = r7
            java.lang.Object r11 = r11.i(r1, r2, r10)
            if (r11 != r0) goto L2d
            goto L84
        L54:
            boolean r11 = r1 instanceof defpackage.ajb
            if (r11 != 0) goto L6d
            r11 = r1
            com.medium.android.graphql.SetPostVisibilityMutation$Data r11 = (com.medium.android.graphql.SetPostVisibilityMutation.Data) r11
            r6c r11 = r5.t
            ffa r2 = new ffa
            r2.<init>(r4)
            r10.b = r1
            r10.c = r6
            java.lang.Object r11 = r11.a(r2, r10)
            if (r11 != r0) goto L6d
            goto L84
        L6d:
            java.lang.Throwable r11 = defpackage.bjb.b(r1)
            if (r11 == 0) goto L85
            r6c r11 = r5.r
            pfa r2 = new pfa
            r2.<init>(r4)
            r10.b = r1
            r10.c = r3
            java.lang.Object r10 = r11.a(r2, r10)
            if (r10 != r0) goto L85
        L84:
            return r0
        L85:
            c1e r10 = defpackage.c1e.a
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.aha.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
