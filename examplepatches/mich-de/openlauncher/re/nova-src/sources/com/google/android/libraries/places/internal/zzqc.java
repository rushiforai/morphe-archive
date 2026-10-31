package com.google.android.libraries.places.internal;

import com.amplitude.android.migration.DatabaseConstants;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes3.dex */
public final class zzqc {
    private static final zzqg zza = new zzpz();
    private static final zzqf zzb = new zzqa();
    private final zzqg zze;
    private final Map zzc = new HashMap();
    private final Map zzd = new HashMap();
    private zzqf zzf = null;

    public final zzqc zza(zzqf zzqfVar) {
        this.zzf = zzqfVar;
        return this;
    }

    public final zzqh zzd() {
        return new zzqe(this, null);
    }

    public final void zzg(zzpr zzprVar) {
        zzrr.zza(zzprVar, DatabaseConstants.KEY_FIELD);
        if (!zzprVar.zzb()) {
            zzqg zzqgVar = zza;
            zzrr.zza(zzprVar, DatabaseConstants.KEY_FIELD);
            this.zzd.remove(zzprVar);
            this.zzc.put(zzprVar, zzqgVar);
            return;
        }
        zzqf zzqfVar = zzb;
        zzrr.zza(zzprVar, DatabaseConstants.KEY_FIELD);
        if (!zzprVar.zzb()) {
            throw new IllegalArgumentException("key must be repeating");
        }
        this.zzc.remove(zzprVar);
        this.zzd.put(zzprVar, zzqfVar);
    }
}
