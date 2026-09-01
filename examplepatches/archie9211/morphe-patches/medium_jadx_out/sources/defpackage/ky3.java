package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ky3 {
    public final String a;
    public final String b;
    public final String c;

    public ky3(String str, String str2, String str3) {
        this.a = str;
        this.b = str2;
        this.c = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ky3)) {
            return false;
        }
        ky3 ky3Var = (ky3) obj;
        return this.a.equals(ky3Var.a) && this.b.equals(ky3Var.b) && this.c.equals(ky3Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        return ka1.v(y30.u("EmptySearchTagUiModel(tagSlug=", this.a, ", tagName=", this.b, ", source="), this.c, ")");
    }
}
