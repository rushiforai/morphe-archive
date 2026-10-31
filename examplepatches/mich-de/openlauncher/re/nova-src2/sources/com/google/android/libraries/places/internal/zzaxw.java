package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
public final class zzaxw implements zzaxy {
    private static final Object zza = new Object();
    private volatile zzaxy zzb;
    private volatile Object zzc = zza;

    private zzaxw(zzaxy zzaxyVar) {
        this.zzb = zzaxyVar;
    }

    public static zzaxy zza(zzaxy zzaxyVar) {
        return zzaxyVar instanceof zzaxw ? zzaxyVar : new zzaxw(zzaxyVar);
    }

    @Override // com.google.android.libraries.places.internal.zzbvt
    public final Object zzb() {
        Object objZzb;
        Object obj = this.zzc;
        Object obj2 = zza;
        if (obj != obj2) {
            return obj;
        }
        synchronized (this) {
            try {
                objZzb = this.zzc;
                if (objZzb == obj2) {
                    objZzb = this.zzb.zzb();
                    Object obj3 = this.zzc;
                    if (obj3 != obj2 && obj3 != objZzb) {
                        throw new IllegalStateException("Scoped provider was invoked recursively returning different results: " + obj3 + " & " + objZzb + ". This is likely due to a circular dependency.");
                    }
                    this.zzc = objZzb;
                    this.zzb = null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return objZzb;
    }
}
