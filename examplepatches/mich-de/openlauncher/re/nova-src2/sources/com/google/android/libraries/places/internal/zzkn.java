package com.google.android.libraries.places.internal;

import com.google.android.gms.common.api.Status;
import com.google.android.libraries.places.api.model.AutocompletePrediction;
import com.google.android.libraries.places.api.model.Place;
import java.util.List;

/* loaded from: classes3.dex */
final class zzkn extends zzku {
    private String zza;
    private zznx zzb;
    private Place zzc;
    private AutocompletePrediction zzd;
    private Status zze;
    private int zzf;

    @Override // com.google.android.libraries.places.internal.zzku
    public final zzku zza(Place place) {
        this.zzc = place;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzku
    public final zzku zzb(AutocompletePrediction autocompletePrediction) {
        this.zzd = autocompletePrediction;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzku
    public final zzku zzc(List list) {
        this.zzb = zznx.zzj(list);
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzku
    public final zzku zzd(String str) {
        this.zza = str;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzku
    public final zzku zze(Status status) {
        this.zze = status;
        return this;
    }

    @Override // com.google.android.libraries.places.internal.zzku
    public final zzkv zzf() {
        int i5 = this.zzf;
        if (i5 != 0) {
            return new zzkp(i5, this.zza, this.zzb, this.zzc, this.zzd, this.zze, null);
        }
        throw new IllegalStateException("Missing required properties: type");
    }

    public final zzku zzg(int i5) {
        this.zzf = i5;
        return this;
    }
}
