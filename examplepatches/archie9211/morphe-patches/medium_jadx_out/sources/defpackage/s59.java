package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s59 extends h69 {
    public final float c;
    public final float d;

    public s59(float f, float f2) {
        super(3);
        this.c = f;
        this.d = f2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s59)) {
            return false;
        }
        s59 s59Var = (s59) obj;
        return Float.compare(this.c, s59Var.c) == 0 && Float.compare(this.d, s59Var.d) == 0;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.d) + (Float.floatToIntBits(this.c) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("LineTo(x=");
        sb.append(this.c);
        sb.append(", y=");
        return lv8.s(sb, this.d, ')');
    }
}
