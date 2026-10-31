package z5;

/* loaded from: classes2.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public double f98239a;

    /* renamed from: b, reason: collision with root package name */
    public double f98240b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f98241c;

    /* renamed from: d, reason: collision with root package name */
    public double f98242d;

    /* renamed from: e, reason: collision with root package name */
    public double f98243e;

    /* renamed from: f, reason: collision with root package name */
    public double f98244f;

    /* renamed from: g, reason: collision with root package name */
    public double f98245g;

    /* renamed from: h, reason: collision with root package name */
    public double f98246h;

    /* renamed from: i, reason: collision with root package name */
    public double f98247i;

    /* renamed from: j, reason: collision with root package name */
    public final jj.d f98248j;

    public d() {
        this.f98239a = Math.sqrt(1500.0d);
        this.f98240b = 0.5d;
        this.f98241c = false;
        this.f98247i = Double.MAX_VALUE;
        this.f98248j = new jj.d();
    }

    public final void a(float f11) {
        if (f11 < 0.0f) {
            throw new IllegalArgumentException("Damping ratio must be non-negative");
        }
        this.f98240b = f11;
        this.f98241c = false;
    }

    public final void b(float f11) {
        if (f11 <= 0.0f) {
            throw new IllegalArgumentException("Spring stiffness constant must be positive.");
        }
        this.f98239a = Math.sqrt(f11);
        this.f98241c = false;
    }

    public final jj.d c(double d5, double d11, long j11) {
        double dSin;
        double dCos;
        if (!this.f98241c) {
            if (this.f98247i == Double.MAX_VALUE) {
                throw new IllegalStateException("Error: Final position of the spring must be set before the animation starts");
            }
            double d12 = this.f98240b;
            if (d12 > 1.0d) {
                double d13 = this.f98239a;
                this.f98244f = (Math.sqrt((d12 * d12) - 1.0d) * d13) + ((-d12) * d13);
                double d14 = this.f98240b;
                double d15 = this.f98239a;
                this.f98245g = ((-d14) * d15) - (Math.sqrt((d14 * d14) - 1.0d) * d15);
            } else if (d12 >= 0.0d && d12 < 1.0d) {
                this.f98246h = Math.sqrt(1.0d - (d12 * d12)) * this.f98239a;
            }
            this.f98241c = true;
        }
        double d16 = j11 / 1000.0d;
        double d17 = d5 - this.f98247i;
        double d18 = this.f98240b;
        if (d18 > 1.0d) {
            double d19 = this.f98245g;
            double d21 = ((d19 * d17) - d11) / (d19 - this.f98244f);
            double d22 = d17 - d21;
            dSin = (Math.pow(2.718281828459045d, this.f98244f * d16) * d21) + (Math.pow(2.718281828459045d, d19 * d16) * d22);
            double d23 = this.f98245g;
            double dPow = Math.pow(2.718281828459045d, d23 * d16) * d22 * d23;
            double d24 = this.f98244f;
            dCos = (Math.pow(2.718281828459045d, d24 * d16) * d21 * d24) + dPow;
        } else if (d18 == 1.0d) {
            double d25 = this.f98239a;
            double d26 = (d25 * d17) + d11;
            double d27 = (d26 * d16) + d17;
            double dPow2 = Math.pow(2.718281828459045d, (-d25) * d16) * d27;
            double dPow3 = Math.pow(2.718281828459045d, (-this.f98239a) * d16) * d27;
            double d28 = -this.f98239a;
            dCos = (Math.pow(2.718281828459045d, d28 * d16) * d26) + (dPow3 * d28);
            dSin = dPow2;
        } else {
            double d29 = 1.0d / this.f98246h;
            double d30 = this.f98239a;
            double d31 = ((d18 * d30 * d17) + d11) * d29;
            dSin = ((Math.sin(this.f98246h * d16) * d31) + (Math.cos(this.f98246h * d16) * d17)) * Math.pow(2.718281828459045d, (-d18) * d30 * d16);
            double d32 = this.f98239a;
            double d33 = this.f98240b;
            double d34 = (-d32) * dSin * d33;
            double dPow4 = Math.pow(2.718281828459045d, (-d33) * d32 * d16);
            double d35 = this.f98246h;
            double dSin2 = Math.sin(d35 * d16) * (-d35) * d17;
            double d36 = this.f98246h;
            dCos = (((Math.cos(d36 * d16) * d31 * d36) + dSin2) * dPow4) + d34;
        }
        float f11 = (float) (dSin + this.f98247i);
        jj.d dVar = this.f98248j;
        dVar.f69567a = f11;
        dVar.f69568b = (float) dCos;
        return dVar;
    }

    public d(float f11) {
        this.f98239a = Math.sqrt(1500.0d);
        this.f98240b = 0.5d;
        this.f98241c = false;
        this.f98248j = new jj.d();
        this.f98247i = f11;
    }
}
