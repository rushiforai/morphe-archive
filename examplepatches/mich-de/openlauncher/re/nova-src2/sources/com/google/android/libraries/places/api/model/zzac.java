package com.google.android.libraries.places.api.model;

import b.c0;
import com.google.android.gms.maps.model.LatLng;

/* loaded from: classes3.dex */
abstract class zzac extends RectangularBounds {
    private final LatLng zza;
    private final LatLng zzb;

    public zzac(LatLng latLng, LatLng latLng2) {
        if (latLng == null) {
            throw new NullPointerException("Null southwest");
        }
        this.zza = latLng;
        if (latLng2 == null) {
            throw new NullPointerException("Null northeast");
        }
        this.zzb = latLng2;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof RectangularBounds) {
            RectangularBounds rectangularBounds = (RectangularBounds) obj;
            if (this.zza.equals(rectangularBounds.getSouthwest()) && this.zzb.equals(rectangularBounds.getNortheast())) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.model.RectangularBounds
    public final LatLng getNortheast() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.model.RectangularBounds
    public final LatLng getSouthwest() {
        return this.zza;
    }

    public final int hashCode() {
        return ((this.zza.hashCode() ^ 1000003) * 1000003) ^ this.zzb.hashCode();
    }

    public final String toString() {
        return c0.n("RectangularBounds{southwest=", this.zza.toString(), ", northeast=", this.zzb.toString(), "}");
    }
}
