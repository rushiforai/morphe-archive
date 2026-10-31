package com.google.android.libraries.places.internal;

import java.io.IOException;

/* loaded from: classes3.dex */
abstract class zzawn {
    public abstract int zza(Object obj);

    public abstract int zzb(Object obj);

    public abstract Object zzc(Object obj);

    public abstract Object zzd(Object obj);

    public abstract Object zze(Object obj, Object obj2);

    public abstract Object zzf();

    public abstract Object zzg(Object obj);

    public abstract void zzh(Object obj, int i5, int i11);

    public abstract void zzi(Object obj, int i5, long j11);

    public abstract void zzj(Object obj, int i5, Object obj2);

    public abstract void zzk(Object obj, int i5, zzask zzaskVar);

    public abstract void zzl(Object obj, int i5, long j11);

    public abstract void zzm(Object obj);

    public abstract void zzn(Object obj, Object obj2);

    public abstract void zzo(Object obj, Object obj2);

    public final boolean zzp(Object obj, zzavs zzavsVar) throws IOException {
        int iZzd = zzavsVar.zzd();
        int i5 = iZzd >>> 3;
        int i11 = iZzd & 7;
        if (i11 == 0) {
            zzl(obj, i5, zzavsVar.zzl());
            return true;
        }
        if (i11 == 1) {
            zzi(obj, i5, zzavsVar.zzk());
            return true;
        }
        if (i11 == 2) {
            zzk(obj, i5, zzavsVar.zzp());
            return true;
        }
        if (i11 != 3) {
            if (i11 == 4) {
                return false;
            }
            if (i11 != 5) {
                throw zzauf.zza();
            }
            zzh(obj, i5, zzavsVar.zzf());
            return true;
        }
        Object objZzf = zzf();
        int i12 = i5 << 3;
        while (zzavsVar.zzc() != Integer.MAX_VALUE && zzp(objZzf, zzavsVar)) {
        }
        if ((4 | i12) != zzavsVar.zzd()) {
            throw zzauf.zzb();
        }
        zzg(objZzf);
        zzj(obj, i5, objZzf);
        return true;
    }

    public abstract boolean zzq(zzavs zzavsVar);

    public abstract void zzr(Object obj, zzasy zzasyVar) throws IOException;

    public abstract void zzs(Object obj, zzasy zzasyVar) throws IOException;
}
