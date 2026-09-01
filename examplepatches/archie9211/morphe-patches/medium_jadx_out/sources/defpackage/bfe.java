package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bfe {
    public final String a;
    public final String b;

    public bfe(String str, String str2) {
        str.getClass();
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bfe)) {
            return false;
        }
        bfe bfeVar = (bfe) obj;
        return g76.L(this.a, bfeVar.a) && this.b.equals(bfeVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("AdminPublication(id=", this.a, ", name=", this.b, ")");
    }
}
