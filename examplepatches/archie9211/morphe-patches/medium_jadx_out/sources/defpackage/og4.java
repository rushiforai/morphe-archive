package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class og4 implements yx5 {
    public final g59 a;
    public final ch4 b;
    public final String c;
    public final AutoCloseable d;
    public final Object e = new Object();
    public boolean f;
    public yua g;

    public og4(g59 g59Var, ch4 ch4Var, String str, AutoCloseable autoCloseable) {
        this.a = g59Var;
        this.b = ch4Var;
        this.c = str;
        this.d = autoCloseable;
    }

    @Override // defpackage.yx5
    public final kng K() {
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0014 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // java.lang.AutoCloseable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void close() {
        /*
            r2 = this;
            java.lang.Object r0 = r2.e
            monitor-enter(r0)
            r1 = 1
            r2.f = r1     // Catch: java.lang.Throwable -> L1c
            yua r1 = r2.g     // Catch: java.lang.Throwable -> L1c
            if (r1 == 0) goto L10
            r1.close()     // Catch: java.lang.RuntimeException -> Le java.lang.Exception -> L10 java.lang.Throwable -> L1c
            goto L10
        Le:
            r2 = move-exception
            throw r2     // Catch: java.lang.Throwable -> L1c
        L10:
            java.lang.AutoCloseable r2 = r2.d     // Catch: java.lang.Throwable -> L1c
            if (r2 == 0) goto L1a
            defpackage.wgd.x(r2)     // Catch: java.lang.RuntimeException -> L18 java.lang.Exception -> L1a java.lang.Throwable -> L1c
            goto L1a
        L18:
            r2 = move-exception
            throw r2     // Catch: java.lang.Throwable -> L1c
        L1a:
            monitor-exit(r0)
            return
        L1c:
            r2 = move-exception
            monitor-exit(r0)
            throw r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.og4.close():void");
    }

    @Override // defpackage.yx5
    public final ch4 getFileSystem() {
        return this.b;
    }

    @Override // defpackage.yx5
    public final g59 m0() {
        g59 g59Var;
        synchronized (this.e) {
            if (this.f) {
                throw new IllegalStateException("closed");
            }
            g59Var = this.a;
        }
        return g59Var;
    }

    @Override // defpackage.yx5
    public final zz0 v0() {
        synchronized (this.e) {
            if (this.f) {
                throw new IllegalStateException("closed");
            }
            yua yuaVar = this.g;
            if (yuaVar != null) {
                return yuaVar;
            }
            yua yuaVarI = wo7.i(this.b.g0(this.a));
            this.g = yuaVarI;
            return yuaVarI;
        }
    }
}
