package com.google.android.libraries.places.internal;

import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes3.dex */
final class zzbep implements zzbkj {
    private final AtomicLong zza = new AtomicLong();

    @Override // com.google.android.libraries.places.internal.zzbkj
    public final void zza(long j11) {
        this.zza.getAndAdd(1L);
    }
}
