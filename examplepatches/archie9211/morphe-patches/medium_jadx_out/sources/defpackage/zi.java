package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zi extends bj {
    public final b24 a;
    public final int b;

    public zi(int i, b24 b24Var) {
        this.a = b24Var;
        this.b = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zi)) {
            return false;
        }
        zi ziVar = (zi) obj;
        return this.a.equals(ziVar.a) && this.b == ziVar.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + this.b;
    }

    public final String toString() {
        return "Error(errorState=" + this.a + ", total=" + this.b + ")";
    }
}
