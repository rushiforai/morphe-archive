package com.google.android.libraries.places.internal;

import java.util.concurrent.Future;

/* loaded from: classes3.dex */
final class zzboy {
    final Object zza;
    Future zzb;
    boolean zzc;

    public zzboy(Object obj) {
        this.zza = obj;
    }

    public final Future zza() {
        this.zzc = true;
        return this.zzb;
    }

    public final void zzb(Future future) {
        boolean z11;
        synchronized (this.zza) {
            try {
                z11 = this.zzc;
                if (!z11) {
                    this.zzb = future;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (z11) {
            future.cancel(false);
        }
    }
}
