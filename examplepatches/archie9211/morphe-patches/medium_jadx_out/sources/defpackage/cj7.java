package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cj7 {
    public final String a;
    public final n46 b;

    public cj7(String str, n46 n46Var) {
        this.a = str;
        this.b = n46Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof cj7)) {
            return false;
        }
        cj7 cj7Var = (cj7) obj;
        return this.a.equals(cj7Var.a) && this.b.equals(cj7Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "MatchGroup(value=" + this.a + ", range=" + this.b + ')';
    }
}
