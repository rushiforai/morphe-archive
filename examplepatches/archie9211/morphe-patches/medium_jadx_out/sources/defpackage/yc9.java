package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yc9 {
    public final String a;
    public final String b;
    public final sw5 c;

    public yc9(String str, String str2, sw5 sw5Var) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = sw5Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yc9)) {
            return false;
        }
        yc9 yc9Var = (yc9) obj;
        return g76.L(this.a, yc9Var.a) && g76.L(this.b, yc9Var.b) && g76.L(this.c, yc9Var.c);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        sw5 sw5Var = this.c;
        return iHashCode2 + (sw5Var != null ? sw5Var.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("PopularPostUiModel(id=", this.a, ", title=", this.b, ", previewImage=");
        sbU.append(this.c);
        sbU.append(")");
        return sbU.toString();
    }
}
