package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gm6 {
    public final wg6 a;

    public gm6(wg6 wg6Var) {
        wg6Var.getClass();
        this.a = wg6Var;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof gm6) {
            return g76.L(this.a, ((gm6) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return vx0.T(this.a).getName();
    }
}
