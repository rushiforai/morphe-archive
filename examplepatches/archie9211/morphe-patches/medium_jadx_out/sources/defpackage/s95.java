package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class s95 {
    public final dd3 a;

    public s95(dd3 dd3Var) {
        dd3Var.getClass();
        this.a = dd3Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r7 = this;
            boolean r0 = r9 instanceof defpackage.r95
            if (r0 == 0) goto L13
            r0 = r9
            r95 r0 = (defpackage.r95) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            r95 r0 = new r95
            r0.<init>(r7, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            r5 = 0
            if (r2 == 0) goto L33
            if (r2 != r3) goto L2d
            defpackage.br7.v(r9)
            bjb r9 = (defpackage.bjb) r9
            java.lang.Object r7 = r9.a
            goto L4a
        L2d:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r5
        L33:
            defpackage.br7.v(r9)
            uld r9 = defpackage.wld.a
            java.lang.Object[] r2 = new java.lang.Object[r4]
            java.lang.String r6 = "Get digest history"
            defpackage.km4.I(r9, r5, r6, r2, r6)
            r0.d = r3
            dd3 r7 = r7.a
            java.lang.Object r7 = r7.b(r8, r0)
            if (r7 != r1) goto L4a
            return r1
        L4a:
            boolean r8 = r7 instanceof defpackage.ajb
            if (r8 != 0) goto L89
            com.medium.android.graphql.DigestHistoryQuery$OnDigestsConnection r7 = (com.medium.android.graphql.DigestHistoryQuery.OnDigestsConnection) r7
            java.util.List r7 = r7.getEdges()
            java.util.ArrayList r8 = new java.util.ArrayList
            r9 = 10
            int r9 = defpackage.cu1.k0(r7, r9)
            r8.<init>(r9)
            java.util.Iterator r7 = r7.iterator()
        L63:
            boolean r9 = r7.hasNext()
            if (r9 == 0) goto L88
            java.lang.Object r9 = r7.next()
            com.medium.android.graphql.DigestHistoryQuery$Edge r9 = (com.medium.android.graphql.DigestHistoryQuery.Edge) r9
            ic3 r0 = new ic3
            com.medium.android.graphql.DigestHistoryQuery$Node r1 = r9.getNode()
            java.lang.String r1 = r1.getId()
            com.medium.android.graphql.DigestHistoryQuery$Node r9 = r9.getNode()
            long r2 = r9.getCreatedAt()
            r0.<init>(r1, r2)
            r8.add(r0)
            goto L63
        L88:
            r7 = r8
        L89:
            boolean r8 = r7 instanceof defpackage.ajb
            if (r8 != 0) goto La4
            r8 = r7
            java.util.List r8 = (java.util.List) r8
            int r8 = r8.size()
            java.lang.String r9 = "Get digest history successful. Got "
            java.lang.String r0 = " digests"
            java.lang.String r8 = defpackage.ev6.w(r9, r8, r0)
            uld r9 = defpackage.wld.a
            java.lang.Object[] r0 = new java.lang.Object[r4]
            defpackage.km4.I(r9, r5, r8, r0, r8)
        La4:
            java.lang.Throwable r8 = defpackage.bjb.b(r7)
            if (r8 == 0) goto Lb3
            uld r9 = defpackage.wld.a
            java.lang.Object[] r0 = new java.lang.Object[r4]
            java.lang.String r1 = "Get digest history failed"
            r9.e(r8, r1, r0)
        Lb3:
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.s95.a(yd4, p92):java.lang.Object");
    }
}
