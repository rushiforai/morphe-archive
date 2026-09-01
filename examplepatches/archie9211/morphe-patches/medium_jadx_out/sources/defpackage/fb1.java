package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fb1 implements bc1 {
    public final String a;
    public final String b;

    public fb1(String str, String str2) {
        str.getClass();
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof fb1)) {
            return false;
        }
        fb1 fb1Var = (fb1) obj;
        return g76.L(this.a, fb1Var.a) && this.b.equals(fb1Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("EditListInfo(catalogId=", this.a, ", source=", this.b, ")");
    }
}
