package defpackage;

import com.medium.android.core.navigation.PublicationStatsReference;
import com.medium.android.graphql.type.PublicationRef;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rrc {
    public final e00 a;

    public rrc(e00 e00Var) {
        e00Var.getClass();
        this.a = e00Var;
    }

    public static PublicationRef j(PublicationStatsReference publicationStatsReference) {
        if (publicationStatsReference instanceof PublicationStatsReference.PubById) {
            return new PublicationRef(new yv8(((PublicationStatsReference.PubById) publicationStatsReference).getPublicationId()), null, null, 6, null);
        }
        if (!(publicationStatsReference instanceof PublicationStatsReference.PubBySlug)) {
            ygf.a();
            return null;
        }
        return new PublicationRef(null, new yv8(((PublicationStatsReference.PubBySlug) publicationStatsReference).getSlug()), null, 5, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(com.medium.android.core.navigation.PublicationStatsReference r14, long r15, long r17, defpackage.yd4 r19, defpackage.p92 r20) {
        /*
            r13 = this;
            r0 = r20
            boolean r1 = r0 instanceof defpackage.zqc
            if (r1 == 0) goto L15
            r1 = r0
            zqc r1 = (defpackage.zqc) r1
            int r2 = r1.d
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L15
            int r2 = r2 - r3
            r1.d = r2
            goto L1a
        L15:
            zqc r1 = new zqc
            r1.<init>(r13, r0)
        L1a:
            java.lang.Object r0 = r1.b
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r1.d
            r4 = 1
            if (r3 == 0) goto L30
            if (r3 != r4) goto L29
            defpackage.br7.v(r0)     // Catch: java.lang.Exception -> La9 java.util.concurrent.CancellationException -> Lb2
            goto L6d
        L29:
            java.lang.String r13 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r13)
            r13 = 0
            return r13
        L30:
            defpackage.br7.v(r0)
            com.medium.android.graphql.type.PublicationRef r6 = j(r14)
            com.medium.android.graphql.PubMonthlyStatsAndChartQuery r14 = new com.medium.android.graphql.PubMonthlyStatsAndChartQuery
            com.medium.android.graphql.type.PublicationAggregateStatsInput r5 = new com.medium.android.graphql.type.PublicationAggregateStatsInput
            yv8 r11 = new yv8
            java.lang.String r0 = "P1D"
            r11.<init>(r0)
            java.lang.Boolean r0 = java.lang.Boolean.TRUE
            yv8 r12 = new yv8
            r12.<init>(r0)
            r7 = r15
            r9 = r17
            r5.<init>(r6, r7, r9, r11, r12)
            r14.<init>(r6, r5)
            e00 r13 = r13.a
            r13.getClass()
            uz r0 = new uz
            r0.<init>(r13, r14)
            r13 = r19
            java.lang.Object r13 = defpackage.gr7.i(r0, r13)
            uz r13 = (defpackage.uz) r13
            r1.d = r4     // Catch: java.lang.Exception -> La9 java.util.concurrent.CancellationException -> Lb2
            java.lang.Object r0 = r13.b(r1)     // Catch: java.lang.Exception -> La9 java.util.concurrent.CancellationException -> Lb2
            if (r0 != r2) goto L6d
            return r2
        L6d:
            j00 r0 = (defpackage.j00) r0     // Catch: java.lang.Exception -> La9 java.util.concurrent.CancellationException -> Lb2
            du8 r13 = r0.c     // Catch: java.lang.Throwable -> La1
            com.apollographql.apollo.exception.ApolloException r14 = r0.e     // Catch: java.lang.Throwable -> La1
            java.util.List r0 = r0.d     // Catch: java.lang.Throwable -> La1
            if (r14 != 0) goto La0
            if (r0 != 0) goto L84
            if (r13 == 0) goto L7c
            goto Lb1
        L7c:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La1
            java.lang.String r14 = "data is null"
            r13.<init>(r14)     // Catch: java.lang.Throwable -> La1
            throw r13     // Catch: java.lang.Throwable -> La1
        L84:
            com.medium.android.data.common.RitoException r13 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La1
            arc r14 = defpackage.arc.b     // Catch: java.lang.Throwable -> La1
            r1 = 31
            r2 = 0
            r3 = 0
            r4 = 0
            r19 = r14
            r15 = r0
            r20 = r1
            r16 = r2
            r17 = r3
            r18 = r4
            java.lang.String r14 = defpackage.bu1.F0(r15, r16, r17, r18, r19, r20)     // Catch: java.lang.Throwable -> La1
            r13.<init>(r14)     // Catch: java.lang.Throwable -> La1
            throw r13     // Catch: java.lang.Throwable -> La1
        La0:
            throw r14     // Catch: java.lang.Throwable -> La1
        La1:
            r0 = move-exception
            r13 = r0
            ajb r14 = new ajb     // Catch: java.lang.Exception -> La9 java.util.concurrent.CancellationException -> Lb2
            r14.<init>(r13)     // Catch: java.lang.Exception -> La9 java.util.concurrent.CancellationException -> Lb2
            goto Lb0
        La9:
            r0 = move-exception
            r13 = r0
            ajb r14 = new ajb
            r14.<init>(r13)
        Lb0:
            r13 = r14
        Lb1:
            return r13
        Lb2:
            r0 = move-exception
            r13 = r0
            throw r13
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rrc.a(com.medium.android.core.navigation.PublicationStatsReference, long, long, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(com.medium.android.core.navigation.PublicationStatsReference r21, int r22, java.lang.String r23, defpackage.xqc r24, defpackage.yd4 r25, defpackage.p92 r26) {
        /*
            Method dump skipped, instruction units count: 362
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rrc.b(com.medium.android.core.navigation.PublicationStatsReference, int, java.lang.String, xqc, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(java.lang.String r22, int r23, java.lang.String r24, defpackage.xqc r25, defpackage.yd4 r26, defpackage.p92 r27) {
        /*
            Method dump skipped, instruction units count: 408
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rrc.c(java.lang.String, int, java.lang.String, xqc, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(java.lang.String r7, defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.frc
            if (r0 == 0) goto L13
            r0 = r9
            frc r0 = (defpackage.frc) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            frc r0 = new frc
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r9)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            goto L4f
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r9)
            com.medium.android.graphql.GetAudienceStatsQuery r9 = new com.medium.android.graphql.GetAudienceStatsQuery
            r9.<init>(r7)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r9)
            java.lang.Object r6 = defpackage.gr7.i(r7, r8)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            java.lang.Object r9 = r6.b(r0)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            if (r9 != r1) goto L4f
            return r1
        L4f:
            j00 r9 = (defpackage.j00) r9     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            du8 r6 = r9.c     // Catch: java.lang.Throwable -> L7e
            com.apollographql.apollo.exception.ApolloException r7 = r9.e     // Catch: java.lang.Throwable -> L7e
            java.util.List r0 = r9.d     // Catch: java.lang.Throwable -> L7e
            if (r7 != 0) goto L7d
            if (r0 != 0) goto L6c
            if (r6 == 0) goto L64
            com.medium.android.graphql.GetAudienceStatsQuery$Data r6 = (com.medium.android.graphql.GetAudienceStatsQuery.Data) r6     // Catch: java.lang.Throwable -> L7e
            com.medium.android.graphql.GetAudienceStatsQuery$UserResult r6 = r6.getUserResult()     // Catch: java.lang.Throwable -> L7e
            goto L8e
        L64:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7e
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L7e
            throw r6     // Catch: java.lang.Throwable -> L7e
        L6c:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7e
            grc r4 = defpackage.grc.b     // Catch: java.lang.Throwable -> L7e
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L7e
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L7e
            throw r6     // Catch: java.lang.Throwable -> L7e
        L7d:
            throw r7     // Catch: java.lang.Throwable -> L7e
        L7e:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            r7.<init>(r6)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            goto L8d
        L86:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L8d:
            r6 = r7
        L8e:
            boolean r7 = r6 instanceof defpackage.ajb
            if (r7 != 0) goto La6
            if (r6 == 0) goto L96
            goto La6
        L96:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L9e
            java.lang.String r7 = "invalid response data"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L9e
            throw r6     // Catch: java.lang.Throwable -> L9e
        L9e:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        La6:
            return r6
        La7:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rrc.d(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(java.lang.String r13, long r14, long r16, defpackage.yd4 r18, defpackage.p92 r19) {
        /*
            Method dump skipped, instruction units count: 206
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rrc.f(java.lang.String, long, long, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(java.lang.String r7, defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.lrc
            if (r0 == 0) goto L13
            r0 = r9
            lrc r0 = (defpackage.lrc) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            lrc r0 = new lrc
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r9)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            goto L4f
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r9)
            com.medium.android.graphql.GetPostStatsDetailsQuery r9 = new com.medium.android.graphql.GetPostStatsDetailsQuery
            r9.<init>(r7)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r9)
            java.lang.Object r6 = defpackage.gr7.i(r7, r8)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            java.lang.Object r9 = r6.b(r0)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            if (r9 != r1) goto L4f
            return r1
        L4f:
            j00 r9 = (defpackage.j00) r9     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            du8 r6 = r9.c     // Catch: java.lang.Throwable -> L78
            com.apollographql.apollo.exception.ApolloException r7 = r9.e     // Catch: java.lang.Throwable -> L78
            java.util.List r0 = r9.d     // Catch: java.lang.Throwable -> L78
            if (r7 != 0) goto L77
            if (r0 != 0) goto L66
            if (r6 == 0) goto L5e
            goto L88
        L5e:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L78
            throw r6     // Catch: java.lang.Throwable -> L78
        L66:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            mrc r4 = defpackage.mrc.b     // Catch: java.lang.Throwable -> L78
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L78
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L78
            throw r6     // Catch: java.lang.Throwable -> L78
        L77:
            throw r7     // Catch: java.lang.Throwable -> L78
        L78:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            r7.<init>(r6)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> L89
            goto L87
        L80:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L87:
            r6 = r7
        L88:
            return r6
        L89:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rrc.g(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object h(java.lang.String r7, defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.nrc
            if (r0 == 0) goto L13
            r0 = r9
            nrc r0 = (defpackage.nrc) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            nrc r0 = new nrc
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r9)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            goto L4f
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r9)
            com.medium.android.graphql.GetSubscriberGlobalStatsQuery r9 = new com.medium.android.graphql.GetSubscriberGlobalStatsQuery
            r9.<init>(r7)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r9)
            java.lang.Object r6 = defpackage.gr7.i(r7, r8)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            java.lang.Object r9 = r6.b(r0)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            if (r9 != r1) goto L4f
            return r1
        L4f:
            j00 r9 = (defpackage.j00) r9     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            du8 r6 = r9.c     // Catch: java.lang.Throwable -> L7e
            com.apollographql.apollo.exception.ApolloException r7 = r9.e     // Catch: java.lang.Throwable -> L7e
            java.util.List r0 = r9.d     // Catch: java.lang.Throwable -> L7e
            if (r7 != 0) goto L7d
            if (r0 != 0) goto L6c
            if (r6 == 0) goto L64
            com.medium.android.graphql.GetSubscriberGlobalStatsQuery$Data r6 = (com.medium.android.graphql.GetSubscriberGlobalStatsQuery.Data) r6     // Catch: java.lang.Throwable -> L7e
            com.medium.android.graphql.GetSubscriberGlobalStatsQuery$UserResult r6 = r6.getUserResult()     // Catch: java.lang.Throwable -> L7e
            goto L8e
        L64:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7e
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L7e
            throw r6     // Catch: java.lang.Throwable -> L7e
        L6c:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7e
            orc r4 = defpackage.orc.b     // Catch: java.lang.Throwable -> L7e
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L7e
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L7e
            throw r6     // Catch: java.lang.Throwable -> L7e
        L7d:
            throw r7     // Catch: java.lang.Throwable -> L7e
        L7e:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            r7.<init>(r6)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La7
            goto L8d
        L86:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L8d:
            r6 = r7
        L8e:
            boolean r7 = r6 instanceof defpackage.ajb
            if (r7 != 0) goto La6
            if (r6 == 0) goto L96
            goto La6
        L96:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L9e
            java.lang.String r7 = "invalid response data"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L9e
            throw r6     // Catch: java.lang.Throwable -> L9e
        L9e:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        La6:
            return r6
        La7:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rrc.h(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object i(defpackage.p92 r7, defpackage.yd4 r8, com.medium.android.graphql.type.PagingOptions r9, java.lang.String r10) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.prc
            if (r0 == 0) goto L13
            r0 = r7
            prc r0 = (defpackage.prc) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            prc r0 = new prc
            r0.<init>(r6, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r7)     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> Lb2
            goto L5a
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r7)
            com.medium.android.graphql.GetSubscriberListQuery r7 = new com.medium.android.graphql.GetSubscriberListQuery
            if (r9 != 0) goto L38
            xv8 r9 = defpackage.xv8.a
            goto L3e
        L38:
            yv8 r2 = new yv8
            r2.<init>(r9)
            r9 = r2
        L3e:
            r7.<init>(r10, r9)
            e00 r6 = r6.a
            r6.getClass()
            uz r9 = new uz
            r9.<init>(r6, r7)
            java.lang.Object r6 = defpackage.gr7.i(r9, r8)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> Lb2
            java.lang.Object r7 = r6.b(r0)     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> Lb2
            if (r7 != r1) goto L5a
            return r1
        L5a:
            j00 r7 = (defpackage.j00) r7     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> Lb2
            du8 r6 = r7.c     // Catch: java.lang.Throwable -> L89
            com.apollographql.apollo.exception.ApolloException r8 = r7.e     // Catch: java.lang.Throwable -> L89
            java.util.List r0 = r7.d     // Catch: java.lang.Throwable -> L89
            if (r8 != 0) goto L88
            if (r0 != 0) goto L77
            if (r6 == 0) goto L6f
            com.medium.android.graphql.GetSubscriberListQuery$Data r6 = (com.medium.android.graphql.GetSubscriberListQuery.Data) r6     // Catch: java.lang.Throwable -> L89
            com.medium.android.graphql.GetSubscriberListQuery$UserResult r6 = r6.getUserResult()     // Catch: java.lang.Throwable -> L89
            goto L99
        L6f:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L89
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L89
            throw r6     // Catch: java.lang.Throwable -> L89
        L77:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L89
            qrc r4 = defpackage.qrc.b     // Catch: java.lang.Throwable -> L89
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L89
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L89
            throw r6     // Catch: java.lang.Throwable -> L89
        L88:
            throw r8     // Catch: java.lang.Throwable -> L89
        L89:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> Lb2
            r7.<init>(r6)     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> Lb2
            goto L98
        L91:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L98:
            r6 = r7
        L99:
            boolean r7 = r6 instanceof defpackage.ajb
            if (r7 != 0) goto Lb1
            if (r6 == 0) goto La1
            goto Lb1
        La1:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La9
            java.lang.String r7 = "invalid response data"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> La9
            throw r6     // Catch: java.lang.Throwable -> La9
        La9:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        Lb1:
            return r6
        Lb2:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rrc.i(p92, yd4, com.medium.android.graphql.type.PagingOptions, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(java.lang.String r12, long r13, long r15, defpackage.yd4 r17, defpackage.p92 r18) {
        /*
            r11 = this;
            r0 = r18
            boolean r1 = r0 instanceof defpackage.hrc
            if (r1 == 0) goto L15
            r1 = r0
            hrc r1 = (defpackage.hrc) r1
            int r2 = r1.d
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L15
            int r2 = r2 - r3
            r1.d = r2
            goto L1a
        L15:
            hrc r1 = new hrc
            r1.<init>(r11, r0)
        L1a:
            java.lang.Object r0 = r1.b
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r1.d
            r4 = 1
            if (r3 == 0) goto L31
            if (r3 != r4) goto L29
            defpackage.br7.v(r0)     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            goto L57
        L29:
            r11 = 0
            java.lang.String r11 = sprig.g.Hq.fiHTiFJ.TNRhp
            defpackage.ygf.f(r11)
            r11 = 0
            return r11
        L31:
            defpackage.br7.v(r0)
            com.medium.android.graphql.GetPostStatMonthlyQuery r5 = new com.medium.android.graphql.GetPostStatMonthlyQuery
            r6 = r12
            r7 = r13
            r9 = r15
            r5.<init>(r6, r7, r9)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r5)
            r11 = r17
            java.lang.Object r11 = defpackage.gr7.i(r12, r11)
            uz r11 = (defpackage.uz) r11
            r1.d = r4     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            java.lang.Object r0 = r11.b(r1)     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            if (r0 != r2) goto L57
            return r2
        L57:
            j00 r0 = (defpackage.j00) r0     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            du8 r11 = r0.c     // Catch: java.lang.Throwable -> L88
            com.apollographql.apollo.exception.ApolloException r12 = r0.e     // Catch: java.lang.Throwable -> L88
            java.util.List r13 = r0.d     // Catch: java.lang.Throwable -> L88
            if (r12 != 0) goto L87
            if (r13 != 0) goto L6e
            if (r11 == 0) goto L66
            goto L98
        L66:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L88
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L88
            throw r11     // Catch: java.lang.Throwable -> L88
        L6e:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L88
            irc r12 = defpackage.irc.b     // Catch: java.lang.Throwable -> L88
            r14 = 31
            r0 = 0
            r1 = 0
            r2 = 0
            r17 = r12
            r18 = r14
            r14 = r0
            r15 = r1
            r16 = r2
            java.lang.String r12 = defpackage.bu1.F0(r13, r14, r15, r16, r17, r18)     // Catch: java.lang.Throwable -> L88
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L88
            throw r11     // Catch: java.lang.Throwable -> L88
        L87:
            throw r12     // Catch: java.lang.Throwable -> L88
        L88:
            r0 = move-exception
            r11 = r0
            ajb r12 = new ajb     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            r12.<init>(r11)     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            goto L97
        L90:
            r0 = move-exception
            r11 = r0
            ajb r12 = new ajb
            r12.<init>(r11)
        L97:
            r11 = r12
        L98:
            return r11
        L99:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rrc.e(java.lang.String, long, long, yd4, p92):java.lang.Object");
    }
}
