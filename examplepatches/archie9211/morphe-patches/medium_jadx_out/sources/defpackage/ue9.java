package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ue9 {
    public final float a;
    public final tf9 b;
    public final cv7 c;

    public ue9(float f, tf9 tf9Var, cv7 cv7Var) {
        this.a = f;
        this.b = tf9Var;
        this.c = cv7Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ue9)) {
            return false;
        }
        ue9 ue9Var = (ue9) obj;
        return vj3.b(this.a, ue9Var.a) && g76.L(this.b, ue9Var.b) && g76.L(this.c, ue9Var.c);
    }

    public final int hashCode() {
        int iFloatToIntBits = Float.floatToIntBits(this.a) * 31;
        tf9 tf9Var = this.b;
        int iHashCode = (iFloatToIntBits + (tf9Var == null ? 0 : tf9Var.hashCode())) * 31;
        cv7 cv7Var = this.c;
        return iHashCode + (cv7Var != null ? cv7Var.hashCode() : 0);
    }

    public final String toString() {
        return "PostChipsUiModel(topPadding=" + vj3.c(this.a) + ", postFeaturedInPublicationChipUiModel=" + this.b + ", memberOnlyChipUiModel=" + this.c + ")";
    }
}
