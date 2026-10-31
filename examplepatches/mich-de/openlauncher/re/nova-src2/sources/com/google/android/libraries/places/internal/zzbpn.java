package com.google.android.libraries.places.internal;

import java.util.Arrays;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes3.dex */
final class zzbpn {
    final int zza;
    final int zzb;
    final int zzc;
    final AtomicInteger zzd;

    public zzbpn(float f11, float f12) {
        AtomicInteger atomicInteger = new AtomicInteger();
        this.zzd = atomicInteger;
        this.zzc = (int) (f12 * 1000.0f);
        int i5 = (int) (f11 * 1000.0f);
        this.zza = i5;
        this.zzb = i5 / 2;
        atomicInteger.set(i5);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zzbpn)) {
            return false;
        }
        zzbpn zzbpnVar = (zzbpn) obj;
        return this.zza == zzbpnVar.zza && this.zzc == zzbpnVar.zzc;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(this.zza), Integer.valueOf(this.zzc)});
    }

    public final boolean zza() {
        return this.zzd.get() > this.zzb;
    }

    public final boolean zzb() {
        int i5;
        int i11;
        do {
            i5 = this.zzd.get();
            if (i5 == 0) {
                return false;
            }
            i11 = i5 - 1000;
        } while (!this.zzd.compareAndSet(i5, Math.max(i11, 0)));
        return i11 > this.zzb;
    }
}
