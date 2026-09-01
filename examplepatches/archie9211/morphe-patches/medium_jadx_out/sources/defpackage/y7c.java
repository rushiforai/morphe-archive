package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class y7c {
    public final float a;
    public zwa c;
    public float e;
    public zwa g;
    public zwa h;
    public final float b = (((-Math.abs(-75.0f)) + 90.0f) / 180.0f) * 3.1415927f;
    public long d = 0;
    public long f = 9205357640488583168L;

    public y7c(float f) {
        this.a = f;
        zwa zwaVar = zwa.e;
        this.g = zwaVar;
        this.h = zwaVar;
    }

    public final void a() {
        if (this.h.f()) {
            return;
        }
        zwa zwaVar = this.c;
        if (zwaVar == null) {
            zwaVar = this.h;
        }
        this.g = zwaVar;
        this.f = ip8.e(this.h.d() ^ (-9223372034707292160L), this.g.b());
        long jC = this.g.c();
        if (dfc.a(this.d, jC)) {
            return;
        }
        this.d = jC;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (jC >> 32)) / 2.0f;
        this.e = (((float) Math.cos(((float) Math.acos(fIntBitsToFloat / r2)) - this.b)) * ((float) Math.sqrt(((float) Math.pow(fIntBitsToFloat, 2.0d)) + ((float) Math.pow(Float.intBitsToFloat((int) (this.d & 4294967295L)) / 2.0f, 2.0d)))) * 2.0f) + this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && y7c.class == obj.getClass()) {
            y7c y7cVar = (y7c) obj;
            if (this.a == y7cVar.a && this.b == y7cVar.b) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.b) + (Float.floatToIntBits(this.a) * 31);
    }
}
