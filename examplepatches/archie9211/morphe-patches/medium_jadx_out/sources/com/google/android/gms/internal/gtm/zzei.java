package com.google.android.gms.internal.gtm;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
final class zzei implements zzcq {
    private final zzbu zza;
    private final zzej zzb = new zzej();

    public zzei(zzbu zzbuVar) {
        this.zza = zzbuVar;
    }

    @Override // com.google.android.gms.internal.gtm.zzcq
    public final /* synthetic */ zzcp zza() {
        return this.zzb;
    }

    @Override // com.google.android.gms.internal.gtm.zzcq
    public final void zzc(String str, boolean z) {
        if (!"ga_dryRun".equals(str)) {
            this.zza.zzm().zzR("Bool xml configuration name not recognized", str);
        } else {
            this.zzb.zze = z ? 1 : 0;
        }
    }

    @Override // com.google.android.gms.internal.gtm.zzcq
    public final void zzd(String str, int i) {
        if ("ga_dispatchPeriod".equals(str)) {
            this.zzb.zzd = i;
        } else {
            this.zza.zzm().zzR("Int xml configuration name not recognized", str);
        }
    }

    @Override // com.google.android.gms.internal.gtm.zzcq
    public final void zze(String str, String str2) {
        if ("ga_appName".equals(str)) {
            this.zzb.zza = str2;
            return;
        }
        if ("ga_appVersion".equals(str)) {
            this.zzb.zzb = str2;
        } else if ("ga_logLevel".equals(str)) {
            this.zzb.zzc = str2;
        } else {
            this.zza.zzm().zzR("String xml configuration name not recognized", str);
        }
    }

    @Override // com.google.android.gms.internal.gtm.zzcq
    public final void zzb(String str, String str2) {
    }
}
