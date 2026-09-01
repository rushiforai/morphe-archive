package defpackage;

import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class uj8 {
    public final e00 a;
    public final LinkedHashMap b;

    public uj8(e00 e00Var) {
        e00Var.getClass();
        this.a = e00Var;
        this.b = new LinkedHashMap();
    }

    /* JADX WARN: Removed duplicated region for block: B:52:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.util.List r7, com.medium.android.graphql.type.PagingOptions r8, defpackage.yd4 r9, defpackage.p92 r10) {
        /*
            Method dump skipped, instruction units count: 326
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uj8.a(java.util.List, com.medium.android.graphql.type.PagingOptions, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Can't wrap try/catch for region: R(12:0|2|(2:4|(1:6)(1:8))(0)|7|9|(1:70)|(1:(1:(2:13|62)(2:14|15))(2:16|17))(7:21|66|22|23|26|27|(2:29|61))|30|65|31|(1:(1:(5:35|47|(3:68|51|52)|55|(2:57|(2:59|(1:61)(1:74))(1:73))(1:72))(2:38|39))(2:40|41))(1:42)|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x00a1, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00bd, code lost:
    
        r1 = new defpackage.ajb(r0);
        r3 = r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00c8, code lost:
    
        r0 = r1;
        r3 = r3;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /* JADX WARN: Type inference failed for: r3v1 */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v20 */
    /* JADX WARN: Type inference failed for: r3v21 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.p92 r17) {
        /*
            Method dump skipped, instruction units count: 288
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uj8.b(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.Serializable c(defpackage.p92 r8) {
        /*
            r7 = this;
            boolean r0 = r8 instanceof defpackage.sj8
            if (r0 == 0) goto L13
            r0 = r8
            sj8 r0 = (defpackage.sj8) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            sj8 r0 = new sj8
            r0.<init>(r7, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r8)     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> L99
            goto L51
        L27:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            r7 = 0
            return r7
        L2e:
            defpackage.br7.v(r8)
            com.medium.android.graphql.UnreadNotificationsCountQuery r8 = new com.medium.android.graphql.UnreadNotificationsCountQuery
            r8.<init>()
            e00 r7 = r7.a
            r7.getClass()
            uz r2 = new uz
            r2.<init>(r7, r8)
            yd4 r7 = defpackage.yd4.CacheFirst
            java.lang.Object r7 = defpackage.gr7.i(r2, r7)
            uz r7 = (defpackage.uz) r7
            r0.d = r3     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> L99
            java.lang.Object r8 = r7.b(r0)     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> L99
            if (r8 != r1) goto L51
            return r1
        L51:
            j00 r8 = (defpackage.j00) r8     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> L99
            du8 r7 = r8.c     // Catch: java.lang.Throwable -> L89
            com.apollographql.apollo.exception.ApolloException r0 = r8.e     // Catch: java.lang.Throwable -> L89
            java.util.List r1 = r8.d     // Catch: java.lang.Throwable -> L89
            if (r0 != 0) goto L88
            if (r1 != 0) goto L77
            if (r7 == 0) goto L6f
            com.medium.android.graphql.UnreadNotificationsCountQuery$Data r7 = (com.medium.android.graphql.UnreadNotificationsCountQuery.Data) r7     // Catch: java.lang.Throwable -> L89
            com.medium.android.graphql.UnreadNotificationsCountQuery$NotificationStatus r7 = r7.getNotificationStatus()     // Catch: java.lang.Throwable -> L89
            int r7 = r7.getUnreadNotificationCount()     // Catch: java.lang.Throwable -> L89
            java.lang.Integer r8 = new java.lang.Integer     // Catch: java.lang.Throwable -> L89
            r8.<init>(r7)     // Catch: java.lang.Throwable -> L89
            goto L98
        L6f:
            com.medium.android.data.common.RitoException r7 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L89
            java.lang.String r8 = "data is null"
            r7.<init>(r8)     // Catch: java.lang.Throwable -> L89
            throw r7     // Catch: java.lang.Throwable -> L89
        L77:
            com.medium.android.data.common.RitoException r7 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L89
            a00 r5 = defpackage.a00.b     // Catch: java.lang.Throwable -> L89
            r6 = 31
            r2 = 0
            r3 = 0
            r4 = 0
            java.lang.String r8 = defpackage.bu1.F0(r1, r2, r3, r4, r5, r6)     // Catch: java.lang.Throwable -> L89
            r7.<init>(r8)     // Catch: java.lang.Throwable -> L89
            throw r7     // Catch: java.lang.Throwable -> L89
        L88:
            throw r0     // Catch: java.lang.Throwable -> L89
        L89:
            r0 = move-exception
            r7 = r0
            ajb r8 = new ajb     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> L99
            r8.<init>(r7)     // Catch: java.lang.Exception -> L91 java.util.concurrent.CancellationException -> L99
            goto L98
        L91:
            r0 = move-exception
            r7 = r0
            ajb r8 = new ajb
            r8.<init>(r7)
        L98:
            return r8
        L99:
            r0 = move-exception
            r7 = r0
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uj8.c(p92):java.io.Serializable");
    }
}
