package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class x79 implements ikc {
    public final zz0 a;
    public final kz0 b;
    public iwb c;
    public int d;
    public boolean e;
    public long f;

    public x79(zz0 zz0Var) {
        this.a = zz0Var;
        kz0 kz0VarA = zz0Var.a();
        this.b = kz0VarA;
        iwb iwbVar = kz0VarA.a;
        this.c = iwbVar;
        this.d = iwbVar != null ? iwbVar.b : -1;
    }

    @Override // defpackage.ikc
    public final fmd b() {
        return this.a.b();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.e = true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x001e, code lost:
    
        if (r3 == r5.b) goto L15;
     */
    @Override // defpackage.ikc
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final long q0(defpackage.kz0 r9, long r10) {
        /*
            r8 = this;
            r9.getClass()
            r0 = 0
            int r2 = (r10 > r0 ? 1 : (r10 == r0 ? 0 : -1))
            if (r2 < 0) goto L65
            boolean r3 = r8.e
            if (r3 != 0) goto L5f
            iwb r3 = r8.c
            kz0 r4 = r8.b
            if (r3 == 0) goto L27
            iwb r5 = r4.a
            if (r3 != r5) goto L21
            int r3 = r8.d
            r5.getClass()
            int r5 = r5.b
            if (r3 != r5) goto L21
            goto L27
        L21:
            java.lang.String r8 = "Peek source is invalid because upstream source was used"
            defpackage.ygf.f(r8)
            return r0
        L27:
            if (r2 != 0) goto L2a
            return r0
        L2a:
            long r0 = r8.f
            r2 = 1
            long r0 = r0 + r2
            zz0 r2 = r8.a
            boolean r0 = r2.request(r0)
            if (r0 != 0) goto L3a
            r8 = -1
            return r8
        L3a:
            iwb r0 = r8.c
            if (r0 != 0) goto L48
            iwb r0 = r4.a
            if (r0 == 0) goto L48
            r8.c = r0
            int r0 = r0.b
            r8.d = r0
        L48:
            long r0 = r4.b
            long r2 = r8.f
            long r0 = r0 - r2
            long r6 = java.lang.Math.min(r10, r0)
            kz0 r2 = r8.b
            long r4 = r8.f
            r3 = r9
            r2.I(r3, r4, r6)
            long r9 = r8.f
            long r9 = r9 + r6
            r8.f = r9
            return r6
        L5f:
            java.lang.String r8 = "closed"
            defpackage.ygf.f(r8)
            return r0
        L65:
            java.lang.String r8 = "byteCount < 0: "
            java.lang.String r8 = defpackage.ho2.D(r10, r8)
            defpackage.ywb.g(r8)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.x79.q0(kz0, long):long");
    }
}
