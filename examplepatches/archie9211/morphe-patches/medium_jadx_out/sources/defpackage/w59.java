package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w59 extends h69 {
    public final float c;
    public final float d;

    public w59(float f, float f2) {
        super(1);
        this.c = f;
        this.d = f2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w59)) {
            return false;
        }
        w59 w59Var = (w59) obj;
        return Float.compare(this.c, w59Var.c) == 0 && Float.compare(this.d, w59Var.d) == 0;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.d) + (Float.floatToIntBits(this.c) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ReflectiveQuadTo(x=");
        sb.append(this.c);
        sb.append(", y=");
        return lv8.s(sb, this.d, ')');
    }
}
