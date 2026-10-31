package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbkt implements zzbfp {
    volatile zzbpn zza;
    final /* synthetic */ zzbma zzb;

    public /* synthetic */ zzbkt(zzbma zzbmaVar, zzbks zzbksVar) {
        this.zzb = zzbmaVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final zzbfu zzc(zzbbf zzbbfVar) {
        zzbma zzbmaVar = this.zzb;
        zzbbk zzbbkVar = zzbmaVar.zzH;
        if (!zzbmaVar.zzP.get()) {
            if (zzbbkVar == null) {
                zzbma zzbmaVar2 = this.zzb;
                zzbkq zzbkqVar = new zzbkq(this);
                zzbdw zzbdwVar = zzbmaVar2.zzf;
                zzbdwVar.zzc(zzbkqVar);
                zzbdwVar.zzb();
                return this.zzb.zzN;
            }
            zzbfu zzbfuVarZzc = zzbjd.zzc(zzbbkVar.zza(zzbbfVar), zzbbfVar.zza().zzo());
            if (zzbfuVarZzc != null) {
                return zzbfuVarZzc;
            }
        }
        return this.zzb.zzN;
    }

    @Override // com.google.android.libraries.places.internal.zzbfp
    public final zzbfr zza(zzbcl zzbclVar, zzayj zzayjVar, zzbcf zzbcfVar, zzazj zzazjVar) {
        if (this.zzb.zzaf) {
            zzbmg zzbmgVar = (zzbmg) zzayjVar.zzl(zzbmg.zza);
            return new zzbkr(this, zzbclVar, zzbcfVar, zzayjVar, zzbmgVar == null ? null : zzbmgVar.zzf, zzbmgVar != null ? zzbmgVar.zzg : null, zzazjVar);
        }
        zzbfu zzbfuVarZzc = zzc(new zzbnr(zzbclVar, zzbcfVar, zzayjVar));
        zzazj zzazjVarZza = zzazjVar.zza();
        try {
            return zzbfuVarZzc.zza(zzbclVar, zzbcfVar, zzayjVar, zzbjd.zzk(zzayjVar, zzbcfVar, 0, false));
        } finally {
            zzazjVar.zze(zzazjVarZza);
        }
    }
}
