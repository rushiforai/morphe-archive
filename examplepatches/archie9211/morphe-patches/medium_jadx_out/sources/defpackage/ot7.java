package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ot7 implements pt7 {
    public final boolean a;
    public final int b;

    public ot7(int i, boolean z) {
        this.a = z;
        this.b = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ot7)) {
            return false;
        }
        ot7 ot7Var = (ot7) obj;
        return this.a == ot7Var.a && this.b == ot7Var.b;
    }

    public final int hashCode() {
        return ((this.a ? 1231 : 1237) * 31) + this.b;
    }

    public final String toString() {
        return "Position(isTooltipAboveAnchor=" + this.a + ", arrowMarginStart=" + this.b + ")";
    }
}
