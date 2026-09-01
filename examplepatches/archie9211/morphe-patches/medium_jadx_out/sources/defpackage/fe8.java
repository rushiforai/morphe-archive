package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fe8 {
    public final ee8 a;
    public final String b;
    public final Long c;
    public final Long d;
    public final Long e;
    public final Long f;
    public final String g;

    public /* synthetic */ fe8(ee8 ee8Var, String str, Long l, Long l2, Long l3, Long l4, String str2, int i) {
        this((i & 1) != 0 ? ee8.NETWORK_NOT_CONNECTED : ee8Var, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : l, (i & 8) != 0 ? null : l2, (i & 16) != 0 ? null : l3, (i & 32) != 0 ? null : l4, (i & 64) != 0 ? null : str2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof fe8)) {
            return false;
        }
        fe8 fe8Var = (fe8) obj;
        return this.a == fe8Var.a && g76.L(this.b, fe8Var.b) && g76.L(this.c, fe8Var.c) && g76.L(this.d, fe8Var.d) && g76.L(this.e, fe8Var.e) && g76.L(this.f, fe8Var.f) && g76.L(this.g, fe8Var.g);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        Long l = this.c;
        int iHashCode3 = (iHashCode2 + (l == null ? 0 : l.hashCode())) * 31;
        Long l2 = this.d;
        int iHashCode4 = (iHashCode3 + (l2 == null ? 0 : l2.hashCode())) * 31;
        Long l3 = this.e;
        int iHashCode5 = (iHashCode4 + (l3 == null ? 0 : l3.hashCode())) * 31;
        Long l4 = this.f;
        int iHashCode6 = (iHashCode5 + (l4 == null ? 0 : l4.hashCode())) * 31;
        String str2 = this.g;
        return iHashCode6 + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("NetworkInfo(connectivity=");
        sb.append(this.a);
        sb.append(", carrierName=");
        sb.append(this.b);
        sb.append(", carrierId=");
        sb.append(this.c);
        sb.append(", upKbps=");
        sb.append(this.d);
        sb.append(", downKbps=");
        sb.append(this.e);
        sb.append(", strength=");
        sb.append(this.f);
        sb.append(", cellularTechnology=");
        return ka1.v(sb, this.g, ")");
    }

    public fe8(ee8 ee8Var, String str, Long l, Long l2, Long l3, Long l4, String str2) {
        ee8Var.getClass();
        this.a = ee8Var;
        this.b = str;
        this.c = l;
        this.d = l2;
        this.e = l3;
        this.f = l4;
        this.g = str2;
    }
}
