package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jc5 extends p4d implements b55 {
    public rya b;
    public rya c;
    public int d;
    public /* synthetic */ Object e;
    public final /* synthetic */ kc5 f;
    public final /* synthetic */ u1d g;
    public final /* synthetic */ u1d h;
    public final /* synthetic */ u1d i;
    public final /* synthetic */ u1d j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jc5(kc5 kc5Var, u1d u1dVar, u1d u1dVar2, u1d u1dVar3, u1d u1dVar4, n92 n92Var) {
        super(2, n92Var);
        this.f = kc5Var;
        this.g = u1dVar;
        this.h = u1dVar2;
        this.i = u1dVar3;
        this.j = u1dVar4;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        jc5 jc5Var = new jc5(this.f, this.g, this.h, this.i, this.j, n92Var);
        jc5Var.e = obj;
        return jc5Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((jc5) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x00a9, code lost:
    
        if (defpackage.r6c.m(r14, r1, r13) != r0) goto L33;
     */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0097  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r14) {
        /*
            r13 = this;
            java.lang.Object r0 = r13.e
            r3 = r0
            do4 r3 = (defpackage.do4) r3
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r13.d
            u1d r8 = r13.j
            u1d r7 = r13.i
            u1d r6 = r13.h
            u1d r5 = r13.g
            kc5 r4 = r13.f
            r9 = 4
            r2 = 3
            r10 = 2
            r11 = 1
            r12 = 0
            if (r1 == 0) goto L46
            if (r1 == r11) goto L40
            if (r1 == r10) goto L34
            if (r1 == r2) goto L2d
            if (r1 == r9) goto L28
            java.lang.String r13 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r13)
            return r12
        L28:
            defpackage.br7.v(r14)
            goto Lac
        L2d:
            rya r1 = r13.b
            defpackage.br7.v(r14)
            r2 = r1
            goto L98
        L34:
            rya r1 = r13.c
            rya r10 = r13.b
            defpackage.br7.v(r14)
            bjb r14 = (defpackage.bjb) r14
            java.lang.Object r14 = r14.a
            goto L72
        L40:
            rya r1 = r13.b
            defpackage.br7.v(r14)
            goto L5c
        L46:
            rya r14 = defpackage.ev6.p(r14)
            dc5 r1 = defpackage.dc5.a
            r14.a = r1
            r13.e = r3
            r13.b = r14
            r13.d = r11
            java.lang.Object r1 = r3.a(r1, r13)
            if (r1 != r0) goto L5b
            goto Lab
        L5b:
            r1 = r14
        L5c:
            zk2 r14 = r4.a
            yd4 r11 = defpackage.yd4.CacheFirst
            r13.e = r3
            r13.b = r1
            r13.c = r1
            r13.d = r10
            r10 = 10
            java.lang.Object r14 = r14.g(r10, r11, r13)
            if (r14 != r0) goto L71
            goto Lab
        L71:
            r10 = r1
        L72:
            java.lang.Throwable r11 = defpackage.bjb.b(r14)
            if (r11 != 0) goto L7f
            com.medium.android.graphql.AllSuggestionsQuery$Data r14 = (com.medium.android.graphql.AllSuggestionsQuery.Data) r14
            ec5 r14 = defpackage.kc5.a(r14, r5, r6, r7, r8)
            goto L84
        L7f:
            cc5 r14 = new cc5
            r14.<init>(r11)
        L84:
            r1.a = r14
            java.lang.Object r14 = r10.a
            r13.e = r3
            r13.b = r10
            r13.c = r12
            r13.d = r2
            java.lang.Object r14 = r3.a(r14, r13)
            if (r14 != r0) goto L97
            goto Lab
        L97:
            r2 = r10
        L98:
            r6c r14 = r4.b
            ic5 r1 = new ic5
            r1.<init>(r2, r3, r4, r5, r6, r7, r8)
            r13.e = r12
            r13.b = r12
            r13.d = r9
            tb2 r13 = defpackage.r6c.m(r14, r1, r13)
            if (r13 != r0) goto Lac
        Lab:
            return r0
        Lac:
            defpackage.z72.b()
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jc5.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
