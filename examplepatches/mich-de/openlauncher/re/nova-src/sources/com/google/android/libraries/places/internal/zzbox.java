package com.google.android.libraries.places.internal;

import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes3.dex */
final class zzbox {
    private final AtomicLong zza = new AtomicLong();

    public final long zza(long j11) {
        return this.zza.addAndGet(j11);
    }
}
