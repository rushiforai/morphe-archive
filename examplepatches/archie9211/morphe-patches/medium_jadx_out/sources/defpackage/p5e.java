package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class p5e {
    public final l2c a;
    public final zk2 b;

    public p5e(l2c l2cVar, zk2 zk2Var) {
        zk2Var.getClass();
        this.a = l2cVar;
        this.b = zk2Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(com.medium.android.data.settings.Frequency r18, defpackage.p92 r19) {
        /*
            r17 = this;
            r0 = r17
            r1 = r19
            boolean r2 = r1 instanceof defpackage.o5e
            if (r2 == 0) goto L17
            r2 = r1
            o5e r2 = (defpackage.o5e) r2
            int r3 = r2.d
            r4 = -2147483648(0xffffffff80000000, float:-0.0)
            r5 = r3 & r4
            if (r5 == 0) goto L17
            int r3 = r3 - r4
            r2.d = r3
            goto L1c
        L17:
            o5e r2 = new o5e
            r2.<init>(r0, r1)
        L1c:
            java.lang.Object r1 = r2.b
            tb2 r3 = defpackage.tb2.COROUTINE_SUSPENDED
            int r4 = r2.d
            r5 = 0
            r6 = 0
            r7 = 1
            if (r4 == 0) goto L37
            if (r4 != r7) goto L31
            defpackage.br7.v(r1)
            bjb r1 = (defpackage.bjb) r1
            java.lang.Object r0 = r1.a
            goto L7a
        L31:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r6
        L37:
            defpackage.br7.v(r1)
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            java.lang.String r4 = "Update social email frequency: "
            r1.<init>(r4)
            r4 = r18
            r1.append(r4)
            java.lang.String r1 = r1.toString()
            uld r8 = defpackage.wld.a
            java.lang.Object[] r9 = new java.lang.Object[r5]
            defpackage.km4.I(r8, r6, r1, r9, r1)
            zk2 r1 = r0.b
            java.lang.String r1 = r1.m()
            java.lang.String r4 = r4.getServerName()
            yv8 r10 = new yv8
            r10.<init>(r4)
            com.medium.android.graphql.type.UserPreferenceInput r8 = new com.medium.android.graphql.type.UserPreferenceInput
            r15 = 53
            r16 = 0
            r9 = 0
            r11 = 0
            java.lang.String r12 = "allow_social_emails"
            r13 = 0
            r14 = 0
            r8.<init>(r9, r10, r11, r12, r13, r14, r15, r16)
            r2.d = r7
            l2c r0 = r0.a
            java.lang.Object r0 = r0.c(r1, r8, r2)
            if (r0 != r3) goto L7a
            return r3
        L7a:
            java.lang.Throwable r1 = defpackage.bjb.b(r0)
            java.lang.String r2 = "Update social email frequency failed"
            if (r1 != 0) goto L9f
            com.medium.android.graphql.UpdateUserPreferenceValueMutation$UpdateUserPreferences r0 = (com.medium.android.graphql.UpdateUserPreferenceValueMutation.UpdateUserPreferences) r0
            com.medium.android.graphql.UpdateUserPreferenceValueMutation$OnMutationSuccess r0 = r0.getOnMutationSuccess()
            if (r0 == 0) goto L93
            boolean r0 = r0.getSuccess()
            if (r0 != r7) goto L93
            c1e r0 = defpackage.c1e.a
            goto La4
        L93:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException
            r0.<init>(r2)
            ajb r1 = new ajb
            r1.<init>(r0)
            r0 = r1
            goto La4
        L9f:
            ajb r0 = new ajb
            r0.<init>(r1)
        La4:
            boolean r1 = r0 instanceof defpackage.ajb
            if (r1 != 0) goto Lb4
            r1 = r0
            c1e r1 = (defpackage.c1e) r1
            uld r1 = defpackage.wld.a
            java.lang.Object[] r3 = new java.lang.Object[r5]
            java.lang.String r4 = "Update social email frequency successful"
            defpackage.km4.I(r1, r6, r4, r3, r4)
        Lb4:
            java.lang.Throwable r1 = defpackage.bjb.b(r0)
            if (r1 == 0) goto Lc1
            uld r3 = defpackage.wld.a
            java.lang.Object[] r4 = new java.lang.Object[r5]
            r3.e(r1, r2, r4)
        Lc1:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p5e.a(com.medium.android.data.settings.Frequency, p92):java.lang.Object");
    }
}
