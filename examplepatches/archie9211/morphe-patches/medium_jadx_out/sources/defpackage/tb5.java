package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tb5 extends p4d implements b55 {
    public o33 b;
    public n33 c;
    public Object d;
    public Object e;
    public int f;
    public /* synthetic */ Object g;
    public final /* synthetic */ ub5 h;
    public final /* synthetic */ yd4 i;
    public final /* synthetic */ boolean j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tb5(ub5 ub5Var, yd4 yd4Var, boolean z, n92 n92Var) {
        super(2, n92Var);
        this.h = ub5Var;
        this.i = yd4Var;
        this.j = z;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        tb5 tb5Var = new tb5(this.h, this.i, this.j, n92Var);
        tb5Var.g = obj;
        return tb5Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((tb5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0091  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r14) throws java.lang.Throwable {
        /*
            r13 = this;
            java.lang.Object r0 = r13.g
            sb2 r0 = (defpackage.sb2) r0
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r13.f
            r3 = 3
            r4 = 2
            r5 = 1
            r10 = 0
            if (r2 == 0) goto L38
            if (r2 == r5) goto L30
            if (r2 == r4) goto L24
            if (r2 != r3) goto L1d
            java.lang.Object r0 = r13.e
            java.lang.Object r13 = r13.d
            defpackage.br7.v(r14)
            goto L95
        L1d:
            java.lang.String r13 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r13)
            r13 = 0
            return r13
        L24:
            java.lang.Object r0 = r13.d
            n33 r2 = r13.c
            defpackage.br7.v(r14)
            r12 = r2
            r2 = r14
            r14 = r0
            r0 = r12
            goto L7e
        L30:
            n33 r0 = r13.c
            o33 r2 = r13.b
            defpackage.br7.v(r14)
            goto L6d
        L38:
            defpackage.br7.v(r14)
            ob5 r14 = new ob5
            ub5 r7 = r13.h
            r14.<init>(r7, r10, r4)
            o33 r14 = defpackage.vx0.G(r0, r10, r14, r3)
            rb5 r6 = new rb5
            r11 = 2
            yd4 r8 = r13.i
            boolean r9 = r13.j
            r6.<init>(r7, r8, r9, r10, r11)
            o33 r2 = defpackage.vx0.G(r0, r10, r6, r3)
            rb5 r6 = new rb5
            r11 = 1
            r6.<init>(r7, r8, r9, r10, r11)
            o33 r0 = defpackage.vx0.G(r0, r10, r6, r3)
            r13.g = r10
            r13.b = r2
            r13.c = r0
            r13.f = r5
            java.lang.Object r14 = r14.i(r13)
            if (r14 != r1) goto L6d
            goto L90
        L6d:
            r13.g = r10
            r13.b = r10
            r13.c = r0
            r13.d = r14
            r13.f = r4
            java.lang.Object r2 = r2.p0(r13)
            if (r2 != r1) goto L7e
            goto L90
        L7e:
            r13.g = r10
            r13.b = r10
            r13.c = r10
            r13.d = r14
            r13.e = r2
            r13.f = r3
            java.lang.Object r13 = r0.p0(r13)
            if (r13 != r1) goto L91
        L90:
            return r1
        L91:
            r0 = r14
            r14 = r13
            r13 = r0
            r0 = r2
        L95:
            otd r1 = new otd
            r1.<init>(r13, r0, r14)
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tb5.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
