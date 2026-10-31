package com.google.android.libraries.places.internal;

import java.util.concurrent.Executor;

/* loaded from: classes3.dex */
final class zzbky implements Executor {
    private Executor zza;
    private final zzbqn zzb;

    public zzbky(zzbqn zzbqnVar) {
        this.zzb = zzbqnVar;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        zza().execute(runnable);
    }

    /* JADX WARN: Type inference failed for: r0v4, types: [java.lang.Object, java.util.concurrent.Executor] */
    public final synchronized Executor zza() {
        try {
            if (this.zza == null) {
                ?? Zzb = this.zzb.zzb();
                zzmt.zzd(Zzb, "%s.getObject()", this.zza);
                this.zza = Zzb;
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return this.zza;
    }

    public final synchronized void zzb() {
        Executor executor = this.zza;
        if (executor != null) {
            this.zzb.zzc(executor);
            this.zza = null;
        }
    }
}
