package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o59 extends h69 {
    public final float c;
    public final float d;
    public final float e;
    public final boolean f;
    public final boolean g;
    public final float h;
    public final float i;

    public o59(float f, float f2, float f3, boolean z, boolean z2, float f4, float f5) {
        super(3);
        this.c = f;
        this.d = f2;
        this.e = f3;
        this.f = z;
        this.g = z2;
        this.h = f4;
        this.i = f5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o59)) {
            return false;
        }
        o59 o59Var = (o59) obj;
        return Float.compare(this.c, o59Var.c) == 0 && Float.compare(this.d, o59Var.d) == 0 && Float.compare(this.e, o59Var.e) == 0 && this.f == o59Var.f && this.g == o59Var.g && Float.compare(this.h, o59Var.h) == 0 && Float.compare(this.i, o59Var.i) == 0;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.i) + km4.p(this.h, (((km4.p(this.e, km4.p(this.d, Float.floatToIntBits(this.c) * 31, 31), 31) + (this.f ? 1231 : 1237)) * 31) + (this.g ? 1231 : 1237)) * 31, 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ArcTo(horizontalEllipseRadius=");
        sb.append(this.c);
        sb.append(", verticalEllipseRadius=");
        sb.append(this.d);
        sb.append(", theta=");
        sb.append(this.e);
        sb.append(", isMoreThanHalf=");
        sb.append(this.f);
        sb.append(", isPositiveArc=");
        sb.append(this.g);
        sb.append(", arcStartX=");
        sb.append(this.h);
        sb.append(", arcStartY=");
        return lv8.s(sb, this.i, ')');
    }
}
