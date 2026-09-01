package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z2f {
    public final e00 a;

    public z2f(e00 e00Var) {
        e00Var.getClass();
        this.a = e00Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(int r7, java.lang.String r8, com.medium.android.graphql.type.RecommendedPublishersMode r9, java.lang.String r10, defpackage.yd4 r11, defpackage.p92 r12) {
        /*
            r6 = this;
            boolean r0 = r12 instanceof defpackage.y2f
            if (r0 == 0) goto L13
            r0 = r12
            y2f r0 = (defpackage.y2f) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            y2f r0 = new y2f
            r0.<init>(r6, r12)
        L18:
            java.lang.Object r12 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r12)     // Catch: java.lang.Exception -> L8f java.util.concurrent.CancellationException -> L98
            goto L5e
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r12)
            if (r8 != 0) goto L35
            java.lang.String r8 = ""
        L35:
            if (r10 != 0) goto L3a
            xv8 r10 = defpackage.xv8.a
            goto L40
        L3a:
            yv8 r12 = new yv8
            r12.<init>(r10)
            r10 = r12
        L40:
            com.medium.android.graphql.WhoToFollowQuery r12 = new com.medium.android.graphql.WhoToFollowQuery
            r12.<init>(r10, r7, r8, r9)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r12)
            java.lang.Object r6 = defpackage.gr7.i(r7, r11)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L8f java.util.concurrent.CancellationException -> L98
            java.lang.Object r12 = r6.b(r0)     // Catch: java.lang.Exception -> L8f java.util.concurrent.CancellationException -> L98
            if (r12 != r1) goto L5e
            return r1
        L5e:
            j00 r12 = (defpackage.j00) r12     // Catch: java.lang.Exception -> L8f java.util.concurrent.CancellationException -> L98
            du8 r6 = r12.c     // Catch: java.lang.Throwable -> L87
            com.apollographql.apollo.exception.ApolloException r7 = r12.e     // Catch: java.lang.Throwable -> L87
            java.util.List r0 = r12.d     // Catch: java.lang.Throwable -> L87
            if (r7 != 0) goto L86
            if (r0 != 0) goto L75
            if (r6 == 0) goto L6d
            goto L97
        L6d:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L87
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L87
            throw r6     // Catch: java.lang.Throwable -> L87
        L75:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L87
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L87
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L87
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L87
            throw r6     // Catch: java.lang.Throwable -> L87
        L86:
            throw r7     // Catch: java.lang.Throwable -> L87
        L87:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L8f java.util.concurrent.CancellationException -> L98
            r7.<init>(r6)     // Catch: java.lang.Exception -> L8f java.util.concurrent.CancellationException -> L98
            goto L96
        L8f:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L96:
            r6 = r7
        L97:
            return r6
        L98:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z2f.a(int, java.lang.String, com.medium.android.graphql.type.RecommendedPublishersMode, java.lang.String, yd4, p92):java.lang.Object");
    }
}
