package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ex1 {
    public final e00 a;
    public final r6c b;
    public final uua c;

    public ex1(e00 e00Var) {
        e00Var.getClass();
        this.a = e00Var;
        r6c r6cVarX = k40.x(0, 7, null);
        this.b = r6cVarX;
        this.c = bo.z(r6cVarX);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r12, java.lang.String r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.dx1
            if (r0 == 0) goto L13
            r0 = r14
            dx1 r0 = (defpackage.dx1) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            dx1 r0 = new dx1
            r0.<init>(r11, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r14)     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            goto L5f
        L27:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            r11 = 0
            return r11
        L2e:
            defpackage.br7.v(r14)
            com.medium.android.graphql.UpdateSubmissionStatusMutation r14 = new com.medium.android.graphql.UpdateSubmissionStatusMutation
            com.medium.android.graphql.type.UpdateSubmissionStatusInput r4 = new com.medium.android.graphql.type.UpdateSubmissionStatusInput
            com.medium.android.graphql.type.UpdateSubmissionStatusPostPublicationTuple r2 = new com.medium.android.graphql.type.UpdateSubmissionStatusPostPublicationTuple
            r2.<init>(r12, r13)
            yv8 r6 = new yv8
            r6.<init>(r2)
            com.medium.android.graphql.type.PublicationSubmissionStatus r7 = com.medium.android.graphql.type.PublicationSubmissionStatus.CANCELLED
            r9 = 9
            r10 = 0
            r5 = 0
            r8 = 0
            r4.<init>(r5, r6, r7, r8, r9, r10)
            r14.<init>(r4)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r14)
            r0.d = r3     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            java.lang.Object r14 = r12.b(r0)     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            if (r14 != r1) goto L5f
            return r1
        L5f:
            j00 r14 = (defpackage.j00) r14     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            du8 r11 = r14.c     // Catch: java.lang.Throwable -> L88
            com.apollographql.apollo.exception.ApolloException r12 = r14.e     // Catch: java.lang.Throwable -> L88
            java.util.List r0 = r14.d     // Catch: java.lang.Throwable -> L88
            if (r12 != 0) goto L87
            if (r0 != 0) goto L76
            if (r11 == 0) goto L6e
            goto L98
        L6e:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L88
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L88
            throw r11     // Catch: java.lang.Throwable -> L88
        L76:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L88
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L88
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r12 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L88
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ex1.a(java.lang.String, java.lang.String, p92):java.lang.Object");
    }
}
