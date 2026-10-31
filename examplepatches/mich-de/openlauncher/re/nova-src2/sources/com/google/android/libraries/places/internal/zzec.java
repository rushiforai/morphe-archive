package com.google.android.libraries.places.internal;

import fi.b;
import fi.j;
import java.util.concurrent.ExecutionException;

/* loaded from: classes3.dex */
final class zzec implements zzajv {
    final /* synthetic */ j zza;
    final /* synthetic */ zzaka zzb;
    final /* synthetic */ b zzc;

    public zzec(j jVar, zzaka zzakaVar, b bVar) {
        this.zza = jVar;
        this.zzb = zzakaVar;
        this.zzc = bVar;
    }

    @Override // com.google.android.libraries.places.internal.zzajv
    public final void zza(Throwable th2) {
        if (this.zzb.isCancelled()) {
            this.zzc.a();
            return;
        }
        if (th2 instanceof Exception) {
            this.zza.f55135a.v((Exception) th2);
        } else {
            j jVar = this.zza;
            jVar.f55135a.v(new ExecutionException(th2));
        }
    }

    @Override // com.google.android.libraries.places.internal.zzajv
    public final void zzb(Object obj) {
        this.zza.a(obj);
    }
}
