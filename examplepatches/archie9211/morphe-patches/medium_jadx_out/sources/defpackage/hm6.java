package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hm6 {
    public lm6 a;
    public String b;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hm6)) {
            return false;
        }
        hm6 hm6Var = (hm6) obj;
        return this.a.equals(hm6Var.a) && g76.L(this.b, hm6Var.b);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("KmFlexibleTypeUpperBound(type=");
        sb.append(this.a);
        sb.append(", typeFlexibilityId=");
        return ev6.z(sb, this.b, ')');
    }
}
