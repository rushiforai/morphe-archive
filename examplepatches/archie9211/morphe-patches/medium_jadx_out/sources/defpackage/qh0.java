package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qh0 {
    public final nm0 a;
    public final long b;

    public qh0(nm0 nm0Var, long j) {
        if (nm0Var == null) {
            z72.c("Null status");
            throw null;
        }
        this.a = nm0Var;
        this.b = j;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof qh0) {
            qh0 qh0Var = (qh0) obj;
            if (this.a.equals(qh0Var.a) && this.b == qh0Var.b) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = (this.a.hashCode() ^ 1000003) * 1000003;
        long j = this.b;
        return ((int) (j ^ (j >>> 32))) ^ iHashCode;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("BackendResponse{status=");
        sb.append(this.a);
        sb.append(", nextRequestWaitMillis=");
        return ev6.t(this.b, "}", sb);
    }
}
