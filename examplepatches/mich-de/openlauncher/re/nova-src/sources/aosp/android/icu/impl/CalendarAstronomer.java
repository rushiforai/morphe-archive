package aosp.android.icu.impl;

import cm.f;
import e8.a;

/* loaded from: classes.dex */
public class CalendarAstronomer {

    /* renamed from: a, reason: collision with root package name */
    public long f15362a;

    /* renamed from: b, reason: collision with root package name */
    public double f15363b;

    /* renamed from: c, reason: collision with root package name */
    public long f15364c;

    /* renamed from: d, reason: collision with root package name */
    public transient double f15365d;

    /* renamed from: e, reason: collision with root package name */
    public transient double f15366e;

    /* renamed from: f, reason: collision with root package name */
    public transient double f15367f;

    /* renamed from: g, reason: collision with root package name */
    public transient double f15368g;

    /* renamed from: h, reason: collision with root package name */
    public transient double f15369h;

    /* renamed from: i, reason: collision with root package name */
    public transient double f15370i;

    /* renamed from: j, reason: collision with root package name */
    public transient double f15371j;

    /* renamed from: k, reason: collision with root package name */
    public transient a f15372k;

    public CalendarAstronomer() {
        this(System.currentTimeMillis());
    }

    public static final double f(double d5, double d11) {
        return d5 - (Math.floor(d5 / d11) * d11);
    }

    public final a a(double d5, double d11) {
        if (this.f15370i == Double.MIN_VALUE) {
            double dB = (b() - 2451545.0d) / 36525.0d;
            this.f15370i = ((5.027777777777778E-7d * dB * dB * dB) + ((23.439292d - (0.013004166666666666d * dB)) - ((1.6666666666666665E-7d * dB) * dB))) * 0.017453292519943295d;
        }
        double d12 = this.f15370i;
        double dSin = Math.sin(d12);
        double dCos = Math.cos(d12);
        double dSin2 = Math.sin(d5);
        double dCos2 = Math.cos(d5);
        double dSin3 = Math.sin(d11);
        return new a(Math.atan2((dSin2 * dCos) - (Math.tan(d11) * dSin), dCos2), Math.asin((Math.cos(d11) * dSin * dSin2) + (dSin3 * dCos)));
    }

    public final double b() {
        if (this.f15365d == Double.MIN_VALUE) {
            this.f15365d = (this.f15362a - (-210866760000000L)) / 8.64E7d;
        }
        return this.f15365d;
    }

    public final double c() {
        if (this.f15372k == null) {
            double d5 = d();
            double dB = b() - 2447891.5d;
            double dF = f((0.22997150421858628d * dB) + 5.556284436750021d, 6.283185307179586d);
            double dF2 = f((dF - (0.001944368345221015d * dB)) - 0.6342598060246725d, 6.283185307179586d);
            double dSin = Math.sin(((dF - d5) * 2.0d) - dF2) * 0.022233749341155764d;
            double dSin2 = Math.sin(this.f15367f) * 0.003242821750205464d;
            double dSin3 = ((dSin - dSin2) - (Math.sin(this.f15367f) * 0.00645771823237902d)) + dF2;
            double dSin4 = (((dF + dSin) + (Math.sin(dSin3) * 0.10975677534091541d)) - dSin2) + (Math.sin(dSin3 * 2.0d) * 0.0037350045992678655d);
            this.f15368g = dSin4;
            this.f15368g += Math.sin((dSin4 - d5) * 2.0d) * 0.011489502465878671d;
            double dF3 = f(5.559050068029439d - (dB * 9.242199067718253E-4d), 6.283185307179586d) - (Math.sin(this.f15367f) * 0.0027925268031909274d);
            double dSin5 = Math.sin(this.f15368g - dF3);
            this.f15369h = Math.atan2(Math.cos(0.08980357792017056d) * dSin5, Math.cos(this.f15368g - dF3)) + dF3;
            this.f15372k = a(this.f15369h, Math.asin(Math.sin(0.08980357792017056d) * dSin5));
        }
        return f(this.f15369h - this.f15366e, 6.283185307179586d);
    }

    public final double d() {
        double dSin;
        if (this.f15366e == Double.MIN_VALUE) {
            double dF = f((f((b() - 2447891.5d) * 0.017202791632524146d, 6.283185307179586d) + 4.87650757829735d) - 4.935239984568769d, 6.283185307179586d);
            double dCos = dF;
            do {
                dSin = (dCos - (Math.sin(dCos) * 0.016713d)) - dF;
                dCos -= dSin / (1.0d - (Math.cos(dCos) * 0.016713d));
            } while (Math.abs(dSin) > 1.0E-5d);
            double[] dArr = {f((Math.atan(Math.sqrt(1.033994144130859d) * Math.tan(dCos / 2.0d)) * 2.0d) + 4.935239984568769d, 6.283185307179586d), dF};
            this.f15366e = dArr[0];
            this.f15367f = dArr[1];
        }
        return this.f15366e;
    }

