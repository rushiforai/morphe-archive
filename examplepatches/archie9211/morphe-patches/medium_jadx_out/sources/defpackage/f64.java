package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class f64 {
    public final e00 a;

    public f64(e00 e00Var) {
        e00Var.getClass();
        this.a = e00Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.yd4 r22, defpackage.p92 r23) {
        /*
            r21 = this;
            r0 = r21
            r1 = r23
            boolean r2 = r1 instanceof defpackage.d64
            if (r2 == 0) goto L17
            r2 = r1
            d64 r2 = (defpackage.d64) r2
            int r3 = r2.d
            r4 = -2147483648(0xffffffff80000000, float:-0.0)
            r5 = r3 & r4
            if (r5 == 0) goto L17
            int r3 = r3 - r4
            r2.d = r3
            goto L1c
        L17:
            d64 r2 = new d64
            r2.<init>(r0, r1)
        L1c:
            java.lang.Object r1 = r2.b
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            int r4 = r2.d
            r5 = 1
            if (r4 == 0) goto L32
            if (r4 != r5) goto L2b
            defpackage.br7.v(r1)     // Catch: java.lang.Exception -> Lb8 java.util.concurrent.CancellationException -> Lc0
            goto L85
        L2b:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            r0 = 0
            return r0
        L32:
            defpackage.br7.v(r1)
            com.medium.android.graphql.ExploreQuery r6 = new com.medium.android.graphql.ExploreQuery
            com.medium.android.graphql.type.RecommendedTagsInput r7 = new com.medium.android.graphql.type.RecommendedTagsInput
            r1 = 20
            xv8 r4 = defpackage.xv8.a
            r7.<init>(r4, r1)
            com.medium.android.graphql.type.TrendingPostsFeedInput r8 = new com.medium.android.graphql.type.TrendingPostsFeedInput
            r1 = 6
            r8.<init>(r4, r1)
            com.medium.android.graphql.type.StaffPicksFeedInput r9 = new com.medium.android.graphql.type.StaffPicksFeedInput
            com.medium.android.graphql.type.PagingOptions r10 = new com.medium.android.graphql.type.PagingOptions
            r19 = 255(0xff, float:3.57E-43)
            r20 = 0
            r11 = 0
            r12 = 0
            r13 = 0
            r14 = 0
            r15 = 0
            r16 = 0
            r17 = 0
            r18 = 0
            r10.<init>(r11, r12, r13, r14, r15, r16, r17, r18, r19, r20)
            r9.<init>(r4, r10)
            com.medium.android.graphql.type.DiscoverPostsInput r10 = new com.medium.android.graphql.type.DiscoverPostsInput
            r1 = 5
            r10.<init>(r1)
            r11 = 20
            r6.<init>(r7, r8, r9, r10, r11)
            e00 r0 = r0.a
            r0.getClass()
            uz r1 = new uz
            r1.<init>(r0, r6)
            r0 = r22
            java.lang.Object r0 = defpackage.gr7.i(r1, r0)
            uz r0 = (defpackage.uz) r0
            r2.d = r5     // Catch: java.lang.Exception -> Lb8 java.util.concurrent.CancellationException -> Lc0
            java.lang.Object r1 = r0.b(r2)     // Catch: java.lang.Exception -> Lb8 java.util.concurrent.CancellationException -> Lc0
            if (r1 != r3) goto L85
            return r3
        L85:
            j00 r1 = (defpackage.j00) r1     // Catch: java.lang.Exception -> Lb8 java.util.concurrent.CancellationException -> Lc0
            du8 r0 = r1.c     // Catch: java.lang.Throwable -> Lb1
            com.apollographql.apollo.exception.ApolloException r2 = r1.e     // Catch: java.lang.Throwable -> Lb1
            java.util.List r3 = r1.d     // Catch: java.lang.Throwable -> Lb1
            if (r2 != 0) goto Lb0
            if (r3 != 0) goto L9f
            if (r0 == 0) goto L96
            com.medium.android.graphql.ExploreQuery$Data r0 = (com.medium.android.graphql.ExploreQuery.Data) r0     // Catch: java.lang.Throwable -> Lb1
            goto Lbf
        L96:
            com.medium.android.data.common.RitoException r0 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lb1
            r1 = 0
            java.lang.String r1 = com.google.android.gms.internal.fido.Hg.kSWQKWZ.MJdHzXX     // Catch: java.lang.Throwable -> Lb1
            r0.<init>(r1)     // Catch: java.lang.Throwable -> Lb1
            throw r0     // Catch: java.lang.Throwable -> Lb1
        L9f:
            com.medium.android.data.common.RitoException r0 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lb1
            e64 r7 = defpackage.e64.b     // Catch: java.lang.Throwable -> Lb1
            r8 = 31
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r1 = defpackage.bu1.F0(r3, r4, r5, r6, r7, r8)     // Catch: java.lang.Throwable -> Lb1
            r0.<init>(r1)     // Catch: java.lang.Throwable -> Lb1
            throw r0     // Catch: java.lang.Throwable -> Lb1
        Lb0:
            throw r2     // Catch: java.lang.Throwable -> Lb1
        Lb1:
            r0 = move-exception
            ajb r1 = new ajb     // Catch: java.lang.Exception -> Lb8 java.util.concurrent.CancellationException -> Lc0
            r1.<init>(r0)     // Catch: java.lang.Exception -> Lb8 java.util.concurrent.CancellationException -> Lc0
            goto Lbe
        Lb8:
            r0 = move-exception
            ajb r1 = new ajb
            r1.<init>(r0)
        Lbe:
            r0 = r1
        Lbf:
            return r0
        Lc0:
            r0 = move-exception
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f64.a(yd4, p92):java.lang.Object");
    }
}
