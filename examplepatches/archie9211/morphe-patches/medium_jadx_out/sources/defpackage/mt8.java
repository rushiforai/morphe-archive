package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mt8 implements nt8 {
    public final String a;
    public final boolean b;

    public mt8(String str, boolean z) {
        str.getClass();
        this.a = str;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mt8)) {
            return false;
        }
        mt8 mt8Var = (mt8) obj;
        return g76.L(this.a, mt8Var.a) && this.b == mt8Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return km4.z("ToggleFollow(slug=", this.a, ", isFollowing=", ")", this.b);
    }
}
