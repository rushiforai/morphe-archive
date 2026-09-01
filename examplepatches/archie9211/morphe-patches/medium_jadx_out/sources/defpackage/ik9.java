package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ik9 implements lk9 {
    public final String a;
    public final boolean b;

    public ik9(String str, boolean z) {
        str.getClass();
        this.a = str;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ik9)) {
            return false;
        }
        ik9 ik9Var = (ik9) obj;
        return g76.L(this.a, ik9Var.a) && this.b == ik9Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return km4.z("PostSubmissionApproved(postId=", this.a, ", isPublished=", ")", this.b);
    }
}
