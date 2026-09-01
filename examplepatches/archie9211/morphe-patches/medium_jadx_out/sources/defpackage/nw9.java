package defpackage;

import com.medium.android.graphql.fragment.ParagraphData;
import com.medium.android.graphql.fragment.PostMetaData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nw9 extends p4d implements b55 {
    public Object b;
    public int c;
    public final /* synthetic */ sw9 d;
    public final /* synthetic */ PostMetaData e;
    public final /* synthetic */ qxb f;
    public final /* synthetic */ ParagraphData g;
    public final /* synthetic */ n39 h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nw9(sw9 sw9Var, PostMetaData postMetaData, qxb qxbVar, ParagraphData paragraphData, n39 n39Var, n92 n92Var) {
        super(2, n92Var);
        this.d = sw9Var;
        this.e = postMetaData;
        this.f = qxbVar;
        this.g = paragraphData;
        this.h = n39Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new nw9(this.d, this.e, this.f, this.g, this.h, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((nw9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x00bb, code lost:
    
        if (r12.a(r2, r26) == r13) goto L26;
     */
    /* JADX WARN: Removed duplicated region for block: B:24:0x00aa  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r27) {
        /*
            r26 = this;
            r10 = r26
            sw9 r11 = r10.d
            r6c r12 = r11.x0
            tb2 r13 = defpackage.tb2.COROUTINE_SUSPENDED
            int r0 = r10.c
            r1 = 0
            r14 = 3
            r15 = 2
            r2 = 1
            com.medium.android.graphql.fragment.PostMetaData r3 = r10.e
            if (r0 == 0) goto L36
            if (r0 == r2) goto L2a
            if (r0 == r15) goto L23
            if (r0 != r14) goto L1d
            defpackage.br7.v(r27)
            goto Lbe
        L1d:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r1
        L23:
            java.lang.Object r0 = r10.b
            defpackage.br7.v(r27)
            goto La4
        L2a:
            defpackage.br7.v(r27)
            r0 = r27
            bjb r0 = (defpackage.bjb) r0
            java.lang.Object r0 = r0.a
            r17 = r3
            goto L6d
        L36:
            defpackage.br7.v(r27)
            jf2 r0 = r11.x
            r4 = r1
            java.lang.String r1 = r3.getId()
            java.lang.String r5 = r3.getLatestPublishedVersion()
            qxb r6 = r10.f
            r7 = r3
            int r3 = r6.a
            int r6 = r6.b
            com.medium.android.graphql.fragment.ParagraphData r8 = r10.g
            java.lang.String r8 = r8.getName()
            if (r8 == 0) goto Lc1
            r4 = r6
            com.medium.android.core.models.HighlightType r6 = com.medium.android.core.models.HighlightType.RESPONSE
            r9 = r7
            java.lang.String r7 = r11.d
            r16 = r5
            r5 = r8
            java.lang.String r8 = r11.F0
            r17 = r9
            java.lang.String r9 = r11.D0
            r10.c = r2
            r2 = r16
            java.lang.Object r0 = r0.a(r1, r2, r3, r4, r5, r6, r7, r8, r9, r10)
            if (r0 != r13) goto L6d
            goto Lbd
        L6d:
            boolean r1 = r0 instanceof defpackage.ajb
            if (r1 != 0) goto La4
            r1 = r0
            com.medium.android.domain.post.models.Highlight r1 = (com.medium.android.domain.post.models.Highlight) r1
            n39 r2 = r10.h
            r2.e(r1)
            dt9 r2 = new dt9
            com.medium.android.core.navigation.ResponsesReference$Post r18 = new com.medium.android.core.navigation.ResponsesReference$Post
            java.lang.String r19 = r17.getId()
            java.lang.String r20 = r1.getId()
            com.medium.android.core.navigation.ResponsesReference$WriteState$Answer r23 = com.medium.android.core.navigation.ResponsesReference.WriteState.Answer.INSTANCE
            r24 = 12
            r25 = 0
            r21 = 0
            r22 = 0
            r18.<init>(r19, r20, r21, r22, r23, r24, r25)
            r1 = r18
            java.lang.String r3 = r11.F0
            r2.<init>(r1, r3)
            r10.b = r0
            r10.c = r15
            java.lang.Object r1 = r12.a(r2, r10)
            if (r1 != r13) goto La4
            goto Lbd
        La4:
            java.lang.Throwable r1 = defpackage.bjb.b(r0)
            if (r1 == 0) goto Lbe
            ms9 r2 = new ms9
            b24 r1 = defpackage.m4.I(r1)
            r2.<init>(r1)
            r10.b = r0
            r10.c = r14
            java.lang.Object r0 = r12.a(r2, r10)
            if (r0 != r13) goto Lbe
        Lbd:
            return r13
        Lbe:
            c1e r0 = defpackage.c1e.a
            return r0
        Lc1:
            r6 = r4
            java.lang.String r0 = "Paragraph name cannot be null"
            defpackage.ay0.e(r0)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nw9.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
