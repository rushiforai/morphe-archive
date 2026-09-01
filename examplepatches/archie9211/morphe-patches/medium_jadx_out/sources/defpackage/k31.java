package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k31 {
    public final ne8 a;

    public k31(ne8 ne8Var) {
        this.a = ne8Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof k31) && g76.L(this.a, ((k31) obj).a);
    }

    public final int hashCode() {
        ne8 ne8Var = this.a;
        if (ne8Var != null) {
            return ne8Var.hashCode();
        }
        return 0;
    }

    public final String toString() {
        return "ReadResult(request=null, response=" + this.a + ')';
    }
}
