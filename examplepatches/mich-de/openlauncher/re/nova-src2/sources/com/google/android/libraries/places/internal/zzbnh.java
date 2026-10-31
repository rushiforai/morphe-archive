package com.google.android.libraries.places.internal;

import java.util.Objects;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes3.dex */
final class zzbnh extends zzbbk {
    final /* synthetic */ zzbnj zza;
    private final zzbnj zzb;
    private final AtomicBoolean zzc = new AtomicBoolean(false);

    public zzbnh(zzbnj zzbnjVar, zzbnj zzbnjVar2) {
        this.zza = zzbnjVar;
        this.zzb = zzbnjVar2;
    }

    @Override // com.google.android.libraries.places.internal.zzbbk
    public final zzbbe zza(zzbbf zzbbfVar) {
        if (this.zzc.compareAndSet(false, true)) {
            zzbdw zzbdwVarZzb = this.zza.zzg.zzb();
            final zzbnj zzbnjVar = this.zzb;
            Objects.requireNonNull(zzbnjVar);
            zzbdwVarZzb.zzc(new Runnable() { // from class: com.google.android.libraries.places.internal.zzbng
                @Override // java.lang.Runnable
                public final void run() {
                    zzbnjVar.zzd();
                }
            });
            zzbdwVarZzb.zzb();
        }
        return zzbbe.zzc();
    }
}
