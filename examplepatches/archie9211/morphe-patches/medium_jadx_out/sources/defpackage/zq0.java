package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zq0 {
    public final float a;

    public zq0(float f) {
        this.a = f;
    }

    public final int a(int i, int i2) {
        return Math.round((1.0f + this.a) * ((i2 - i) / 2.0f));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof zq0) && Float.compare(this.a, ((zq0) obj).a) == 0;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.a);
    }

    public final String toString() {
        return lv8.s(new StringBuilder("Vertical(bias="), this.a, ')');
    }
}
