package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ke8 {
    public final String a;
    public final String b;
    public final ce8 c;
    public final r84 d;

    public ke8(String str, String str2, ce8 ce8Var, r84 r84Var) {
        this.a = str;
        this.b = str2;
        this.c = ce8Var;
        this.d = r84Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ke8)) {
            return false;
        }
        ke8 ke8Var = (ke8) obj;
        return this.a.equals(ke8Var.a) && g76.L(this.b, ke8Var.b) && this.c.equals(ke8Var.c) && g76.L(this.d, ke8Var.d);
    }

    public final int hashCode() {
        return this.d.a.hashCode() + ((this.c.a.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b)) * 961);
    }

    public final String toString() {
        return "NetworkRequest(url=" + this.a + ", method=" + this.b + ", headers=" + this.c + ", body=null, extras=" + this.d + ')';
    }
}
