package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bt9 implements ou9 {
    public final String a;
    public final String b;
    public final String c;

    public bt9(String str, String str2, String str3) {
        str2.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bt9)) {
            return false;
        }
        bt9 bt9Var = (bt9) obj;
        return this.a.equals(bt9Var.a) && g76.L(this.b, bt9Var.b) && this.c.equals(bt9Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        return ka1.v(y30.u("NavigateToReportPost(postId=", this.a, ", authorId=", this.b, ", source="), this.c, ")");
    }
}
