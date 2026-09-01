package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ob7 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ zb7 c;
    public final /* synthetic */ va6 d;
    public final /* synthetic */ int e;
    public final /* synthetic */ int f;
    public final /* synthetic */ ub7 g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ob7(zb7 zb7Var, va6 va6Var, int i, int i2, ub7 ub7Var, n92 n92Var) {
        super(2, n92Var);
        this.c = zb7Var;
        this.d = va6Var;
        this.e = i;
        this.f = i2;
        this.g = ub7Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new ob7(this.c, this.d, this.e, this.f, this.g, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((ob7) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0025  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0039  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0060  */
    /*  JADX ERROR: JadxOverflowException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxOverflowException: Regions count limit reached
        	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:59)
        	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:31)
        	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:19)
        */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r6) {
        /*
            r5 = this;
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r5.b
            r2 = 1
            if (r1 == 0) goto L14
            if (r1 != r2) goto Ld
            defpackage.br7.v(r6)
            goto L58
        Ld:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            r5 = 0
            return r5
        L14:
            defpackage.br7.v(r6)
        L17:
            int[] r6 = defpackage.nb7.a
            zb7 r1 = r5.c
            int r1 = r1.ordinal()
            r6 = r6[r1]
            int r1 = r5.e
            if (r6 != r2) goto L30
            va6 r6 = r5.d
            boolean r6 = r6.f()
            if (r6 == 0) goto L2e
            goto L30
        L2e:
            int r1 = r5.f
        L30:
            r5.b = r2
            r6 = 2147483647(0x7fffffff, float:NaN)
            ub7 r3 = r5.g
            if (r1 != r6) goto L44
            rb7 r6 = new rb7
            r4 = 0
            r6.<init>(r1, r4, r3)
            java.lang.Object r6 = defpackage.k50.i0(r6, r5)
            goto L55
        L44:
            rb7 r6 = new rb7
            r6.<init>(r1, r2, r3)
            ib2 r1 = r5.getContext()
            ft r1 = defpackage.gr7.o(r1)
            java.lang.Object r6 = r1.a(r6, r5)
        L55:
            if (r6 != r0) goto L58
            return r0
        L58:
            java.lang.Boolean r6 = (java.lang.Boolean) r6
            boolean r6 = r6.booleanValue()
            if (r6 != 0) goto L17
            c1e r5 = defpackage.c1e.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ob7.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
