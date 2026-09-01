package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q59 extends h69 {
    public final float c;
    public final float d;
    public final float e;
    public final float f;
    public final float g;
    public final float h;

    public q59(float f, float f2, float f3, float f4, float f5, float f6) {
        super(2);
        this.c = f;
        this.d = f2;
        this.e = f3;
        this.f = f4;
        this.g = f5;
        this.h = f6;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q59)) {
            return false;
        }
        q59 q59Var = (q59) obj;
        return Float.compare(this.c, q59Var.c) == 0 && Float.compare(this.d, q59Var.d) == 0 && Float.compare(this.e, q59Var.e) == 0 && Float.compare(this.f, q59Var.f) == 0 && Float.compare(this.g, q59Var.g) == 0 && Float.compare(this.h, q59Var.h) == 0;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.h) + km4.p(this.g, km4.p(this.f, km4.p(this.e, km4.p(this.d, Float.floatToIntBits(this.c) * 31, 31), 31), 31), 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("CurveTo(x1=");
        sb.append(this.c);
        sb.append(", y1=");
        sb.append(this.d);
        sb.append(", x2=");
        sb.append(this.e);
        sb.append(", y2=");
        sb.append(this.f);
        sb.append(", x3=");
        sb.append(this.g);
        sb.append(", y3=");
        return lv8.s(sb, this.h, ')');
    }
}
