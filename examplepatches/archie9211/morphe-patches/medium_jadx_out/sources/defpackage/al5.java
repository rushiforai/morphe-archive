package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class al5 extends p4d implements b55 {
    public Object b;
    public int c;
    public final /* synthetic */ dl5 d;
    public final /* synthetic */ String e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public al5(dl5 dl5Var, String str, n92 n92Var) {
        super(2, n92Var);
        this.d = dl5Var;
        this.e = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new al5(this.d, this.e, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((al5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x00b9, code lost:
    
        if (r11.a(r2, r25) == r14) goto L24;
     */
    /* JADX WARN: Removed duplicated region for block: B:22:0x00a7  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r26) {
        /*
            r25 = this;
            r10 = r25
            dl5 r0 = r10.d
            r6c r11 = r0.k
            gen.model.SourceParameter r12 = r0.d
            com.medium.android.core.navigation.HighlightReference r13 = r0.b
            tb2 r14 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r10.c
            r15 = 3
            r2 = 2
            r3 = 1
            if (r1 == 0) goto L37
            if (r1 == r3) goto L2c
            if (r1 == r2) goto L25
            if (r1 != r15) goto L1e
            defpackage.br7.v(r26)
            goto Lbc
        L1e:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            r0 = 0
            return r0
        L25:
            java.lang.Object r0 = r10.b
            defpackage.br7.v(r26)
            goto La1
        L2c:
            defpackage.br7.v(r26)
            r0 = r26
            bjb r0 = (defpackage.bjb) r0
            java.lang.Object r0 = r0.a
            r15 = r2
            goto L6d
        L37:
            defpackage.br7.v(r26)
            jf2 r1 = r0.g
            r4 = r1
            java.lang.String r1 = r13.getPostId()
            java.lang.String r5 = r13.getParagraphName()
            int r6 = r13.getStartOffset()
            r7 = r4
            int r4 = r13.getEndOffset()
            r8 = r7
            java.lang.String r7 = r0.c
            r9 = r6
            com.medium.android.core.models.HighlightType r6 = com.medium.android.core.models.HighlightType.RESPONSE
            r16 = r8
            java.lang.String r8 = defpackage.gp7.u(r12)
            java.lang.String r0 = r0.e
            r10.c = r3
            r3 = r2
            java.lang.String r2 = r10.e
            r15 = r3
            r3 = r9
            r9 = r0
            r0 = r16
            java.lang.Object r0 = r0.a(r1, r2, r3, r4, r5, r6, r7, r8, r9, r10)
            if (r0 != r14) goto L6d
            goto Lbb
        L6d:
            boolean r1 = r0 instanceof defpackage.ajb
            if (r1 != 0) goto La1
            r1 = r0
            com.medium.android.domain.post.models.Highlight r1 = (com.medium.android.domain.post.models.Highlight) r1
            lk5 r2 = new lk5
            com.medium.android.core.navigation.ResponsesReference$Post r17 = new com.medium.android.core.navigation.ResponsesReference$Post
            java.lang.String r18 = r13.getPostId()
            java.lang.String r19 = r1.getId()
            com.medium.android.core.navigation.ResponsesReference$WriteState$Answer r22 = com.medium.android.core.navigation.ResponsesReference.WriteState.Answer.INSTANCE
            r23 = 12
            r24 = 0
            r20 = 0
            r21 = 0
            r17.<init>(r18, r19, r20, r21, r22, r23, r24)
            r1 = r17
            java.lang.String r3 = defpackage.gp7.u(r12)
            r2.<init>(r1, r3)
            r10.b = r0
            r10.c = r15
            java.lang.Object r1 = r11.a(r2, r10)
            if (r1 != r14) goto La1
            goto Lbb
        La1:
            java.lang.Throwable r1 = defpackage.bjb.b(r0)
            if (r1 == 0) goto Lbc
            jk5 r2 = new jk5
            b24 r1 = defpackage.m4.I(r1)
            r2.<init>(r1)
            r10.b = r0
            r0 = 3
            r10.c = r0
            java.lang.Object r0 = r11.a(r2, r10)
            if (r0 != r14) goto Lbc
        Lbb:
            return r14
        Lbc:
            c1e r0 = defpackage.c1e.a
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.al5.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
