package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class uq9 implements vq9 {
    public final String a;
    public final String b;
    public final String c;

    public uq9(String str, String str2, String str3) {
        str2.getClass();
        str3.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof uq9)) {
            return false;
        }
        uq9 uq9Var = (uq9) obj;
        return this.a.equals(uq9Var.a) && g76.L(this.b, uq9Var.b) && g76.L(this.c, uq9Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        return ka1.v(y30.u("EditNote(annotation=", this.a, ", catalogId=", this.b, ", catalogItemId="), this.c, ")");
    }
}
