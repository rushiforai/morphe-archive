package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kkb {
    public final float a;
    public final float b;
    public final float c;
    public final float d;

    public kkb(float f, float f2, float f3, float f4) {
        this.a = f;
        this.b = f2;
        this.c = f3;
        this.d = f4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kkb)) {
            return false;
        }
        kkb kkbVar = (kkb) obj;
        return this.a == kkbVar.a && this.b == kkbVar.b && this.c == kkbVar.c && this.d == kkbVar.d;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.d) + km4.p(this.c, km4.p(this.b, Float.floatToIntBits(this.a) * 31, 31), 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("RippleAlpha(draggedAlpha=");
        sb.append(this.a);
        sb.append(", focusedAlpha=");
        sb.append(this.b);
        sb.append(", hoveredAlpha=");
        sb.append(this.c);
        sb.append(", pressedAlpha=");
        return lv8.s(sb, this.d, ')');
    }
}
