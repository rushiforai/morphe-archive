package com.google.android.libraries.places.internal;

import java.util.concurrent.atomic.AtomicLong;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final class zzbeo {
    private static final Logger zza = Logger.getLogger(zzbeo.class.getName());
    private final String zzb;
    private final AtomicLong zzc;

    public zzbeo(String str, long j11) {
        AtomicLong atomicLong = new AtomicLong();
        this.zzc = atomicLong;
        this.zzb = "keepalive time nanos";
        atomicLong.set(Long.MAX_VALUE);
    }

    public final zzben zza() {
        return new zzben(this, this.zzc.get(), null);
    }
}
