package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vj3 implements Comparable {
    public final float a;

    public static int a(float f, float f2) {
        if (Float.isNaN(f) || Float.isNaN(f2)) {
            return 0;
        }
        return Float.compare(f, f2);
    }

    public static final boolean b(float f, float f2) {
        return Float.compare(f, f2) == 0;
    }

    public static String c(float f) {
        if (Float.isNaN(f)) {
            return "Dp.Unspecified";
        }
        return f + ".dp";
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return a(this.a, ((vj3) obj).a);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof vj3) {
            return Float.compare(this.a, ((vj3) obj).a) == 0;
        }
        return false;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.a);
    }

    public final String toString() {
        return c(this.a);
    }
}
