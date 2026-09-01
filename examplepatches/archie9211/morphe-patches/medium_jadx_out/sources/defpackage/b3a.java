package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b3a extends d3a {
    public final String a;
    public final long b;

    public b3a(String str, long j) {
        this.a = str;
        this.b = j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b3a)) {
            return false;
        }
        b3a b3aVar = (b3a) obj;
        return this.a.equals(b3aVar.a) && this.b == b3aVar.b;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        long j = this.b;
        return iHashCode + ((int) (j ^ (j >>> 32)));
    }

    public final String toString() {
        StringBuilder sbI = ho2.I(this.b, "User(name=", this.a, ", premiumAt=");
        sbI.append(")");
        return sbI.toString();
    }
}
