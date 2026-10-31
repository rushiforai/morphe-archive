package com.google.android.libraries.places.internal;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes3.dex */
final class zzbfl extends zzbgi {
    final /* synthetic */ zzbvq zza;
    final /* synthetic */ zzbqq zzb;
    final /* synthetic */ zzbfo zzc;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zzbfl(zzbfo zzbfoVar, zzbvq zzbvqVar, zzbqq zzbqqVar) {
        super(zzbfoVar.zza.zzi);
        this.zza = zzbvqVar;
        this.zzb = zzbqqVar;
        this.zzc = zzbfoVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbgi
    public final void zza() throws IOException {
        int i5 = zzbvr.zza;
        if (this.zzc.zzc != null) {
            zzbjd.zzh(this.zzb);
            return;
        }
        while (true) {
            try {
                InputStream inputStreamZza = this.zzb.zza();
                if (inputStreamZza == null) {
                    return;
                }
                try {
                    zzbfo zzbfoVar = this.zzc;
                    zzbfoVar.zzb.zzc(zzbfoVar.zza.zzd.zzd(inputStreamZza));
                    inputStreamZza.close();
                } catch (Throwable th2) {
                    zzbjd.zzi(inputStreamZza);
                    throw th2;
                }
            } catch (Throwable th3) {
                zzbjd.zzh(this.zzb);
                zzbfo.zzc(this.zzc, zzbdo.zzb.zzf(th3).zzg("Failed to read message."));
                return;
            }
        }
    }
}
