package defpackage;

import com.medium.android.graphql.type.PagingOptions;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hy4 {
    public final ble a;
    public n0c b;

    public hy4(ble bleVar) {
        this.a = bleVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r6, com.medium.android.graphql.type.PagingOptions r7, defpackage.yd4 r8, defpackage.b55 r9, int r10, defpackage.p92 r11) {
        /*
            r5 = this;
            boolean r0 = r11 instanceof defpackage.gy4
            if (r0 == 0) goto L13
            r0 = r11
            gy4 r0 = (defpackage.gy4) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            gy4 r0 = new gy4
            r0.<init>(r5, r11)
        L18:
            java.lang.Object r11 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L36
            if (r2 != r3) goto L30
            int r10 = r0.c
            b55 r9 = r0.b
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
            r0.c = r10
            r0.f = r3
            ble r5 = r5.a
            java.lang.Object r5 = r5.f(r0, r8, r7, r6)
            if (r5 != r1) goto L48
            return r1
        L48:
            boolean r6 = r5 instanceof defpackage.ajb
            if (r6 != 0) goto La0
            com.medium.android.graphql.FollowingUsersQuery$FollowingUserConnection r5 = (com.medium.android.graphql.FollowingUsersQuery.FollowingUserConnection) r5
            java.util.List r6 = r5.getUsers()
            java.util.ArrayList r7 = new java.util.ArrayList
            r7.<init>()
            java.util.Iterator r6 = r6.iterator()
            r8 = 0
        L5c:
            boolean r11 = r6.hasNext()
            if (r11 == 0) goto L85
            java.lang.Object r11 = r6.next()
            int r0 = r8 + 1
            if (r8 < 0) goto L81
            com.medium.android.graphql.FollowingUsersQuery$User1 r11 = (com.medium.android.graphql.FollowingUsersQuery.User1) r11
            int r8 = r8 + r10
            java.lang.Integer r1 = new java.lang.Integer
            r1.<init>(r8)
            com.medium.android.graphql.fragment.CreatorPreviewData r8 = r11.getCreatorPreviewData()
            java.lang.Object r8 = r9.invoke(r1, r8)
            if (r8 == 0) goto L7f
            r7.add(r8)
        L7f:
            r8 = r0
            goto L5c
        L81:
            defpackage.d46.i0()
            throw r4
        L85:
            com.medium.android.graphql.FollowingUsersQuery$PagingInfo r5 = r5.getPagingInfo()
            if (r5 == 0) goto L9b
            com.medium.android.graphql.FollowingUsersQuery$Next r5 = r5.getNext()
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hy4.a(java.lang.String, com.medium.android.graphql.type.PagingOptions, yd4, b55, int, p92):java.lang.Object");
    }

    public final to4 b(String str, b55 b55Var) {
        str.getClass();
        n0c n0cVar = new n0c((yd4) null, new PagingOptions(null, null, new yv8(12), null, null, null, null, null, 251, null), 3);
        this.b = n0cVar;
        return n0cVar.Q(new yj2(this, str, b55Var, null, 4));
    }
}
