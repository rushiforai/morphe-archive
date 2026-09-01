package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l31 {
    public final ne8 a;

    public l31(ne8 ne8Var) {
        this.a = ne8Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof l31) {
            return g76.L(this.a, ((l31) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        ne8 ne8Var = this.a;
        if (ne8Var != null) {
            return ne8Var.hashCode();
        }
        return 0;
    }

    public final String toString() {
        return "WriteResult(response=" + this.a + ')';
    }
}
