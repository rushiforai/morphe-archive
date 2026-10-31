package com.google.android.libraries.places.internal;

import b.c0;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final class zzbki implements Runnable {
    private static final Logger zza = Logger.getLogger(zzbki.class.getName());
    private final Runnable zzb;

    public zzbki(Runnable runnable) {
        this.zzb = runnable;
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            this.zzb.run();
        } catch (Throwable th2) {
            zza.logp(Level.SEVERE, "io.grpc.internal.LogExceptionRunnable", "run", "Exception while executing runnable ".concat(this.zzb.toString()), th2);
            zznd.zza(th2);
            throw new AssertionError(th2);
        }
    }

    public final String toString() {
        return c0.l("LogExceptionRunnable(", this.zzb.toString(), ")");
    }
}
