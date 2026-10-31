package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public class zzaul {
    private static final zzatf zzb = zzatf.zza;
    protected volatile zzavf zza;
    private volatile zzask zzc;

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zzaul)) {
            return false;
        }
        zzaul zzaulVar = (zzaul) obj;
        zzavf zzavfVar = this.zza;
        zzavf zzavfVar2 = zzaulVar.zza;
        if (zzavfVar == null && zzavfVar2 == null) {
            return zzb().equals(zzaulVar.zzb());
        }
        if (zzavfVar != null && zzavfVar2 != null) {
            return zzavfVar.equals(zzavfVar2);
        }
        if (zzavfVar != null) {
            zzaulVar.zzd(zzavfVar.zzaL());
            return zzavfVar.equals(zzaulVar.zza);
        }
        zzd(zzavfVar2.zzaL());
        return this.zza.equals(zzavfVar2);
    }

    public int hashCode() {
        return 1;
    }

    public final int zza() {
        if (this.zzc != null) {
            return ((zzash) this.zzc).zza.length;
        }
        if (this.zza != null) {
            return this.zza.zzaq();
        }
        return 0;
    }

    public final zzask zzb() {
        if (this.zzc != null) {
            return this.zzc;
        }
        synchronized (this) {
            try {
                if (this.zzc != null) {
                    return this.zzc;
                }
                if (this.zza == null) {
                    this.zzc = zzask.zzb;
                } else {
                    this.zzc = this.zza.zzal();
                }
                return this.zzc;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final zzavf zzc(zzavf zzavfVar) {
        zzavf zzavfVar2 = this.zza;
        this.zzc = null;
        this.zza = zzavfVar;
        return zzavfVar2;
    }

    public final void zzd(zzavf zzavfVar) {
        if (this.zza != null) {
            return;
        }
        synchronized (this) {
            if (this.zza != null) {
                return;
            }
            try {
                this.zza = zzavfVar;
                this.zzc = zzask.zzb;
            } catch (zzauf unused) {
                this.zza = zzavfVar;
                this.zzc = zzask.zzb;
            }
        }
    }
}
