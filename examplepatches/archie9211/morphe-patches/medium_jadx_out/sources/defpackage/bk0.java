package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bk0 extends wkb {
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final long f;

    public bk0(String str, String str2, String str3, long j, String str4) {
        if (str == null) {
            z72.c("Null rolloutId");
            throw null;
        }
        this.b = str;
        if (str2 == null) {
            z72.c("Null parameterKey");
            throw null;
        }
        this.c = str2;
        this.d = str3;
        if (str4 == null) {
            z72.c("Null variantId");
            throw null;
        }
        this.e = str4;
        this.f = j;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof wkb)) {
            return false;
        }
        bk0 bk0Var = (bk0) ((wkb) obj);
        return this.b.equals(bk0Var.b) && this.c.equals(bk0Var.c) && this.d.equals(bk0Var.d) && this.e.equals(bk0Var.e) && this.f == bk0Var.f;
    }

    public final int hashCode() {
        int iHashCode = (((((((this.b.hashCode() ^ 1000003) * 1000003) ^ this.c.hashCode()) * 1000003) ^ this.d.hashCode()) * 1000003) ^ this.e.hashCode()) * 1000003;
        long j = this.f;
        return ((int) (j ^ (j >>> 32))) ^ iHashCode;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("RolloutAssignment{rolloutId=");
        sb.append(this.b);
        sb.append(", parameterKey=");
        sb.append(this.c);
        sb.append(", parameterValue=");
        sb.append(this.d);
        sb.append(", variantId=");
        sb.append(this.e);
        sb.append(", templateVersion=");
        return ev6.t(this.f, "}", sb);
    }
}
