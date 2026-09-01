package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c69 extends h69 {
    public final float c;
    public final float d;
    public final float e;
    public final float f;

    public c69(float f, float f2, float f3, float f4) {
        super(1);
        this.c = f;
        this.d = f2;
        this.e = f3;
        this.f = f4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c69)) {
            return false;
        }
        c69 c69Var = (c69) obj;
        return Float.compare(this.c, c69Var.c) == 0 && Float.compare(this.d, c69Var.d) == 0 && Float.compare(this.e, c69Var.e) == 0 && Float.compare(this.f, c69Var.f) == 0;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.f) + km4.p(this.e, km4.p(this.d, Float.floatToIntBits(this.c) * 31, 31), 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("RelativeQuadTo(dx1=");
        sb.append(this.c);
        sb.append(", dy1=");
        sb.append(this.d);
        sb.append(", dx2=");
        sb.append(this.e);
        sb.append(", dy2=");
        return lv8.s(sb, this.f, ')');
    }
}
