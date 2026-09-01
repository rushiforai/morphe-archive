package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dud {
    public static dud e;
    public final /* synthetic */ int a = 0;
    public int b;
    public long c;
    public long d;

    public dud(int i) {
        this.b = i;
    }

    public static void c(dud dudVar, long j, long j2, int i) {
        if ((i & 1) != 0) {
            j = 0;
        }
        if ((i & 2) != 0) {
            j2 = 0;
        }
        synchronized (dudVar) {
            try {
                if (j < 0) {
                    throw new IllegalStateException("Check failed.");
                }
                if (j2 < 0) {
                    throw new IllegalStateException("Check failed.");
                }
                long j3 = dudVar.c + j;
                dudVar.c = j3;
                long j4 = dudVar.d + j2;
                dudVar.d = j4;
                if (j4 > j3) {
                    throw new IllegalStateException("Check failed.");
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public void a(double d, double d2, long j) {
        double d3 = (0.01720197f * ((j - 946728000000L) / 8.64E7f)) + 6.24006f;
        double dSin = (Math.sin(r3 * 3.0f) * 5.236000106378924E-6d) + (Math.sin(2.0f * r3) * 3.4906598739326E-4d) + (Math.sin(d3) * 0.03341960161924362d) + d3 + 1.796593063d + 3.141592653589793d;
        double dSin2 = (Math.sin(2.0d * dSin) * (-0.0069d)) + (Math.sin(d3) * 0.0053d) + ((double) (Math.round(((double) (r2 - 9.0E-4f)) - r6) + 9.0E-4f)) + ((-d2) / 360.0d);
        double dAsin = Math.asin(Math.sin(0.4092797040939331d) * Math.sin(dSin));
        double d4 = 0.01745329238474369d * d;
        double dSin3 = (Math.sin(-0.10471975803375244d) - (Math.sin(dAsin) * Math.sin(d4))) / (Math.cos(dAsin) * Math.cos(d4));
        if (dSin3 >= 1.0d) {
            this.b = 1;
            this.c = -1L;
            this.d = -1L;
        } else {
            if (dSin3 <= -1.0d) {
                this.b = 0;
                this.c = -1L;
                this.d = -1L;
                return;
            }
            double dAcos = (float) (Math.acos(dSin3) / 6.283185307179586d);
            this.c = Math.round((dSin2 + dAcos) * 8.64E7d) + 946728000000L;
            long jRound = Math.round((dSin2 - dAcos) * 8.64E7d) + 946728000000L;
            this.d = jRound;
            if (jRound >= j || this.c <= j) {
                this.b = 1;
            } else {
                this.b = 0;
            }
        }
    }

    public synchronized long b() {
        return this.c - this.d;
    }

    public String toString() {
        switch (this.a) {
            case 1:
                return "WindowCounter(streamId=" + this.b + ", total=" + this.c + ", acknowledged=" + this.d + ", unacknowledged=" + b() + ')';
            default:
                return super.toString();
        }
    }

    public /* synthetic */ dud() {
    }
}
