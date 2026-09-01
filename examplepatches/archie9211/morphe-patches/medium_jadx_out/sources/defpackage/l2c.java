package defpackage;

import com.medium.android.data.preferences.DarkMode;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class l2c {
    public final pu7 a;
    public final e00 b;

    public l2c(pu7 pu7Var, e00 e00Var) {
        pu7Var.getClass();
        e00Var.getClass();
        this.a = pu7Var;
        this.b = e00Var;
    }

    public final DarkMode a() {
        DarkMode darkModeValueOf;
        pu7 pu7Var = this.a;
        pu7Var.getClass();
        try {
            String strO = p2.o(pu7Var, ek6.SETTINGS_DARK_MODE, null, 2, null);
            if (strO != null && (darkModeValueOf = DarkMode.valueOf(strO)) != null) {
                return darkModeValueOf;
            }
            DarkMode.Companion.getClass();
            return bt2.a();
        } catch (Exception unused) {
            DarkMode.Companion.getClass();
            return bt2.a();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.yd4 r12, defpackage.p92 r13) {
        /*
            r11 = this;
            boolean r0 = r13 instanceof defpackage.h2c
            if (r0 == 0) goto L13
            r0 = r13
            h2c r0 = (defpackage.h2c) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            h2c r0 = new h2c
            r0.<init>(r11, r13)
        L18:
            java.lang.Object r13 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r13)     // Catch: java.lang.Exception -> L98 java.util.concurrent.CancellationException -> Lb6
            goto L4f
        L28:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            return r4
        L2e:
            defpackage.br7.v(r13)
            com.medium.android.graphql.UserPreferencesQuery r13 = new com.medium.android.graphql.UserPreferencesQuery
            r13.<init>()
            e00 r11 = r11.b
            r11.getClass()
            uz r2 = new uz
            r2.<init>(r11, r13)
            java.lang.Object r11 = defpackage.gr7.i(r2, r12)
            uz r11 = (defpackage.uz) r11
            r0.d = r3     // Catch: java.lang.Exception -> L98 java.util.concurrent.CancellationException -> Lb6
            java.lang.Object r13 = r11.b(r0)     // Catch: java.lang.Exception -> L98 java.util.concurrent.CancellationException -> Lb6
            if (r13 != r1) goto L4f
            return r1
        L4f:
            j00 r13 = (defpackage.j00) r13     // Catch: java.lang.Exception -> L98 java.util.concurrent.CancellationException -> Lb6
            du8 r11 = r13.c     // Catch: java.lang.Throwable -> L90
            com.apollographql.apollo.exception.ApolloException r12 = r13.e     // Catch: java.lang.Throwable -> L90
            java.util.List r5 = r13.d     // Catch: java.lang.Throwable -> L90
            if (r12 != 0) goto L8f
            if (r5 != 0) goto L7e
            if (r11 == 0) goto L76
            com.medium.android.graphql.UserPreferencesQuery$Data r11 = (com.medium.android.graphql.UserPreferencesQuery.Data) r11     // Catch: java.lang.Throwable -> L90
            com.medium.android.graphql.UserPreferencesQuery$Viewer r11 = r11.getViewer()     // Catch: java.lang.Throwable -> L90
            if (r11 == 0) goto L9f
            com.medium.android.graphql.UserPreferencesQuery$ViewerEdge r11 = r11.getViewerEdge()     // Catch: java.lang.Throwable -> L90
            if (r11 == 0) goto L9f
            java.util.List r11 = r11.getPreferences()     // Catch: java.lang.Throwable -> L90
            if (r11 == 0) goto L9f
            gee r4 = defpackage.hee.c(r11)     // Catch: java.lang.Throwable -> L90
            goto L9f
        L76:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L90
            java.lang.String r12 = "data is null"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L90
            throw r11     // Catch: java.lang.Throwable -> L90
        L7e:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> L90
            a00 r9 = defpackage.a00.b     // Catch: java.lang.Throwable -> L90
            r10 = 31
            r6 = 0
            r7 = 0
            r8 = 0
            java.lang.String r12 = defpackage.bu1.F0(r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L90
            r11.<init>(r12)     // Catch: java.lang.Throwable -> L90
            throw r11     // Catch: java.lang.Throwable -> L90
        L8f:
            throw r12     // Catch: java.lang.Throwable -> L90
        L90:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb     // Catch: java.lang.Exception -> L98 java.util.concurrent.CancellationException -> Lb6
            r4.<init>(r11)     // Catch: java.lang.Exception -> L98 java.util.concurrent.CancellationException -> Lb6
            goto L9f
        L98:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        L9f:
            boolean r11 = r4 instanceof defpackage.ajb
            if (r11 != 0) goto Lb5
            if (r4 == 0) goto La6
            goto Lb5
        La6:
            com.medium.android.data.common.RitoException r11 = new com.medium.android.data.common.RitoException     // Catch: java.lang.Throwable -> Lae
            java.lang.String r12 = "invalid response data"
            r11.<init>(r12)     // Catch: java.lang.Throwable -> Lae
            throw r11     // Catch: java.lang.Throwable -> Lae
        Lae:
            r0 = move-exception
            r11 = r0
            ajb r4 = new ajb
            r4.<init>(r11)
        Lb5:
            return r4
        Lb6:
            r0 = move-exception
            r11 = r0
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.l2c.b(yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(java.lang.String r5, com.medium.android.graphql.type.UserPreferenceInput r6, defpackage.p92 r7) {
        /*
            r4 = this;
            boolean r0 = r7 instanceof defpackage.i2c
            if (r0 == 0) goto L13
            r0 = r7
            i2c r0 = (defpackage.i2c) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            i2c r0 = new i2c
            r0.<init>(r4, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            defpackage.br7.v(r7)
            bjb r7 = (defpackage.bjb) r7
            java.lang.Object r4 = r7.a
            return r4
        L2b:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L32:
            defpackage.br7.v(r7)
            java.util.List r6 = defpackage.d46.Q(r6)
            r0.d = r3
            java.lang.Object r4 = r4.d(r0, r5, r6)
            if (r4 != r1) goto L42
            return r1
        L42:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.l2c.c(java.lang.String, com.medium.android.graphql.type.UserPreferenceInput, p92):java.lang.Object");
    }

    /* JADX WARN: Can't wrap try/catch for region: R(12:0|2|(2:4|(1:6)(1:8))(0)|7|9|(1:105)|(1:(1:(2:13|99)(2:14|15))(2:16|17))(3:21|22|(2:24|98))|25|102|26|(1:(1:(5:30|42|(3:103|46|47)|50|(2:52|(1:111)(5:55|(9:58|(1:60)|61|(2:64|62)|107|65|(5:68|(11:73|(1:75)(1:76)|77|(1:79)(1:80)|81|(1:83)(1:84)|85|(1:87)(1:88)|89|(1:91)(1:92)|93)|70|94|66)|108|95)|57|96|(1:98)(1:110)))(1:109))(2:33|34))(2:35|36))(1:37)|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00a1, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x00bd, code lost:
    
        r1 = new defpackage.ajb(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00c8, code lost:
    
        r0 = r1;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(defpackage.p92 r28, java.lang.String r29, java.util.List r30) {
        /*
            Method dump skipped, instruction units count: 595
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.l2c.d(p92, java.lang.String, java.util.List):java.lang.Object");
    }

    public final zz e() {
        pu7 pu7Var = this.a;
        pu7Var.getClass();
        return new zz(pu7Var.L(ek6.SETTINGS_DARK_MODE, null), 8);
    }
}
