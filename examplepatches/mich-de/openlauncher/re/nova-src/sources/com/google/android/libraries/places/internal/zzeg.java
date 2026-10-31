package com.google.android.libraries.places.internal;

import a2.c;

/* loaded from: classes3.dex */
final class zzeg extends zzei {
    private final long zza;
    private final long zzb;

    public zzeg(long j11, long j12) {
        this.zza = j11;
        this.zzb = j12;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof zzei) {
            zzei zzeiVar = (zzei) obj;
            if (this.zza == zzeiVar.zza() && this.zzb == zzeiVar.zzb()) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        long j11 = this.zzb;
        long j12 = this.zza;
        return ((int) (j11 ^ (j11 >>> 32))) ^ ((((int) (j12 ^ (j12 >>> 32))) ^ 1000003) * 1000003);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("PrimesInstant{elapsedRealtimeMs=");
        sb2.append(this.zza);
        sb2.append(", uptimeMillis=");
        return c.i(this.zzb, "}", sb2);
    }

    @Override // com.google.android.libraries.places.internal.zzei
    public final long zza() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.internal.zzei
    public final long zzb() {
        return this.zzb;
    }
}
