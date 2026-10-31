package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes3.dex */
public final class zzqq implements zzqr {
    private final String zza;
    private final zzpu zzb;

    public zzqq() {
        zzpv zzpvVar = zzpv.NO_OP;
        this.zza = b.f42142b;
        this.zzb = zzpvVar;
    }

    @Override // com.google.android.libraries.places.internal.zzqr
    public final zzpw zza(String str) {
        return new zzqz(this.zza, str, true, this.zzb, true, true);
    }
}
