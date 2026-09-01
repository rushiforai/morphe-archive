package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u2f {
    public final float a;
    public final float b;

    public u2f(float f, float f2) {
        this.a = f;
        this.b = f2;
    }

    public final float[] a() {
        float f = this.a;
        float f2 = this.b;
        return new float[]{f / f2, 1.0f, ((1.0f - f) - f2) / f2};
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u2f)) {
            return false;
        }
        u2f u2fVar = (u2f) obj;
        return Float.compare(this.a, u2fVar.a) == 0 && Float.compare(this.b, u2fVar.b) == 0;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.b) + (Float.floatToIntBits(this.a) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("WhitePoint(x=");
        sb.append(this.a);
        sb.append(", y=");
        return lv8.s(sb, this.b, ')');
    }
}
