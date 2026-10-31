package com.google.android.libraries.places.internal;

import java.util.Locale;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes3.dex */
public final class zzakd {
    private String zza = null;
    private Boolean zzb = null;

    public final zzakd zza(boolean z11) {
        this.zzb = Boolean.TRUE;
        return this;
    }

    public final zzakd zzb(String str) {
        Locale locale = Locale.ROOT;
        this.zza = str;
        return this;
    }

    public final ThreadFactory zzc() {
        String str = this.zza;
        return new zzakc(Executors.defaultThreadFactory(), str, str != null ? new AtomicLong(0L) : null, this.zzb, null, null);
    }
}
