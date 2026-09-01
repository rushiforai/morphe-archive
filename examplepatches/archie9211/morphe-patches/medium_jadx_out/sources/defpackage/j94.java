package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j94 {
    public final Object a;
    public final mz1 b;

    public j94(ihc ihcVar, mz1 mz1Var) {
        this.a = ihcVar;
        this.b = mz1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof j94) {
            j94 j94Var = (j94) obj;
            return g76.L(this.a, j94Var.a) && this.b == j94Var.b;
        }
        return false;
    }

    public final int hashCode() {
        Object obj = this.a;
        return this.b.hashCode() + ((obj == null ? 0 : obj.hashCode()) * 31);
    }

    public final String toString() {
        return "FadeInFadeOutAnimationItem(key=" + this.a + ", transition=" + this.b + ')';
    }
}
