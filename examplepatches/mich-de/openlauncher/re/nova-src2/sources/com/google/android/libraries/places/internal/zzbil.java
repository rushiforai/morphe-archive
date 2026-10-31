package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzbil extends zzbmy {
    private boolean zzb;
    private final zzbdo zzc;
    private final zzbfs zzd;
    private final zzayx[] zze;

    public zzbil(zzbdo zzbdoVar, zzbfs zzbfsVar, zzayx[] zzayxVarArr) {
        zzmt.zzf(!zzbdoVar.zzl(), "error must not be OK");
        this.zzc = zzbdoVar;
        this.zzd = zzbfsVar;
        this.zze = zzayxVarArr;
    }

    @Override // com.google.android.libraries.places.internal.zzbmy, com.google.android.libraries.places.internal.zzbfr
    public final void zzg(zzbjj zzbjjVar) {
        zzbjjVar.zzb("error", this.zzc);
        zzbjjVar.zzb("progress", this.zzd);
    }

    @Override // com.google.android.libraries.places.internal.zzbmy, com.google.android.libraries.places.internal.zzbfr
    public final void zzo(zzbft zzbftVar) {
        zzmt.zzp(!this.zzb, "already started");
        this.zzb = true;
        int i5 = 0;
        while (true) {
            zzayx[] zzayxVarArr = this.zze;
            if (i5 >= zzayxVarArr.length) {
                zzbftVar.zzd(this.zzc, this.zzd, new zzbcf());
                return;
            } else {
                zzayx zzayxVar = zzayxVarArr[i5];
                i5++;
            }
        }
    }
}
