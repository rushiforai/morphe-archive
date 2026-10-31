package com.google.android.libraries.places.internal;

import java.util.Map;

/* loaded from: classes3.dex */
public final class zzbnq extends zzbbo {
    static final boolean zza = zzbjd.zzj("GRPC_EXPERIMENTAL_ENABLE_NEW_PICK_FIRST", true);

    @Override // com.google.android.libraries.places.internal.zzbbb
    public final zzbbm zza(zzbbd zzbbdVar) {
        return zza ? new zzbnj(zzbbdVar) : new zzbnp(zzbbdVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbbo
    public final int zzb() {
        return 5;
    }

    @Override // com.google.android.libraries.places.internal.zzbbo
    public final zzbcp zzc(Map map) {
        try {
            Boolean boolZza = zzbkg.zza(map, "shuffleAddressList");
            return zzbcp.zza(zza ? new zzbne(boolZza, null) : new zzbnl(boolZza, null));
        } catch (RuntimeException e3) {
            return zzbcp.zzb(zzbdo.zzp.zzf(e3).zzg("Failed parsing configuration for pick_first"));
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbbo
    public final String zzd() {
        return "pick_first";
    }

    @Override // com.google.android.libraries.places.internal.zzbbo
    public final boolean zze() {
        return true;
    }
}
