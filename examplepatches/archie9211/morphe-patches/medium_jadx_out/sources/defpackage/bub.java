package defpackage;

import com.medium.android.graphql.type.SearchOptions;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bub {
    public static final SearchOptions d = new SearchOptions(new yv8(d46.Q("android")), new yv8(Boolean.TRUE), null, null, null, 28, null);
    public final e00 a;
    public final pu7 b;
    public final dm4 c;

    public bub(e00 e00Var, pu7 pu7Var, dm4 dm4Var) {
        e00Var.getClass();
        pu7Var.getClass();
        dm4Var.getClass();
        this.a = e00Var;
        this.b = pu7Var;
        this.c = dm4Var;
    }

    public final void a(String str) {
        str.getClass();
        pu7 pu7Var = this.b;
        pu7Var.getClass();
        ek6 ek6Var = ek6.SEARCH_HISTORY;
        ku7 ku7Var = pu7.j;
        Collection collection = (List) p2.h(pu7Var, ek6Var, ku7Var, null, 4, null);
        if (collection == null) {
            collection = ey3.a;
        }
        ArrayList arrayList = new ArrayList(collection);
        arrayList.remove(str);
        arrayList.add(0, str);
        pu7Var.y(ek6Var, bu1.g1(arrayList, 30), ku7Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:50:0x008d A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:53:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(java.lang.String r7, com.medium.android.graphql.type.AlgoliaIndexName r8, java.util.List r9, java.util.List r10, defpackage.p92 r11) {
        /*
            r6 = this;
            boolean r0 = r11 instanceof defpackage.ptb
            if (r0 == 0) goto L13
            r0 = r11
            ptb r0 = (defpackage.ptb) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ptb r0 = new ptb
            r0.<init>(r6, r11)
        L18:
            java.lang.Object r11 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r11)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> Lab
            goto L49
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r11)
            com.medium.android.graphql.SearchClickEventMutation r11 = new com.medium.android.graphql.SearchClickEventMutation
            r11.<init>(r7, r8, r9, r10)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r11)
            r0.d = r3     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> Lab
            java.lang.Object r11 = r7.b(r0)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> Lab
            if (r11 != r1) goto L49
            return r1
        L49:
            j00 r11 = (defpackage.j00) r11     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> Lab
            du8 r6 = r11.c     // Catch: java.lang.Throwable -> L78
            com.apollographql.apollo.exception.ApolloException r7 = r11.e     // Catch: java.lang.Throwable -> L78
            java.util.List r0 = r11.d     // Catch: java.lang.Throwable -> L78
            if (r7 != 0) goto L77
            if (r0 != 0) goto L66
            if (r6 == 0) goto L5e
            com.medium.android.graphql.SearchClickEventMutation$Data r6 = (com.medium.android.graphql.SearchClickEventMutation.Data) r6     // Catch: java.lang.Throwable -> L78
            java.lang.Boolean r6 = r6.getSearchClickEvent()     // Catch: java.lang.Throwable -> L78
            goto L88
        L5e:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L78
            throw r6     // Catch: java.lang.Throwable -> L78
        L66:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L78
            qtb r4 = defpackage.qtb.b     // Catch: java.lang.Throwable -> L78
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
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> Lab
            r7.<init>(r6)     // Catch: java.lang.Exception -> L80 java.util.concurrent.CancellationException -> Lab
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
            if (r7 != 0) goto Laa
            java.lang.Boolean r6 = (java.lang.Boolean) r6     // Catch: java.lang.Throwable -> La2
            java.lang.Boolean r7 = java.lang.Boolean.TRUE     // Catch: java.lang.Throwable -> La2
            boolean r6 = defpackage.g76.L(r6, r7)     // Catch: java.lang.Throwable -> La2
            if (r6 == 0) goto L9a
            c1e r6 = defpackage.c1e.a     // Catch: java.lang.Throwable -> La2
            goto Laa
        L9a:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> La2
            java.lang.String r7 = "Search result clicked cannot be reported"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> La2
            throw r6     // Catch: java.lang.Throwable -> La2
        La2:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
            r6 = r7
        Laa:
            return r6
        Lab:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.bub.b(java.lang.String, com.medium.android.graphql.type.AlgoliaIndexName, java.util.List, java.util.List, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(java.lang.String r12, com.medium.android.graphql.type.SearchPagingOptions r13, defpackage.yd4 r14, defpackage.p92 r15) {
        /*
            Method dump skipped, instruction units count: 201
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.bub.c(java.lang.String, com.medium.android.graphql.type.SearchPagingOptions, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(java.lang.String r18, com.medium.android.graphql.type.SearchPagingOptions r19, defpackage.yd4 r20, defpackage.p92 r21) {
        /*
            Method dump skipped, instruction units count: 245
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.bub.e(java.lang.String, com.medium.android.graphql.type.SearchPagingOptions, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(java.lang.String r19, com.medium.android.graphql.type.SearchPagingOptions r20, defpackage.yd4 r21, defpackage.p92 r22) {
        /*
            Method dump skipped, instruction units count: 237
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.bub.f(java.lang.String, com.medium.android.graphql.type.SearchPagingOptions, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(java.lang.String r12, com.medium.android.graphql.type.SearchPagingOptions r13, defpackage.yd4 r14, defpackage.p92 r15) {
        /*
            Method dump skipped, instruction units count: 201
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.bub.g(java.lang.String, com.medium.android.graphql.type.SearchPagingOptions, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(java.lang.String r12, com.medium.android.graphql.type.SearchPagingOptions r13, defpackage.yd4 r14, defpackage.p92 r15) {
        /*
            Method dump skipped, instruction units count: 202
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.bub.d(java.lang.String, com.medium.android.graphql.type.SearchPagingOptions, yd4, p92):java.lang.Object");
    }
}
