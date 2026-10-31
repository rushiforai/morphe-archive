package com.google.android.libraries.places.internal;

import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes3.dex */
final class zzbno extends zzbbk {
    final /* synthetic */ zzbnp zza;
    private final zzbbj zzb;
    private final AtomicBoolean zzc = new AtomicBoolean(false);

    public zzbno(zzbnp zzbnpVar, zzbbj zzbbjVar) {
        this.zza = zzbnpVar;
        this.zzb = zzbbjVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbbk
    public final zzbbe zza(zzbbf zzbbfVar) {
        if (this.zzc.compareAndSet(false, true)) {
            zzbdw zzbdwVarZzb = this.zza.zzf.zzb();
            zzbdwVarZzb.zzc(new zzbnn(this));
            zzbdwVarZzb.zzb();
        }
        return zzbbe.zzc();
    }
}
