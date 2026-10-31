package j2;

import b.c9;

/* loaded from: classes.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final double f68720a;

    /* renamed from: b, reason: collision with root package name */
    public final double f68721b;

    /* renamed from: c, reason: collision with root package name */
    public final double f68722c;

    /* renamed from: d, reason: collision with root package name */
    public final double f68723d;

    /* renamed from: e, reason: collision with root package name */
    public final double f68724e;

    /* renamed from: f, reason: collision with root package name */
    public final double f68725f;

    /* renamed from: g, reason: collision with root package name */
    public final double f68726g;

    public /* synthetic */ r(double d5, double d11, double d12, double d13, double d14) {
        this(d5, d11, d12, d13, d14, 0.0d, 0.0d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        return Double.compare(this.f68720a, rVar.f68720a) == 0 && Double.compare(this.f68721b, rVar.f68721b) == 0 && Double.compare(this.f68722c, rVar.f68722c) == 0 && Double.compare(this.f68723d, rVar.f68723d) == 0 && Double.compare(this.f68724e, rVar.f68724e) == 0 && Double.compare(this.f68725f, rVar.f68725f) == 0 && Double.compare(this.f68726g, rVar.f68726g) == 0;
    }

    public final int hashCode() {
        return Double.hashCode(this.f68726g) + c9.c(this.f68725f, c9.c(this.f68724e, c9.c(this.f68723d, c9.c(this.f68722c, c9.c(this.f68721b, Double.hashCode(this.f68720a) * 31, 31), 31), 31), 31), 31);
    }

    public final String toString() {
        return "TransferParameters(gamma=" + this.f68720a + ", a=" + this.f68721b + ", b=" + this.f68722c + ", c=" + this.f68723d + ", d=" + this.f68724e + ", e=" + this.f68725f + ", f=" + this.f68726g + ')';
    }

    public r(double d5, double d11, double d12, double d13, double d14, double d15, double d16) {
        this.f68720a = d5;
        this.f68721b = d11;
        this.f68722c = d12;
        this.f68723d = d13;
        this.f68724e = d14;
        this.f68725f = d15;
        this.f68726g = d16;
        if (Double.isNaN(d11) || Double.isNaN(d12) || Double.isNaN(d13) || Double.isNaN(d14) || Double.isNaN(d15) || Double.isNaN(d16) || Double.isNaN(d5)) {
            throw new IllegalArgumentException("Parameters cannot be NaN");
        }
        if (d5 == -2.0d || d5 == -3.0d) {
            return;
        }
        if (d14 < 0.0d || d14 > 1.0d) {
            throw new IllegalArgumentException("Parameter d must be in the range [0..1], was " + d14);
        }
        if (d14 == 0.0d && (d11 == 0.0d || d5 == 0.0d)) {
            throw new IllegalArgumentException("Parameter a or g is zero, the transfer function is constant");
        }
        if (d14 >= 1.0d && d13 == 0.0d) {
            throw new IllegalArgumentException("Parameter c is zero, the transfer function is constant");
        }
        if ((d11 == 0.0d || d5 == 0.0d) && d13 == 0.0d) {
            throw new IllegalArgumentException("Parameter a or g is zero, and c is zero, the transfer function is constant");
        }
        if (d13 < 0.0d) {
            throw new IllegalArgumentException("The transfer function must be increasing");
        }
        if (d11 < 0.0d || d5 < 0.0d) {
            throw new IllegalArgumentException("The transfer function must be positive or increasing");
        }
    }
}
