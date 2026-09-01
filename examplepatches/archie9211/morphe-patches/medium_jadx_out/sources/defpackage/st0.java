package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class st0 extends gx1 {
    public final rl0 v;

    public st0(rl0 rl0Var) {
        this.v = rl0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof st0) && this.v.equals(((st0) obj).v);
    }

    public final int hashCode() {
        return this.v.hashCode();
    }

    public final String toString() {
        return "Element(value=" + this.v + ')';
    }
}
