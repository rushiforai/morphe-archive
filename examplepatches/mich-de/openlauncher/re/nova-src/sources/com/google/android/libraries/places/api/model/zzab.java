package com.google.android.libraries.places.api.model;

import com.google.android.gms.maps.model.LatLng;

/* loaded from: classes3.dex */
final class zzab extends zzcj {
    private LatLng zza;
    private LatLng zzb;

    @Override // com.google.android.libraries.places.api.model.zzcj
    public final zzcj zza(LatLng latLng) {
        if (latLng == null) {
            throw new NullPointerException("Null northeast");
        }
        this.zzb = latLng;
        return this;
    }

    public final zzcj zzb(LatLng latLng) {
        if (latLng == null) {
            throw new NullPointerException("Null southwest");
        }
        this.zza = latLng;
        return this;
    }

    @Override // com.google.android.libraries.places.api.model.zzcj
    public final RectangularBounds zzc() {
        LatLng latLng;
        LatLng latLng2 = this.zza;
        if (latLng2 != null && (latLng = this.zzb) != null) {
            return new zzbq(latLng2, latLng);
        }
        StringBuilder sb2 = new StringBuilder();
        if (this.zza == null) {
            sb2.append(" southwest");
        }
        if (this.zzb == null) {
            sb2.append(" northeast");
        }
        throw new IllegalStateException("Missing required properties:".concat(sb2.toString()));
    }
}
