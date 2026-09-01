package defpackage;

import gen.model.User;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n32 {
    public final vr7 a;
    public final in7 b;
    public final c40 c;
    public final dm4 d;
    public e18 e;
    public boolean f;
    public final xpc g;
    public final wua h;

    public n32(vr7 vr7Var, in7 in7Var, c40 c40Var, dm4 dm4Var) {
        vr7Var.getClass();
        in7Var.getClass();
        dm4Var.getClass();
        this.a = vr7Var;
        this.b = in7Var;
        this.c = c40Var;
        this.d = dm4Var;
        this.f = true;
        xpc xpcVarJ = vv2.j(null);
        this.g = xpcVarJ;
        this.h = bo.A(xpcVarJ);
    }

    public final synchronized void a() {
        this.e = null;
        vr7 vr7Var = this.a;
        vr7Var.getClass();
        vr7Var.e(ek6.MOBILE_CLIENT_CONFIG);
        this.f = false;
    }

    public final synchronized e18 b() {
        e18 e18Var;
        e18Var = this.e;
        if (e18Var == null && this.f) {
            vr7 vr7Var = this.a;
            vr7Var.getClass();
            e18Var = (e18) p2.i(vr7Var, ek6.MOBILE_CLIENT_CONFIG, e18.class, null, 4, null);
            this.e = e18Var;
            this.f = false;
        }
        return e18Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x00a7 A[Catch: all -> 0x0036, TryCatch #1 {all -> 0x0036, blocks: (B:14:0x0031, B:48:0x00cc, B:50:0x00de, B:51:0x00df, B:55:0x00e4, B:21:0x0049, B:38:0x009f, B:40:0x00a7, B:41:0x00a9, B:44:0x00c5, B:24:0x0053, B:31:0x006d, B:34:0x0096, B:27:0x005d, B:49:0x00cd), top: B:63:0x0023, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00c5 A[Catch: all -> 0x0036, TryCatch #1 {all -> 0x0036, blocks: (B:14:0x0031, B:48:0x00cc, B:50:0x00de, B:51:0x00df, B:55:0x00e4, B:21:0x0049, B:38:0x009f, B:40:0x00a7, B:41:0x00a9, B:44:0x00c5, B:24:0x0053, B:31:0x006d, B:34:0x0096, B:27:0x005d, B:49:0x00cd), top: B:63:0x0023, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00ca  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00cd A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(defpackage.p92 r12) {
        /*
            Method dump skipped, instruction units count: 250
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n32.c(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(defpackage.p92 r6) {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.m32
            if (r0 == 0) goto L13
            r0 = r6
            m32 r0 = (defpackage.m32) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            m32 r0 = new m32
            r0.<init>(r5, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            defpackage.br7.v(r6)
            bjb r6 = (defpackage.bjb) r6
            java.lang.Object r6 = r6.a
            goto L48
        L2b:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            r5 = 0
            return r5
        L32:
            defpackage.br7.v(r6)
            int r6 = android.os.Build.VERSION.SDK_INT
            java.lang.String r6 = java.lang.String.valueOf(r6)
            r0.d = r3
            c40 r2 = r5.c
            java.lang.String r3 = "4.5.1784910415"
            java.io.Serializable r6 = r2.a(r3, r6, r0)
            if (r6 != r1) goto L48
            return r1
        L48:
            boolean r0 = r6 instanceof defpackage.ajb
            r1 = 0
            if (r0 != 0) goto L6f
            r0 = r6
            com.medium.android.graphql.type.AppConfigSupportStatus r0 = (com.medium.android.graphql.type.AppConfigSupportStatus) r0
            uld r2 = defpackage.wld.a
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            java.lang.String r4 = "Fetched app support status: "
            r3.<init>(r4)
            r3.append(r0)
            java.lang.String r4 = "."
            r3.append(r4)
            java.lang.String r3 = r3.toString()
            java.lang.Object[] r4 = new java.lang.Object[r1]
            r2.a(r3, r4)
            xpc r5 = r5.g
            r5.l(r0)
        L6f:
            java.lang.Throwable r5 = defpackage.bjb.b(r6)
            if (r5 == 0) goto L7e
            uld r6 = defpackage.wld.a
            java.lang.String r0 = "Failed to fetch app support status!"
            java.lang.Object[] r1 = new java.lang.Object[r1]
            r6.e(r5, r0, r1)
        L7e:
            c1e r5 = defpackage.c1e.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n32.d(p92):java.lang.Object");
    }

    public final synchronized void e() {
        e18 e18VarB = b();
        User userB = e18VarB != null ? e18VarB.getCurrentUser() : null;
        e18 e18Var = (e18VarB == null || userB == null) ? new e18(null, null, null) : e18.a(e18VarB, User.copy$default(userB, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, Boolean.TRUE, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -1, 268433407, null));
        this.e = e18Var;
        this.f = false;
        vr7 vr7Var = this.a;
        vr7Var.getClass();
        vr7Var.x(ek6.MOBILE_CLIENT_CONFIG, e18Var);
    }
}
