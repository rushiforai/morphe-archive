package com.google.android.libraries.places.internal;

import java.util.concurrent.atomic.AtomicReference;
import java.util.logging.Level;

/* loaded from: classes3.dex */
final class zzqw extends zzrc {
    private static final zzqw zza = new zzqw(zzrc.zze());
    private final AtomicReference zzb;

    public zzqw(zzrc zzrcVar) {
        this.zzb = new AtomicReference(zzrcVar);
    }

    public static final zzqw zzb() {
        return zza;
    }

    @Override // com.google.android.libraries.places.internal.zzrc
    public final zzpy zza() {
        return ((zzrc) this.zzb.get()).zza();
    }

    @Override // com.google.android.libraries.places.internal.zzrc
    public final zzrp zzc() {
        return ((zzrc) this.zzb.get()).zzc();
    }

    @Override // com.google.android.libraries.places.internal.zzrc
    public final boolean zzd(String str, Level level, boolean z11) {
        ((zzrc) this.zzb.get()).zzd(str, level, z11);
        return false;
    }
}
