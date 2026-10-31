package com.google.android.libraries.places.internal;

import java.util.Iterator;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
final class zzbls extends zzayk {
    final /* synthetic */ zzbma zza;
    private final String zzc;
    private final AtomicReference zzb = new AtomicReference(zzbma.zzi);
    private final zzayk zzd = new zzblk(this);

    public /* synthetic */ zzbls(zzbma zzbmaVar, String str, zzblr zzblrVar) {
        this.zza = zzbmaVar;
        this.zzc = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final zzayo zzh(zzbcl zzbclVar, zzayj zzayjVar) {
        zzbam zzbamVar = (zzbam) this.zzb.get();
        if (zzbamVar == null) {
            return this.zzd.zza(zzbclVar, zzayjVar);
        }
        if (!(zzbamVar instanceof zzbmi)) {
            return new zzbkv(zzbamVar, this.zzd, this.zza.zzt, zzbclVar, zzayjVar);
        }
        zzbmg zzbmgVarZzb = ((zzbmi) zzbamVar).zzb.zzb(zzbclVar);
        if (zzbmgVarZzb != null) {
            zzayjVar = zzayjVar.zze(zzbmg.zza, zzbmgVarZzb);
        }
        return this.zzd.zza(zzbclVar, zzayjVar);
    }

    @Override // com.google.android.libraries.places.internal.zzayk
    public final zzayo zza(zzbcl zzbclVar, zzayj zzayjVar) {
        if (this.zzb.get() != zzbma.zzi) {
            return zzh(zzbclVar, zzayjVar);
        }
        zzbma zzbmaVar = this.zza;
        zzbll zzbllVar = new zzbll(this);
        zzbdw zzbdwVar = zzbmaVar.zzf;
        zzbdwVar.zzc(zzbllVar);
        zzbdwVar.zzb();
        if (this.zzb.get() != zzbma.zzi) {
            return zzh(zzbclVar, zzayjVar);
        }
        if (this.zza.zzP.get()) {
            return new zzblm(this);
        }
        zzblq zzblqVar = new zzblq(this, zzazj.zzb(), zzbclVar, zzayjVar);
        zzbma zzbmaVar2 = this.zza;
        zzbln zzblnVar = new zzbln(this, zzblqVar);
        zzbdw zzbdwVar2 = zzbmaVar2.zzf;
        zzbdwVar2.zzc(zzblnVar);
        zzbdwVar2.zzb();
        return zzblqVar;
    }

    @Override // com.google.android.libraries.places.internal.zzayk
    public final String zzb() {
        return this.zzc;
    }

    public final void zzf() {
        if (this.zzb.get() == zzbma.zzi) {
            zzg(null);
        }
    }

    public final void zzg(zzbam zzbamVar) {
        zzbam zzbamVar2 = (zzbam) this.zzb.get();
        this.zzb.set(zzbamVar);
        if (zzbamVar2 == zzbma.zzi) {
            zzbma zzbmaVar = this.zza;
            if (zzbmaVar.zzK != null) {
                Iterator it = zzbmaVar.zzK.iterator();
                while (it.hasNext()) {
                    ((zzblq) it.next()).zzl();
                }
            }
        }
    }
}
