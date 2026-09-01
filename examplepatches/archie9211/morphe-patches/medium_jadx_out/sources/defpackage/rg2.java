package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rg2 extends q62 {
    public final String f;
    public final String g;

    public rg2(String str, String str2) {
        super(l3d.APPLE, str, null, null, str2, 12);
        this.f = str;
        this.g = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof rg2)) {
            return false;
        }
        rg2 rg2Var = (rg2) obj;
        return this.f.equals(rg2Var.f) && this.g.equals(rg2Var.g);
    }

    public final int hashCode() {
        return this.g.hashCode() + (this.f.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("Apple(token=", this.f, ", idToken=", this.g, ")");
    }
}
