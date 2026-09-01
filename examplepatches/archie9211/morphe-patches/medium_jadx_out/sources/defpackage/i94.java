package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i94 {
    public final tj4 a;

    public i94(tj4 tj4Var) {
        this.a = tj4Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof i94) {
            return Float.compare(0.0f, 0.0f) == 0 && g76.L(this.a, ((i94) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode() + (Float.floatToIntBits(0.0f) * 31);
    }

    public final String toString() {
        return "Fade(alpha=0.0, animationSpec=" + this.a + ')';
    }
}
