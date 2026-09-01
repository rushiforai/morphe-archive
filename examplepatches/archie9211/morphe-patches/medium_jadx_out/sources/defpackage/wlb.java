package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wlb {
    public final float a;
    public final float b;
    public final float c;
    public final float d;
    public final long e;
    public final long f;
    public final long g;
    public final long h;

    static {
        float fIntBitsToFloat = Float.intBitsToFloat(0);
        float fIntBitsToFloat2 = Float.intBitsToFloat(0);
        Float.floatToRawIntBits(fIntBitsToFloat);
        Float.floatToRawIntBits(fIntBitsToFloat2);
    }

    public wlb(float f, float f2, float f3, float f4, long j, long j2, long j3, long j4) {
        this.a = f;
        this.b = f2;
        this.c = f3;
        this.d = f4;
        this.e = j;
        this.f = j2;
        this.g = j3;
        this.h = j4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wlb)) {
            return false;
        }
        wlb wlbVar = (wlb) obj;
        return Float.compare(this.a, wlbVar.a) == 0 && Float.compare(this.b, wlbVar.b) == 0 && Float.compare(this.c, wlbVar.c) == 0 && Float.compare(this.d, wlbVar.d) == 0 && f49.z(this.e, wlbVar.e) && f49.z(this.f, wlbVar.f) && f49.z(this.g, wlbVar.g) && f49.z(this.h, wlbVar.h);
    }

    public final int hashCode() {
        int iP = km4.p(this.d, km4.p(this.c, km4.p(this.b, Float.floatToIntBits(this.a) * 31, 31), 31), 31);
        long j = this.e;
        long j2 = this.f;
        int i = (((int) (j2 ^ (j2 >>> 32))) + ((((int) (j ^ (j >>> 32))) + iP) * 31)) * 31;
        long j3 = this.g;
        int i2 = (((int) (j3 ^ (j3 >>> 32))) + i) * 31;
        long j4 = this.h;
        return ((int) (j4 ^ (j4 >>> 32))) + i2;
    }

    public final String toString() {
        String str = vc2.P(this.a) + ", " + vc2.P(this.b) + ", " + vc2.P(this.c) + ", " + vc2.P(this.d);
        long j = this.e;
        long j2 = this.f;
        boolean z = f49.z(j, j2);
        long j3 = this.g;
        long j4 = this.h;
        if (!z || !f49.z(j2, j3) || !f49.z(j3, j4)) {
            StringBuilder sbU = lv8.u("RoundRect(rect=", str, ", topLeft=");
            sbU.append((Object) f49.W(j));
            sbU.append(", topRight=");
            sbU.append((Object) f49.W(j2));
            sbU.append(", bottomRight=");
            sbU.append((Object) f49.W(j3));
            sbU.append(", bottomLeft=");
            sbU.append((Object) f49.W(j4));
            sbU.append(')');
            return sbU.toString();
        }
        int i = (int) (j >> 32);
        int i2 = (int) (j & 4294967295L);
        if (Float.intBitsToFloat(i) == Float.intBitsToFloat(i2)) {
            StringBuilder sbU2 = lv8.u("RoundRect(rect=", str, ", radius=");
            sbU2.append(vc2.P(Float.intBitsToFloat(i)));
            sbU2.append(')');
            return sbU2.toString();
        }
        StringBuilder sbU3 = lv8.u("RoundRect(rect=", str, ", x=");
        sbU3.append(vc2.P(Float.intBitsToFloat(i)));
        sbU3.append(", y=");
        sbU3.append(vc2.P(Float.intBitsToFloat(i2)));
        sbU3.append(')');
        return sbU3.toString();
    }
}
