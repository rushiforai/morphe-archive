package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vtd {
    public final String a;
    public final String b;

    public vtd(String str, String str2) {
        str.getClass();
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vtd)) {
            return false;
        }
        vtd vtdVar = (vtd) obj;
        return g76.L(this.a, vtdVar.a) && g76.L(this.b, vtdVar.b);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return ev6.y("Entity(id=", this.a, ", name=", this.b, ")");
    }
}
