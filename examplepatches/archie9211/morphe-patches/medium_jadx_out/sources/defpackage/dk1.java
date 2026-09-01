package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class dk1 extends yj1 {
    public final bo4 d;

    public dk1(int i, nz0 nz0Var, ib2 ib2Var, bo4 bo4Var) {
        super(ib2Var, i, nz0Var);
        this.d = bo4Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0070  */
    @Override // defpackage.yj1, defpackage.bo4
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.do4 r6, defpackage.n92 r7) {
        /*
            r5 = this;
            int r0 = r5.b
            r1 = -3
            if (r0 != r1) goto L70
            ib2 r0 = r7.getContext()
            java.lang.Boolean r1 = java.lang.Boolean.FALSE
            v02 r2 = new v02
            r3 = 17
            r4 = 0
            r2.<init>(r3, r4)
            ib2 r3 = r5.a
            java.lang.Object r1 = r3.N(r2, r1)
            java.lang.Boolean r1 = (java.lang.Boolean) r1
            boolean r1 = r1.booleanValue()
            if (r1 != 0) goto L26
            ib2 r1 = r0.j0(r3)
            goto L2a
        L26:
            ib2 r1 = defpackage.guc.D(r0, r3, r4)
        L2a:
            boolean r2 = defpackage.g76.L(r1, r0)
            if (r2 == 0) goto L39
            java.lang.Object r5 = r5.k(r6, r7)
            tb2 r6 = defpackage.tb2.COROUTINE_SUSPENDED
            if (r5 != r6) goto L79
            return r5
        L39:
            wz7 r2 = defpackage.wz7.d
            gb2 r3 = r1.o0(r2)
            gb2 r0 = r0.o0(r2)
            boolean r0 = defpackage.g76.L(r3, r0)
            if (r0 == 0) goto L70
            ib2 r0 = r7.getContext()
            boolean r2 = r6 instanceof defpackage.hzb
            if (r2 != 0) goto L5c
            boolean r2 = r6 instanceof defpackage.uh8
            if (r2 == 0) goto L56
            goto L5c
        L56:
            eh9 r2 = new eh9
            r2.<init>(r6, r0)
            r6 = r2
        L5c:
            r91 r0 = new r91
            r2 = 0
            r3 = 5
            r0.<init>(r5, r2, r3)
            java.lang.Object r5 = defpackage.gx1.d0(r1)
            java.lang.Object r5 = defpackage.guc.b0(r1, r6, r5, r0, r7)
            tb2 r6 = defpackage.tb2.COROUTINE_SUSPENDED
            if (r5 != r6) goto L79
            return r5
        L70:
            java.lang.Object r5 = super.b(r6, r7)
            tb2 r6 = defpackage.tb2.COROUTINE_SUSPENDED
            if (r5 != r6) goto L79
            return r5
        L79:
            c1e r5 = defpackage.c1e.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dk1.b(do4, n92):java.lang.Object");
    }

    @Override // defpackage.yj1
    public final Object e(l2a l2aVar, n92 n92Var) {
        Object objK = k(new hzb(l2aVar), n92Var);
        return objK == tb2.COROUTINE_SUSPENDED ? objK : c1e.a;
    }

    public abstract Object k(do4 do4Var, n92 n92Var);

    @Override // defpackage.yj1
    public final String toString() {
        return this.d + " -> " + super.toString();
    }
}
