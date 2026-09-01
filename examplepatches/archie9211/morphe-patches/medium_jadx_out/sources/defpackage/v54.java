package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class v54 {
    public final e00 a;

    public v54(e00 e00Var) {
        e00Var.getClass();
        this.a = e00Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r11, defpackage.p92 r12) {
        /*
            r10 = this;
            boolean r0 = r12 instanceof defpackage.t54
            if (r0 == 0) goto L13
            r0 = r12
            t54 r0 = (defpackage.t54) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            t54 r0 = new t54
            r0.<init>(r10, r12)
        L18:
            java.lang.Object r12 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r12)     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lbf
            goto L53
        L27:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            r10 = 0
            return r10
        L2e:
            defpackage.br7.v(r12)
            com.medium.android.graphql.LogExperimentExposureMutation r12 = new com.medium.android.graphql.LogExperimentExposureMutation
            com.medium.android.graphql.type.LogExperimentExposureInput r4 = new com.medium.android.graphql.type.LogExperimentExposureInput
            r8 = 6
            r9 = 0
            r6 = 0
            r7 = 0
            r5 = r11
            r4.<init>(r5, r6, r7, r8, r9)
            r12.<init>(r4)
            e00 r10 = r10.a
            r10.getClass()
            uz r11 = new uz
            r11.<init>(r10, r12)
            r0.d = r3     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lbf
            java.lang.Object r12 = r11.b(r0)     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lbf
            if (r12 != r1) goto L53
            return r1
        L53:
            j00 r12 = (defpackage.j00) r12     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lbf
            du8 r10 = r12.c     // Catch: java.lang.Throwable -> L8e
            com.apollographql.apollo.exception.ApolloException r11 = r12.e     // Catch: java.lang.Throwable -> L8e
            java.util.List r0 = r12.d     // Catch: java.lang.Throwable -> L8e
            if (r11 != 0) goto L8d
            if (r0 != 0) goto L7c
            if (r10 == 0) goto L74
            com.medium.android.graphql.LogExperimentExposureMutation$Data r10 = (com.medium.android.graphql.LogExperimentExposureMutation.Data) r10     // Catch: java.lang.Throwable -> L8e
            com.medium.android.graphql.LogExperimentExposureMutation$LogExperimentExposure r10 = r10.getLogExperimentExposure()     // Catch: java.lang.Throwable -> L8e
            com.medium.android.graphql.fragment.MutationSuccessData r10 = r10.getMutationSuccessData()     // Catch: java.lang.Throwable -> L8e
            boolean r10 = r10.getSuccess()     // Catch: java.lang.Throwable -> L8e
            java.lang.Boolean r10 = java.lang.Boolean.valueOf(r10)     // Catch: java.lang.Throwable -> L8e
            goto L9e
        L74:
            com.medium.android.data.common.RitoException r10 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8e
            java.lang.String r11 = "data is null"
            r10.<init>(r11)     // Catch: java.lang.Throwable -> L8e
            throw r10     // Catch: java.lang.Throwable -> L8e
        L7c:
            com.medium.android.data.common.RitoException r10 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8e
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L8e
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r11 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L8e
            r10.<init>(r11)     // Catch: java.lang.Throwable -> L8e
            throw r10     // Catch: java.lang.Throwable -> L8e
        L8d:
            throw r11     // Catch: java.lang.Throwable -> L8e
        L8e:
            r0 = move-exception
            r10 = r0
            ajb r11 = new ajb     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lbf
            r11.<init>(r10)     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lbf
            goto L9d
        L96:
            r0 = move-exception
            r10 = r0
            ajb r11 = new ajb
            r11.<init>(r10)
        L9d:
            r10 = r11
        L9e:
            boolean r11 = r10 instanceof defpackage.ajb
            if (r11 != 0) goto Lbe
            java.lang.Boolean r10 = (java.lang.Boolean) r10     // Catch: java.lang.Throwable -> Lb6
            boolean r10 = r10.booleanValue()     // Catch: java.lang.Throwable -> Lb6
            if (r10 == 0) goto Lae
            c1e r10 = defpackage.c1e.a     // Catch: java.lang.Throwable -> Lb6
            goto Lbe
        Lae:
            com.medium.android.data.common.RitoException r10 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lb6
            java.lang.String r11 = "Cannot track experiment exposure event"
            r10.<init>(r11)     // Catch: java.lang.Throwable -> Lb6
            throw r10     // Catch: java.lang.Throwable -> Lb6
        Lb6:
            r0 = move-exception
            r10 = r0
            ajb r11 = new ajb
            r11.<init>(r10)
            r10 = r11
        Lbe:
            return r10
        Lbf:
            r0 = move-exception
            r10 = r0
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.v54.a(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(java.lang.String r11, defpackage.p92 r12) {
        /*
            r10 = this;
            boolean r0 = r12 instanceof defpackage.u54
            if (r0 == 0) goto L13
            r0 = r12
            u54 r0 = (defpackage.u54) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            u54 r0 = new u54
            r0.<init>(r10, r12)
        L18:
            java.lang.Object r12 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r12)     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lbf
            goto L53
        L27:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            r10 = 0
            return r10
        L2e:
            defpackage.br7.v(r12)
            com.medium.android.graphql.LogGateExposureMutation r12 = new com.medium.android.graphql.LogGateExposureMutation
            com.medium.android.graphql.type.LogGateExposureInput r4 = new com.medium.android.graphql.type.LogGateExposureInput
            r8 = 6
            r9 = 0
            r6 = 0
            r7 = 0
            r5 = r11
            r4.<init>(r5, r6, r7, r8, r9)
            r12.<init>(r4)
            e00 r10 = r10.a
            r10.getClass()
            uz r11 = new uz
            r11.<init>(r10, r12)
            r0.d = r3     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lbf
            java.lang.Object r12 = r11.b(r0)     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lbf
            if (r12 != r1) goto L53
            return r1
        L53:
            j00 r12 = (defpackage.j00) r12     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lbf
            du8 r10 = r12.c     // Catch: java.lang.Throwable -> L8e
            com.apollographql.apollo.exception.ApolloException r11 = r12.e     // Catch: java.lang.Throwable -> L8e
            java.util.List r0 = r12.d     // Catch: java.lang.Throwable -> L8e
            if (r11 != 0) goto L8d
            if (r0 != 0) goto L7c
            if (r10 == 0) goto L74
            com.medium.android.graphql.LogGateExposureMutation$Data r10 = (com.medium.android.graphql.LogGateExposureMutation.Data) r10     // Catch: java.lang.Throwable -> L8e
            com.medium.android.graphql.LogGateExposureMutation$LogGateExposure r10 = r10.getLogGateExposure()     // Catch: java.lang.Throwable -> L8e
            com.medium.android.graphql.fragment.MutationSuccessData r10 = r10.getMutationSuccessData()     // Catch: java.lang.Throwable -> L8e
            boolean r10 = r10.getSuccess()     // Catch: java.lang.Throwable -> L8e
            java.lang.Boolean r10 = java.lang.Boolean.valueOf(r10)     // Catch: java.lang.Throwable -> L8e
            goto L9e
        L74:
            com.medium.android.data.common.RitoException r10 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8e
            java.lang.String r11 = "data is null"
            r10.<init>(r11)     // Catch: java.lang.Throwable -> L8e
            throw r10     // Catch: java.lang.Throwable -> L8e
        L7c:
            com.medium.android.data.common.RitoException r10 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8e
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L8e
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r11 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L8e
            r10.<init>(r11)     // Catch: java.lang.Throwable -> L8e
            throw r10     // Catch: java.lang.Throwable -> L8e
        L8d:
            throw r11     // Catch: java.lang.Throwable -> L8e
        L8e:
            r0 = move-exception
            r10 = r0
            ajb r11 = new ajb     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lbf
            r11.<init>(r10)     // Catch: java.lang.Exception -> L96 java.util.concurrent.CancellationException -> Lbf
            goto L9d
        L96:
            r0 = move-exception
            r10 = r0
            ajb r11 = new ajb
            r11.<init>(r10)
        L9d:
            r10 = r11
        L9e:
            boolean r11 = r10 instanceof defpackage.ajb
            if (r11 != 0) goto Lbe
            java.lang.Boolean r10 = (java.lang.Boolean) r10     // Catch: java.lang.Throwable -> Lb6
            boolean r10 = r10.booleanValue()     // Catch: java.lang.Throwable -> Lb6
            if (r10 == 0) goto Lae
            c1e r10 = defpackage.c1e.a     // Catch: java.lang.Throwable -> Lb6
            goto Lbe
        Lae:
            com.medium.android.data.common.RitoException r10 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lb6
            java.lang.String r11 = "Cannot track gate exposure event"
            r10.<init>(r11)     // Catch: java.lang.Throwable -> Lb6
            throw r10     // Catch: java.lang.Throwable -> Lb6
        Lb6:
            r0 = move-exception
            r10 = r0
            ajb r11 = new ajb
            r11.<init>(r10)
            r10 = r11
        Lbe:
            return r10
        Lbf:
            r0 = move-exception
            r10 = r0
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.v54.b(java.lang.String, p92):java.lang.Object");
    }
}
