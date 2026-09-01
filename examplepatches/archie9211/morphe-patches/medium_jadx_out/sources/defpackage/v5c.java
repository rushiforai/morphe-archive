package defpackage;

import com.medium.android.core.share.PostShareData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class v5c extends que {
    public final PostShareData b;
    public final String c;
    public final String d;
    public final String e;
    public final gn9 f;
    public final l95 g;
    public final hu7 h;
    public final ty2 i;
    public String j;
    public final xpc k;
    public final xpc l;
    public final wua m;
    public final r6c n;
    public final uua o;

    public v5c(PostShareData postShareData, String str, String str2, String str3, gn9 gn9Var, l95 l95Var, ty2 ty2Var) {
        i03 i03Var = i03.a;
        postShareData.getClass();
        str.getClass();
        str2.getClass();
        str3.getClass();
        gn9Var.getClass();
        this.b = postShareData;
        this.c = str;
        this.d = str2;
        this.e = str3;
        this.f = gn9Var;
        this.g = l95Var;
        this.h = i03Var;
        this.i = ty2Var;
        this.j = postShareData.getAuthorShareKey();
        Boolean bool = Boolean.FALSE;
        xpc xpcVarJ = vv2.j(bool);
        this.k = xpcVarJ;
        xpc xpcVarJ2 = vv2.j(bool);
        this.l = xpcVarJ2;
        this.m = bo.e0(new sp4(xpcVarJ, xpcVarJ2, new u5c(this, null), 0), f76.F(this), l7c.b, e(false, false));
        r6c r6cVarX = k40.x(0, 7, null);
        this.n = r6cVarX;
        this.o = bo.z(r6cVarX);
    }

    public final q5c e(boolean z, boolean z2) {
        rj2 rj2VarA;
        zw7 zw7Var;
        PostShareData postShareData = this.b;
        if (postShareData.getAuthorShareKey() == null && ((rj2VarA = this.g.a()) == null || (zw7Var = rj2VarA.i) == null || !zw7Var.getMemberFriendLinksEnabled())) {
            return p5c.a;
        }
        return new o5c(postShareData.getAuthorShareKey() != null, z, z2);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(defpackage.p92 r7) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.s5c
            if (r0 == 0) goto L13
            r0 = r7
            s5c r0 = (defpackage.s5c) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            s5c r0 = new s5c
            r0.<init>(r6, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L33
            if (r2 != r3) goto L2c
            defpackage.br7.v(r7)
            bjb r7 = (defpackage.bjb) r7
            java.lang.Object r7 = r7.a
            goto L50
        L2c:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L33:
            defpackage.br7.v(r7)
            uld r7 = defpackage.wld.a
            java.lang.String r2 = "Fetch share key"
            java.lang.Object[] r5 = new java.lang.Object[r4]
            r7.a(r2, r5)
            com.medium.android.core.share.PostShareData r7 = r6.b
            java.lang.String r7 = r7.getPostId()
            r0.d = r3
            gn9 r2 = r6.f
            java.io.Serializable r7 = r2.b(r7, r0)
            if (r7 != r1) goto L50
            return r1
        L50:
            boolean r0 = r7 instanceof defpackage.ajb
            if (r0 != 0) goto L62
            r0 = r7
            java.lang.String r0 = (java.lang.String) r0
            uld r1 = defpackage.wld.a
            java.lang.String r2 = "Fetch share key successful"
            java.lang.Object[] r3 = new java.lang.Object[r4]
            r1.a(r2, r3)
            r6.j = r0
        L62:
            java.lang.Throwable r6 = defpackage.bjb.b(r7)
            if (r6 == 0) goto L71
            uld r0 = defpackage.wld.a
            java.lang.String r1 = "Fetch share key failed"
            java.lang.Object[] r2 = new java.lang.Object[r4]
            r0.e(r6, r1, r2)
        L71:
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.v5c.f(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00a3 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(defpackage.p92 r20) {
        /*
            r19 = this;
            r0 = r19
            r1 = r20
            boolean r2 = r1 instanceof defpackage.t5c
            if (r2 == 0) goto L17
            r2 = r1
            t5c r2 = (defpackage.t5c) r2
            int r3 = r2.d
            r4 = -2147483648(0xffffffff80000000, float:-0.0)
            r5 = r3 & r4
            if (r5 == 0) goto L17
            int r3 = r3 - r4
            r2.d = r3
            goto L1c
        L17:
            t5c r2 = new t5c
            r2.<init>(r0, r1)
        L1c:
            java.lang.Object r1 = r2.b
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            int r4 = r2.d
            java.lang.String r5 = "sk"
            hu7 r6 = r0.h
            com.medium.android.core.share.PostShareData r7 = r0.b
            r8 = 1
            if (r4 == 0) goto L3c
            if (r4 != r8) goto L35
            defpackage.br7.v(r1)
            bjb r1 = (defpackage.bjb) r1
            java.lang.Object r1 = r1.a
            goto L4c
        L35:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            r0 = 0
            return r0
        L3c:
            defpackage.br7.v(r1)
            java.lang.String r1 = r0.j
            if (r1 != 0) goto L6b
            r2.d = r8
            java.lang.Object r1 = r0.f(r2)
            if (r1 != r3) goto L4c
            return r3
        L4c:
            boolean r2 = r1 instanceof defpackage.ajb
            if (r2 != 0) goto L83
            java.lang.String r1 = (java.lang.String) r1
            android.net.Uri r1 = r7.getShareUri()
            android.net.Uri$Builder r1 = r1.buildUpon()
            r6.getClass()
            java.lang.String r2 = r0.j
            android.net.Uri$Builder r1 = r1.appendQueryParameter(r5, r2)
            android.net.Uri r1 = r1.build()
            r1.getClass()
            goto L83
        L6b:
            android.net.Uri r1 = r7.getShareUri()
            android.net.Uri$Builder r1 = r1.buildUpon()
            r6.getClass()
            java.lang.String r2 = r0.j
            android.net.Uri$Builder r1 = r1.appendQueryParameter(r5, r2)
            android.net.Uri r1 = r1.build()
            r1.getClass()
        L83:
            boolean r2 = r1 instanceof defpackage.ajb
            if (r2 != 0) goto La3
            r4 = r1
            android.net.Uri r4 = (android.net.Uri) r4
            r17 = 6654(0x19fe, float:9.324E-42)
            r18 = 0
            com.medium.android.core.share.PostShareData r3 = r0.b
            r5 = 0
            r6 = 0
            r7 = 0
            r8 = 0
            r9 = 0
            r10 = 0
            r11 = 0
            r12 = 0
            ey3 r13 = defpackage.ey3.a
            r14 = 0
            r15 = 0
            r16 = 0
            com.medium.android.core.share.PostShareData r0 = com.medium.android.core.share.PostShareData.copy$default(r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18)
            return r0
        La3:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.v5c.g(p92):java.lang.Object");
    }
}
