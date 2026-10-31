package com.google.android.libraries.places.api.model;

import b.c0;

/* loaded from: classes3.dex */
abstract class zzj extends zzby {
    private final int zza;
    private final int zzb;

    public zzj(int i5, int i11) {
        this.zza = i5;
        this.zzb = i11;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof zzby) {
            zzby zzbyVar = (zzby) obj;
            if (this.zza == zzbyVar.zzb() && this.zzb == zzbyVar.zza()) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((this.zza ^ 1000003) * 1000003) ^ this.zzb;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SubstringMatch{offset=");
        sb2.append(this.zza);
        sb2.append(", length=");
        return c0.o(sb2, this.zzb, "}");
    }

    @Override // com.google.android.libraries.places.api.model.zzby
    public final int zza() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.model.zzby
    public final int zzb() {
        return this.zza;
    }
}
