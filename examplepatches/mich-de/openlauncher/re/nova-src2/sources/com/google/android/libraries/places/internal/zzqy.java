package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Set;
import java.util.logging.Level;

/* loaded from: classes3.dex */
public final class zzqy implements zzqr {
    private final String zza;
    private final zzpu zzb;
    private final Level zzc;
    private final Set zzd;
    private final zzqh zze;

    private zzqy(String str, boolean z11, zzpu zzpuVar, Level level, boolean z12, Set set, zzqh zzqhVar) {
        this.zza = b.f42142b;
        this.zzb = zzpuVar;
        this.zzc = level;
        this.zzd = set;
        this.zze = zzqhVar;
    }

    @Override // com.google.android.libraries.places.internal.zzqr
    public final zzpw zza(String str) {
        return new zzrb(this.zza, str, true, this.zzb, this.zzc, this.zzd, this.zze, null);
    }

    public final zzqy zzb(boolean z11) {
        Set set = this.zzd;
        zzqh zzqhVar = this.zze;
        return new zzqy(this.zza, true, this.zzb, Level.OFF, false, set, zzqhVar);
    }

    private zzqy() {
        this(b.f42142b, true, zzpv.NO_OP, Level.ALL, false, zzrb.zza, zzrb.zzb);
    }
}
