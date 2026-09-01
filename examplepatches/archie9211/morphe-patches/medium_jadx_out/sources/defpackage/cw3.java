package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cw3 {
    public final in7 a;
    public final e00 b;
    public final gn9 c;

    public cw3(in7 in7Var, e00 e00Var, gn9 gn9Var) {
        in7Var.getClass();
        e00Var.getClass();
        gn9Var.getClass();
        this.a = in7Var;
        this.b = e00Var;
        this.c = gn9Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(gen.model.Quote r7, defpackage.p92 r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.sv3
            if (r0 == 0) goto L13
            r0 = r8
            sv3 r0 = (defpackage.sv3) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            sv3 r0 = new sv3
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L3f
            if (r2 == r4) goto L33
            if (r2 != r3) goto L2d
            java.io.Serializable r6 = r0.c
            defpackage.br7.v(r8)
            goto L7c
        L2d:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r5
        L33:
            java.io.Serializable r7 = r0.c
            cw3 r7 = (defpackage.cw3) r7
            gen.model.Quote r7 = r0.b
            defpackage.br7.v(r8)     // Catch: java.lang.Throwable -> L3d
            goto L53
        L3d:
            r8 = move-exception
            goto L5c
        L3f:
            defpackage.br7.v(r8)
            in7 r8 = r6.a     // Catch: java.lang.Throwable -> L3d
            java.lang.String r2 = r7.post_id     // Catch: java.lang.Throwable -> L3d
            r0.b = r7     // Catch: java.lang.Throwable -> L3d
            r0.c = r5     // Catch: java.lang.Throwable -> L3d
            r0.f = r4     // Catch: java.lang.Throwable -> L3d
            java.lang.Object r8 = r8.h(r2, r7, r0)     // Catch: java.lang.Throwable -> L3d
            if (r8 != r1) goto L53
            goto L7a
        L53:
            jn7 r8 = (defpackage.jn7) r8     // Catch: java.lang.Throwable -> L3d
            java.lang.Object r8 = r8.getPayload()     // Catch: java.lang.Throwable -> L3d
            gen.model.response.CreateQuoteResponse r8 = (gen.model.response.CreateQuoteResponse) r8     // Catch: java.lang.Throwable -> L3d
            goto L62
        L5c:
            ajb r2 = new ajb
            r2.<init>(r8)
            r8 = r2
        L62:
            boolean r2 = r8 instanceof defpackage.ajb
            if (r2 != 0) goto L7d
            r2 = r8
            gen.model.response.CreateQuoteResponse r2 = (gen.model.response.CreateQuoteResponse) r2
            java.lang.String r7 = r7.post_id
            r0.b = r5
            r0.c = r8
            r0.f = r3
            gn9 r6 = r6.c
            java.lang.Object r6 = r6.q(r7, r0)
            if (r6 != r1) goto L7b
        L7a:
            return r1
        L7b:
            r6 = r8
        L7c:
            r8 = r6
        L7d:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cw3.a(gen.model.Quote, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(java.lang.String r7, defpackage.wa r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.tv3
            if (r0 == 0) goto L13
            r0 = r9
            tv3 r0 = (defpackage.tv3) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            tv3 r0 = new tv3
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L3f
            if (r2 == r4) goto L33
            if (r2 != r3) goto L2d
            java.lang.Object r6 = r0.c
            defpackage.br7.v(r9)
            goto L78
        L2d:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r5
        L33:
            java.lang.Object r7 = r0.c
            cw3 r7 = (defpackage.cw3) r7
            java.lang.String r7 = r0.b
            defpackage.br7.v(r9)     // Catch: java.lang.Throwable -> L3d
            goto L51
        L3d:
            r8 = move-exception
            goto L5a
        L3f:
            defpackage.br7.v(r9)
            in7 r9 = r6.a     // Catch: java.lang.Throwable -> L3d
            r0.b = r7     // Catch: java.lang.Throwable -> L3d
            r0.c = r5     // Catch: java.lang.Throwable -> L3d
            r0.f = r4     // Catch: java.lang.Throwable -> L3d
            java.lang.Object r9 = r9.s(r7, r8, r0)     // Catch: java.lang.Throwable -> L3d
            if (r9 != r1) goto L51
            goto L76
        L51:
            jn7 r9 = (defpackage.jn7) r9     // Catch: java.lang.Throwable -> L3d
            java.lang.Object r8 = r9.getPayload()     // Catch: java.lang.Throwable -> L3d
            mq3 r8 = (defpackage.mq3) r8     // Catch: java.lang.Throwable -> L3d
            goto L60
        L5a:
            ajb r9 = new ajb
            r9.<init>(r8)
            r8 = r9
        L60:
            boolean r9 = r8 instanceof defpackage.ajb
            if (r9 != 0) goto L79
            r9 = r8
            mq3 r9 = (defpackage.mq3) r9
            r0.b = r5
            r0.c = r8
            r0.f = r3
            gn9 r6 = r6.c
            java.lang.Object r6 = r6.q(r7, r0)
            if (r6 != r1) goto L77
        L76:
            return r1
        L77:
            r6 = r8
        L78:
            r8 = r6
        L79:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cw3.b(java.lang.String, wa, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(java.lang.String r12, defpackage.p92 r13) {
        /*
            r11 = this;
            boolean r0 = r13 instanceof defpackage.uv3
            if (r0 == 0) goto L13
            r0 = r13
            uv3 r0 = (defpackage.uv3) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            uv3 r0 = new uv3
            r0.<init>(r11, r13)
        L18:
            java.lang.Object r13 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r13)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            goto L49
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r13)
            com.medium.android.graphql.CreateMediaResourceMutation r13 = new com.medium.android.graphql.CreateMediaResourceMutation
            r13.<init>(r12)
            e00 r11 = r11.b
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r13)
            r0.d = r3     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            java.lang.Object r13 = r12.b(r0)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            if (r13 != r1) goto L49
            return r1
        L49:
            j00 r13 = (defpackage.j00) r13     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            du8 r11 = r13.c     // Catch: java.lang.Throwable -> L7e
            com.apollographql.apollo.exception.ApolloException r12 = r13.e     // Catch: java.lang.Throwable -> L7e
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L7e
            if (r12 != 0) goto L7d
            if (r5 != 0) goto L6c
            if (r11 == 0) goto L64
            com.medium.android.graphql.CreateMediaResourceMutation$Data r11 = (com.medium.android.graphql.CreateMediaResourceMutation.Data) r11     // Catch: java.lang.Throwable -> L7e
            com.medium.android.graphql.CreateMediaResourceMutation$CreateMediaResource r11 = r11.getCreateMediaResource()     // Catch: java.lang.Throwable -> L7e
            if (r11 == 0) goto L8d
            com.medium.android.graphql.CreateMediaResourceMutation$OnMediaResource r4 = r11.getOnMediaResource()     // Catch: java.lang.Throwable -> L7e
            goto L8d
        L64:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7e
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L7e
            throw r11     // Catch: java.lang.Throwable -> L7e
        L6c:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7e
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L7e
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L7e
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L7e
            throw r11     // Catch: java.lang.Throwable -> L7e
        L7d:
            throw r12     // Catch: java.lang.Throwable -> L7e
        L7e:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            r4.<init>(r11)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> La4
            goto L8d
        L86:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        L8d:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto La3
            if (r4 == 0) goto L94
            goto La3
        L94:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L9c
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L9c
            throw r11     // Catch: java.lang.Throwable -> L9c
        L9c:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        La3:
            return r4
        La4:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cw3.c(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(defpackage.p92 r5) {
        /*
            r4 = this;
            boolean r0 = r5 instanceof defpackage.vv3
            if (r0 == 0) goto L13
            r0 = r5
            vv3 r0 = (defpackage.vv3) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            vv3 r0 = new vv3
            r0.<init>(r4, r5)
        L18:
            java.lang.Object r5 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r5)     // Catch: java.lang.Throwable -> L47
            goto L3e
        L27:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L2e:
            defpackage.br7.v(r5)
            in7 r4 = r4.a     // Catch: java.lang.Throwable -> L47
            fy3 r5 = defpackage.fy3.a     // Catch: java.lang.Throwable -> L47
            r0.d = r3     // Catch: java.lang.Throwable -> L47
            java.lang.Object r5 = r4.r(r5, r0)     // Catch: java.lang.Throwable -> L47
            if (r5 != r1) goto L3e
            return r1
        L3e:
            jn7 r5 = (defpackage.jn7) r5     // Catch: java.lang.Throwable -> L47
            java.lang.Object r4 = r5.getPayload()     // Catch: java.lang.Throwable -> L47
            mq3 r4 = (defpackage.mq3) r4     // Catch: java.lang.Throwable -> L47
            return r4
        L47:
            r4 = move-exception
            ajb r5 = new ajb
            r5.<init>(r4)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cw3.d(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(java.lang.String r5, defpackage.p92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.wv3
            if (r0 == 0) goto L13
            r0 = r6
            wv3 r0 = (defpackage.wv3) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            wv3 r0 = new wv3
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r6)     // Catch: java.lang.Throwable -> L47
            goto L3e
        L27:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L2e:
            defpackage.br7.v(r6)
            in7 r4 = r4.a     // Catch: java.lang.Throwable -> L47
            fy3 r6 = defpackage.fy3.a     // Catch: java.lang.Throwable -> L47
            r0.d = r3     // Catch: java.lang.Throwable -> L47
            java.lang.Object r6 = r4.c(r5, r6, r0)     // Catch: java.lang.Throwable -> L47
            if (r6 != r1) goto L3e
            return r1
        L3e:
            jn7 r6 = (defpackage.jn7) r6     // Catch: java.lang.Throwable -> L47
            java.lang.Object r4 = r6.getPayload()     // Catch: java.lang.Throwable -> L47
            mq3 r4 = (defpackage.mq3) r4     // Catch: java.lang.Throwable -> L47
            return r4
        L47:
            r4 = move-exception
            ajb r5 = new ajb
            r5.<init>(r4)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cw3.e(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(gen.model.request.CreateInResponseToQuoteRequest r5, defpackage.p92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.xv3
            if (r0 == 0) goto L13
            r0 = r6
            xv3 r0 = (defpackage.xv3) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            xv3 r0 = new xv3
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r6)     // Catch: java.lang.Throwable -> L45
            goto L3c
        L27:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L2e:
            defpackage.br7.v(r6)
            in7 r4 = r4.a     // Catch: java.lang.Throwable -> L45
            r0.d = r3     // Catch: java.lang.Throwable -> L45
            java.lang.Object r6 = r4.a(r5, r0)     // Catch: java.lang.Throwable -> L45
            if (r6 != r1) goto L3c
            return r1
        L3c:
            jn7 r6 = (defpackage.jn7) r6     // Catch: java.lang.Throwable -> L45
            java.lang.Object r4 = r6.getPayload()     // Catch: java.lang.Throwable -> L45
            mq3 r4 = (defpackage.mq3) r4     // Catch: java.lang.Throwable -> L45
            return r4
        L45:
            r4 = move-exception
            ajb r5 = new ajb
            r5.<init>(r4)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cw3.f(gen.model.request.CreateInResponseToQuoteRequest, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(java.lang.String r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.yv3
            if (r0 == 0) goto L13
            r0 = r14
            yv3 r0 = (defpackage.yv3) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            yv3 r0 = new yv3
            r0.<init>(r11, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r14)     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Laa
            goto L4f
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r14)
            com.medium.android.graphql.EditorPostQuery r14 = new com.medium.android.graphql.EditorPostQuery
            r14.<init>(r12)
            e00 r11 = r11.b
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r14)
            java.lang.Object r11 = defpackage.gr7.i(r12, r13)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Laa
            java.lang.Object r14 = r11.b(r0)     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Laa
            if (r14 != r1) goto L4f
            return r1
        L4f:
            j00 r14 = (defpackage.j00) r14     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Laa
            du8 r11 = r14.c     // Catch: java.lang.Throwable -> L84
            com.apollographql.apollo.exception.ApolloException r12 = r14.e     // Catch: java.lang.Throwable -> L84
            java.util.List r5 = r14.d     // Catch: java.lang.Throwable -> L84
            if (r12 != 0) goto L83
            if (r5 != 0) goto L72
            if (r11 == 0) goto L6a
            com.medium.android.graphql.EditorPostQuery$Data r11 = (com.medium.android.graphql.EditorPostQuery.Data) r11     // Catch: java.lang.Throwable -> L84
            com.medium.android.graphql.EditorPostQuery$PostResult r11 = r11.getPostResult()     // Catch: java.lang.Throwable -> L84
            if (r11 == 0) goto L93
            com.medium.android.graphql.EditorPostQuery$OnPost r4 = r11.getOnPost()     // Catch: java.lang.Throwable -> L84
            goto L93
        L6a:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L84
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L84
            throw r11     // Catch: java.lang.Throwable -> L84
        L72:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L84
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L84
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L84
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L84
            throw r11     // Catch: java.lang.Throwable -> L84
        L83:
            throw r12     // Catch: java.lang.Throwable -> L84
        L84:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Laa
            r4.<init>(r11)     // Catch: java.lang.Exception -> L8c java.util.concurrent.CancellationException -> Laa
            goto L93
        L8c:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        L93:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto La9
            if (r4 == 0) goto L9a
            goto La9
        L9a:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La2
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> La2
            throw r11     // Catch: java.lang.Throwable -> La2
        La2:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        La9:
            return r4
        Laa:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cw3.g(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object h(java.lang.String r5, defpackage.p92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.zv3
            if (r0 == 0) goto L13
            r0 = r6
            zv3 r0 = (defpackage.zv3) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            zv3 r0 = new zv3
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r6)     // Catch: java.lang.Throwable -> L45
            goto L3c
        L27:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L2e:
            defpackage.br7.v(r6)
            in7 r4 = r4.a     // Catch: java.lang.Throwable -> L45
            r0.d = r3     // Catch: java.lang.Throwable -> L45
            java.lang.Object r6 = r4.o(r5, r0)     // Catch: java.lang.Throwable -> L45
            if (r6 != r1) goto L3c
            return r1
        L3c:
            jn7 r6 = (defpackage.jn7) r6     // Catch: java.lang.Throwable -> L45
            java.lang.Object r4 = r6.getPayload()     // Catch: java.lang.Throwable -> L45
            mq3 r4 = (defpackage.mq3) r4     // Catch: java.lang.Throwable -> L45
            return r4
        L45:
            r4 = move-exception
            ajb r5 = new ajb
            r5.<init>(r4)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cw3.h(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object i(java.lang.String r6, int r7, defpackage.p92 r8) {
        /*
            r5 = this;
            boolean r0 = r8 instanceof defpackage.aw3
            if (r0 == 0) goto L13
            r0 = r8
            aw3 r0 = (defpackage.aw3) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            aw3 r0 = new aw3
            r0.<init>(r5, r8)
        L18:
            java.lang.Object r8 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L30
            if (r2 != r3) goto L2a
            int r7 = r0.b
            defpackage.br7.v(r8)     // Catch: java.lang.Throwable -> L51
            goto L42
        L2a:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r4
        L30:
            defpackage.br7.v(r8)
            in7 r5 = r5.a     // Catch: java.lang.Throwable -> L51
            java.lang.String r8 = "typeahead"
            r0.b = r7     // Catch: java.lang.Throwable -> L51
            r0.e = r3     // Catch: java.lang.Throwable -> L51
            java.lang.Object r8 = r5.g(r6, r8, r4, r0)     // Catch: java.lang.Throwable -> L51
            if (r8 != r1) goto L42
            return r1
        L42:
            jn7 r8 = (defpackage.jn7) r8     // Catch: java.lang.Throwable -> L51
            java.lang.Object r5 = r8.getPayload()     // Catch: java.lang.Throwable -> L51
            gen.model.response.FetchUsersForTypeaheadResponse r5 = (gen.model.response.FetchUsersForTypeaheadResponse) r5     // Catch: java.lang.Throwable -> L51
            java.util.List<gen.model.User> r5 = r5.value_     // Catch: java.lang.Throwable -> L51
            java.util.List r5 = defpackage.bu1.g1(r5, r7)     // Catch: java.lang.Throwable -> L51
            return r5
        L51:
            r5 = move-exception
            ajb r6 = new ajb
            r6.<init>(r5)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cw3.i(java.lang.String, int, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object j(java.lang.String r7, gen.model.request.PublishPostRequest r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.bw3
            if (r0 == 0) goto L13
            r0 = r9
            bw3 r0 = (defpackage.bw3) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            bw3 r0 = new bw3
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L3f
            if (r2 == r4) goto L33
            if (r2 != r3) goto L2d
            java.lang.Object r6 = r0.c
            defpackage.br7.v(r9)
            goto L78
        L2d:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r5
        L33:
            java.lang.Object r7 = r0.c
            cw3 r7 = (defpackage.cw3) r7
            java.lang.String r7 = r0.b
            defpackage.br7.v(r9)     // Catch: java.lang.Throwable -> L3d
            goto L51
        L3d:
            r8 = move-exception
            goto L5a
        L3f:
            defpackage.br7.v(r9)
            in7 r9 = r6.a     // Catch: java.lang.Throwable -> L3d
            r0.b = r7     // Catch: java.lang.Throwable -> L3d
            r0.c = r5     // Catch: java.lang.Throwable -> L3d
            r0.f = r4     // Catch: java.lang.Throwable -> L3d
            java.lang.Object r9 = r9.i(r7, r8, r0)     // Catch: java.lang.Throwable -> L3d
            if (r9 != r1) goto L51
            goto L76
        L51:
            jn7 r9 = (defpackage.jn7) r9     // Catch: java.lang.Throwable -> L3d
            java.lang.Object r8 = r9.getPayload()     // Catch: java.lang.Throwable -> L3d
            mq3 r8 = (defpackage.mq3) r8     // Catch: java.lang.Throwable -> L3d
            goto L60
        L5a:
            ajb r9 = new ajb
            r9.<init>(r8)
            r8 = r9
        L60:
            boolean r9 = r8 instanceof defpackage.ajb
            if (r9 != 0) goto L79
            r9 = r8
            mq3 r9 = (defpackage.mq3) r9
            r0.b = r5
            r0.c = r8
            r0.f = r3
            gn9 r6 = r6.c
            java.lang.Object r6 = r6.q(r7, r0)
            if (r6 != r1) goto L77
        L76:
            return r1
        L77:
            r6 = r8
        L78:
            r8 = r6
        L79:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cw3.j(java.lang.String, gen.model.request.PublishPostRequest, p92):java.lang.Object");
    }
}
