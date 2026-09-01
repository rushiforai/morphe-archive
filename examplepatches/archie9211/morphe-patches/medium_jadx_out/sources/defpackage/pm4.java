package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pm4 implements qm4 {
    public final String a;
    public final String b;
    public final String c;

    public pm4(String str, String str2, String str3) {
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
        if (!(obj instanceof pm4)) {
            return false;
        }
        pm4 pm4Var = (pm4) obj;
        return g76.L(this.a, pm4Var.a) && this.b.equals(pm4Var.b) && g76.L(this.c, pm4Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        return ka1.v(y30.u("StringFlag(name=", this.a, ", value=", this.b, ", description="), this.c, ")");
    }
}
