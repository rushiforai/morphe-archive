package com.google.android.libraries.places.internal;

import sun.misc.Unsafe;

/* loaded from: classes3.dex */
abstract class zzaww {
    final Unsafe zza;

    public zzaww(Unsafe unsafe) {
        this.zza = unsafe;
    }

    public abstract double zza(Object obj, long j11);

    public abstract float zzb(Object obj, long j11);

    public abstract void zzc(Object obj, long j11, boolean z11);

    public abstract void zzd(Object obj, long j11, byte b11);

    public abstract void zze(Object obj, long j11, double d5);

    public abstract void zzf(Object obj, long j11, float f11);

    public abstract boolean zzg(Object obj, long j11);
}
