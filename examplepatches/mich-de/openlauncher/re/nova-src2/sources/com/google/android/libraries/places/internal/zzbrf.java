package com.google.android.libraries.places.internal;

import java.io.IOException;

/* loaded from: classes3.dex */
final class zzbrf extends zzbrl {
    final /* synthetic */ zzbri zza;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zzbrf(zzbri zzbriVar, zzbts zzbtsVar) {
        super(zzbtsVar);
        this.zza = zzbriVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbrl, com.google.android.libraries.places.internal.zzbts
    public final void zza(zzbue zzbueVar) throws IOException {
        this.zza.zzk++;
        super.zza(zzbueVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbrl, com.google.android.libraries.places.internal.zzbts
    public final void zzb(boolean z11, int i5, int i11) throws IOException {
        if (z11) {
            this.zza.zzk++;
        }
        super.zzb(z11, i5, i11);
    }

    @Override // com.google.android.libraries.places.internal.zzbrl, com.google.android.libraries.places.internal.zzbts
    public final void zzc(int i5, zzbtp zzbtpVar) throws IOException {
        this.zza.zzk++;
        super.zzc(i5, zzbtpVar);
    }
}
