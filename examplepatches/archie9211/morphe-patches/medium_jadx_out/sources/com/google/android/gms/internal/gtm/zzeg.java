package com.google.android.gms.internal.gtm;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zzeg {
    private final Object zza;
    private final Object zzb = new Object();

    private zzeg(Object obj, Object obj2, zzef zzefVar) {
        this.zza = obj;
    }

    public static zzeg zza(Object obj, Object obj2, zzef zzefVar) {
        return new zzeg(obj, obj2, zzefVar);
    }

    public final Object zzb() {
        synchronized (this.zzb) {
        }
        return this.zza;
    }
}
