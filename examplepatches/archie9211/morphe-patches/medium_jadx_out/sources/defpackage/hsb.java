package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hsb implements zc8 {
    public final vsb a;
    public boolean b;

    public hsb(vsb vsbVar, boolean z) {
        this.a = vsbVar;
        this.b = z;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.zc8
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object A(long r5, long r7, defpackage.n92 r9) throws java.lang.Throwable {
        /*
            r4 = this;
            boolean r5 = r9 instanceof defpackage.gsb
            if (r5 == 0) goto L13
            r5 = r9
            gsb r5 = (defpackage.gsb) r5
            int r6 = r5.e
            r0 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r6 & r0
            if (r1 == 0) goto L13
            int r6 = r6 - r0
            r5.e = r6
            goto L1a
        L13:
            gsb r5 = new gsb
            p92 r9 = (defpackage.p92) r9
            r5.<init>(r4, r9)
        L1a:
            java.lang.Object r6 = r5.c
            tb2 r9 = defpackage.tb2.COROUTINE_SUSPENDED
            int r0 = r5.e
            r1 = 1
            if (r0 == 0) goto L32
            if (r0 != r1) goto L2b
            long r7 = r5.b
            defpackage.br7.v(r6)
            goto L4d
        L2b:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L32:
            defpackage.br7.v(r6)
            boolean r6 = r4.b
            r2 = 0
            if (r6 == 0) goto L55
            vsb r4 = r4.a
            boolean r6 = r4.i
            if (r6 == 0) goto L42
            goto L51
        L42:
            r5.b = r7
            r5.e = r1
            java.lang.Object r6 = r4.a(r7, r5)
            if (r6 != r9) goto L4d
            return r9
        L4d:
            qre r6 = (defpackage.qre) r6
            long r2 = r6.a
        L51:
            long r2 = defpackage.qre.d(r7, r2)
        L55:
            qre r4 = new qre
            r4.<init>(r2)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hsb.A(long, long, n92):java.lang.Object");
    }

    @Override // defpackage.zc8
    public final /* synthetic */ long K(int i, long j) {
        return 0L;
    }

    @Override // defpackage.zc8
    public final Object j0(long j, n92 n92Var) {
        return ev6.I();
    }

    @Override // defpackage.zc8
    public final long n0(long j, long j2, int i) {
        if (!this.b) {
            return 0L;
        }
        vsb vsbVar = this.a;
        if (vsbVar.a.a()) {
            return 0L;
        }
        return vsbVar.h(vsbVar.d(vsbVar.a.e(vsbVar.d(vsbVar.g(j2)))));
    }
}
