package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class tb0 {
    public final String a;
    public final String b;
    public final bo4 c;

    public tb0(String str, String str2, bo4 bo4Var) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
        this.c = bo4Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tb0)) {
            return false;
        }
        tb0 tb0Var = (tb0) obj;
        return g76.L(this.a, tb0Var.a) && g76.L(this.b, tb0Var.b) && this.c.equals(tb0Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("Entity(id=", this.a, ", name=", this.b, ", mutedStateStream=");
        sbU.append(this.c);
        sbU.append(")");
        return sbU.toString();
    }
}
