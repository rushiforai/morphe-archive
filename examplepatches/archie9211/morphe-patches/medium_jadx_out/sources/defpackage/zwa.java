package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zwa {
    public static final zwa e = new zwa(0.0f, 0.0f, 0.0f, 0.0f);
    public final float a;
    public final float b;
    public final float c;
    public final float d;

    public zwa(float f, float f2, float f3, float f4) {
        this.a = f;
        this.b = f2;
        this.c = f3;
        this.d = f4;
    }

    public final boolean a(long j) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j & 4294967295L));
        return (fIntBitsToFloat >= this.a) & (fIntBitsToFloat < this.c) & (fIntBitsToFloat2 >= this.b) & (fIntBitsToFloat2 < this.d);
    }

    public final long b() {
        float f = this.c;
        float f2 = this.a;
        float f3 = ((f - f2) / 2.0f) + f2;
        float f4 = this.d;
        float f5 = this.b;
        return (((long) Float.floatToRawIntBits(((f4 - f5) / 2.0f) + f5)) & 4294967295L) | (Float.floatToRawIntBits(f3) << 32);
    }

    public final long c() {
        float f = this.c - this.a;
        return (((long) Float.floatToRawIntBits(this.d - this.b)) & 4294967295L) | (Float.floatToRawIntBits(f) << 32);
    }

    public final long d() {
        return (((long) Float.floatToRawIntBits(this.a)) << 32) | (((long) Float.floatToRawIntBits(this.b)) & 4294967295L);
    }

    public final zwa e(zwa zwaVar) {
        return new zwa(Math.max(this.a, zwaVar.a), Math.max(this.b, zwaVar.b), Math.min(this.c, zwaVar.c), Math.min(this.d, zwaVar.d));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zwa)) {
            return false;
        }
        zwa zwaVar = (zwa) obj;
        return Float.compare(this.a, zwaVar.a) == 0 && Float.compare(this.b, zwaVar.b) == 0 && Float.compare(this.c, zwaVar.c) == 0 && Float.compare(this.d, zwaVar.d) == 0;
    }

    public final boolean f() {
        return (this.a >= this.c) | (this.b >= this.d);
    }

    public final boolean g(zwa zwaVar) {
        return (this.a < zwaVar.c) & (zwaVar.a < this.c) & (this.b < zwaVar.d) & (zwaVar.b < this.d);
    }

    public final zwa h(float f, float f2) {
        return new zwa(this.a + f, this.b + f2, this.c + f, this.d + f2);
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.d) + km4.p(this.c, km4.p(this.b, Float.floatToIntBits(this.a) * 31, 31), 31);
    }

    public final zwa i(long j) {
        int i = (int) (j >> 32);
        int i2 = (int) (j & 4294967295L);
        return new zwa(Float.intBitsToFloat(i) + this.a, Float.intBitsToFloat(i2) + this.b, Float.intBitsToFloat(i) + this.c, Float.intBitsToFloat(i2) + this.d);
    }

    public final String toString() {
        return "Rect.fromLTRB(" + vc2.P(this.a) + ", " + vc2.P(this.b) + ", " + vc2.P(this.c) + ", " + vc2.P(this.d) + ')';
    }
}
