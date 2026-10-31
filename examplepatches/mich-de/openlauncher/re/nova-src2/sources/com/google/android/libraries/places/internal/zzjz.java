package com.google.android.libraries.places.internal;

import b.c0;

/* loaded from: classes3.dex */
final class zzjz extends zzkb {
    private final String zza;
    private final int zzb;
    private final int zzc;

    public /* synthetic */ zzjz(String str, int i5, int i11, zzjy zzjyVar) {
        this.zza = str;
        this.zzb = i5;
        this.zzc = i11;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof zzkb) {
            zzkb zzkbVar = (zzkb) obj;
            if (this.zza.equals(zzkbVar.zzb()) && this.zzb == zzkbVar.zza() && this.zzc == zzkbVar.zzc()) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((((this.zza.hashCode() ^ 1000003) * 1000003) ^ this.zzb) * 1000003) ^ this.zzc;
    }

    public final String toString() {
        return c0.q(c0.v("ClientProfile{packageName=", this.zzb, this.zza, ", versionCode=", ", requestSource="), this.zzc != 1 ? "AUTOCOMPLETE_WIDGET" : "PROGRAMMATIC_API", "}");
    }

    @Override // com.google.android.libraries.places.internal.zzkb
    public final int zza() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.internal.zzkb
    public final String zzb() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.internal.zzkb
    public final int zzc() {
        return this.zzc;
    }
}
