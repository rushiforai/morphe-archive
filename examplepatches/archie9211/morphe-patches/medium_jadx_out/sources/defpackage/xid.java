package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xid {
    public static final xid c = new xid(1.0f, 0.0f);
    public final float a;
    public final float b;

    public xid(float f, float f2) {
        this.a = f;
        this.b = f2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xid)) {
            return false;
        }
        xid xidVar = (xid) obj;
        return this.a == xidVar.a && this.b == xidVar.b;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.b) + (Float.floatToIntBits(this.a) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("TextGeometricTransform(scaleX=");
        sb.append(this.a);
        sb.append(", skewX=");
        return lv8.s(sb, this.b, ')');
    }
}
