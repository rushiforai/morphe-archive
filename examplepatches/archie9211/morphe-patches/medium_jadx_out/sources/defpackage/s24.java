package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class s24 implements y24 {
    public final String a;
    public final b24 b;

    public s24(String str, b24 b24Var) {
        str.getClass();
        this.a = str;
        this.b = b24Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s24)) {
            return false;
        }
        s24 s24Var = (s24) obj;
        return g76.L(this.a, s24Var.a) && this.b.equals(s24Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "OnClappedFailed(responseId=" + this.a + ", errorState=" + this.b + ")";
    }
}
