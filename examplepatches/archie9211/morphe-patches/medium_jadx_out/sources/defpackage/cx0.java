package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cx0 implements zc8 {
    public final /* synthetic */ sl a;
    public final /* synthetic */ hw8 b;

    public cx0(sl slVar, hw8 hw8Var) {
        this.a = slVar;
        this.b = hw8Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.zc8
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object A(long r3, long r5, defpackage.n92 r7) {
        /*
            r2 = this;
            boolean r3 = r7 instanceof defpackage.ax0
            if (r3 == 0) goto L13
            r3 = r7
            ax0 r3 = (defpackage.ax0) r3
            int r4 = r3.e
            r0 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r4 & r0
            if (r1 == 0) goto L13
            int r4 = r4 - r0
            r3.e = r4
            goto L1a
        L13:
            ax0 r3 = new ax0
            p92 r7 = (defpackage.p92) r7
            r3.<init>(r2, r7)
        L1a:
            java.lang.Object r4 = r3.c
            tb2 r7 = defpackage.tb2.COROUTINE_SUSPENDED
            int r0 = r3.e
            r1 = 1
            if (r0 == 0) goto L32
            if (r0 != r1) goto L2b
            long r5 = r3.b
            defpackage.br7.v(r4)
            goto L51
        L2b:
            java.lang.String r2 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r2)
            r2 = 0
            return r2
        L32:
            defpackage.br7.v(r4)
            hw8 r4 = r2.b
            hw8 r0 = defpackage.hw8.Horizontal
            if (r4 != r0) goto L40
            float r4 = defpackage.qre.b(r5)
            goto L44
        L40:
            float r4 = defpackage.qre.c(r5)
        L44:
            r3.b = r5
            r3.e = r1
            sl r2 = r2.a
            java.lang.Object r2 = r2.h(r4, r3)
            if (r2 != r7) goto L51
            return r7
        L51:
            qre r2 = new qre
            r2.<init>(r5)
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cx0.A(long, long, n92):java.lang.Object");
    }

    @Override // defpackage.zc8
    public final long K(int i, long j) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (this.b == hw8.Horizontal ? j >> 32 : j & 4294967295L));
        if (fIntBitsToFloat >= 0.0f || i != 1) {
            return 0L;
        }
        sl slVar = this.a;
        float fE = slVar.e(fIntBitsToFloat);
        g49 g49Var = slVar.i;
        float fG = Float.isNaN(g49Var.g()) ? 0.0f : g49Var.g();
        g49Var.h(fE);
        return a(fE - fG);
    }

    public final long a(float f) {
        hw8 hw8Var = hw8.Horizontal;
        hw8 hw8Var2 = this.b;
        float f2 = hw8Var2 == hw8Var ? f : 0.0f;
        if (hw8Var2 != hw8.Vertical) {
            f = 0.0f;
        }
        return (((long) Float.floatToRawIntBits(f)) & 4294967295L) | (((long) Float.floatToRawIntBits(f2)) << 32);
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.zc8
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object j0(long r6, defpackage.n92 r8) {
        /*
            r5 = this;
            boolean r0 = r8 instanceof defpackage.bx0
            if (r0 == 0) goto L13
            r0 = r8
            bx0 r0 = (defpackage.bx0) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L1a
        L13:
            bx0 r0 = new bx0
            p92 r8 = (defpackage.p92) r8
            r0.<init>(r5, r8)
        L1a:
            java.lang.Object r8 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            long r6 = r0.b
            defpackage.br7.v(r8)
            goto L79
        L2b:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            r5 = 0
            return r5
        L32:
            defpackage.br7.v(r8)
            hw8 r8 = r5.b
            hw8 r2 = defpackage.hw8.Horizontal
            if (r8 != r2) goto L40
            float r8 = defpackage.qre.b(r6)
            goto L44
        L40:
            float r8 = defpackage.qre.c(r6)
        L44:
            sl r5 = r5.a
            float r2 = r5.f()
            r4 = 0
            int r4 = (r8 > r4 ? 1 : (r8 == r4 ? 0 : -1))
            if (r4 >= 0) goto L77
            hh7 r4 = r5.d()
            java.util.Map r4 = r4.a
            java.util.Collection r4 = r4.values()
            java.lang.Iterable r4 = (java.lang.Iterable) r4
            java.lang.Float r4 = defpackage.bu1.M0(r4)
            if (r4 == 0) goto L66
            float r4 = r4.floatValue()
            goto L68
        L66:
            r4 = 2143289344(0x7fc00000, float:NaN)
        L68:
            int r2 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
            if (r2 <= 0) goto L77
            r0.b = r6
            r0.e = r3
            java.lang.Object r5 = r5.h(r8, r0)
            if (r5 != r1) goto L79
            return r1
        L77:
            r6 = 0
        L79:
            qre r5 = new qre
            r5.<init>(r6)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cx0.j0(long, n92):java.lang.Object");
    }

    @Override // defpackage.zc8
    public final long n0(long j, long j2, int i) {
        if (i != 1) {
            return 0L;
        }
        float fIntBitsToFloat = Float.intBitsToFloat((int) (this.b == hw8.Horizontal ? j2 >> 32 : 4294967295L & j2));
        sl slVar = this.a;
        float fE = slVar.e(fIntBitsToFloat);
        g49 g49Var = slVar.i;
        float fG = Float.isNaN(g49Var.g()) ? 0.0f : g49Var.g();
        g49Var.h(fE);
        return a(fE - fG);
    }
}
