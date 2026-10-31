package com.google.android.gms.internal.play_billing;

import java.util.Locale;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class e0 {

    /* renamed from: a, reason: collision with root package name */
    public final f0 f33374a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f33375b;

    /* renamed from: c, reason: collision with root package name */
    public long f33376c;

    /* renamed from: d, reason: collision with root package name */
    public long f33377d;

    public e0(f0 f0Var) {
        if (f0Var == null) {
            throw new NullPointerException("ticker");
        }
        this.f33374a = f0Var;
    }

    public final void a() {
        if (this.f33375b) {
            throw new IllegalStateException("This stopwatch is already running.");
        }
        this.f33375b = true;
        this.f33377d = this.f33374a.a();
    }

    public final String toString() {
        String str;
        long jA = this.f33375b ? (this.f33374a.a() - this.f33377d) + this.f33376c : this.f33376c;
        TimeUnit timeUnit = TimeUnit.DAYS;
        TimeUnit timeUnit2 = TimeUnit.NANOSECONDS;
        if (timeUnit.convert(jA, timeUnit2) <= 0) {
            timeUnit = TimeUnit.HOURS;
            if (timeUnit.convert(jA, timeUnit2) <= 0) {
                timeUnit = TimeUnit.MINUTES;
                if (timeUnit.convert(jA, timeUnit2) <= 0) {
                    timeUnit = TimeUnit.SECONDS;
                    if (timeUnit.convert(jA, timeUnit2) <= 0) {
                        timeUnit = TimeUnit.MILLISECONDS;
                        if (timeUnit.convert(jA, timeUnit2) <= 0) {
                            timeUnit = TimeUnit.MICROSECONDS;
                            if (timeUnit.convert(jA, timeUnit2) <= 0) {
                                timeUnit = timeUnit2;
                            }
                        }
                    }
                }
            }
        }
        String str2 = String.format(Locale.ROOT, "%.4g", Double.valueOf(jA / timeUnit2.convert(1L, timeUnit)));
        switch (d0.f33369a[timeUnit.ordinal()]) {
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
                throw new AssertionError();
        }
        return b.u4.m(str2, " ", str);
    }
}
