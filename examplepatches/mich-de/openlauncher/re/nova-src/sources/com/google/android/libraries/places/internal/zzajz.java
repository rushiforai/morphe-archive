package com.google.android.libraries.places.internal;

import java.util.logging.Logger;

/* loaded from: classes3.dex */
final class zzajz {
    private final String zza;
    private volatile Logger zzb;

    public zzajz(Class cls) {
        this.zza = cls.getName();
    }

    public final Logger zza() {
        Logger logger = this.zzb;
        if (logger != null) {
            return logger;
        }
        synchronized (this) {
            try {
                Logger logger2 = this.zzb;
                if (logger2 != null) {
                    return logger2;
                }
                Logger logger3 = Logger.getLogger(this.zza);
                this.zzb = logger3;
                return logger3;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
