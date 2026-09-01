package defpackage;

import com.medium.android.core.models.EntityType;
import com.medium.android.graphql.fragment.CollectionNewsletterSubscriptionData;
import com.medium.android.graphql.fragment.CollectionNewsletterSubscriptionDataImpl;
import com.medium.android.graphql.fragment.NewsletterSubscriptionData;
import com.medium.android.graphql.fragment.UserNewsletterSubscriptionData;
import com.medium.android.graphql.fragment.UserNewsletterSubscriptionDataImpl;
import com.medium.android.graphql.type.Collection;
import com.medium.android.graphql.type.User;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class pf8 {
    public final e00 a;

    public pf8(e00 e00Var) {
        e00Var.getClass();
        this.a = e00Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r12, defpackage.p92 r13) {
        /*
            r11 = this;
            boolean r0 = r13 instanceof defpackage.kf8
            if (r0 == 0) goto L13
            r0 = r13
            kf8 r0 = (defpackage.kf8) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            kf8 r0 = new kf8
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
            com.medium.android.graphql.CreateAndSubscribeToNewsletterV3Mutation r13 = new com.medium.android.graphql.CreateAndSubscribeToNewsletterV3Mutation
            r13.<init>(r12)
            e00 r11 = r11.a
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
            com.medium.android.graphql.CreateAndSubscribeToNewsletterV3Mutation$Data r11 = (com.medium.android.graphql.CreateAndSubscribeToNewsletterV3Mutation.Data) r11     // Catch: java.lang.Throwable -> L7e
            com.medium.android.graphql.CreateAndSubscribeToNewsletterV3Mutation$FetchOrLazilyCreateNewsletterV3AndMaybeSubscribe r11 = r11.getFetchOrLazilyCreateNewsletterV3AndMaybeSubscribe()     // Catch: java.lang.Throwable -> L7e
            if (r11 == 0) goto L8d
            com.medium.android.graphql.fragment.NewsletterData r4 = r11.getNewsletterData()     // Catch: java.lang.Throwable -> L7e
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
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pf8.a(java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Can't wrap try/catch for region: R(12:0|2|(2:4|(1:6)(1:7))(0)|8|90|(1:(1:(3:12|83|84)(2:13|14))(4:15|95|16|17))(14:21|(1:23)(1:25)|24|26|88|27|28|92|29|30|97|31|(1:34)|81)|101|35|94|36|(1:(1:(7:40|59|(3:99|63|64)|67|(3:87|69|(1:71)(2:74|75))|77|(3:79|(3:82|83|84)|81)(1:102))(2:43|44))(2:45|46))(1:47)|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00a6, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00d3, code lost:
    
        r0 = new defpackage.ajb(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00d5, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Removed duplicated region for block: B:102:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00ee A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0125  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0105 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.p92 r17, com.medium.android.core.models.EntityType r18, java.lang.Boolean r19, java.lang.String r20, java.lang.String r21, boolean r22) {
        /*
            Method dump skipped, instruction units count: 318
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pf8.b(p92, com.medium.android.core.models.EntityType, java.lang.Boolean, java.lang.String, java.lang.String, boolean):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00b3 A[Catch: all -> 0x0098, TRY_LEAVE, TryCatch #3 {all -> 0x0098, blocks: (B:30:0x0085, B:34:0x0091, B:37:0x009a, B:38:0x00a1, B:39:0x00a2, B:40:0x00b2, B:41:0x00b3), top: B:87:0x0085 }] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00d4 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:74:0x010b  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x00eb A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:97:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(defpackage.p92 r18, com.medium.android.core.models.EntityType r19, java.lang.String r20, java.lang.String r21, boolean r22) {
        /*
            Method dump skipped, instruction units count: 293
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pf8.c(p92, com.medium.android.core.models.EntityType, java.lang.String, java.lang.String, boolean):java.lang.Object");
    }

    public final Object d(EntityType entityType, String str, boolean z, p92 p92Var) {
        int i = jf8.a[entityType.ordinal()];
        e00 e00Var = this.a;
        if (i == 1) {
            m00 m00VarM = gr7.m(e00Var);
            UserNewsletterSubscriptionDataImpl userNewsletterSubscriptionDataImpl = new UserNewsletterSubscriptionDataImpl();
            User.INSTANCE.getClass();
            i31 i31Var = new i31(User.type.u, k80.Q0(new String[]{str}));
            yl2 yl2Var = yl2.e;
            f31 f31Var = f31.b;
            g15 g15VarC0 = gsa.c0(m00VarM, userNewsletterSubscriptionDataImpl, i31Var, yl2Var, f31Var);
            if (g15VarC0 != null) {
                UserNewsletterSubscriptionData userNewsletterSubscriptionDataCopy$default = (UserNewsletterSubscriptionData) g15VarC0;
                UserNewsletterSubscriptionData.NewsletterV3 newsletterV3 = userNewsletterSubscriptionDataCopy$default.getNewsletterV3();
                if (newsletterV3 != null) {
                    NewsletterSubscriptionData newsletterSubscriptionData = newsletterV3.getNewsletterSubscriptionData();
                    userNewsletterSubscriptionDataCopy$default = UserNewsletterSubscriptionData.copy$default(userNewsletterSubscriptionDataCopy$default, null, UserNewsletterSubscriptionData.NewsletterV3.copy$default(newsletterV3, null, null, NewsletterSubscriptionData.copy$default(newsletterSubscriptionData, null, null, NewsletterSubscriptionData.ViewerEdge.copy$default(newsletterSubscriptionData.getViewerEdge(), null, null, z, 3, null), 3, null), 3, null), null, 5, null);
                }
                Object objF = ((zw2) m00VarM).f(userNewsletterSubscriptionDataImpl, i31Var, userNewsletterSubscriptionDataCopy$default, yl2Var, f31Var, true, p92Var);
                if (objF == tb2.COROUTINE_SUSPENDED) {
                    return objF;
                }
            }
        } else {
            if (i != 2) {
                ygf.a();
                return null;
            }
            m00 m00VarM2 = gr7.m(e00Var);
            CollectionNewsletterSubscriptionDataImpl collectionNewsletterSubscriptionDataImpl = new CollectionNewsletterSubscriptionDataImpl();
            Collection.INSTANCE.getClass();
            i31 i31Var2 = new i31(Collection.type.u, k80.Q0(new String[]{str}));
            yl2 yl2Var2 = yl2.e;
            f31 f31Var2 = f31.b;
            g15 g15VarC02 = gsa.c0(m00VarM2, collectionNewsletterSubscriptionDataImpl, i31Var2, yl2Var2, f31Var2);
            if (g15VarC02 != null) {
                CollectionNewsletterSubscriptionData collectionNewsletterSubscriptionDataCopy$default = (CollectionNewsletterSubscriptionData) g15VarC02;
                CollectionNewsletterSubscriptionData.NewsletterV3 newsletterV32 = collectionNewsletterSubscriptionDataCopy$default.getNewsletterV3();
                if (newsletterV32 != null) {
                    NewsletterSubscriptionData newsletterSubscriptionData2 = newsletterV32.getNewsletterSubscriptionData();
                    collectionNewsletterSubscriptionDataCopy$default = CollectionNewsletterSubscriptionData.copy$default(collectionNewsletterSubscriptionDataCopy$default, null, CollectionNewsletterSubscriptionData.NewsletterV3.copy$default(newsletterV32, null, null, NewsletterSubscriptionData.copy$default(newsletterSubscriptionData2, null, null, NewsletterSubscriptionData.ViewerEdge.copy$default(newsletterSubscriptionData2.getViewerEdge(), null, null, z, 3, null), 3, null), 3, null), null, 5, null);
                }
                Object objF2 = ((zw2) m00VarM2).f(collectionNewsletterSubscriptionDataImpl, i31Var2, collectionNewsletterSubscriptionDataCopy$default, yl2Var2, f31Var2, true, p92Var);
                if (objF2 == tb2.COROUTINE_SUSPENDED) {
                    return objF2;
                }
            }
        }
        return c1e.a;
    }
}
