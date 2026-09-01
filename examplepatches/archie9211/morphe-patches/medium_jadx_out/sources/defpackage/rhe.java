package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rhe implements uhe {
    public final jt0 a;
    public final int b;

    public rhe(jt0 jt0Var, int i) {
        this.a = jt0Var;
        this.b = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof rhe)) {
            return false;
        }
        rhe rheVar = (rhe) obj;
        return this.a.equals(rheVar.a) && this.b == rheVar.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + this.b;
    }

    public final String toString() {
        return "Data(book=" + this.a + ", bookCount=" + this.b + ")";
    }
}
