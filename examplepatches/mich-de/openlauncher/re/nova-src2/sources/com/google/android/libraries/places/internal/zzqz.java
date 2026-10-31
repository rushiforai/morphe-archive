package com.google.android.libraries.places.internal;

import java.util.Set;
import java.util.logging.Level;

/* loaded from: classes3.dex */
final class zzqz extends zzqp {
    private final zzpu zza;
    private final Level zzb;
    private final Set zzc;
    private final zzqh zzd;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zzqz(String str, String str2, boolean z11, zzpu zzpuVar, boolean z12, boolean z13) {
        super(str2);
        Level level = Level.ALL;
        Set set = zzrb.zza;
        zzqh zzqhVar = zzrb.zzb;
        this.zza = zzpuVar;
        this.zzb = level;
        this.zzc = set;
        this.zzd = zzqhVar;
    }
}
