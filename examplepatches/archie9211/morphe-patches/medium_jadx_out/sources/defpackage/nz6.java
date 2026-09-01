package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nz6 implements wz4 {
    public final float a;

    public nz6(float f) {
        this.a = f;
    }

    @Override // defpackage.wz4
    public final float a(float f) {
        return f / this.a;
    }

    @Override // defpackage.wz4
    public final float b(float f) {
        return f * this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof nz6) && Float.compare(this.a, ((nz6) obj).a) == 0;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.a);
    }

    public final String toString() {
        return lv8.s(new StringBuilder("LinearFontScaleConverter(fontScale="), this.a, ')');
    }
}
