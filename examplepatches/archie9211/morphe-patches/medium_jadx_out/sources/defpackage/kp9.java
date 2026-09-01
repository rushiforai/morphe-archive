package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kp9 {
    public final String a;
    public final String b;
    public final long c;

    public kp9(String str, String str2, long j) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
        this.c = j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kp9)) {
            return false;
        }
        kp9 kp9Var = (kp9) obj;
        return g76.L(this.a, kp9Var.a) && g76.L(this.b, kp9Var.b) && this.c == kp9Var.c;
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        long j = this.c;
        return iO + ((int) (j ^ (j >>> 32)));
    }

    public final String toString() {
        return ev6.t(this.c, ")", y30.u("Featured(publicationName=", this.a, ", publicationSlug=", this.b, ", occurredAt="));
    }
}
