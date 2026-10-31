package com.google.android.libraries.places.internal;

import b.c0;
import java.lang.Thread;
import java.util.logging.Level;

/* loaded from: classes3.dex */
final class zzbko implements Thread.UncaughtExceptionHandler {
    final /* synthetic */ zzbma zza;

    public zzbko(zzbma zzbmaVar) {
        this.zza = zzbmaVar;
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public final void uncaughtException(Thread thread, Throwable th2) {
        zzbma.zza.logp(Level.SEVERE, "io.grpc.internal.ManagedChannelImpl$2", "uncaughtException", c0.l("[", String.valueOf(this.zza.zzc()), "] Uncaught exception in the SynchronizationContext. Panic!"), th2);
        this.zza.zzW(th2);
    }
}
