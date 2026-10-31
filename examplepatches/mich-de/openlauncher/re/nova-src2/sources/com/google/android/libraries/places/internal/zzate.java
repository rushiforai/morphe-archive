package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzate {
    private final Object zza;
    private final int zzb;

    public zzate(Object obj, int i5) {
        this.zza = obj;
        this.zzb = i5;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof zzate)) {
            return false;
        }
        zzate zzateVar = (zzate) obj;
        return this.zza == zzateVar.zza && this.zzb == zzateVar.zzb;
    }

    public final int hashCode() {
        return (System.identityHashCode(this.zza) * 65535) + this.zzb;
    }
}
