package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d69 extends h69 {
    public final float c;
    public final float d;
    public final float e;
    public final float f;

    public d69(float f, float f2, float f3, float f4) {
        super(2);
        this.c = f;
        this.d = f2;
        this.e = f3;
        this.f = f4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d69)) {
            return false;
        }
        d69 d69Var = (d69) obj;
        return Float.compare(this.c, d69Var.c) == 0 && Float.compare(this.d, d69Var.d) == 0 && Float.compare(this.e, d69Var.e) == 0 && Float.compare(this.f, d69Var.f) == 0;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.f) + km4.p(this.e, km4.p(this.d, Float.floatToIntBits(this.c) * 31, 31), 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("RelativeReflectiveCurveTo(dx1=");
        sb.append(this.c);
        sb.append(", dy1=");
        sb.append(this.d);
        sb.append(", dx2=");
        sb.append(this.e);
        sb.append(", dy2=");
        return lv8.s(sb, this.f, ')');
    }
}
