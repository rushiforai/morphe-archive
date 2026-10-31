package com.google.android.libraries.places.api.model;

import b.c0;

/* loaded from: classes3.dex */
abstract class zzp extends LocalTime {
    private final int zza;
    private final int zzb;

    public zzp(int i5, int i11) {
        this.zza = i5;
        this.zzb = i11;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof LocalTime) {
            LocalTime localTime = (LocalTime) obj;
            if (this.zza == localTime.getHours() && this.zzb == localTime.getMinutes()) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.model.LocalTime
    public final int getHours() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.model.LocalTime
    public final int getMinutes() {
        return this.zzb;
    }

    public final int hashCode() {
        return ((this.zza ^ 1000003) * 1000003) ^ this.zzb;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("LocalTime{hours=");
        sb2.append(this.zza);
        sb2.append(", minutes=");
        return c0.o(sb2, this.zzb, "}");
    }
}
