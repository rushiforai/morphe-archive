package h2;

import a80.m;
import b.c0;
import b.u4;
import e10.z2;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final float f59022a;

    /* renamed from: b, reason: collision with root package name */
    public final float f59023b;

    /* renamed from: c, reason: collision with root package name */
    public final float f59024c;

    /* renamed from: d, reason: collision with root package name */
    public final float f59025d;

    /* renamed from: e, reason: collision with root package name */
    public final long f59026e;

    /* renamed from: f, reason: collision with root package name */
    public final long f59027f;

    /* renamed from: g, reason: collision with root package name */
    public final long f59028g;

    /* renamed from: h, reason: collision with root package name */
    public final long f59029h;

    static {
        z2.n(0.0f, 0.0f, 0.0f, 0.0f, 0L);
    }

    public d(float f11, float f12, float f13, float f14, long j11, long j12, long j13, long j14) {
        this.f59022a = f11;
        this.f59023b = f12;
        this.f59024c = f13;
        this.f59025d = f14;
        this.f59026e = j11;
        this.f59027f = j12;
        this.f59028g = j13;
        this.f59029h = j14;
    }

    public final float a() {
        return this.f59025d - this.f59023b;
    }

    public final float b() {
        return this.f59024c - this.f59022a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return Float.compare(this.f59022a, dVar.f59022a) == 0 && Float.compare(this.f59023b, dVar.f59023b) == 0 && Float.compare(this.f59024c, dVar.f59024c) == 0 && Float.compare(this.f59025d, dVar.f59025d) == 0 && ul.b.B(this.f59026e, dVar.f59026e) && ul.b.B(this.f59027f, dVar.f59027f) && ul.b.B(this.f59028g, dVar.f59028g) && ul.b.B(this.f59029h, dVar.f59029h);
    }

    public final int hashCode() {
        return Long.hashCode(this.f59029h) + c0.d(c0.d(c0.d(m.d(this.f59025d, m.d(this.f59024c, m.d(this.f59023b, Float.hashCode(this.f59022a) * 31, 31), 31), 31), 31, this.f59026e), 31, this.f59027f), 31, this.f59028g);
    }

    public final String toString() {
        String str = t2.c.P(this.f59022a) + ", " + t2.c.P(this.f59023b) + ", " + t2.c.P(this.f59024c) + ", " + t2.c.P(this.f59025d);
        long j11 = this.f59026e;
        long j12 = this.f59027f;
        boolean zB = ul.b.B(j11, j12);
        long j13 = this.f59028g;
        long j14 = this.f59029h;
        if (!zB || !ul.b.B(j12, j13) || !ul.b.B(j13, j14)) {
            StringBuilder sbK = u4.k("RoundRect(rect=", str, ", topLeft=");
            sbK.append((Object) ul.b.j0(j11));
            sbK.append(", topRight=");
            sbK.append((Object) ul.b.j0(j12));
            sbK.append(", bottomRight=");
            sbK.append((Object) ul.b.j0(j13));
            sbK.append(", bottomLeft=");
            sbK.append((Object) ul.b.j0(j14));
            sbK.append(')');
            return sbK.toString();
        }
        int i5 = (int) (j11 >> 32);
        int i11 = (int) (j11 & 4294967295L);
        if (Float.intBitsToFloat(i5) == Float.intBitsToFloat(i11)) {
            StringBuilder sbK2 = u4.k("RoundRect(rect=", str, ", radius=");
            sbK2.append(t2.c.P(Float.intBitsToFloat(i5)));
            sbK2.append(')');
            return sbK2.toString();
        }
        StringBuilder sbK3 = u4.k("RoundRect(rect=", str, ", x=");
        sbK3.append(t2.c.P(Float.intBitsToFloat(i5)));
        sbK3.append(", y=");
        sbK3.append(t2.c.P(Float.intBitsToFloat(i11)));
        sbK3.append(')');
        return sbK3.toString();
    }
}
