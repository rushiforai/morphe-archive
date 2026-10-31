package com.google.android.libraries.places.internal;

import java.net.SocketAddress;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;

/* loaded from: classes3.dex */
final class zzbfd implements zzbfw {
    private final zzbfw zza;
    private final Executor zzb;

    public zzbfd(zzbfw zzbfwVar, zzayf zzayfVar, Executor executor) {
        this.zza = zzbfwVar;
        zzmt.zzc(executor, "appExecutor");
        this.zzb = executor;
    }

    @Override // com.google.android.libraries.places.internal.zzbfw, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.zza.close();
    }

    @Override // com.google.android.libraries.places.internal.zzbfw
    public final zzbgf zza(SocketAddress socketAddress, zzbfv zzbfvVar, zzaym zzaymVar) {
        return new zzbfc(this, this.zza.zza(socketAddress, zzbfvVar, zzaymVar), zzbfvVar.zzg());
    }

    @Override // com.google.android.libraries.places.internal.zzbfw
    public final ScheduledExecutorService zzb() {
        return this.zza.zzb();
    }
}
