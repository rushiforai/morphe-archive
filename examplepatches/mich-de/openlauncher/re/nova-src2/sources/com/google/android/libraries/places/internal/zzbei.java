package com.google.android.libraries.places.internal;

import io.branch.requery.android.database.sqlite.SQLiteDatabase;

/* loaded from: classes3.dex */
public abstract class zzbei implements zzbel, zzbmm {
    private zzbgj zzr;
    private final Object zzs = new Object();
    private final zzbqo zzt;
    private final zzbqz zzu;
    private final zzbmq zzv;
    private int zzw;
    private boolean zzx;
    private boolean zzy;
    private final int zzz;

    public zzbei(int i5, zzbqo zzbqoVar, zzbqz zzbqzVar) {
        this.zzt = zzbqoVar;
        this.zzu = zzbqzVar;
        zzbmq zzbmqVar = new zzbmq(this, zzaza.zza, i5, zzbqoVar, zzbqzVar);
        this.zzv = zzbmqVar;
        this.zzr = zzbmqVar;
        this.zzz = SQLiteDatabase.OPEN_NOMUTEX;
    }

    private final void zzb() {
        boolean zZzc;
        synchronized (this.zzs) {
            zZzc = zzc();
        }
        if (zZzc) {
            zza().zzg();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean zzc() {
        boolean z11;
        synchronized (this.zzs) {
            try {
                z11 = false;
                if (this.zzx && this.zzw < this.zzz && !this.zzy) {
                    z11 = true;
                }
            } finally {
            }
        }
        return z11;
    }

    public static /* bridge */ /* synthetic */ void zzn(zzbei zzbeiVar, int i5) {
        synchronized (zzbeiVar.zzs) {
            zzbeiVar.zzw += i5;
        }
    }

    public static /* bridge */ /* synthetic */ void zzo(zzbei zzbeiVar, int i5) {
        zzbgj zzbgjVar = zzbeiVar.zzr;
        zzbeiVar.zzz(new zzbeh(zzbeiVar, zzbvr.zza(), 2));
    }

    public abstract zzbqr zza();

    public final zzbqz zzm() {
        return this.zzu;
    }

    public final void zzp(boolean z11) {
        if (z11) {
            this.zzr.close();
        } else {
            this.zzr.zza();
        }
    }

    public final void zzq(zzbnv zzbnvVar) {
        try {
            this.zzr.zzb(zzbnvVar);
        } catch (Throwable th2) {
            zzF(th2);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbmm
    public final void zzr(zzbqq zzbqqVar) {
        zza().zzf(zzbqqVar);
    }

    public final void zzs(int i5) {
        boolean z11;
        synchronized (this.zzs) {
            zzmt.zzp(this.zzx, "onStreamAllocated was not called, but it seems the stream is active");
            int i11 = this.zzw;
            int i12 = this.zzz;
            int i13 = i11 - i5;
            this.zzw = i13;
            z11 = false;
            if (i11 >= i12 && i13 < i12) {
                z11 = true;
            }
        }
        if (z11) {
            zzb();
        }
    }

    public final void zzt() {
        zzmt.zzo(zza() != null);
        synchronized (this.zzs) {
            zzmt.zzp(!this.zzx, "Already allocated");
            this.zzx = true;
        }
        zzb();
    }

    public final void zzu() {
        synchronized (this.zzs) {
            this.zzy = true;
        }
    }

    public final void zzv() {
        this.zzv.zzf(this);
        this.zzr = this.zzv;
    }

    public final void zzw(zzazo zzazoVar) {
        this.zzr.zzd(zzazoVar);
    }

    public final void zzx(int i5) {
        this.zzr.zze(i5);
    }
}
