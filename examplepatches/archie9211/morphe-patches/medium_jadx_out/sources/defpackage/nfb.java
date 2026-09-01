package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nfb {
    public final e00 a;
    public final r6c b;

    public nfb(e00 e00Var) {
        e00Var.getClass();
        this.a = e00Var;
        this.b = k40.x(0, 7, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:63:0x00ad A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:65:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r9, defpackage.p92 r10) {
        /*
            Method dump skipped, instruction units count: 219
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nfb.a(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(java.lang.String r25, java.lang.String r26, defpackage.p92 r27) {
        /*
            Method dump skipped, instruction units count: 417
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nfb.b(java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(java.lang.String r7, com.medium.android.graphql.type.PagingOptions r8, defpackage.yd4 r9, com.medium.android.graphql.type.ResponseSortType r10, int r11, defpackage.p92 r12) {
        /*
            r6 = this;
            boolean r0 = r12 instanceof defpackage.zeb
            if (r0 == 0) goto L13
            r0 = r12
            zeb r0 = (defpackage.zeb) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            zeb r0 = new zeb
            r0.<init>(r6, r12)
        L18:
            java.lang.Object r12 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r12)     // Catch: java.lang.Exception -> L95 java.util.concurrent.CancellationException -> Lb6
            goto L5a
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r12)
            com.medium.android.graphql.CatalogResponsesQuery r12 = new com.medium.android.graphql.CatalogResponsesQuery
            if (r8 != 0) goto L38
            xv8 r8 = defpackage.xv8.a
            goto L3e
        L38:
            yv8 r2 = new yv8
            r2.<init>(r8)
            r8 = r2
        L3e:
            r12.<init>(r7, r8, r10, r11)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r12)
            java.lang.Object r6 = defpackage.gr7.i(r7, r9)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L95 java.util.concurrent.CancellationException -> Lb6
            java.lang.Object r12 = r6.b(r0)     // Catch: java.lang.Exception -> L95 java.util.concurrent.CancellationException -> Lb6
            if (r12 != r1) goto L5a
            return r1
        L5a:
            j00 r12 = (defpackage.j00) r12     // Catch: java.lang.Exception -> L95 java.util.concurrent.CancellationException -> Lb6
            du8 r6 = r12.c     // Catch: java.lang.Throwable -> L8d
            com.apollographql.apollo.exception.ApolloException r7 = r12.e     // Catch: java.lang.Throwable -> L8d
            java.util.List r0 = r12.d     // Catch: java.lang.Throwable -> L8d
            if (r7 != 0) goto L8c
            if (r0 != 0) goto L7b
            if (r6 == 0) goto L73
            com.medium.android.graphql.CatalogResponsesQuery$Data r6 = (com.medium.android.graphql.CatalogResponsesQuery.Data) r6     // Catch: java.lang.Throwable -> L8d
            com.medium.android.graphql.CatalogResponsesQuery$CatalogById r6 = r6.getCatalogById()     // Catch: java.lang.Throwable -> L8d
            com.medium.android.graphql.fragment.CatalogResponses r6 = r6.getCatalogResponses()     // Catch: java.lang.Throwable -> L8d
            goto L9d
        L73:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8d
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L8d
            throw r6     // Catch: java.lang.Throwable -> L8d
        L7b:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L8d
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L8d
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L8d
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L8d
            throw r6     // Catch: java.lang.Throwable -> L8d
        L8c:
            throw r7     // Catch: java.lang.Throwable -> L8d
        L8d:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L95 java.util.concurrent.CancellationException -> Lb6
            r7.<init>(r6)     // Catch: java.lang.Exception -> L95 java.util.concurrent.CancellationException -> Lb6
            goto L9c
        L95:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L9c:
            r6 = r7
        L9d:
            boolean r7 = r6 instanceof defpackage.ajb
            if (r7 != 0) goto Lb5
            if (r6 == 0) goto La5
            goto Lb5
        La5:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lad
            java.lang.String r7 = "invalid response data"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> Lad
            throw r6     // Catch: java.lang.Throwable -> Lad
        Lad:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        Lb5:
            return r6
        Lb6:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nfb.c(java.lang.String, com.medium.android.graphql.type.PagingOptions, yd4, com.medium.android.graphql.type.ResponseSortType, int, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(java.lang.String r15, java.lang.String r16, int r17, java.lang.String r18, defpackage.yd4 r19, com.medium.android.graphql.type.ResponseSortType r20, int r21, defpackage.p92 r22) {
        /*
            Method dump skipped, instruction units count: 211
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nfb.d(java.lang.String, java.lang.String, int, java.lang.String, yd4, com.medium.android.graphql.type.ResponseSortType, int, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(java.lang.String r9, com.medium.android.graphql.type.PagingOptions r10, defpackage.yd4 r11, com.medium.android.graphql.type.ResponseSortType r12, int r13, defpackage.p92 r14) {
        /*
            r8 = this;
            r2 = r14
            boolean r3 = r2 instanceof defpackage.bfb
            if (r3 == 0) goto L14
            r3 = r2
            bfb r3 = (defpackage.bfb) r3
            int r4 = r3.d
            r5 = -2147483648(0xffffffff80000000, float:-0.0)
            r6 = r4 & r5
            if (r6 == 0) goto L14
            int r4 = r4 - r5
            r3.d = r4
            goto L19
        L14:
            bfb r3 = new bfb
            r3.<init>(r8, r14)
        L19:
            java.lang.Object r2 = r3.b
            tb2 r4 = defpackage.tb2.COROUTINE_SUSPENDED
            int r5 = r3.d
            r6 = 1
            r7 = 0
            if (r5 == 0) goto L2f
            if (r5 != r6) goto L29
            defpackage.br7.v(r2)     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lb9
            goto L5b
        L29:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r7
        L2f:
            defpackage.br7.v(r2)
            com.medium.android.graphql.PostResponsesQuery r2 = new com.medium.android.graphql.PostResponsesQuery
            if (r10 != 0) goto L39
            xv8 r1 = defpackage.xv8.a
            goto L3f
        L39:
            yv8 r5 = new yv8
            r5.<init>(r10)
            r1 = r5
        L3f:
            r2.<init>(r9, r1, r12, r13)
            e00 r0 = r8.a
            r0.getClass()
            uz r1 = new uz
            r1.<init>(r0, r2)
            java.lang.Object r0 = defpackage.gr7.i(r1, r11)
            uz r0 = (defpackage.uz) r0
            r3.d = r6     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lb9
            java.lang.Object r2 = r0.b(r3)     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lb9
            if (r2 != r4) goto L5b
            return r4
        L5b:
            j00 r2 = (defpackage.j00) r2     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lb9
            du8 r0 = r2.c     // Catch: java.lang.Throwable -> L96
            com.apollographql.apollo.exception.ApolloException r1 = r2.e     // Catch: java.lang.Throwable -> L96
            java.util.List r2 = r2.d     // Catch: java.lang.Throwable -> L96
            if (r1 != 0) goto L95
            if (r2 != 0) goto L7e
            if (r0 == 0) goto L76
            com.medium.android.graphql.PostResponsesQuery$Data r0 = (com.medium.android.graphql.PostResponsesQuery.Data) r0     // Catch: java.lang.Throwable -> L96
            com.medium.android.graphql.PostResponsesQuery$PostResult r0 = r0.getPostResult()     // Catch: java.lang.Throwable -> L96
            if (r0 == 0) goto La3
            com.medium.android.graphql.fragment.PostResponses r7 = r0.getPostResponses()     // Catch: java.lang.Throwable -> L96
            goto La3
        L76:
            com.medium.android.data.common.RitoException r0 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L96
            java.lang.String r1 = "data is null"
            r0.<init>(r1)     // Catch: java.lang.Throwable -> L96
            throw r0     // Catch: java.lang.Throwable -> L96
        L7e:
            com.medium.android.data.common.RitoException r0 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L96
            a00 r1 = defpackage.a00.b     // Catch: java.lang.Throwable -> L96
            r3 = 31
            r4 = 0
            r5 = 0
            r6 = 0
            r12 = r1
            r8 = r2
            r13 = r3
            r9 = r4
            r10 = r5
            r11 = r6
            java.lang.String r1 = defpackage.bu1.F0(r8, r9, r10, r11, r12, r13)     // Catch: java.lang.Throwable -> L96
            r0.<init>(r1)     // Catch: java.lang.Throwable -> L96
            throw r0     // Catch: java.lang.Throwable -> L96
        L95:
            throw r1     // Catch: java.lang.Throwable -> L96
        L96:
            r0 = move-exception
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lb9
            r7.<init>(r0)     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lb9
            goto La3
        L9d:
            r0 = move-exception
            ajb r7 = new ajb
            r7.<init>(r0)
        La3:
            boolean r0 = r7 instanceof defpackage.ajb
            if (r0 != 0) goto Lb8
            if (r7 == 0) goto Laa
            goto Lb8
        Laa:
            com.medium.android.data.common.RitoException r0 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lb2
            java.lang.String r1 = "invalid response data"
            r0.<init>(r1)     // Catch: java.lang.Throwable -> Lb2
            throw r0     // Catch: java.lang.Throwable -> Lb2
        Lb2:
            r0 = move-exception
            ajb r7 = new ajb
            r7.<init>(r0)
        Lb8:
            return r7
        Lb9:
            r0 = move-exception
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nfb.e(java.lang.String, com.medium.android.graphql.type.PagingOptions, yd4, com.medium.android.graphql.type.ResponseSortType, int, p92):java.lang.Object");
    }

    /* JADX WARN: Can't wrap try/catch for region: R(11:0|2|(2:4|(1:6)(1:7))(0)|8|(1:73)|(1:(1:(3:12|65|66)(2:13|14))(2:15|16))(3:20|21|(2:23|63))|24|72|25|(1:(1:(7:29|41|(3:69|45|46)|49|(3:71|51|(1:53)(2:56|57))|59|(3:61|(3:64|65|66)|63)(1:75))(2:32|33))(2:34|35))(1:36)|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x007f, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x009b, code lost:
    
        r6 = new defpackage.ajb(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00a6, code lost:
    
        r0 = r6;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(java.lang.String r17, java.lang.String r18, defpackage.p92 r19) {
        /*
            Method dump skipped, instruction units count: 270
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nfb.f(java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(java.lang.String r18, boolean r19, defpackage.p92 r20) {
        /*
            Method dump skipped, instruction units count: 245
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nfb.g(java.lang.String, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Can't wrap try/catch for region: R(11:0|2|(2:4|(1:6)(1:7))(0)|8|(1:73)|(1:(1:(3:12|65|66)(2:13|14))(2:15|16))(3:20|21|(2:23|63))|24|72|25|(1:(1:(7:29|41|(3:69|45|46)|49|(3:71|51|(1:53)(2:56|57))|59|(3:61|(3:64|65|66)|63)(1:75))(2:32|33))(2:34|35))(1:36)|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x007f, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x009b, code lost:
    
        r6 = new defpackage.ajb(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00a6, code lost:
    
        r0 = r6;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object h(java.lang.String r17, java.lang.String r18, defpackage.p92 r19) {
        /*
            Method dump skipped, instruction units count: 270
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nfb.h(java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:57:0x0097 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:60:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object i(java.lang.String r12, boolean r13, defpackage.p92 r14) {
        /*
            Method dump skipped, instruction units count: 220
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nfb.i(java.lang.String, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object j(java.lang.String r18, boolean r19, defpackage.p92 r20) {
        /*
            Method dump skipped, instruction units count: 245
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nfb.j(java.lang.String, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:69:0x0102, code lost:
    
        if (r2 == r4) goto L70;
     */
    /* JADX WARN: Removed duplicated region for block: B:113:0x015a A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:121:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x009b A[Catch: all -> 0x0082, TRY_LEAVE, TryCatch #1 {all -> 0x0082, blocks: (B:31:0x006f, B:35:0x007b, B:38:0x0084, B:39:0x0089, B:40:0x008a, B:41:0x009a, B:42:0x009b), top: B:110:0x006f }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object k(java.lang.String r19, boolean r20, defpackage.p92 r21) {
        /*
            Method dump skipped, instruction units count: 389
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nfb.k(java.lang.String, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object l(java.lang.String r23, java.lang.String r24, defpackage.p92 r25) {
        /*
            Method dump skipped, instruction units count: 245
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nfb.l(java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object m(java.lang.String r24, java.lang.String r25, java.lang.String r26, defpackage.p92 r27) {
        /*
            Method dump skipped, instruction units count: 266
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nfb.m(java.lang.String, java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object n(java.lang.String r7, java.lang.String r8, java.lang.String r9, boolean r10, defpackage.p92 r11) {
        /*
            r6 = this;
            boolean r0 = r11 instanceof defpackage.kfb
            if (r0 == 0) goto L13
            r0 = r11
            kfb r0 = (defpackage.kfb) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            kfb r0 = new kfb
            r0.<init>(r6, r11)
        L18:
            java.lang.Object r11 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r11)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            goto L49
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r11)
            com.medium.android.graphql.ReportResponseMutation r11 = new com.medium.android.graphql.ReportResponseMutation
            r11.<init>(r7, r8, r9, r10)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r11)
            r0.d = r3     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            java.lang.Object r11 = r7.b(r0)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            if (r11 != r1) goto L49
            return r1
        L49:
            j00 r11 = (defpackage.j00) r11     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            du8 r6 = r11.c     // Catch: java.lang.Throwable -> L78
            com.apollographql.apollo.exception.ApolloException r7 = r11.e     // Catch: java.lang.Throwable -> L78
            java.util.List r0 = r11.d     // Catch: java.lang.Throwable -> L78
            if (r7 != 0) goto L77
            if (r0 != 0) goto L66
            if (r6 == 0) goto L5e
            com.medium.android.graphql.ReportResponseMutation$Data r6 = (com.medium.android.graphql.ReportResponseMutation.Data) r6     // Catch: java.lang.Throwable -> L78
            com.medium.android.graphql.ReportResponseMutation$ReportStoryAndMaybeBlockAuthor r6 = r6.getReportStoryAndMaybeBlockAuthor()     // Catch: java.lang.Throwable -> L78
            goto L88
        L5e:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L78
            throw r6     // Catch: java.lang.Throwable -> L78
        L66:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L78
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
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            r7.<init>(r6)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> La1
            goto L87
        L80:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L87:
            r6 = r7
        L88:
            boolean r7 = r6 instanceof defpackage.ajb
            if (r7 != 0) goto La0
            if (r6 == 0) goto L90
            goto La0
        L90:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L98
            java.lang.String r7 = "invalid response data"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L98
            throw r6     // Catch: java.lang.Throwable -> L98
        L98:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        La0:
            return r6
        La1:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nfb.n(java.lang.String, java.lang.String, java.lang.String, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Can't wrap try/catch for region: R(11:0|2|(2:4|(1:6)(1:7))(0)|8|(1:73)|(1:(1:(3:12|65|66)(2:13|14))(2:15|16))(3:20|21|(2:23|63))|24|72|25|(1:(1:(7:29|41|(3:69|45|46)|49|(3:71|51|(1:53)(2:56|57))|59|(3:61|(3:64|65|66)|63)(1:75))(2:32|33))(2:34|35))(1:36)|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x007f, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x009b, code lost:
    
        r6 = new defpackage.ajb(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00a6, code lost:
    
        r0 = r6;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object o(java.lang.String r17, java.lang.String r18, defpackage.p92 r19) {
        /*
            Method dump skipped, instruction units count: 270
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nfb.o(java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Can't wrap try/catch for region: R(11:0|2|(2:4|(1:6)(1:7))(0)|8|(1:73)|(1:(1:(3:12|65|66)(2:13|14))(2:15|16))(3:20|21|(2:23|63))|24|72|25|(1:(1:(7:29|41|(3:69|45|46)|49|(3:71|51|(1:53)(2:56|57))|59|(3:61|(3:64|65|66)|63)(1:75))(2:32|33))(2:34|35))(1:36)|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x007f, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x009b, code lost:
    
        r6 = new defpackage.ajb(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00a6, code lost:
    
        r0 = r6;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object p(java.lang.String r17, java.lang.String r18, defpackage.p92 r19) {
        /*
            Method dump skipped, instruction units count: 270
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nfb.p(java.lang.String, java.lang.String, p92):java.lang.Object");
    }
}
