package com.google.android.libraries.places.internal;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
final class zzbpl implements zzbft {
    final zzbpm zza;
    final /* synthetic */ zzbpo zzb;

    public zzbpl(zzbpo zzbpoVar, zzbpm zzbpmVar) {
        this.zzb = zzbpoVar;
        this.zza = zzbpmVar;
    }

    private static final Integer zza(zzbcf zzbcfVar) {
        String str = (String) zzbcfVar.zzb(zzbpo.zzi);
        if (str == null) {
            return null;
        }
        try {
            return Integer.valueOf(str);
        } catch (NumberFormatException unused) {
            return -1;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:107:0x0274  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x01de  */
    @Override // com.google.android.libraries.places.internal.zzbft
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void zzd(zzbdo zzbdoVar, zzbfs zzbfsVar, zzbcf zzbcfVar) {
        boolean z11;
        zzboy zzboyVar;
        synchronized (this.zzb.zzm) {
            try {
                zzbpo zzbpoVar = this.zzb;
                zzbpd zzbpdVar = zzbpoVar.zzs;
                zzbpm zzbpmVar = this.zza;
                zzbpmVar.zzb = true;
                if (zzbpdVar.zzc.contains(zzbpmVar)) {
                    ArrayList arrayList = new ArrayList(zzbpdVar.zzc);
                    arrayList.remove(zzbpmVar);
                    zzbpdVar = new zzbpd(zzbpdVar.zzb, Collections.unmodifiableCollection(arrayList), zzbpdVar.zzd, zzbpdVar.zzf, zzbpdVar.zzg, zzbpdVar.zza, zzbpdVar.zzh, zzbpdVar.zze);
                }
                zzbpoVar.zzs = zzbpdVar;
                this.zzb.zzr.zza(zzbdoVar.zza());
            } finally {
            }
        }
        if (this.zzb.zzv.decrementAndGet() == Integer.MIN_VALUE) {
            zzbdw zzbdwVar = (zzbdw) this.zzb.zze;
            zzbdwVar.zzc(new zzbph(this));
            zzbdwVar.zzb();
            return;
        }
        zzbpm zzbpmVar2 = this.zza;
        if (zzbpmVar2.zzc) {
            zzbpo.zzW(this.zzb, zzbpmVar2);
            if (this.zzb.zzs.zzf == this.zza) {
                this.zzb.zzak(zzbdoVar, zzbfsVar, zzbcfVar);
                return;
            }
            return;
        }
        zzbfs zzbfsVar2 = zzbfs.MISCARRIED;
        if (zzbfsVar == zzbfsVar2 && this.zzb.zzu.incrementAndGet() > 1000) {
            zzbpo.zzW(this.zzb, this.zza);
            if (this.zzb.zzs.zzf == this.zza) {
                this.zzb.zzak(zzbdo.zzo.zzg("Too many transparent retries. Might be a bug in gRPC").zzf(new zzbdq(zzbdoVar, null)), zzbfsVar, zzbcfVar);
                return;
            }
            return;
        }
        if (this.zzb.zzs.zzf == null) {
            if (zzbfsVar == zzbfsVar2 || (zzbfsVar == zzbfs.REFUSED && this.zzb.zzt.compareAndSet(false, true))) {
                zzbpm zzbpmVarZzaf = this.zzb.zzaf(this.zza.zzd, true);
                if (zzbpmVarZzaf != null) {
                    zzbpo zzbpoVar2 = this.zzb;
                    if (zzbpoVar2.zzl) {
                        synchronized (zzbpoVar2.zzm) {
                            zzbpo zzbpoVar3 = this.zzb;
                            zzbpd zzbpdVar2 = zzbpoVar3.zzs;
                            zzbpm zzbpmVar3 = this.zza;
                            ArrayList arrayList2 = new ArrayList(zzbpdVar2.zzd);
                            arrayList2.remove(zzbpmVar3);
                            arrayList2.add(zzbpmVarZzaf);
                            zzbpoVar3.zzs = new zzbpd(zzbpdVar2.zzb, zzbpdVar2.zzc, Collections.unmodifiableCollection(arrayList2), zzbpdVar2.zzf, zzbpdVar2.zzg, zzbpdVar2.zza, zzbpdVar2.zzh, zzbpdVar2.zze);
                        }
                    }
                    this.zzb.zzd.execute(new zzbpi(this, zzbpmVarZzaf));
                    return;
                }
                return;
            }
            if (zzbfsVar == zzbfs.DROPPED) {
                zzbpo zzbpoVar4 = this.zzb;
                if (zzbpoVar4.zzl) {
                    zzbpoVar4.zzaj();
                }
            } else {
                this.zzb.zzt.set(true);
                zzbpo zzbpoVar5 = this.zzb;
                if (zzbpoVar5.zzl) {
                    Integer numZza = zza(zzbcfVar);
                    boolean zContains = this.zzb.zzk.zzc.contains(zzbdoVar.zza());
                    boolean z12 = (this.zzb.zzq == null || (!zContains && (numZza == null || numZza.intValue() >= 0))) ? false : !this.zzb.zzq.zzb();
                    if (zContains && !z12 && !zzbdoVar.zzl() && numZza != null && numZza.intValue() > 0) {
                        numZza = 0;
                    }
                    boolean z13 = zContains && !z12;
                    if (z13) {
                        zzbpo.zzZ(this.zzb, numZza);
                    }
                    synchronized (this.zzb.zzm) {
                        try {
                            zzbpo zzbpoVar6 = this.zzb;
                            zzbpd zzbpdVar3 = zzbpoVar6.zzs;
                            zzbpm zzbpmVar4 = this.zza;
                            ArrayList arrayList3 = new ArrayList(zzbpdVar3.zzd);
                            arrayList3.remove(zzbpmVar4);
                            zzbpoVar6.zzs = new zzbpd(zzbpdVar3.zzb, zzbpdVar3.zzc, Collections.unmodifiableCollection(arrayList3), zzbpdVar3.zzf, zzbpdVar3.zzg, zzbpdVar3.zza, zzbpdVar3.zzh, zzbpdVar3.zze);
                            if (z13) {
                                zzbpo zzbpoVar7 = this.zzb;
                                if (!zzbpoVar7.zzal(zzbpoVar7.zzs)) {
                                    if (!this.zzb.zzs.zzd.isEmpty()) {
                                    }
                                }
                                return;
                            }
                        } finally {
                        }
                    }
                } else {
                    long nanos = 0;
                    if (zzbpoVar5.zzj == null) {
                        z11 = false;
                        if (z11) {
                            zzbpm zzbpmVarZzaf2 = this.zzb.zzaf(this.zza.zzd + 1, false);
                            if (zzbpmVarZzaf2 != null) {
                                synchronized (this.zzb.zzm) {
                                    zzbpo zzbpoVar8 = this.zzb;
                                    zzboyVar = new zzboy(zzbpoVar8.zzm);
                                    zzbpoVar8.zzz = zzboyVar;
                                }
                                zzboyVar.zzb(this.zzb.zzf.schedule(new zzbpg(this, zzboyVar, zzbpmVarZzaf2), nanos, TimeUnit.NANOSECONDS));
                                return;
                            }
                            return;
                        }
                    } else {
                        boolean zContains2 = zzbpoVar5.zzj.zzf.contains(zzbdoVar.zza());
                        Integer numZza2 = zza(zzbcfVar);
                        boolean z14 = (this.zzb.zzq == null || (!zContains2 && (numZza2 == null || numZza2.intValue() >= 0))) ? false : !this.zzb.zzq.zzb();
                        if (this.zzb.zzj.zza > this.zza.zzd + 1 && !z14) {
                            if (numZza2 == null) {
                                if (zContains2) {
                                    double dNextDouble = zzbpo.zzb.nextDouble() * r11.zzB;
                                    zzbpo zzbpoVar9 = this.zzb;
                                    zzbpoVar9.zzB = Math.min((long) (zzbpoVar9.zzB * zzbpoVar9.zzj.zzd), zzbpoVar9.zzj.zzc);
                                    nanos = (long) dNextDouble;
                                    z11 = true;
                                }
                                z11 = false;
                            } else {
                                if (numZza2.intValue() >= 0) {
                                    nanos = TimeUnit.MILLISECONDS.toNanos(numZza2.intValue());
                                    zzbpo zzbpoVar10 = this.zzb;
                                    zzbpoVar10.zzB = zzbpoVar10.zzj.zzb;
                                    z11 = true;
                                }
                                z11 = false;
                            }
                            if (z11) {
                            }
                        }
                    }
                }
            }
        }
        zzbpo.zzW(this.zzb, this.zza);
        if (this.zzb.zzs.zzf == this.zza) {
            this.zzb.zzak(zzbdoVar, zzbfsVar, zzbcfVar);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbft
    public final void zze(zzbcf zzbcfVar) {
        int i5;
        int i11;
        if (this.zza.zzd > 0) {
            zzbca zzbcaVar = zzbpo.zzh;
            zzbcfVar.zzd(zzbcaVar);
            zzbcfVar.zzf(zzbcaVar, String.valueOf(this.zza.zzd));
        }
        zzbpo.zzW(this.zzb, this.zza);
        if (this.zzb.zzs.zzf == this.zza) {
            zzbpo zzbpoVar = this.zzb;
            if (zzbpoVar.zzq != null) {
                zzbpn zzbpnVar = zzbpoVar.zzq;
                do {
                    i5 = zzbpnVar.zzd.get();
                    i11 = zzbpnVar.zza;
                    if (i5 == i11) {
                        break;
                    }
                } while (!zzbpnVar.zzd.compareAndSet(i5, Math.min(zzbpnVar.zzc + i5, i11)));
            }
            zzbdw zzbdwVar = (zzbdw) this.zzb.zze;
            zzbdwVar.zzc(new zzbpe(this, zzbcfVar));
            zzbdwVar.zzb();
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbqr
    public final void zzf(zzbqq zzbqqVar) throws IOException {
        zzbpd zzbpdVar = this.zzb.zzs;
        zzmt.zzp(zzbpdVar.zzf != null, "Headers should be received prior to messages.");
        if (zzbpdVar.zzf != this.zza) {
            zzbjd.zzh(zzbqqVar);
            return;
        }
        zzbdw zzbdwVar = (zzbdw) this.zzb.zze;
        zzbdwVar.zzc(new zzbpj(this, zzbqqVar));
        zzbdwVar.zzb();
    }

    @Override // com.google.android.libraries.places.internal.zzbqr
    public final void zzg() {
        if (this.zzb.zzp()) {
            zzbdw zzbdwVar = (zzbdw) this.zzb.zze;
            zzbdwVar.zzc(new zzbpk(this));
            zzbdwVar.zzb();
        }
    }
}
