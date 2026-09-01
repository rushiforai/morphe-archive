package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class j77 {
    public final String a;
    public final String b;
    public final String c;

    public j77(String str, String str2, String str3) {
        str.getClass();
        str3.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j77)) {
            return false;
        }
        j77 j77Var = (j77) obj;
        return g76.L(this.a, j77Var.a) && g76.L(this.b, j77Var.b) && g76.L(this.c, j77Var.c);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        return this.c.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        return ka1.v(y30.u("Logger(name=", this.a, ", threadName=", this.b, ", version="), this.c, ")");
    }
}
