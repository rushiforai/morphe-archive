package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zhf {
    public final long a;

    public zhf(long j) {
        this.a = j;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        return (obj instanceof zhf) && this.a == ((zhf) obj).a;
    }

    public final int hashCode() {
        long j = this.a;
        return (((int) (j ^ (j >>> 32))) ^ 1000003) * 1000003;
    }

    public final String toString() {
        return ev6.t(this.a, ", webViewRequestMode=0}", new StringBuilder("PrepareIntegrityTokenRequest{cloudProjectNumber="));
    }
}
