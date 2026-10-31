package com.google.android.libraries.places.api.model;

import a80.m;
import b.u4;

/* loaded from: classes3.dex */
abstract class zzag extends SpecialDay {
    private final LocalDate zza;
    private final boolean zzb;

    public zzag(LocalDate localDate, boolean z11) {
        if (localDate == null) {
            throw new NullPointerException("Null date");
        }
        this.zza = localDate;
        this.zzb = z11;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof SpecialDay) {
            SpecialDay specialDay = (SpecialDay) obj;
            if (this.zza.equals(specialDay.getDate()) && this.zzb == specialDay.isExceptional()) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.model.SpecialDay
    public final LocalDate getDate() {
        return this.zza;
    }

    public final int hashCode() {
        return ((this.zza.hashCode() ^ 1000003) * 1000003) ^ (true != this.zzb ? 1237 : 1231);
    }

    @Override // com.google.android.libraries.places.api.model.SpecialDay
    public final boolean isExceptional() {
        return this.zzb;
    }

    public final String toString() {
        return m.k(u4.k("SpecialDay{date=", this.zza.toString(), ", exceptional="), this.zzb, "}");
    }
}
