package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nm4 implements qm4 {
    public final String a;
    public final boolean b;
    public final String c;

    public nm4(String str, boolean z, String str2) {
        str.getClass();
        this.a = str;
        this.b = z;
        this.c = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof nm4)) {
            return false;
        }
        nm4 nm4Var = (nm4) obj;
        return g76.L(this.a, nm4Var.a) && this.b == nm4Var.b && g76.L(this.c, nm4Var.c);
    }

    public final int hashCode() {
        int iHashCode = ((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31;
        String str = this.c;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return ka1.v(ev6.D("BooleanFlag(name=", this.a, ", value=", ", description=", this.b), this.c, ")");
    }
}
