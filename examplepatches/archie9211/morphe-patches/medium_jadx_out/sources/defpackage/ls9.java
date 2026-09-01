package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ls9 implements ou9 {
    public final uu4 a;

    public ls9(uu4 uu4Var) {
        uu4Var.getClass();
        this.a = uu4Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ls9) && g76.L(this.a, ((ls9) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "FollowSubscribe(result=" + this.a + ")";
    }
}
