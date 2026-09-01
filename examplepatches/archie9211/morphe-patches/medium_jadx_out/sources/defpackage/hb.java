package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hb {
    public final e00 a;

    public hb(e00 e00Var) {
        e00Var.getClass();
        this.a = e00Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.p92 r8) {
        /*
            r7 = this;
            boolean r0 = r8 instanceof defpackage.db
            if (r0 == 0) goto L13
            r0 = r8
            db r0 = (defpackage.db) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            db r0 = new db
            r0.<init>(r7, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r8)     // Catch: java.lang.Exception -> L7a java.util.concurrent.CancellationException -> L83
            goto L49
        L27:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            r7 = 0
            return r7
        L2e:
            defpackage.br7.v(r8)
            com.medium.android.graphql.FollowAllContactMatchedMutation r8 = new com.medium.android.graphql.FollowAllContactMatchedMutation
            r8.<init>()
            e00 r7 = r7.a
            r7.getClass()
            uz r2 = new uz
            r2.<init>(r7, r8)
            r0.d = r3     // Catch: java.lang.Exception -> L7a java.util.concurrent.CancellationException -> L83
            java.lang.Object r8 = r2.b(r0)     // Catch: java.lang.Exception -> L7a java.util.concurrent.CancellationException -> L83
            if (r8 != r1) goto L49
            return r1
        L49:
            j00 r8 = (defpackage.j00) r8     // Catch: java.lang.Exception -> L7a java.util.concurrent.CancellationException -> L83
            du8 r7 = r8.c     // Catch: java.lang.Throwable -> L72
            com.apollographql.apollo.exception.ApolloException r0 = r8.e     // Catch: java.lang.Throwable -> L72
            java.util.List r1 = r8.d     // Catch: java.lang.Throwable -> L72
            if (r0 != 0) goto L71
            if (r1 != 0) goto L60
            if (r7 == 0) goto L58
            goto L82
        L58:
            com.medium.android.data.common.RitoException r7 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L72
            java.lang.String r8 = "data is null"
            r7.<init>(r8)     // Catch: java.lang.Throwable -> L72
            throw r7     // Catch: java.lang.Throwable -> L72
        L60:
            com.medium.android.data.common.RitoException r7 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L72
            eb r5 = defpackage.eb.b     // Catch: java.lang.Throwable -> L72
            r6 = 31
            r2 = 0
            r3 = 0
            r4 = 0
            java.lang.String r8 = defpackage.bu1.F0(r1, r2, r3, r4, r5, r6)     // Catch: java.lang.Throwable -> L72
            r7.<init>(r8)     // Catch: java.lang.Throwable -> L72
            throw r7     // Catch: java.lang.Throwable -> L72
        L71:
            throw r0     // Catch: java.lang.Throwable -> L72
        L72:
            r0 = move-exception
            r7 = r0
            ajb r8 = new ajb     // Catch: java.lang.Exception -> L7a java.util.concurrent.CancellationException -> L83
            r8.<init>(r7)     // Catch: java.lang.Exception -> L7a java.util.concurrent.CancellationException -> L83
            goto L81
        L7a:
            r0 = move-exception
            r7 = r0
            ajb r8 = new ajb
            r8.<init>(r7)
        L81:
            r7 = r8
        L82:
            return r7
        L83:
            r0 = move-exception
            r7 = r0
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hb.a(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(java.util.List r7, defpackage.p92 r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.fb
            if (r0 == 0) goto L13
            r0 = r8
            fb r0 = (defpackage.fb) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            fb r0 = new fb
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r8)     // Catch: java.lang.Exception -> Laa java.util.concurrent.CancellationException -> Lb3
            goto L79
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r8)
            java.util.ArrayList r8 = new java.util.ArrayList
            r2 = 10
            int r2 = defpackage.cu1.k0(r7, r2)
            r8.<init>(r2)
            java.util.Iterator r7 = r7.iterator()
        L40:
            boolean r2 = r7.hasNext()
            if (r2 == 0) goto L5c
            java.lang.Object r2 = r7.next()
            u72 r2 = (defpackage.u72) r2
            com.medium.android.graphql.type.ContactInfoInput r4 = new com.medium.android.graphql.type.ContactInfoInput
            java.util.List r2 = r2.b
            yv8 r5 = new yv8
            r5.<init>(r2)
            r4.<init>(r5)
            r8.add(r4)
            goto L40
        L5c:
            com.medium.android.graphql.type.UploadContactsInput r7 = new com.medium.android.graphql.type.UploadContactsInput
            r7.<init>(r8)
            com.medium.android.graphql.UploadContactsMutation r8 = new com.medium.android.graphql.UploadContactsMutation
            r8.<init>(r7)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r8)
            r0.d = r3     // Catch: java.lang.Exception -> Laa java.util.concurrent.CancellationException -> Lb3
            java.lang.Object r8 = r7.b(r0)     // Catch: java.lang.Exception -> Laa java.util.concurrent.CancellationException -> Lb3
            if (r8 != r1) goto L79
            return r1
        L79:
            j00 r8 = (defpackage.j00) r8     // Catch: java.lang.Exception -> Laa java.util.concurrent.CancellationException -> Lb3
            du8 r6 = r8.c     // Catch: java.lang.Throwable -> La2
            com.apollographql.apollo.exception.ApolloException r7 = r8.e     // Catch: java.lang.Throwable -> La2
            java.util.List r0 = r8.d     // Catch: java.lang.Throwable -> La2
            if (r7 != 0) goto La1
            if (r0 != 0) goto L90
            if (r6 == 0) goto L88
            goto Lb2
        L88:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La2
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> La2
            throw r6     // Catch: java.lang.Throwable -> La2
        L90:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La2
            gb r4 = defpackage.gb.b     // Catch: java.lang.Throwable -> La2
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> La2
            r6.<init>(r7)     // Catch: java.lang.Throwable -> La2
            throw r6     // Catch: java.lang.Throwable -> La2
        La1:
            throw r7     // Catch: java.lang.Throwable -> La2
        La2:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> Laa java.util.concurrent.CancellationException -> Lb3
            r7.<init>(r6)     // Catch: java.lang.Exception -> Laa java.util.concurrent.CancellationException -> Lb3
            goto Lb1
        Laa:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        Lb1:
            r6 = r7
        Lb2:
            return r6
        Lb3:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hb.b(java.util.List, p92):java.lang.Object");
    }
}