    public final long e(boolean z11) {
        double d5;
        double d11;
        double d12;
        long j11 = this.f15362a;
        long j12 = this.f15364c;
        long j13 = 86400000;
        g(((z11 ? -6L : 6L) * 3600000) + ((((j11 + j12) / 86400000) * 86400000) - j12) + 43200000);
        double d13 = this.f15363b;
        double dTan = Math.tan(d13);
        int i5 = 0;
        while (true) {
            a aVarA = a(d(), 0.0d);
            d5 = aVarA.f52244b;
            long j14 = j13;
            double dAcos = Math.acos(Math.tan(d5) * (-dTan));
            if (z11) {
                dAcos = 6.283185307179586d - dAcos;
            }
            long j15 = j12;
            double d14 = ((dAcos + aVarA.f52243a) * 24.0d) / 6.283185307179586d;
            if (this.f15371j == Double.MIN_VALUE) {
                double dFloor = ((Math.floor(b() - 0.5d) + 0.5d) - 2451545.0d) / 36525.0d;
                d11 = d13;
                d12 = 24.0d;
                this.f15371j = f((2.5862E-5d * dFloor * dFloor) + (2400.051336d * dFloor) + 6.697374558d, 24.0d);
            } else {
                d11 = d13;
                d12 = 24.0d;
            }
            double dF = f((d14 - this.f15371j) * 0.9972695663d, d12);
            long j16 = this.f15362a;
            long j17 = ((((j16 + j15) / j14) * j14) - j15) + ((long) (dF * 3600000.0d));
            long j18 = j17 - j16;
            g(j17);
            i5++;
            if (i5 >= 5 || Math.abs(j18) <= 5000) {
                break;
            }
            j13 = j14;
            j12 = j15;
            d13 = d11;
        }
        double dCos = Math.cos(d5);
        long jAsin = (long) ((((Math.asin(Math.sin(0.014541501551199421d) / Math.sin(Math.acos(Math.sin(d11) / dCos))) * 240.0d) * 57.29577951308232d) / dCos) * 1000.0d);
        long j19 = this.f15362a;
        if (z11) {
            jAsin = -jAsin;
        }
        long j21 = j19 + jAsin;
        g(j11);
        return j21;
    }

    public final void g(long j11) {
        this.f15362a = j11;
        this.f15365d = Double.MIN_VALUE;
        this.f15366e = Double.MIN_VALUE;
        this.f15367f = Double.MIN_VALUE;
        this.f15368g = Double.MIN_VALUE;
        this.f15369h = Double.MIN_VALUE;
        this.f15370i = Double.MIN_VALUE;
        this.f15371j = Double.MIN_VALUE;
        this.f15372k = null;
    }

    public final long h(f fVar, double d5) {
        double dX = fVar.x();
        double dF = ((f(d5 - dX, 6.283185307179586d) + 0.0d) * 2.5514428768992E9d) / 6.283185307179586d;
        long j11 = this.f15362a;
        g(((long) dF) + j11);
        while (true) {
            double dX2 = fVar.x();
            double dAbs = Math.abs(dF / (f((dX2 - dX) + 3.141592653589793d, 6.283185307179586d) - 3.141592653589793d)) * (f((d5 - dX2) + 3.141592653589793d, 6.283185307179586d) - 3.141592653589793d);
            if (Math.abs(dAbs) > Math.abs(dF)) {
                g(j11 + ((long) 3.189303596124E8d));
                return h(fVar, d5);
            }
            g(this.f15362a + ((long) dAbs));
            if (Math.abs(dAbs) <= 60000) {
                return this.f15362a;
            }
            dF = dAbs;
            dX = dX2;
        }
    }

    public CalendarAstronomer(long j11) {
        this.f15363b = 0.0d;
        this.f15364c = 0L;
        this.f15365d = Double.MIN_VALUE;
        this.f15366e = Double.MIN_VALUE;
        this.f15367f = Double.MIN_VALUE;
        this.f15368g = Double.MIN_VALUE;
        this.f15369h = Double.MIN_VALUE;
        this.f15370i = Double.MIN_VALUE;
        this.f15371j = Double.MIN_VALUE;
        this.f15372k = null;
        this.f15362a = j11;
    }
}
