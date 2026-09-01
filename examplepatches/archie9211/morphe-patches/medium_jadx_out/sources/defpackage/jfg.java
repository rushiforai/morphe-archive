package defpackage;

import com.squareup.wire.internal.MathMethodsKt;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jfg {
    public boolean a;
    public long b;
    public long c;

    public final String toString() {
        String str;
        long jNanoTime = this.a ? (System.nanoTime() - this.c) + this.b : this.b;
        TimeUnit timeUnit = jNanoTime / 86400000000000L > 0 ? TimeUnit.DAYS : jNanoTime / 3600000000000L > 0 ? TimeUnit.HOURS : jNanoTime / 60000000000L > 0 ? TimeUnit.MINUTES : jNanoTime / MathMethodsKt.NANOS_PER_SECOND > 0 ? TimeUnit.SECONDS : jNanoTime / 1000000 > 0 ? TimeUnit.MILLISECONDS : jNanoTime / 1000 > 0 ? TimeUnit.MICROSECONDS : TimeUnit.NANOSECONDS;
        String str2 = String.format(Locale.ROOT, "%.4g", Double.valueOf(jNanoTime / r2.convert(1L, timeUnit)));
        switch (efg.a[timeUnit.ordinal()]) {
            case 1:
                str = "ns";
                break;
            case 2:
                str = "μs";
                break;
            case 3:
                str = "ms";
                break;
            case 4:
                str = "s";
                break;
            case 5:
                str = "min";
                break;
            case 6:
                str = "h";
                break;
            case 7:
                str = "d";
                break;
            default:
                ywb.d();
                return null;
        }
        return y30.s(new StringBuilder(str.length() + str2.length() + 1), str2, " ", str);
    }
}
