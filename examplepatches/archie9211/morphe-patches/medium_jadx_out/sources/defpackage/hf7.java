package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hf7 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ yo8 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ hf7(yo8 yo8Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = yo8Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        yo8 yo8Var = this.d;
        switch (i) {
            case 0:
                return new hf7(yo8Var, n92Var, 0);
            default:
                return new hf7(yo8Var, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((hf7) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:49:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r11) throws java.lang.Throwable {
        /*
            r10 = this;
            int r0 = r10.b
            java.lang.String r1 = "call to 'resume' before 'invoke' with coroutine"
            r2 = 1
            yo8 r3 = r10.d
            c1e r4 = defpackage.c1e.a
            r5 = 0
            r6 = 0
            switch(r0) {
                case 0: goto L72;
                default: goto Le;
            }
        Le:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r7 = r10.c
            r8 = 3
            r9 = 2
            if (r7 == 0) goto L2d
            if (r7 == r2) goto L29
            if (r7 == r9) goto L25
            if (r7 != r8) goto L20
            defpackage.br7.v(r11)
            goto L71
        L20:
            defpackage.ygf.f(r1)
            r4 = r6
            goto L71
        L25:
            defpackage.br7.v(r11)
            goto L5b
        L29:
            defpackage.br7.v(r11)
            goto L3b
        L2d:
            defpackage.br7.v(r11)
            qi1 r11 = r3.a
            r10.c = r2
            java.lang.Object r11 = r11.c(r10)
            if (r11 != r0) goto L3b
            goto L70
        L3b:
            gn9 r11 = r3.b
            r10.c = r9
            cp8 r11 = r11.c
            ep8 r11 = (defpackage.ep8) r11
            elb r11 = r11.a
            hb8 r1 = new hb8
            r7 = 14
            r1.<init>(r7)
            java.lang.Object r11 = defpackage.n01.d0(r10, r11, r5, r2, r1)
            if (r11 != r0) goto L53
            goto L54
        L53:
            r11 = r4
        L54:
            if (r11 != r0) goto L57
            goto L58
        L57:
            r11 = r4
        L58:
            if (r11 != r0) goto L5b
            goto L70
        L5b:
            go8 r11 = r3.f
            r10.c = r8
            kb2 r1 = r11.a
            fo8 r2 = new fo8
            r2.<init>(r11, r6, r5)
            java.lang.Object r10 = defpackage.vx0.m0(r1, r2, r10)
            if (r10 != r0) goto L6d
            goto L6e
        L6d:
            r10 = r4
        L6e:
            if (r10 != r0) goto L71
        L70:
            r4 = r0
        L71:
            return r4
        L72:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r7 = r10.c
            if (r7 == 0) goto L87
            if (r7 != r2) goto L82
            defpackage.br7.v(r11)
            bjb r11 = (defpackage.bjb) r11
            java.lang.Object r10 = r11.a
            goto L94
        L82:
            defpackage.ygf.f(r1)
            r4 = r6
            goto Lb3
        L87:
            defpackage.br7.v(r11)
            r10.c = r2
            java.lang.Object r10 = r3.e(r10)
            if (r10 != r0) goto L94
            r4 = r0
            goto Lb3
        L94:
            boolean r11 = r10 instanceof defpackage.ajb
            if (r11 != 0) goto La4
            r11 = r10
            c1e r11 = (defpackage.c1e) r11
            uld r11 = defpackage.wld.a
            java.lang.String r0 = "Download all catalogs success"
            java.lang.Object[] r1 = new java.lang.Object[r5]
            r11.a(r0, r1)
        La4:
            java.lang.Throwable r10 = defpackage.bjb.b(r10)
            if (r10 == 0) goto Lb3
            uld r11 = defpackage.wld.a
            java.lang.String r0 = "Download all catalogs failed"
            java.lang.Object[] r1 = new java.lang.Object[r5]
            r11.e(r10, r0, r1)
        Lb3:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hf7.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
