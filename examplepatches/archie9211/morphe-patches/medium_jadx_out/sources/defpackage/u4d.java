package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class u4d implements m73, n92 {
    public final /* synthetic */ w4d a;
    public final x51 b;
    public x51 c;
    public mb9 d = mb9.Main;
    public final /* synthetic */ w4d e;

    public u4d(w4d w4dVar, x51 x51Var) {
        this.e = w4dVar;
        this.a = w4dVar;
        this.b = x51Var;
    }

    @Override // defpackage.m73
    public final long J(float f) {
        return this.a.J(f);
    }

    @Override // defpackage.m73
    public final float N(int i) {
        return this.a.N(i);
    }

    @Override // defpackage.m73
    public final float Q(float f) {
        return f / this.a.b();
    }

    @Override // defpackage.m73
    public final float U() {
        return this.a.U();
    }

    @Override // defpackage.m73
    public final float Z(float f) {
        return this.a.b() * f;
    }

    public final Object a(mb9 mb9Var, kn0 kn0Var) {
        x51 x51Var = new x51(1, pwd.Q(kn0Var));
        x51Var.s();
        this.d = mb9Var;
        this.c = x51Var;
        return x51Var.q();
    }

    @Override // defpackage.m73
    public final float b() {
        return this.a.b();
    }

    public final long c() {
        w4d w4dVar = this.e;
        long jG = ho2.g(flb.v0(w4dVar).A.e(), w4dVar);
        long j = w4dVar.x;
        return (((long) Float.floatToRawIntBits(Math.max(0.0f, Float.intBitsToFloat((int) (jG >> 32)) - ((int) (j >> 32))) / 2.0f)) << 32) | (((long) Float.floatToRawIntBits(Math.max(0.0f, Float.intBitsToFloat((int) (jG & 4294967295L)) - ((int) (j & 4294967295L))) / 2.0f)) & 4294967295L);
    }

    public final zte e() {
        return flb.v0(this.e).A;
    }

    @Override // defpackage.n92
    public final ib2 getContext() {
        return zx3.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object h(long r6, defpackage.b55 r8, defpackage.p92 r9) {
        /*
            r5 = this;
            boolean r0 = r9 instanceof defpackage.t4d
            if (r0 == 0) goto L13
            r0 = r9
            t4d r0 = (defpackage.t4d) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            t4d r0 = new t4d
            r0.<init>(r5, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 != r4) goto L28
            defpackage.br7.v(r9)     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> L3b
            return r9
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2e:
            defpackage.br7.v(r9)
            r0.d = r4     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> L3b
            java.lang.Object r5 = r5.g(r6, r8, r0)     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> L3b
            if (r5 != r1) goto L3a
            return r1
        L3a:
            return r5
        L3b:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.u4d.h(long, b55, p92):java.lang.Object");
    }

    @Override // defpackage.m73
    public final int i0(float f) {
        return ho2.d(this.a, f);
    }

    @Override // defpackage.m73
    public final long m0(long j) {
        return ho2.g(j, this.a);
    }

    @Override // defpackage.m73
    public final float p0(long j) {
        return ho2.f(j, this.a);
    }

    @Override // defpackage.m73
    public final long r(long j) {
        return ho2.e(j, this.a);
    }

    @Override // defpackage.n92
    public final void resumeWith(Object obj) {
        w4d w4dVar = this.e;
        synchronized (w4dVar.u) {
            w4dVar.t.l(this);
        }
        this.b.resumeWith(obj);
    }

    @Override // defpackage.m73
    public final float z(long j) {
        return km4.i(j, this.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(long r9, defpackage.b55 r11, defpackage.kn0 r12) throws java.lang.Throwable {
        /*
            r8 = this;
            boolean r0 = r12 instanceof defpackage.s4d
            if (r0 == 0) goto L13
            r0 = r12
            s4d r0 = (defpackage.s4d) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            s4d r0 = new s4d
            r0.<init>(r8, r12)
        L18:
            java.lang.Object r12 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L33
            if (r2 != r4) goto L2c
            enc r8 = r0.b
            defpackage.br7.v(r12)     // Catch: java.lang.Throwable -> L2a
            goto L69
        L2a:
            r9 = move-exception
            goto L73
        L2c:
            r8 = 0
            java.lang.String r8 = androidx.core.widget.nRCC.nGxjfIr.tEtDXSPOoapNDEL
            defpackage.ygf.f(r8)
            return r3
        L33:
            defpackage.br7.v(r12)
            r5 = 0
            int r12 = (r9 > r5 ? 1 : (r9 == r5 ? 0 : -1))
            if (r12 > 0) goto L4d
            x51 r12 = r8.c
            if (r12 == 0) goto L4d
            androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException r2 = new androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException
            r2.<init>(r9)
            ajb r5 = new ajb
            r5.<init>(r2)
            r12.resumeWith(r5)
        L4d:
            w4d r12 = r8.e
            sb2 r12 = r12.u0()
            xt r2 = new xt
            r2.<init>(r9, r8, r3)
            r9 = 3
            enc r9 = defpackage.vx0.c0(r12, r3, r3, r2, r9)
            r0.b = r9     // Catch: java.lang.Throwable -> L6f
            r0.e = r4     // Catch: java.lang.Throwable -> L6f
            java.lang.Object r12 = r11.invoke(r8, r0)     // Catch: java.lang.Throwable -> L6f
            if (r12 != r1) goto L68
            return r1
        L68:
            r8 = r9
        L69:
            androidx.compose.ui.input.pointer.CancelTimeoutCancellationException r9 = androidx.compose.ui.input.pointer.CancelTimeoutCancellationException.a
            r8.m(r9)
            return r12
        L6f:
            r8 = move-exception
            r7 = r9
            r9 = r8
            r8 = r7
        L73:
            androidx.compose.ui.input.pointer.CancelTimeoutCancellationException r10 = androidx.compose.ui.input.pointer.CancelTimeoutCancellationException.a
            r8.m(r10)
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.u4d.g(long, b55, kn0):java.lang.Object");
    }
}
