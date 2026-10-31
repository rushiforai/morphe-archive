package com.google.android.libraries.places.api.model;

import com.google.android.libraries.places.api.model.SpecialDay;

/* loaded from: classes3.dex */
final class zzaf extends SpecialDay.Builder {
    private LocalDate zza;
    private boolean zzb;
    private byte zzc;

    @Override // com.google.android.libraries.places.api.model.SpecialDay.Builder
    public final SpecialDay build() {
        LocalDate localDate;
        if (this.zzc == 1 && (localDate = this.zza) != null) {
            return new zzbu(localDate, this.zzb);
        }
        StringBuilder sb2 = new StringBuilder();
        if (this.zza == null) {
            sb2.append(" date");
        }
        if (this.zzc == 0) {
            sb2.append(" exceptional");
        }
        throw new IllegalStateException("Missing required properties:".concat(sb2.toString()));
    }

    @Override // com.google.android.libraries.places.api.model.SpecialDay.Builder
    public final LocalDate getDate() {
        LocalDate localDate = this.zza;
        if (localDate != null) {
            return localDate;
        }
        throw new IllegalStateException("Property \"date\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.SpecialDay.Builder
    public final boolean isExceptional() {
        if (this.zzc != 0) {
            return this.zzb;
        }
        throw new IllegalStateException("Property \"exceptional\" has not been set");
    }

    @Override // com.google.android.libraries.places.api.model.SpecialDay.Builder
    public final SpecialDay.Builder setDate(LocalDate localDate) {
        if (localDate == null) {
            throw new NullPointerException("Null date");
        }
        this.zza = localDate;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.SpecialDay.Builder
    public final SpecialDay.Builder setExceptional(boolean z11) {
        this.zzb = z11;
        this.zzc = (byte) 1;
        return this;
    }
}
