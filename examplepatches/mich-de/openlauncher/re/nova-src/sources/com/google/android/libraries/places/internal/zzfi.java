package com.google.android.libraries.places.internal;

import fi.a;
import java.util.Map;

/* loaded from: classes3.dex */
public abstract class zzfi {
    private final zzjt zza;

    public zzfi(zzjt zzjtVar) {
        this.zza = zzjtVar;
    }

    public final a zza() {
        return this.zza.getCancellationToken();
    }

    public final zzjt zzb() {
        return this.zza;
    }

    public abstract String zzc();

    public abstract Map zzd();
}
