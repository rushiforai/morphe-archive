package com.google.android.libraries.places.internal;

import sun.misc.Unsafe;

/* loaded from: classes3.dex */
final class zzawv extends zzaww {
    public zzawv(Unsafe unsafe) {
        super(unsafe);
    }

    @Override // com.google.android.libraries.places.internal.zzaww
    public final double zza(Object obj, long j11) {
        return Double.longBitsToDouble(this.zza.getLong(obj, j11));
    }

    @Override // com.google.android.libraries.places.internal.zzaww
    public final float zzb(Object obj, long j11) {
        return Float.intBitsToFloat(this.zza.getInt(obj, j11));
    }

    /* JADX WARN: Failed to inline method: com.google.android.libraries.places.internal.zzawx.zzj(java.lang.Object, long, boolean):void */
    /* JADX WARN: Unknown register number '(r5v0 boolean)' in method call: com.google.android.libraries.places.internal.zzawx.zzj(java.lang.Object, long, boolean):void */
    @Override // com.google.android.libraries.places.internal.zzaww
    public final void zzc(Object obj, long j11, boolean z11) {
        if (zzawx.zzb) {
            zzawx.zzD(obj, j11, z11 ? (byte) 1 : (byte) 0);
        } else {
            zzawx.zzj(obj, j11, z11);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzaww
    public final void zzd(Object obj, long j11, byte b11) {
        if (zzawx.zzb) {
            zzawx.zzD(obj, j11, b11);
        } else {
            zzawx.zzE(obj, j11, b11);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzaww
    public final void zze(Object obj, long j11, double d5) {
        this.zza.putLong(obj, j11, Double.doubleToLongBits(d5));
    }

    @Override // com.google.android.libraries.places.internal.zzaww
    public final void zzf(Object obj, long j11, float f11) {
        this.zza.putInt(obj, j11, Float.floatToIntBits(f11));
    }

    @Override // com.google.android.libraries.places.internal.zzaww
    public final boolean zzg(Object obj, long j11) {
        return zzawx.zzb ? zzawx.zzt(obj, j11) : zzawx.zzu(obj, j11);
    }
}
