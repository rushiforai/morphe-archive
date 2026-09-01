package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class p2f {
    public final String a;
    public final String b;

    public p2f(String str, String str2) {
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p2f)) {
            return false;
        }
        p2f p2fVar = (p2f) obj;
        return this.a.equals(p2fVar.a) && this.b.equals(p2fVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("Author(name=", this.a, ", imageId=", this.b, ")");
    }
}
