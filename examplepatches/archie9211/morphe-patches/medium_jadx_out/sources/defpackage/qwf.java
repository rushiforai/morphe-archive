package defpackage;

import com.squareup.wire.internal.MathMethodsKt;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qwf {
    public final swf a;
    public boolean b;
    public long c;
    public long d;

    public qwf(swf swfVar) {
        if (swfVar != null) {
            this.a = swfVar;
        } else {
            z72.c("ticker");
            throw null;
        }
    }

    public final void a() {
        if (this.b) {
            ygf.f("This stopwatch is already running.");
        } else {
            this.b = true;
            this.d = this.a.a();
        }
    }

    public final String toString() {
        String str;
        long jA = this.b ? (this.a.a() - this.d) + this.c : this.c;
        TimeUnit timeUnit = jA / 86400000000000L > 0 ? TimeUnit.DAYS : jA / 3600000000000L > 0 ? TimeUnit.HOURS : jA / 60000000000L > 0 ? TimeUnit.MINUTES : jA / MathMethodsKt.NANOS_PER_SECOND > 0 ? TimeUnit.SECONDS : jA / 1000000 > 0 ? TimeUnit.MILLISECONDS : jA / 1000 > 0 ? TimeUnit.MICROSECONDS : TimeUnit.NANOSECONDS;
        String str2 = String.format(Locale.ROOT, "%.4g", Double.valueOf(jA / r2.convert(1L, timeUnit)));
        switch (mwf.a[timeUnit.ordinal()]) {
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
        return ev6.x(str2, " ", str);
    }
}
