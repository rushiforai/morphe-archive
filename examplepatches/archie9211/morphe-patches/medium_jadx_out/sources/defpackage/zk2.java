package defpackage;

import com.medium.android.core.models.CurrentUserEntity;
import com.medium.android.core.models.MembershipTypeEntity;
import com.medium.android.graphql.CurrentUserProfileQuery;
import com.medium.android.graphql.fragment.CurrentUserData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zk2 {
    public final e00 a;
    public final u3 b;
    public final vr7 c;
    public final kb2 d;
    public final w5d e;
    public final w5d f;
    public final r6c g;
    public final uua h;

    public zk2(e00 e00Var, u3 u3Var, vr7 vr7Var, kb2 kb2Var) {
        e00Var.getClass();
        u3Var.getClass();
        vr7Var.getClass();
        this.a = e00Var;
        this.b = u3Var;
        this.c = vr7Var;
        this.d = kb2Var;
        final int i = 0;
        this.e = new w5d(new m45(this) { // from class: fk2
            public final /* synthetic */ zk2 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i2 = i;
                zk2 zk2Var = this.b;
                switch (i2) {
                    case 0:
                        vr7 vr7Var2 = zk2Var.c;
                        vr7Var2.getClass();
                        CurrentUserEntity currentUserEntity = null;
                        String strO = p2.o(vr7Var2, ek6.CURRENT_USER, null, 2, null);
                        if (strO != null) {
                            try {
                                currentUserEntity = (CurrentUserEntity) ((jb6) vr7Var2.j.getValue()).b(strO);
                            } catch (Exception e) {
                                wld.a.e(e, "Failed to inflate CurrentUserEntity from JSON", new Object[0]);
                            }
                        }
                        return vv2.j(currentUserEntity);
                    default:
                        return bo.A(zk2Var.q());
                }
            }
        });
        final int i2 = 1;
        this.f = new w5d(new m45(this) { // from class: fk2
            public final /* synthetic */ zk2 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i22 = i2;
                zk2 zk2Var = this.b;
                switch (i22) {
                    case 0:
                        vr7 vr7Var2 = zk2Var.c;
                        vr7Var2.getClass();
                        CurrentUserEntity currentUserEntity = null;
                        String strO = p2.o(vr7Var2, ek6.CURRENT_USER, null, 2, null);
                        if (strO != null) {
                            try {
                                currentUserEntity = (CurrentUserEntity) ((jb6) vr7Var2.j.getValue()).b(strO);
                            } catch (Exception e) {
                                wld.a.e(e, "Failed to inflate CurrentUserEntity from JSON", new Object[0]);
                            }
                        }
                        return vv2.j(currentUserEntity);
                    default:
                        return bo.A(zk2Var.q());
                }
            }
        });
        r6c r6cVarX = k40.x(0, 7, null);
        this.g = r6cVarX;
        this.h = bo.z(r6cVarX);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.p92 r8) {
        /*
            r7 = this;
            boolean r0 = r8 instanceof defpackage.gk2
            if (r0 == 0) goto L13
            r0 = r8
            gk2 r0 = (defpackage.gk2) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            gk2 r0 = new gk2
            r0.<init>(r7, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r8)     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            goto L49
        L27:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            r7 = 0
            return r7
        L2e:
            defpackage.br7.v(r8)
            com.medium.android.graphql.ResetUserReadingHistoryMutation r8 = new com.medium.android.graphql.ResetUserReadingHistoryMutation
            r8.<init>()
            e00 r7 = r7.a
            r7.getClass()
            uz r2 = new uz
            r2.<init>(r7, r8)
            r0.d = r3     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            java.lang.Object r8 = r2.b(r0)     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            if (r8 != r1) goto L49
            return r1
        L49:
            j00 r8 = (defpackage.j00) r8     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            du8 r7 = r8.c     // Catch: java.lang.Throwable -> L88
            com.apollographql.apollo.exception.ApolloException r0 = r8.e     // Catch: java.lang.Throwable -> L88
            java.util.List r1 = r8.d     // Catch: java.lang.Throwable -> L88
            if (r0 != 0) goto L87
            if (r1 != 0) goto L76
            if (r7 == 0) goto L6e
            com.medium.android.graphql.ResetUserReadingHistoryMutation$Data r7 = (com.medium.android.graphql.ResetUserReadingHistoryMutation.Data) r7     // Catch: java.lang.Throwable -> L88
            com.medium.android.graphql.ResetUserReadingHistoryMutation$ResetUserReadingHistory r7 = r7.getResetUserReadingHistory()     // Catch: java.lang.Throwable -> L88
            boolean r7 = r7.getSuccess()     // Catch: java.lang.Throwable -> L88
            if (r7 == 0) goto L66
            c1e r7 = defpackage.c1e.a     // Catch: java.lang.Throwable -> L88
            goto L98
        L66:
            com.medium.android.data.common.RitoException r7 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L88
            java.lang.String r8 = "Clear history failed"
            r7.<init>(r8)     // Catch: java.lang.Throwable -> L88
            throw r7     // Catch: java.lang.Throwable -> L88
        L6e:
            com.medium.android.data.common.RitoException r7 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L88
            java.lang.String r8 = "data is null"
            r7.<init>(r8)     // Catch: java.lang.Throwable -> L88
            throw r7     // Catch: java.lang.Throwable -> L88
        L76:
            com.medium.android.data.common.RitoException r7 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L88
            a00 r5 = defpackage.a00.b     // Catch: java.lang.Throwable -> L88
            r6 = 31
            r2 = 0
            r3 = 0
            r4 = 0
            java.lang.String r8 = defpackage.bu1.F0(r1, r2, r3, r4, r5, r6)     // Catch: java.lang.Throwable -> L88
            r7.<init>(r8)     // Catch: java.lang.Throwable -> L88
            throw r7     // Catch: java.lang.Throwable -> L88
        L87:
            throw r0     // Catch: java.lang.Throwable -> L88
        L88:
            r0 = move-exception
            r7 = r0
            ajb r8 = new ajb     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            r8.<init>(r7)     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            goto L97
        L90:
            r0 = move-exception
            r7 = r0
            ajb r8 = new ajb
            r8.<init>(r7)
        L97:
            r7 = r8
        L98:
            return r7
        L99:
            r0 = move-exception
            r7 = r0
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zk2.a(p92):java.lang.Object");
    }

    /* JADX WARN: Can't wrap try/catch for region: R(15:0|2|(2:4|(1:6)(1:8))(0)|7|9|(1:84)|(1:(1:(1:(1:(4:15|75|76|(2:78|86)(2:79|80))(2:16|17))(5:18|66|(4:68|(1:71)|(2:74|75)|73)|76|(0)(0)))(6:19|20|39|83|40|(1:(1:(7:44|(1:46)(1:49)|57|59|(2:61|(3:63|(2:66|(0))|73)(0))(0)|76|(0)(0))(2:50|51))(2:52|53))(1:54)))(1:24))(6:25|(1:27)|28|(1:31)|(1:34)|73)|35|36|(2:38|73)|39|83|40|(0)(0)|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00e5, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x010a, code lost:
    
        r0 = new defpackage.ajb(r0);
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00d4  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0104 A[Catch: all -> 0x00e5, TRY_LEAVE, TryCatch #0 {all -> 0x00e5, blocks: (B:40:0x00cc, B:44:0x00d8, B:46:0x00e0, B:50:0x00e9, B:51:0x00f0, B:52:0x00f1, B:53:0x0103, B:54:0x0104), top: B:83:0x00cc }] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x013b A[PHI: r2 r3 r4
      0x013b: PHI (r2v7 java.lang.Object) = (r2v6 java.lang.Object), (r2v6 java.lang.Object), (r2v6 java.lang.Object), (r2v23 java.lang.Object) binds: [B:60:0x011c, B:62:0x0121, B:64:0x0138, B:18:0x0048] A[DONT_GENERATE, DONT_INLINE]
      0x013b: PHI (r3v4 ??) = (r3v16 ??), (r3v17 ??), (r3v18 ??), (r3v19 ??) binds: [B:60:0x011c, B:62:0x0121, B:64:0x0138, B:18:0x0048] A[DONT_GENERATE, DONT_INLINE]
      0x013b: PHI (r4v3 ??) = (r4v13 ??), (r4v14 ??), (r4v15 ??), (r4v16 ??) binds: [B:60:0x011c, B:62:0x0121, B:64:0x0138, B:18:0x0048] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0142  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0164  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0167  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r20v0 */
    /* JADX WARN: Type inference failed for: r2v15 */
    /* JADX WARN: Type inference failed for: r2v28 */
    /* JADX WARN: Type inference failed for: r2v29 */
    /* JADX WARN: Type inference failed for: r2v3, types: [int] */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r3v0 */
    /* JADX WARN: Type inference failed for: r3v1 */
    /* JADX WARN: Type inference failed for: r3v16 */
    /* JADX WARN: Type inference failed for: r3v17 */
    /* JADX WARN: Type inference failed for: r3v18 */
    /* JADX WARN: Type inference failed for: r3v19 */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v20 */
    /* JADX WARN: Type inference failed for: r3v21 */
    /* JADX WARN: Type inference failed for: r3v3 */
    /* JADX WARN: Type inference failed for: r3v4, types: [java.util.Set] */
    /* JADX WARN: Type inference failed for: r3v8 */
    /* JADX WARN: Type inference failed for: r3v9 */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v13 */
    /* JADX WARN: Type inference failed for: r4v14 */
    /* JADX WARN: Type inference failed for: r4v15 */
    /* JADX WARN: Type inference failed for: r4v16 */
    /* JADX WARN: Type inference failed for: r4v2, types: [com.medium.android.graphql.type.UserDismissableFlags] */
    /* JADX WARN: Type inference failed for: r4v3, types: [com.medium.android.graphql.type.UserDismissableFlags] */
    /* JADX WARN: Type inference failed for: r4v7 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(com.medium.android.graphql.type.UserDismissableFlags r22, defpackage.p92 r23) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 363
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zk2.b(com.medium.android.graphql.type.UserDismissableFlags, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(com.medium.android.graphql.type.PagingOptions r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.jk2
            if (r0 == 0) goto L13
            r0 = r14
            jk2 r0 = (defpackage.jk2) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            jk2 r0 = new jk2
            r0.<init>(r11, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r14)     // Catch: java.lang.Exception -> L9b java.util.concurrent.CancellationException -> Lb9
            goto L5e
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r14)
            com.medium.android.graphql.AllFollowingQuery r14 = new com.medium.android.graphql.AllFollowingQuery
            java.lang.String r2 = r11.m()
            if (r12 != 0) goto L3c
            xv8 r12 = defpackage.xv8.a
            goto L42
        L3c:
            yv8 r5 = new yv8
            r5.<init>(r12)
            r12 = r5
        L42:
            r14.<init>(r2, r12)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r14)
            java.lang.Object r11 = defpackage.gr7.i(r12, r13)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> L9b java.util.concurrent.CancellationException -> Lb9
            java.lang.Object r14 = r11.b(r0)     // Catch: java.lang.Exception -> L9b java.util.concurrent.CancellationException -> Lb9
            if (r14 != r1) goto L5e
            return r1
        L5e:
            j00 r14 = (defpackage.j00) r14     // Catch: java.lang.Exception -> L9b java.util.concurrent.CancellationException -> Lb9
            du8 r11 = r14.c     // Catch: java.lang.Throwable -> L93
            com.apollographql.apollo.exception.ApolloException r12 = r14.e     // Catch: java.lang.Throwable -> L93
            java.util.List r5 = r14.d     // Catch: java.lang.Throwable -> L93
            if (r12 != 0) goto L92
            if (r5 != 0) goto L81
            if (r11 == 0) goto L79
            com.medium.android.graphql.AllFollowingQuery$Data r11 = (com.medium.android.graphql.AllFollowingQuery.Data) r11     // Catch: java.lang.Throwable -> L93
            com.medium.android.graphql.AllFollowingQuery$User r11 = r11.getUser()     // Catch: java.lang.Throwable -> L93
            if (r11 == 0) goto La2
            com.medium.android.graphql.AllFollowingQuery$OnUser r4 = r11.getOnUser()     // Catch: java.lang.Throwable -> L93
            goto La2
        L79:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L93
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L93
            throw r11     // Catch: java.lang.Throwable -> L93
        L81:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L93
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L93
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L93
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L93
            throw r11     // Catch: java.lang.Throwable -> L93
        L92:
            throw r12     // Catch: java.lang.Throwable -> L93
        L93:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L9b java.util.concurrent.CancellationException -> Lb9
            r4.<init>(r11)     // Catch: java.lang.Exception -> L9b java.util.concurrent.CancellationException -> Lb9
            goto La2
        L9b:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        La2:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lb8
            if (r4 == 0) goto La9
            goto Lb8
        La9:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lb1
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> Lb1
            throw r11     // Catch: java.lang.Throwable -> Lb1
        Lb1:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lb8:
            return r4
        Lb9:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zk2.c(com.medium.android.graphql.type.PagingOptions, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(com.medium.android.graphql.type.PagingOptions r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.lk2
            if (r0 == 0) goto L13
            r0 = r14
            lk2 r0 = (defpackage.lk2) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            lk2 r0 = new lk2
            r0.<init>(r11, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r14)     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            goto L5e
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r14)
            com.medium.android.graphql.MutedCollectionsQuery r14 = new com.medium.android.graphql.MutedCollectionsQuery
            java.lang.String r2 = r11.m()
            if (r12 != 0) goto L3c
            xv8 r12 = defpackage.xv8.a
            goto L42
        L3c:
            yv8 r5 = new yv8
            r5.<init>(r12)
            r12 = r5
        L42:
            r14.<init>(r2, r12)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r14)
            java.lang.Object r11 = defpackage.gr7.i(r12, r13)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            java.lang.Object r14 = r11.b(r0)     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            if (r14 != r1) goto L5e
            return r1
        L5e:
            j00 r14 = (defpackage.j00) r14     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            du8 r11 = r14.c     // Catch: java.lang.Throwable -> L99
            com.apollographql.apollo.exception.ApolloException r12 = r14.e     // Catch: java.lang.Throwable -> L99
            java.util.List r5 = r14.d     // Catch: java.lang.Throwable -> L99
            if (r12 != 0) goto L98
            if (r5 != 0) goto L87
            if (r11 == 0) goto L7f
            com.medium.android.graphql.MutedCollectionsQuery$Data r11 = (com.medium.android.graphql.MutedCollectionsQuery.Data) r11     // Catch: java.lang.Throwable -> L99
            com.medium.android.graphql.MutedCollectionsQuery$User r11 = r11.getUser()     // Catch: java.lang.Throwable -> L99
            if (r11 == 0) goto La8
            com.medium.android.graphql.MutedCollectionsQuery$OnUser r11 = r11.getOnUser()     // Catch: java.lang.Throwable -> L99
            if (r11 == 0) goto La8
            com.medium.android.graphql.MutedCollectionsQuery$MutedCollectionConnection r4 = r11.getMutedCollectionConnection()     // Catch: java.lang.Throwable -> L99
            goto La8
        L7f:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L99
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L99
            throw r11     // Catch: java.lang.Throwable -> L99
        L87:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L99
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L99
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L99
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L99
            throw r11     // Catch: java.lang.Throwable -> L99
        L98:
            throw r12     // Catch: java.lang.Throwable -> L99
        L99:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            r4.<init>(r11)     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            goto La8
        La1:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        La8:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lbe
            if (r4 == 0) goto Laf
            goto Lbe
        Laf:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lb7
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> Lb7
            throw r11     // Catch: java.lang.Throwable -> Lb7
        Lb7:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lbe:
            return r4
        Lbf:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zk2.e(com.medium.android.graphql.type.PagingOptions, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(com.medium.android.graphql.type.PagingOptions r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.mk2
            if (r0 == 0) goto L13
            r0 = r14
            mk2 r0 = (defpackage.mk2) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            mk2 r0 = new mk2
            r0.<init>(r11, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r14)     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            goto L5e
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r14)
            com.medium.android.graphql.MutedUsersQuery r14 = new com.medium.android.graphql.MutedUsersQuery
            java.lang.String r2 = r11.m()
            if (r12 != 0) goto L3c
            xv8 r12 = defpackage.xv8.a
            goto L42
        L3c:
            yv8 r5 = new yv8
            r5.<init>(r12)
            r12 = r5
        L42:
            r14.<init>(r2, r12)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r14)
            java.lang.Object r11 = defpackage.gr7.i(r12, r13)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            java.lang.Object r14 = r11.b(r0)     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            if (r14 != r1) goto L5e
            return r1
        L5e:
            j00 r14 = (defpackage.j00) r14     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            du8 r11 = r14.c     // Catch: java.lang.Throwable -> L99
            com.apollographql.apollo.exception.ApolloException r12 = r14.e     // Catch: java.lang.Throwable -> L99
            java.util.List r5 = r14.d     // Catch: java.lang.Throwable -> L99
            if (r12 != 0) goto L98
            if (r5 != 0) goto L87
            if (r11 == 0) goto L7f
            com.medium.android.graphql.MutedUsersQuery$Data r11 = (com.medium.android.graphql.MutedUsersQuery.Data) r11     // Catch: java.lang.Throwable -> L99
            com.medium.android.graphql.MutedUsersQuery$User r11 = r11.getUser()     // Catch: java.lang.Throwable -> L99
            if (r11 == 0) goto La8
            com.medium.android.graphql.MutedUsersQuery$OnUser r11 = r11.getOnUser()     // Catch: java.lang.Throwable -> L99
            if (r11 == 0) goto La8
            com.medium.android.graphql.MutedUsersQuery$MutedUserConnection r4 = r11.getMutedUserConnection()     // Catch: java.lang.Throwable -> L99
            goto La8
        L7f:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L99
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L99
            throw r11     // Catch: java.lang.Throwable -> L99
        L87:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L99
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L99
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L99
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L99
            throw r11     // Catch: java.lang.Throwable -> L99
        L98:
            throw r12     // Catch: java.lang.Throwable -> L99
        L99:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            r4.<init>(r11)     // Catch: java.lang.Exception -> La1 java.util.concurrent.CancellationException -> Lbf
            goto La8
        La1:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        La8:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lbe
            if (r4 == 0) goto Laf
            goto Lbe
        Laf:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lb7
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> Lb7
            throw r11     // Catch: java.lang.Throwable -> Lb7
        Lb7:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lbe:
            return r4
        Lbf:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zk2.f(com.medium.android.graphql.type.PagingOptions, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(int r7, defpackage.yd4 r8, defpackage.p92 r9) {
        /*
            r6 = this;
            boolean r0 = r9 instanceof defpackage.nk2
            if (r0 == 0) goto L13
            r0 = r9
            nk2 r0 = (defpackage.nk2) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            nk2 r0 = new nk2
            r0.<init>(r6, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r9)     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            goto L5f
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r9)
            com.medium.android.graphql.AllSuggestionsQuery r9 = new com.medium.android.graphql.AllSuggestionsQuery
            com.medium.android.graphql.type.RecommendedPublishersMode r2 = com.medium.android.graphql.type.RecommendedPublishersMode.ALL
            yv8 r4 = new yv8
            r4.<init>(r2)
            com.medium.android.graphql.type.RecommendedTagsInput r2 = new com.medium.android.graphql.type.RecommendedTagsInput
            xv8 r5 = defpackage.xv8.a
            r2.<init>(r5, r7)
            java.lang.String r5 = ""
            r9.<init>(r7, r5, r4, r2)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r9)
            java.lang.Object r6 = defpackage.gr7.i(r7, r8)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            java.lang.Object r9 = r6.b(r0)     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            if (r9 != r1) goto L5f
            return r1
        L5f:
            j00 r9 = (defpackage.j00) r9     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            du8 r6 = r9.c     // Catch: java.lang.Throwable -> L88
            com.apollographql.apollo.exception.ApolloException r7 = r9.e     // Catch: java.lang.Throwable -> L88
            java.util.List r0 = r9.d     // Catch: java.lang.Throwable -> L88
            if (r7 != 0) goto L87
            if (r0 != 0) goto L76
            if (r6 == 0) goto L6e
            goto L98
        L6e:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L88
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L88
            throw r6     // Catch: java.lang.Throwable -> L88
        L76:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L88
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L88
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L88
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L88
            throw r6     // Catch: java.lang.Throwable -> L88
        L87:
            throw r7     // Catch: java.lang.Throwable -> L88
        L88:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            r7.<init>(r6)     // Catch: java.lang.Exception -> L90 java.util.concurrent.CancellationException -> L99
            goto L97
        L90:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L97:
            r6 = r7
        L98:
            return r6
        L99:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zk2.g(int, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object i(com.medium.android.graphql.type.PagingOptions r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.pk2
            if (r0 == 0) goto L13
            r0 = r14
            pk2 r0 = (defpackage.pk2) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            pk2 r0 = new pk2
            r0.<init>(r11, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r14)     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lbb
            goto L5a
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r14)
            com.medium.android.graphql.ReadingHistoryQuery r14 = new com.medium.android.graphql.ReadingHistoryQuery
            if (r12 != 0) goto L38
            xv8 r12 = defpackage.xv8.a
            goto L3e
        L38:
            yv8 r2 = new yv8
            r2.<init>(r12)
            r12 = r2
        L3e:
            r14.<init>(r12)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r14)
            java.lang.Object r11 = defpackage.gr7.i(r12, r13)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lbb
            java.lang.Object r14 = r11.b(r0)     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lbb
            if (r14 != r1) goto L5a
            return r1
        L5a:
            j00 r14 = (defpackage.j00) r14     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lbb
            du8 r11 = r14.c     // Catch: java.lang.Throwable -> L95
            com.apollographql.apollo.exception.ApolloException r12 = r14.e     // Catch: java.lang.Throwable -> L95
            java.util.List r5 = r14.d     // Catch: java.lang.Throwable -> L95
            if (r12 != 0) goto L94
            if (r5 != 0) goto L83
            if (r11 == 0) goto L7b
            com.medium.android.graphql.ReadingHistoryQuery$Data r11 = (com.medium.android.graphql.ReadingHistoryQuery.Data) r11     // Catch: java.lang.Throwable -> L95
            com.medium.android.graphql.ReadingHistoryQuery$Viewer r11 = r11.getViewer()     // Catch: java.lang.Throwable -> L95
            if (r11 == 0) goto La4
            com.medium.android.graphql.ReadingHistoryQuery$ReadingHistory r11 = r11.getReadingHistory()     // Catch: java.lang.Throwable -> L95
            if (r11 == 0) goto La4
            com.medium.android.graphql.ReadingHistoryQuery$PostPreviewConnection r4 = r11.getPostPreviewConnection()     // Catch: java.lang.Throwable -> L95
            goto La4
        L7b:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L95
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L95
            throw r11     // Catch: java.lang.Throwable -> L95
        L83:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L95
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L95
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L95
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L95
            throw r11     // Catch: java.lang.Throwable -> L95
        L94:
            throw r12     // Catch: java.lang.Throwable -> L95
        L95:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lbb
            r4.<init>(r11)     // Catch: java.lang.Exception -> L9d java.util.concurrent.CancellationException -> Lbb
            goto La4
        L9d:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        La4:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lba
            if (r4 == 0) goto Lab
            goto Lba
        Lab:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lb3
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> Lb3
            throw r11     // Catch: java.lang.Throwable -> Lb3
        Lb3:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lba:
            return r4
        Lbb:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zk2.i(com.medium.android.graphql.type.PagingOptions, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object j(int r7, defpackage.p92 r8, defpackage.yd4 r9, java.lang.String r10) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.qk2
            if (r0 == 0) goto L13
            r0 = r8
            qk2 r0 = (defpackage.qk2) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            qk2 r0 = new qk2
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r8)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> L8f
            goto L55
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r8)
            com.medium.android.graphql.RecommendedPublishersQuery r8 = new com.medium.android.graphql.RecommendedPublishersQuery
            if (r10 != 0) goto L37
            java.lang.String r10 = ""
        L37:
            com.medium.android.graphql.type.RecommendedPublishersMode r2 = com.medium.android.graphql.type.RecommendedPublishersMode.USERS_ONLY
            r8.<init>(r7, r10, r2)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r8)
            java.lang.Object r6 = defpackage.gr7.i(r7, r9)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> L8f
            java.lang.Object r8 = r6.b(r0)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> L8f
            if (r8 != r1) goto L55
            return r1
        L55:
            j00 r8 = (defpackage.j00) r8     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> L8f
            du8 r6 = r8.c     // Catch: java.lang.Throwable -> L7e
            com.apollographql.apollo.exception.ApolloException r7 = r8.e     // Catch: java.lang.Throwable -> L7e
            java.util.List r0 = r8.d     // Catch: java.lang.Throwable -> L7e
            if (r7 != 0) goto L7d
            if (r0 != 0) goto L6c
            if (r6 == 0) goto L64
            goto L8e
        L64:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7e
            java.lang.String r7 = "data is null"
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L7e
            throw r6     // Catch: java.lang.Throwable -> L7e
        L6c:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7e
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L7e
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
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> L8f
            r7.<init>(r6)     // Catch: java.lang.Exception -> L86 java.util.concurrent.CancellationException -> L8f
            goto L8d
        L86:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L8d:
            r6 = r7
        L8e:
            return r6
        L8f:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zk2.j(int, p92, yd4, java.lang.String):java.lang.Object");
    }

    public final s3 k() {
        String str = null;
        String str2 = null;
        for (aa2 aa2Var : this.b.b()) {
            String str3 = aa2Var.a;
            String str4 = aa2Var.b;
            if (g76.L(str3, "uid")) {
                str = str4;
            } else if (g76.L(str3, "sid")) {
                str2 = str4;
            }
        }
        if (str == null || str2 == null) {
            return null;
        }
        return new s3(str, str2);
    }

    /* JADX WARN: Can't wrap try/catch for region: R(11:0|2|(2:4|(1:6)(1:7))(0)|8|(1:68)|(1:(1:(1:(5:13|14|61|62|71)(2:16|17))(3:18|55|(1:72)(1:58)))(2:19|20))(3:24|25|(2:27|60))|28|70|29|(1:(1:(7:33|(1:35)(1:38)|46|48|(3:52|(0)|60)|55|(0)(0))(2:39|40))(2:41|42))(1:43)|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0096, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00b9, code lost:
    
        r0 = new defpackage.ajb(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x00ee, code lost:
    
        if (r0 == r3) goto L60;
     */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00e1 A[Catch: all -> 0x00f5, TRY_ENTER, TryCatch #1 {all -> 0x00f5, blocks: (B:14:0x0034, B:61:0x00f1, B:58:0x00e1), top: B:68:0x0028 }] */
    /* JADX WARN: Removed duplicated region for block: B:72:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object l(defpackage.p92 r18) {
        /*
            Method dump skipped, instruction units count: 255
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zk2.l(p92):java.lang.Object");
    }

    public final String m() {
        String strD = this.b.d();
        return strD == null ? "" : strD;
    }

    public final String n() {
        String strM = m();
        if (tj2.a(strM)) {
            return strM;
        }
        return null;
    }

    public final zw7 o() {
        MembershipTypeEntity membershipType;
        zw7 zw7VarX;
        CurrentUserEntity currentUserEntity = (CurrentUserEntity) ((vpc) this.f.getValue()).getValue();
        return (currentUserEntity == null || (membershipType = currentUserEntity.getMembershipType()) == null || (zw7VarX = to7.x(membershipType)) == null) ? zw7.NOT_A_MEMBER : zw7VarX;
    }

    public final String p() {
        u3 u3Var = this.b;
        String str = u3Var.e;
        if (str == null) {
            String strD = u3Var.d();
            str = null;
            if (strD != null) {
                if (muc.b0(strD)) {
                    strD = null;
                }
                if (strD != null && tj2.b(strD)) {
                    return strD;
                }
            }
        }
        return str;
    }

    public final xpc q() {
        return (xpc) this.e.getValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object r(defpackage.yd4 r12, boolean r13, defpackage.p92 r14) {
        /*
            Method dump skipped, instruction units count: 256
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zk2.r(yd4, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object s(defpackage.yd4 r12, boolean r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.uk2
            if (r0 == 0) goto L13
            r0 = r14
            uk2 r0 = (defpackage.uk2) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            uk2 r0 = new uk2
            r0.<init>(r11, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r14)     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> La2
            goto L57
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r14)
            com.medium.android.graphql.MembershipStatusQuery r14 = new com.medium.android.graphql.MembershipStatusQuery
            r14.<init>()
            e00 r11 = r11.a
            r11.getClass()
            uz r2 = new uz
            r2.<init>(r11, r14)
            java.lang.Object r11 = defpackage.gr7.i(r2, r12)
            uz r11 = (defpackage.uz) r11
            java.lang.Boolean r12 = java.lang.Boolean.valueOf(r13)
            h00 r13 = r11.b
            r13.i = r12
            r0.d = r3     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> La2
            java.lang.Object r14 = r11.b(r0)     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> La2
            if (r14 != r1) goto L57
            return r1
        L57:
            j00 r14 = (defpackage.j00) r14     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> La2
            du8 r11 = r14.c     // Catch: java.lang.Throwable -> L92
            com.apollographql.apollo.exception.ApolloException r12 = r14.e     // Catch: java.lang.Throwable -> L92
            java.util.List r5 = r14.d     // Catch: java.lang.Throwable -> L92
            if (r12 != 0) goto L91
            if (r5 != 0) goto L80
            if (r11 == 0) goto L78
            com.medium.android.graphql.MembershipStatusQuery$Data r11 = (com.medium.android.graphql.MembershipStatusQuery.Data) r11     // Catch: java.lang.Throwable -> L92
            com.medium.android.graphql.MembershipStatusQuery$Viewer r11 = r11.getViewer()     // Catch: java.lang.Throwable -> L92
            if (r11 == 0) goto La1
            com.medium.android.graphql.MembershipStatusQuery$ViewerEdge r11 = r11.getViewerEdge()     // Catch: java.lang.Throwable -> L92
            if (r11 == 0) goto La1
            com.medium.android.graphql.MembershipStatusQuery$Membership r4 = r11.getMembership()     // Catch: java.lang.Throwable -> L92
            goto La1
        L78:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L92
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L92
            throw r11     // Catch: java.lang.Throwable -> L92
        L80:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L92
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L92
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L92
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L92
            throw r11     // Catch: java.lang.Throwable -> L92
        L91:
            throw r12     // Catch: java.lang.Throwable -> L92
        L92:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> La2
            r4.<init>(r11)     // Catch: java.lang.Exception -> L9a java.util.concurrent.CancellationException -> La2
            goto La1
        L9a:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        La1:
            return r4
        La2:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zk2.s(yd4, boolean, p92):java.lang.Object");
    }

    public final void t() {
        Object value;
        CurrentUserEntity currentUserEntityCopy$default;
        xpc xpcVarQ = q();
        do {
            value = xpcVarQ.getValue();
            CurrentUserEntity currentUserEntity = (CurrentUserEntity) value;
            if (currentUserEntity == null) {
                return;
            }
            currentUserEntityCopy$default = CurrentUserEntity.copy$default(currentUserEntity, null, null, null, null, null, null, null, null, null, null, null, false, null, null, null, false, false, null, null, true, null, null, null, false, 16252927, null);
            this.c.P(currentUserEntityCopy$default);
        } while (!xpcVarQ.k(value, currentUserEntityCopy$default));
    }

    public final Object u(long j, long j2, p92 p92Var) {
        Object value;
        CurrentUserEntity currentUserEntityCopy$default;
        CurrentUserProfileQuery.Data data;
        CurrentUserData currentUserData;
        CurrentUserData.SocialStats socialStats;
        long j3 = j + j2;
        xpc xpcVarQ = q();
        do {
            value = xpcVarQ.getValue();
            CurrentUserEntity currentUserEntity = (CurrentUserEntity) value;
            if (currentUserEntity != null) {
                Long followingCount = currentUserEntity.getFollowingCount();
                currentUserEntityCopy$default = CurrentUserEntity.copy$default(currentUserEntity, null, null, null, null, null, null, null, followingCount != null ? new Long(followingCount.longValue() + j3) : null, null, null, null, false, null, null, null, false, false, null, null, false, null, null, null, false, 16777087, null);
            } else {
                currentUserEntityCopy$default = null;
            }
            this.c.P(currentUserEntityCopy$default);
        } while (!xpcVarQ.k(value, currentUserEntityCopy$default));
        m00 m00VarM = gr7.m(this.a);
        CurrentUserProfileQuery currentUserProfileQuery = new CurrentUserProfileQuery(m());
        yl2 yl2Var = yl2.e;
        f31 f31Var = f31.b;
        du8 du8VarE0 = gsa.e0(m00VarM, currentUserProfileQuery, yl2Var, f31Var);
        if (du8VarE0 != null) {
            CurrentUserProfileQuery.Data data2 = (CurrentUserProfileQuery.Data) du8VarE0;
            CurrentUserProfileQuery.User user = data2.getUser();
            if (user == null || (socialStats = (currentUserData = user.getCurrentUserData()).getSocialStats()) == null) {
                data = data2;
            } else {
                Long followingCount2 = socialStats.getFollowingCount();
                Long l = followingCount2 != null ? new Long(followingCount2.longValue() + j) : null;
                Long collectionFollowingCount = socialStats.getCollectionFollowingCount();
                data = new CurrentUserProfileQuery.Data(CurrentUserProfileQuery.User.copy$default(user, null, null, CurrentUserData.copy$default(currentUserData, null, null, null, null, null, null, null, CurrentUserData.SocialStats.copy$default(socialStats, null, null, l, collectionFollowingCount != null ? new Long(collectionFollowingCount.longValue() + j2) : null, 3, null), null, null, null, null, null, null, null, null, null, false, null, null, 1048447, null), 3, null));
            }
            Object objG = ((zw2) m00VarM).g(currentUserProfileQuery, data, yl2Var, f31Var, true, p92Var);
            if (objG == tb2.COROUTINE_SUSPENDED) {
                return objG;
            }
        }
        return c1e.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:102:0x0198  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x01b1  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0098  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00c2 A[Catch: all -> 0x00a7, TRY_LEAVE, TryCatch #3 {all -> 0x00a7, blocks: (B:31:0x0090, B:35:0x009c, B:38:0x00a9, B:39:0x00ae, B:40:0x00af, B:41:0x00c1, B:42:0x00c2), top: B:123:0x0090 }] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0128  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x014c A[Catch: all -> 0x0133, TRY_LEAVE, TryCatch #2 {all -> 0x0133, blocks: (B:66:0x0120, B:70:0x012c, B:73:0x0135, B:74:0x013a, B:75:0x013b, B:76:0x014b, B:77:0x014c), top: B:122:0x0120 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0162 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:95:0x017a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object v(java.lang.String r41, java.lang.String r42, java.lang.String r43, java.util.List r44, defpackage.p92 r45) {
        /*
            Method dump skipped, instruction units count: 512
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zk2.v(java.lang.String, java.lang.String, java.lang.String, java.util.List, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(com.medium.android.graphql.type.PagingOptions r12, defpackage.yd4 r13, defpackage.p92 r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof defpackage.kk2
            if (r0 == 0) goto L13
            r0 = r14
            kk2 r0 = (defpackage.kk2) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            kk2 r0 = new kk2
            r0.<init>(r11, r14)
        L18:
            java.lang.Object r14 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2f
            if (r2 != r3) goto L28
            defpackage.br7.v(r14)     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> Lba
            goto L5f
        L28:
            r11 = 0
            java.lang.String r11 = androidx.emoji2.text.flatbuffer.aI.aJzfoQ.OmBavLHcxJHx
            defpackage.ygf.f(r11)
            return r4
        L2f:
            defpackage.br7.v(r14)
            com.medium.android.graphql.AllMutedQuery r14 = new com.medium.android.graphql.AllMutedQuery
            java.lang.String r2 = r11.m()
            if (r12 != 0) goto L3d
            xv8 r12 = defpackage.xv8.a
            goto L43
        L3d:
            yv8 r5 = new yv8
            r5.<init>(r12)
            r12 = r5
        L43:
            r14.<init>(r2, r12)
            e00 r11 = r11.a
            r11.getClass()
            uz r12 = new uz
            r12.<init>(r11, r14)
            java.lang.Object r11 = defpackage.gr7.i(r12, r13)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> Lba
            java.lang.Object r14 = r11.b(r0)     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> Lba
            if (r14 != r1) goto L5f
            return r1
        L5f:
            j00 r14 = (defpackage.j00) r14     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> Lba
            du8 r11 = r14.c     // Catch: java.lang.Throwable -> L94
            com.apollographql.apollo.exception.ApolloException r12 = r14.e     // Catch: java.lang.Throwable -> L94
            java.util.List r5 = r14.d     // Catch: java.lang.Throwable -> L94
            if (r12 != 0) goto L93
            if (r5 != 0) goto L82
            if (r11 == 0) goto L7a
            com.medium.android.graphql.AllMutedQuery$Data r11 = (com.medium.android.graphql.AllMutedQuery.Data) r11     // Catch: java.lang.Throwable -> L94
            com.medium.android.graphql.AllMutedQuery$User r11 = r11.getUser()     // Catch: java.lang.Throwable -> L94
            if (r11 == 0) goto La3
            com.medium.android.graphql.AllMutedQuery$OnUser r4 = r11.getOnUser()     // Catch: java.lang.Throwable -> L94
            goto La3
        L7a:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L94
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L94
            throw r11     // Catch: java.lang.Throwable -> L94
        L82:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L94
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L94
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L94
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L94
            throw r11     // Catch: java.lang.Throwable -> L94
        L93:
            throw r12     // Catch: java.lang.Throwable -> L94
        L94:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> Lba
            r4.<init>(r11)     // Catch: java.lang.Exception -> L9c java.util.concurrent.CancellationException -> Lba
            goto La3
        L9c:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        La3:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lb9
            if (r4 == 0) goto Laa
            goto Lb9
        Laa:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lb2
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> Lb2
            throw r11     // Catch: java.lang.Throwable -> Lb2
        Lb2:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lb9:
            return r4
        Lba:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zk2.d(com.medium.android.graphql.type.PagingOptions, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object h(int r7, defpackage.p92 r8, defpackage.yd4 r9, java.lang.String r10) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.ok2
            if (r0 == 0) goto L13
            r0 = r8
            ok2 r0 = (defpackage.ok2) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ok2 r0 = new ok2
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L27
            defpackage.br7.v(r8)     // Catch: java.lang.Exception -> L87 java.util.concurrent.CancellationException -> L90
            goto L55
        L27:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L2e:
            defpackage.br7.v(r8)
            com.medium.android.graphql.RecommendedPublishersQuery r8 = new com.medium.android.graphql.RecommendedPublishersQuery
            if (r10 != 0) goto L37
            java.lang.String r10 = ""
        L37:
            com.medium.android.graphql.type.RecommendedPublishersMode r2 = com.medium.android.graphql.type.RecommendedPublishersMode.PUBLICATIONS_ONLY
            r8.<init>(r7, r10, r2)
            e00 r6 = r6.a
            r6.getClass()
            uz r7 = new uz
            r7.<init>(r6, r8)
            java.lang.Object r6 = defpackage.gr7.i(r7, r9)
            uz r6 = (defpackage.uz) r6
            r0.d = r3     // Catch: java.lang.Exception -> L87 java.util.concurrent.CancellationException -> L90
            java.lang.Object r8 = r6.b(r0)     // Catch: java.lang.Exception -> L87 java.util.concurrent.CancellationException -> L90
            if (r8 != r1) goto L55
            return r1
        L55:
            j00 r8 = (defpackage.j00) r8     // Catch: java.lang.Exception -> L87 java.util.concurrent.CancellationException -> L90
            du8 r6 = r8.c     // Catch: java.lang.Throwable -> L7f
            com.apollographql.apollo.exception.ApolloException r7 = r8.e     // Catch: java.lang.Throwable -> L7f
            java.util.List r0 = r8.d     // Catch: java.lang.Throwable -> L7f
            if (r7 != 0) goto L7e
            if (r0 != 0) goto L6d
            if (r6 == 0) goto L64
            goto L8f
        L64:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7f
            r7 = 0
            java.lang.String r7 = com.google.android.gms.analytics.wYI.ivbZv.ibJjgOQrkfPVFX     // Catch: java.lang.Throwable -> L7f
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L7f
            throw r6     // Catch: java.lang.Throwable -> L7f
        L6d:
            com.medium.android.data.common.RitoException r6 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L7f
            a00 r4 = defpackage.a00.b     // Catch: java.lang.Throwable -> L7f
            r5 = 31
            r1 = 0
            r2 = 0
            r3 = 0
            java.lang.String r7 = defpackage.bu1.F0(r0, r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L7f
            r6.<init>(r7)     // Catch: java.lang.Throwable -> L7f
            throw r6     // Catch: java.lang.Throwable -> L7f
        L7e:
            throw r7     // Catch: java.lang.Throwable -> L7f
        L7f:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb     // Catch: java.lang.Exception -> L87 java.util.concurrent.CancellationException -> L90
            r7.<init>(r6)     // Catch: java.lang.Exception -> L87 java.util.concurrent.CancellationException -> L90
            goto L8e
        L87:
            r0 = move-exception
            r6 = r0
            ajb r7 = new ajb
            r7.<init>(r6)
        L8e:
            r6 = r7
        L8f:
            return r6
        L90:
            r0 = move-exception
            r6 = r0
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zk2.h(int, p92, yd4, java.lang.String):java.lang.Object");
    }
}
