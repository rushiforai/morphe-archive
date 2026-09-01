package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h2 extends o7f {
    @Override // defpackage.o7f
    public final void F(i2 i2Var, i2 i2Var2) {
        i2Var.b = i2Var2;
    }

    @Override // defpackage.o7f
    public final void G(i2 i2Var, Thread thread) {
        i2Var.a = thread;
    }

    @Override // defpackage.o7f
    public final boolean n(j2 j2Var, f2 f2Var, f2 f2Var2) {
        synchronized (j2Var) {
            try {
                if (j2Var.b != f2Var) {
                    return false;
                }
                j2Var.b = f2Var2;
                return true;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // defpackage.o7f
    public final boolean o(j2 j2Var, Object obj, Object obj2) {
        synchronized (j2Var) {
            try {
                if (j2Var.a != obj) {
                    return false;
                }
                j2Var.a = obj2;
                return true;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // defpackage.o7f
    public final boolean p(j2 j2Var, i2 i2Var, i2 i2Var2) {
        synchronized (j2Var) {
            try {
                if (j2Var.c != i2Var) {
                    return false;
                }
                j2Var.c = i2Var2;
                return true;
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
