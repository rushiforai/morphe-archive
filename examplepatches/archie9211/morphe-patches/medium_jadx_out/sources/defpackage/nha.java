package defpackage;

import com.medium.android.graphql.type.PagingOptions;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nha {
    public final kla a;
    public final n0c b = new n0c((yd4) null, new PagingOptions(null, null, new yv8(12), null, null, null, null, null, 251, null), 3);

    public nha(kla klaVar) {
        this.a = klaVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r6, com.medium.android.graphql.type.PagingOptions r7, int r8, defpackage.v08 r9, defpackage.yd4 r10, defpackage.p92 r11) {
        /*
            r5 = this;
            boolean r0 = r11 instanceof defpackage.mha
            if (r0 == 0) goto L13
            r0 = r11
            mha r0 = (defpackage.mha) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            mha r0 = new mha
            r0.<init>(r5, r11)
        L18:
            java.lang.Object r11 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L36
            if (r2 != r3) goto L30
            int r8 = r0.c
            v08 r9 = r0.b
            defpackage.br7.v(r11)
            bjb r11 = (defpackage.bjb) r11
            java.lang.Object r5 = r11.a
            goto L48
        L30:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r4
        L36:
            defpackage.br7.v(r11)
            r0.b = r9
            r0.c = r8
            r0.f = r3
            kla r5 = r5.a
            java.lang.Object r5 = r5.a(r0, r10, r7, r6)
            if (r5 != r1) goto L48
            return r1
        L48:
            boolean r6 = r5 instanceof defpackage.ajb
            if (r6 != 0) goto La0
            com.medium.android.graphql.PublicationFollowersQuery$FollowersUserConnection r5 = (com.medium.android.graphql.PublicationFollowersQuery.FollowersUserConnection) r5
            java.util.List r6 = r5.getUsers()
            java.util.ArrayList r7 = new java.util.ArrayList
            r7.<init>()
            java.util.Iterator r6 = r6.iterator()
            r10 = 0
        L5c:
            boolean r11 = r6.hasNext()
            if (r11 == 0) goto L85
            java.lang.Object r11 = r6.next()
            int r0 = r10 + 1
            if (r10 < 0) goto L81
            com.medium.android.graphql.PublicationFollowersQuery$User r11 = (com.medium.android.graphql.PublicationFollowersQuery.User) r11
            int r10 = r10 + r8
            java.lang.Integer r1 = new java.lang.Integer
            r1.<init>(r10)
            com.medium.android.graphql.fragment.CreatorPreviewData r10 = r11.getCreatorPreviewData()
            java.lang.Object r10 = r9.invoke(r1, r10)
            if (r10 == 0) goto L7f
            r7.add(r10)
        L7f:
            r10 = r0
            goto L5c
        L81:
            defpackage.d46.i0()
            throw r4
        L85:
            com.medium.android.graphql.PublicationFollowersQuery$PagingInfo r5 = r5.getPagingInfo()
            if (r5 == 0) goto L9b
            com.medium.android.graphql.PublicationFollowersQuery$Next r5 = r5.getNext()
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nha.a(java.lang.String, com.medium.android.graphql.type.PagingOptions, int, v08, yd4, p92):java.lang.Object");
    }
}
