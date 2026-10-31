package com.google.android.libraries.places.internal;

import java.util.Random;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class zzbik {
    private final Random zza = new Random();
    private final long zzb;
    private final long zzc;
    private long zzd;

    public zzbik() {
        long nanos = TimeUnit.SECONDS.toNanos(1L);
        this.zzb = nanos;
        this.zzc = TimeUnit.MINUTES.toNanos(2L);
        this.zzd = nanos;
    }

    public final long zza() {
        long j11 = this.zzd;
        double d5 = j11;
        this.zzd = Math.min((long) (1.6d * d5), this.zzc);
        double d11 = 0.2d * d5;
        double d12 = d5 * (-0.2d);
        zzmt.zze(d11 >= d12);
        return j11 + ((long) ((this.zza.nextDouble() * (d11 - d12)) + d12));
    }
}
