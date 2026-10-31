package com.google.android.libraries.places.internal;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.concurrent.Executor;

/* loaded from: classes3.dex */
final class zzbhg implements zzbml {
    private final Executor zzc;
    private final zzbdw zzd;
    private Runnable zze;
    private Runnable zzf;
    private Runnable zzg;
    private zzbmk zzh;
    private zzbdo zzj;
    private zzbbk zzk;
    private long zzl;
    private final zzbap zza = zzbap.zzb(zzbhg.class, null);
    private final Object zzb = new Object();
    private Collection zzi = new LinkedHashSet();

    public zzbhg(Executor executor, zzbdw zzbdwVar) {
        this.zzc = executor;
        this.zzd = zzbdwVar;
    }

    private final zzbhf zzo(zzbbf zzbbfVar, zzayx[] zzayxVarArr) {
        int size;
        zzbhf zzbhfVar = new zzbhf(this, zzbbfVar, zzayxVarArr, null);
        this.zzi.add(zzbhfVar);
        synchronized (this.zzb) {
            size = this.zzi.size();
        }
        if (size == 1) {
            this.zzd.zzc(this.zze);
        }
        for (zzayx zzayxVar : zzayxVarArr) {
        }
        return zzbhfVar;
    }

    @Override // com.google.android.libraries.places.internal.zzbfu
    public final zzbfr zza(zzbcl zzbclVar, zzbcf zzbcfVar, zzayj zzayjVar, zzayx[] zzayxVarArr) {
        zzbfr zzbilVar;
        try {
            zzbnr zzbnrVar = new zzbnr(zzbclVar, zzbcfVar, zzayjVar);
            long j11 = -1;
            zzbbk zzbbkVar = null;
            while (true) {
                synchronized (this.zzb) {
                    try {
                        zzbdo zzbdoVar = this.zzj;
                        if (zzbdoVar == null) {
                            zzbbk zzbbkVar2 = this.zzk;
                            if (zzbbkVar2 != null) {
                                if (zzbbkVar != null && j11 == this.zzl) {
                                    zzbilVar = zzo(zzbnrVar, zzayxVarArr);
                                    break;
                                }
                                j11 = this.zzl;
                                zzbfu zzbfuVarZzc = zzbjd.zzc(zzbbkVar2.zza(zzbnrVar), zzayjVar.zzo());
                                if (zzbfuVarZzc != null) {
                                    zzbilVar = zzbfuVarZzc.zza(zzbnrVar.zzc(), zzbnrVar.zzb(), zzbnrVar.zza(), zzayxVarArr);
                                    break;
                                }
                                zzbbkVar = zzbbkVar2;
                            } else {
                                zzbilVar = zzo(zzbnrVar, zzayxVarArr);
                                break;
                            }
                        } else {
                            zzbilVar = new zzbil(zzbdoVar, zzbfs.PROCESSED, zzayxVarArr);
                        }
                    } finally {
                    }
                }
            }
            return zzbilVar;
        } finally {
            this.zzd.zzb();
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbau
    public final zzbap zzc() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.internal.zzbml
    public final void zzd(zzbdo zzbdoVar) {
        Runnable runnable;
        synchronized (this.zzb) {
            try {
                if (this.zzj != null) {
                    return;
                }
                this.zzj = zzbdoVar;
                this.zzd.zzc(new zzbhd(this, zzbdoVar));
                if (!zzn() && (runnable = this.zzg) != null) {
                    this.zzd.zzc(runnable);
                    this.zzg = null;
                }
                this.zzd.zzb();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbml
    public final Runnable zzj(zzbmk zzbmkVar) {
        this.zzh = zzbmkVar;
        this.zze = new zzbha(this, zzbmkVar);
        this.zzf = new zzbhb(this, zzbmkVar);
        this.zzg = new zzbhc(this, zzbmkVar);
        return null;
    }

    public final void zzm(zzbbk zzbbkVar) {
        Runnable runnable;
        synchronized (this.zzb) {
            this.zzk = zzbbkVar;
            this.zzl++;
            if (zzbbkVar != null && zzn()) {
                ArrayList arrayList = new ArrayList(this.zzi);
                ArrayList arrayList2 = new ArrayList();
                int size = arrayList.size();
                for (int i5 = 0; i5 < size; i5++) {
                    zzbhf zzbhfVar = (zzbhf) arrayList.get(i5);
                    zzbbe zzbbeVarZza = zzbbkVar.zza(zzbhfVar.zzb);
                    zzayj zzayjVarZza = zzbhfVar.zzb.zza();
                    zzbfu zzbfuVarZzc = zzbjd.zzc(zzbbeVarZza, zzayjVarZza.zzo());
                    if (zzbfuVarZzc != null) {
                        Executor executorZzn = this.zzc;
                        if (zzayjVarZza.zzn() != null) {
                            executorZzn = zzayjVarZza.zzn();
                        }
                        Runnable runnableZzb = zzbhf.zzb(zzbhfVar, zzbfuVarZzc);
                        if (runnableZzb != null) {
                            executorZzn.execute(runnableZzb);
                        }
                        arrayList2.add(zzbhfVar);
                    }
                }
                synchronized (this.zzb) {
                    try {
                        if (zzn()) {
                            this.zzi.removeAll(arrayList2);
                            if (this.zzi.isEmpty()) {
                                this.zzi = new LinkedHashSet();
                            }
                            if (!zzn()) {
                                this.zzd.zzc(this.zzf);
                                if (this.zzj != null && (runnable = this.zzg) != null) {
                                    this.zzd.zzc(runnable);
                                    this.zzg = null;
                                }
                            }
                            this.zzd.zzb();
                        }
                    } finally {
                    }
                }
            }
        }
    }

    public final boolean zzn() {
        boolean z11;
        synchronized (this.zzb) {
            z11 = !this.zzi.isEmpty();
        }
        return z11;
    }
}
