package defpackage;

import com.medium.android.graphql.type.PagingOptions;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class y85 {
    public final zk2 a;
    public final n0c b;

    public y85(zk2 zk2Var) {
        zk2Var.getClass();
        this.a = zk2Var;
        this.b = new n0c((yd4) null, new PagingOptions(null, null, new yv8(10), null, null, null, null, null, 251, null), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(com.medium.android.graphql.type.PagingOptions r6, defpackage.yd4 r7, defpackage.p92 r8) {
        /*
            r5 = this;
            boolean r0 = r8 instanceof defpackage.v85
            if (r0 == 0) goto L13
            r0 = r8
            v85 r0 = (defpackage.v85) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            v85 r0 = new v85
            r0.<init>(r5, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2c
            defpackage.br7.v(r8)
            bjb r8 = (defpackage.bjb) r8
            java.lang.Object r5 = r8.a
            goto L40
        L2c:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r4
        L32:
            defpackage.br7.v(r8)
            r0.d = r3
            zk2 r5 = r5.a
            java.lang.Object r5 = r5.d(r6, r7, r0)
            if (r5 != r1) goto L40
            return r1
        L40:
            boolean r6 = r5 instanceof defpackage.ajb
            if (r6 != 0) goto L6c
            com.medium.android.graphql.AllMutedQuery$OnUser r5 = (com.medium.android.graphql.AllMutedQuery.OnUser) r5
            wz8 r6 = new wz8
            java.util.List r7 = defpackage.d46.Q(r5)
            com.medium.android.graphql.AllMutedQuery$MutedUserConnection r5 = r5.getMutedUserConnection()
            if (r5 == 0) goto L68
            com.medium.android.graphql.AllMutedQuery$PagingInfo r5 = r5.getPagingInfo()
            if (r5 == 0) goto L68
            com.medium.android.graphql.AllMutedQuery$Next r5 = r5.getNext()
            if (r5 == 0) goto L68
            com.medium.android.graphql.fragment.PagingParamsData r5 = r5.getPagingParamsData()
            if (r5 == 0) goto L68
            com.medium.android.graphql.type.PagingOptions r4 = defpackage.dl7.r(r5)
        L68:
            r6.<init>(r4, r7)
            return r6
        L6c:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.y85.a(com.medium.android.graphql.type.PagingOptions, yd4, p92):java.lang.Object");
    }
}
