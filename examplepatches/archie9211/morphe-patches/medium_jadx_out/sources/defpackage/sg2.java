package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sg2 extends q62 {
    public final String f;
    public final String g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public sg2(String str, String str2) {
        super(l3d.FACEBOOK, str, null, str2, null, 20);
        str.getClass();
        this.f = str;
        this.g = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sg2)) {
            return false;
        }
        sg2 sg2Var = (sg2) obj;
        return g76.L(this.f, sg2Var.f) && g76.L(this.g, sg2Var.g);
    }

    public final int hashCode() {
        int iHashCode = this.f.hashCode() * 31;
        String str = this.g;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return ev6.y("Facebook(token=", this.f, ", username=", this.g, ")");
    }
}
