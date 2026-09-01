package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z14 implements b24 {
    public final Throwable a;
    public final boolean b;

    public z14(Throwable th, boolean z) {
        this.a = th;
        this.b = z;
    }

    @Override // defpackage.b24
    public final boolean a() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z14)) {
            return false;
        }
        z14 z14Var = (z14) obj;
        return g76.L(this.a, z14Var.a) && this.b == z14Var.b;
    }

    public final int hashCode() {
        Throwable th = this.a;
        return ((th == null ? 0 : th.hashCode()) * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "ServerError(originalError=" + this.a + ", canRetry=" + this.b + ")";
    }
}
