package com.google.android.gms.internal.gtm;

import java.lang.Thread;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
final class zzbt implements Thread.UncaughtExceptionHandler {
    final /* synthetic */ zzbu zza;

    public zzbt(zzbu zzbuVar) {
        this.zza = zzbuVar;
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public final void uncaughtException(Thread thread, Throwable th) {
        zzeo zzeoVarZzn = this.zza.zzn();
        if (zzeoVarZzn != null) {
            zzeoVarZzn.zzJ("Job execution failed", th);
        }
    }
}
