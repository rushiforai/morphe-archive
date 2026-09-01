package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class om4 implements qm4 {
    public final String a;
    public final int b;
    public final String c;

    public om4(String str, int i, String str2) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = i;
        this.c = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof om4)) {
            return false;
        }
        om4 om4Var = (om4) obj;
        return g76.L(this.a, om4Var.a) && this.b == om4Var.b && g76.L(this.c, om4Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + (((this.a.hashCode() * 31) + this.b) * 31);
    }

    public final String toString() {
        return ka1.v(y30.t(this.b, "IntFlag(name=", this.a, ", value=", ", description="), this.c, ")");
    }
}
