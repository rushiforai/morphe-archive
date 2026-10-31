package h2;

import a80.m;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: e, reason: collision with root package name */
    public static final c f59017e = new c(0.0f, 0.0f, 0.0f, 0.0f);

    /* renamed from: a, reason: collision with root package name */
    public final float f59018a;

    /* renamed from: b, reason: collision with root package name */
    public final float f59019b;

    /* renamed from: c, reason: collision with root package name */
    public final float f59020c;

    /* renamed from: d, reason: collision with root package name */
    public final float f59021d;

    public c(float f11, float f12, float f13, float f14) {
        this.f59018a = f11;
        this.f59019b = f12;
        this.f59020c = f13;
        this.f59021d = f14;
    }

    public final boolean a(long j11) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j11 & 4294967295L));
        return (fIntBitsToFloat >= this.f59018a) & (fIntBitsToFloat < this.f59020c) & (fIntBitsToFloat2 >= this.f59019b) & (fIntBitsToFloat2 < this.f59021d);
    }

    public final long b() {
        float f11 = this.f59020c;
        float f12 = this.f59018a;
        float fZ = a2.c.z(f11, f12, 2.0f, f12);
        float f13 = this.f59019b;
        float fZ2 = a2.c.z(this.f59021d, f13, 2.0f, f13);
        return (Float.floatToRawIntBits(fZ2) & 4294967295L) | (Float.floatToRawIntBits(fZ) << 32);
    }

    public final long c() {
        float f11 = this.f59020c - this.f59018a;
        float f12 = this.f59021d - this.f59019b;
        return (Float.floatToRawIntBits(f12) & 4294967295L) | (Float.floatToRawIntBits(f11) << 32);
    }

    public final long d() {
        return (Float.floatToRawIntBits(this.f59018a) << 32) | (Float.floatToRawIntBits(this.f59019b) & 4294967295L);
    }

    public final long e() {
        return (Float.floatToRawIntBits(this.f59020c) << 32) | (Float.floatToRawIntBits(this.f59019b) & 4294967295L);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Float.compare(this.f59018a, cVar.f59018a) == 0 && Float.compare(this.f59019b, cVar.f59019b) == 0 && Float.compare(this.f59020c, cVar.f59020c) == 0 && Float.compare(this.f59021d, cVar.f59021d) == 0;
    }

    public final c f(c cVar) {
        return new c(Math.max(this.f59018a, cVar.f59018a), Math.max(this.f59019b, cVar.f59019b), Math.min(this.f59020c, cVar.f59020c), Math.min(this.f59021d, cVar.f59021d));
    }

    public final boolean g() {
        return (this.f59018a >= this.f59020c) | (this.f59019b >= this.f59021d);
    }

    public final boolean h(c cVar) {
        return (this.f59018a < cVar.f59020c) & (cVar.f59018a < this.f59020c) & (this.f59019b < cVar.f59021d) & (cVar.f59019b < this.f59021d);
    }

    public final int hashCode() {
        return Float.hashCode(this.f59021d) + m.d(this.f59020c, m.d(this.f59019b, Float.hashCode(this.f59018a) * 31, 31), 31);
    }

    public final c i(float f11, float f12) {
        return new c(this.f59018a + f11, this.f59019b + f12, this.f59020c + f11, this.f59021d + f12);
    }

    public final c j(long j11) {
        int i5 = (int) (j11 >> 32);
        int i11 = (int) (j11 & 4294967295L);
        return new c(Float.intBitsToFloat(i5) + this.f59018a, Float.intBitsToFloat(i11) + this.f59019b, Float.intBitsToFloat(i5) + this.f59020c, Float.intBitsToFloat(i11) + this.f59021d);
    }

    public final String toString() {
        return "Rect.fromLTRB(" + t2.c.P(this.f59018a) + ", " + t2.c.P(this.f59019b) + ", " + t2.c.P(this.f59020c) + ", " + t2.c.P(this.f59021d) + ')';
    }
}
