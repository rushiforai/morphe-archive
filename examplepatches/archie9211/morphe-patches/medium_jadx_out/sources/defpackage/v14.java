package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v14 implements b24 {
    public final Throwable a;
    public final String b;

    public v14(String str, Throwable th) {
        this.a = th;
        this.b = str;
    }

    @Override // defpackage.b24
    public final boolean a() {
        return false;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v14)) {
            return false;
        }
        v14 v14Var = (v14) obj;
        return g76.L(this.a, v14Var.a) && g76.L(this.b, v14Var.b);
    }

    public final int hashCode() {
        Throwable th = this.a;
        int iHashCode = (th == null ? 0 : th.hashCode()) * 31;
        String str = this.b;
        return ((iHashCode + (str != null ? str.hashCode() : 0)) * 31) + 1237;
    }

    public final String toString() {
        return "Forbidden(originalError=" + this.a + ", message=" + this.b + ", canRetry=false)";
    }
}
