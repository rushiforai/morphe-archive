package com.google.android.libraries.places.api.model;

import com.google.android.libraries.places.api.model.Period;

/* loaded from: classes3.dex */
final class zzs extends Period.Builder {
    private TimeOfWeek zza;
    private TimeOfWeek zzb;

    @Override // com.google.android.libraries.places.api.model.Period.Builder
    public final Period build() {
        return new zzbg(this.zza, this.zzb);
    }

    @Override // com.google.android.libraries.places.api.model.Period.Builder
    public final TimeOfWeek getClose() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.model.Period.Builder
    public final TimeOfWeek getOpen() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.model.Period.Builder
    public final Period.Builder setClose(TimeOfWeek timeOfWeek) {
        this.zzb = timeOfWeek;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.Period.Builder
    public final Period.Builder setOpen(TimeOfWeek timeOfWeek) {
        this.zza = timeOfWeek;
        return this;
    }
}
