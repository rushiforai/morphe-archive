package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lkc implements yx5 {
    public final ch4 a;
    public final kng b;
    public final Object c = new Object();
    public boolean d;
    public final zz0 e;

    public lkc(zz0 zz0Var, ch4 ch4Var, kng kngVar) {
        this.a = ch4Var;
        this.b = kngVar;
        this.e = zz0Var;
    }

    @Override // defpackage.yx5
    public final kng K() {
        return this.b;
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        synchronized (this.c) {
            this.d = true;
            zz0 zz0Var = this.e;
            if (zz0Var != null) {
                try {
                    zz0Var.close();
                } catch (RuntimeException e) {
                    throw e;
                } catch (Exception unused) {
                }
            }
        }
    }

    @Override // defpackage.yx5
    public final ch4 getFileSystem() {
        return this.a;
    }

    @Override // defpackage.yx5
    public final g59 m0() {
        synchronized (this.c) {
            if (this.d) {
                throw new IllegalStateException("closed");
            }
        }
        return null;
    }

    @Override // defpackage.yx5
    public final zz0 v0() {
        zz0 zz0Var;
        synchronized (this.c) {
            try {
                if (this.d) {
                    throw new IllegalStateException("closed");
                }
                zz0Var = this.e;
                if (zz0Var == null) {
                    throw null;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return zz0Var;
    }
}
