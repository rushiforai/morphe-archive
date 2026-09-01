package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class e77 {
    public final m77 a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;

    public e77(m77 m77Var, String str, String str2, String str3, String str4) {
        str4.getClass();
        this.a = m77Var;
        this.b = str;
        this.c = str2;
        this.d = str3;
        this.e = str4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e77)) {
            return false;
        }
        e77 e77Var = (e77) obj;
        return g76.L(this.a, e77Var.a) && g76.L(this.b, e77Var.b) && g76.L(this.c, e77Var.c) && g76.L(this.d, e77Var.d) && g76.L(this.e, e77Var.e);
    }

    public final int hashCode() {
        m77 m77Var = this.a;
        int iHashCode = (m77Var == null ? 0 : m77Var.hashCode()) * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.d;
        return this.e.hashCode() + ((iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Client(simCarrier=");
        sb.append(this.a);
        sb.append(", signalStrength=");
        sb.append(this.b);
        sb.append(", downlinkKbps=");
        ka1.C(sb, this.c, ", uplinkKbps=", this.d, ", connectivity=");
        return ka1.v(sb, this.e, ")");
    }
}
