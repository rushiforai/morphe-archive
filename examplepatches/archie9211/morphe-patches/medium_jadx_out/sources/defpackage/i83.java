package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i83 extends fqc {
    public static final Object h = new Object();
    public long c;
    public int d;
    public t68 e;
    public Object f;
    public int g;

    public i83(long j) {
        super(j);
        t68 t68Var = om8.a;
        t68Var.getClass();
        this.e = t68Var;
        this.f = h;
    }

    @Override // defpackage.fqc
    public final void a(fqc fqcVar) {
        fqcVar.getClass();
        i83 i83Var = (i83) fqcVar;
        this.e = i83Var.e;
        this.f = i83Var.f;
        this.g = i83Var.g;
    }

    @Override // defpackage.fqc
    public final fqc b(long j) {
        return new i83(j);
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean c(defpackage.j83 r7, defpackage.oic r8) {
        /*
            r6 = this;
            java.lang.Object r0 = defpackage.uic.c
            monitor-enter(r0)
            long r1 = r6.c     // Catch: java.lang.Throwable -> L1a
            long r3 = r8.g()     // Catch: java.lang.Throwable -> L1a
            int r1 = (r1 > r3 ? 1 : (r1 == r3 ? 0 : -1))
            r2 = 1
            r3 = 0
            if (r1 != 0) goto L1c
            int r1 = r6.d     // Catch: java.lang.Throwable -> L1a
            int r4 = r8.h()     // Catch: java.lang.Throwable -> L1a
            if (r1 == r4) goto L18
            goto L1c
        L18:
            r1 = r3
            goto L1d
        L1a:
            r6 = move-exception
            goto L47
        L1c:
            r1 = r2
        L1d:
            monitor-exit(r0)
            java.lang.Object r4 = r6.f
            java.lang.Object r5 = defpackage.i83.h
            if (r4 == r5) goto L2f
            if (r1 == 0) goto L30
            int r4 = r6.g
            int r7 = r6.d(r7, r8)
            if (r4 != r7) goto L2f
            goto L30
        L2f:
            r2 = r3
        L30:
            if (r2 == 0) goto L46
            if (r1 == 0) goto L46
            monitor-enter(r0)
            long r3 = r8.g()     // Catch: java.lang.Throwable -> L43
            r6.c = r3     // Catch: java.lang.Throwable -> L43
            int r7 = r8.h()     // Catch: java.lang.Throwable -> L43
            r6.d = r7     // Catch: java.lang.Throwable -> L43
            monitor-exit(r0)
            return r2
        L43:
            r6 = move-exception
            monitor-exit(r0)
            throw r6
        L46:
            return r2
        L47:
            monitor-exit(r0)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.i83.c(j83, oic):boolean");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00d8 A[PHI: r11
      0x00d8: PHI (r11v1 int) = (r11v0 int), (r11v2 int) binds: [B:30:0x00a9, B:40:0x00d6] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Type inference failed for: r13v10, types: [i83] */
    /* JADX WARN: Type inference failed for: r13v5, types: [fqc] */
    /* JADX WARN: Type inference failed for: r13v6, types: [fqc, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r25v0 */
    /* JADX WARN: Type inference failed for: r25v1, types: [int] */
    /* JADX WARN: Type inference failed for: r25v2 */
    /* JADX WARN: Type inference failed for: r25v3 */
    /* JADX WARN: Type inference failed for: r25v4 */
    /* JADX WARN: Type inference failed for: r25v5 */
    /* JADX WARN: Type inference failed for: r25v6 */
    /* JADX WARN: Type inference failed for: r25v7 */
    /* JADX WARN: Type inference failed for: r3v12 */
    /* JADX WARN: Type inference failed for: r3v7 */
    /* JADX WARN: Type inference failed for: r3v8, types: [int] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int d(defpackage.j83 r31, defpackage.oic r32) {
        /*
            Method dump skipped, instruction units count: 369
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.i83.d(j83, oic):int");
    }
}
