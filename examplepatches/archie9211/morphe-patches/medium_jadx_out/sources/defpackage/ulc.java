package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ulc {
    public double a;
    public double b;
    public boolean c;
    public double d;
    public double e;
    public double f;
    public double g;
    public double h;
    public double i;
    public final l80 j;

    public ulc() {
        this.a = Math.sqrt(1500.0d);
        this.b = 0.5d;
        this.c = false;
        this.i = Double.MAX_VALUE;
        this.j = new l80();
    }

    public final l80 a(double d, double d2, long j) {
        double dSin;
        double dCos;
        if (!this.c) {
            if (this.i == Double.MAX_VALUE) {
                ygf.f("Error: Final position of the spring must be set before the animation starts");
                return null;
            }
            double d3 = this.b;
            if (d3 > 1.0d) {
                double d4 = this.a;
                this.f = (Math.sqrt((d3 * d3) - 1.0d) * d4) + ((-d3) * d4);
                double d5 = this.b;
                double d6 = this.a;
                this.g = ((-d5) * d6) - (Math.sqrt((d5 * d5) - 1.0d) * d6);
            } else if (d3 >= 0.0d && d3 < 1.0d) {
                this.h = Math.sqrt(1.0d - (d3 * d3)) * this.a;
            }
            this.c = true;
        }
        double d7 = j / 1000.0d;
        double d8 = d - this.i;
        double d9 = this.b;
        if (d9 > 1.0d) {
            double d10 = this.g;
            double d11 = ((d10 * d8) - d2) / (d10 - this.f);
            double d12 = d8 - d11;
            dSin = (Math.pow(2.718281828459045d, this.f * d7) * d11) + (Math.pow(2.718281828459045d, d10 * d7) * d12);
            double d13 = this.g;
            double dPow = Math.pow(2.718281828459045d, d13 * d7) * d12 * d13;
            double d14 = this.f;
            dCos = (Math.pow(2.718281828459045d, d14 * d7) * d11 * d14) + dPow;
        } else if (d9 == 1.0d) {
            double d15 = this.a;
            double d16 = (d15 * d8) + d2;
            double d17 = (d16 * d7) + d8;
            double dPow2 = Math.pow(2.718281828459045d, (-d15) * d7) * d17;
            double dPow3 = Math.pow(2.718281828459045d, (-this.a) * d7) * d17;
            double d18 = -this.a;
            dCos = (Math.pow(2.718281828459045d, d18 * d7) * d16) + (dPow3 * d18);
            dSin = dPow2;
        } else {
            double d19 = 1.0d / this.h;
            double d20 = this.a;
            double d21 = ((d9 * d20 * d8) + d2) * d19;
            dSin = ((Math.sin(this.h * d7) * d21) + (Math.cos(this.h * d7) * d8)) * Math.pow(2.718281828459045d, (-d9) * d20 * d7);
            double d22 = this.a;
            double d23 = this.b;
            double d24 = (-d22) * dSin * d23;
            double dPow4 = Math.pow(2.718281828459045d, (-d23) * d22 * d7);
            double d25 = this.h;
            double dSin2 = Math.sin(d25 * d7) * (-d25) * d8;
            double d26 = this.h;
            dCos = (((Math.cos(d26 * d7) * d21 * d26) + dSin2) * dPow4) + d24;
        }
        float f = (float) (dSin + this.i);
        l80 l80Var = this.j;
        l80Var.a = f;
        l80Var.b = (float) dCos;
        return l80Var;
    }

    public ulc(float f) {
        this.a = Math.sqrt(1500.0d);
        this.b = 0.5d;
        this.c = false;
        this.j = new l80();
        this.i = f;
    }
}
