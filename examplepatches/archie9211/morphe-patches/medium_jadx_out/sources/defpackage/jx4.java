package defpackage;

import com.medium.android.graphql.type.PagingOptions;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jx4 {
    public final ble a;
    public n0c b;

    public jx4(ble bleVar) {
        this.a = bleVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r6, defpackage.yd4 r7, defpackage.b55 r8, int r9, defpackage.p92 r10) {
        /*
            r5 = this;
            boolean r0 = r10 instanceof defpackage.ix4
            if (r0 == 0) goto L13
            r0 = r10
            ix4 r0 = (defpackage.ix4) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            ix4 r0 = new ix4
            r0.<init>(r5, r10)
        L18:
            java.lang.Object r10 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L36
            if (r2 != r3) goto L30
            int r9 = r0.c
            b55 r8 = r0.b
            defpackage.br7.v(r10)
            bjb r10 = (defpackage.bjb) r10
            java.lang.Object r5 = r10.a
            goto L48
        L30:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r4
        L36:
            defpackage.br7.v(r10)
            r0.b = r8
            r0.c = r9
            r0.f = r3
            ble r5 = r5.a
            java.lang.Object r5 = r5.e(r6, r7, r0)
            if (r5 != r1) goto L48
            return r1
        L48:
            boolean r6 = r5 instanceof defpackage.ajb
            if (r6 != 0) goto La0
            com.medium.android.graphql.FollowingPublicationsQuery$FollowingCollectionConnection r5 = (com.medium.android.graphql.FollowingPublicationsQuery.FollowingCollectionConnection) r5
            java.util.List r6 = r5.getCollections()
            java.util.ArrayList r7 = new java.util.ArrayList
            r7.<init>()
            java.util.Iterator r6 = r6.iterator()
            r10 = 0
        L5c:
            boolean r0 = r6.hasNext()
            if (r0 == 0) goto L85
            java.lang.Object r0 = r6.next()
            int r1 = r10 + 1
            if (r10 < 0) goto L81
            com.medium.android.graphql.FollowingPublicationsQuery$Collection r0 = (com.medium.android.graphql.FollowingPublicationsQuery.Collection) r0
            int r10 = r10 + r9
            java.lang.Integer r2 = new java.lang.Integer
            r2.<init>(r10)
            com.medium.android.graphql.fragment.CollectionPreviewData r10 = r0.getCollectionPreviewData()
            java.lang.Object r10 = r8.invoke(r2, r10)
            if (r10 == 0) goto L7f
            r7.add(r10)
        L7f:
            r10 = r1
            goto L5c
        L81:
            defpackage.d46.i0()
            throw r4
        L85:
            com.medium.android.graphql.FollowingPublicationsQuery$PagingInfo r5 = r5.getPagingInfo()
            if (r5 == 0) goto L9b
            com.medium.android.graphql.FollowingPublicationsQuery$Next r5 = r5.getNext()
            if (r5 == 0) goto L9b
            com.medium.android.graphql.fragment.PagingParamsData r5 = r5.getPagingParamsData()
            if (r5 == 0) goto L9b
            com.medium.android.graphql.type.PagingOptions r4 = defpackage.dl7.r(r5)
        L9b:
            wz8 r5 = new wz8
            r5.<init>(r4, r7)
        La0:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jx4.a(java.lang.String, yd4, b55, int, p92):java.lang.Object");
    }

    public final to4 b(String str, b55 b55Var) {
        str.getClass();
        n0c n0cVar = new n0c((yd4) null, new PagingOptions(null, null, new yv8(12), null, null, null, null, null, 251, null), 3);
        this.b = n0cVar;
        return n0cVar.Q(new kg(this, str, b55Var, (n92) null));
    }
}
