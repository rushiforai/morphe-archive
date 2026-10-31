package com.google.android.libraries.places.internal;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.android.gms.internal.measurement.k2;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
final class zzbjc implements zzbbx {
    @Override // com.google.android.libraries.places.internal.zzbbx
    public final /* bridge */ /* synthetic */ Object zza(String str) throws NumberFormatException {
        zzmt.zzf(str.length() > 0, "empty timeout");
        zzmt.zzf(str.length() <= 9, "bad timeout format");
        long j11 = Long.parseLong(str.substring(0, str.length() - 1));
        char cCharAt = str.charAt(str.length() - 1);
        if (cCharAt == 'H') {
            return Long.valueOf(TimeUnit.HOURS.toNanos(j11));
        }
        if (cCharAt == 'M') {
            return Long.valueOf(TimeUnit.MINUTES.toNanos(j11));
        }
        if (cCharAt == 'S') {
            return Long.valueOf(TimeUnit.SECONDS.toNanos(j11));
        }
        if (cCharAt == 'u') {
            return Long.valueOf(TimeUnit.MICROSECONDS.toNanos(j11));
        }
        if (cCharAt == 'm') {
            return Long.valueOf(TimeUnit.MILLISECONDS.toNanos(j11));
        }
        if (cCharAt == 'n') {
            return Long.valueOf(j11);
        }
        throw new IllegalArgumentException("Invalid timeout unit: " + cCharAt);
    }

    @Override // com.google.android.libraries.places.internal.zzbbx
    public final /* bridge */ /* synthetic */ String zzb(Object obj) {
        Long l9 = (Long) obj;
        TimeUnit timeUnit = TimeUnit.NANOSECONDS;
        if (l9.longValue() >= 0) {
            return l9.longValue() < 100000000 ? String.valueOf(l9).concat("n") : l9.longValue() < 100000000000L ? k2.i(timeUnit.toMicros(l9.longValue()), "u") : l9.longValue() < 100000000000000L ? k2.i(timeUnit.toMillis(l9.longValue()), InneractiveMediationDefs.GENDER_MALE) : l9.longValue() < 100000000000000000L ? k2.i(timeUnit.toSeconds(l9.longValue()), "S") : l9.longValue() < 6000000000000000000L ? k2.i(timeUnit.toMinutes(l9.longValue()), "M") : k2.i(timeUnit.toHours(l9.longValue()), "H");
        }
        throw new IllegalArgumentException("Timeout too small");
    }
}
