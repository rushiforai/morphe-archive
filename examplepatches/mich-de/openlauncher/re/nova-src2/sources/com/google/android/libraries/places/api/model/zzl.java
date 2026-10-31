package com.google.android.libraries.places.api.model;

import b.u4;
import com.google.android.gms.maps.model.LatLng;

/* loaded from: classes3.dex */
abstract class zzl extends CircularBounds {
    private final LatLng zza;
    private final double zzb;

    public zzl(LatLng latLng, double d5) {
        if (latLng == null) {
            throw new NullPointerException("Null center");
        }
        this.zza = latLng;
        this.zzb = d5;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof CircularBounds) {
            CircularBounds circularBounds = (CircularBounds) obj;
            if (this.zza.equals(circularBounds.getCenter()) && Double.doubleToLongBits(this.zzb) == Double.doubleToLongBits(circularBounds.getRadius())) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.model.CircularBounds
    public final LatLng getCenter() {
        return this.zza;
    }

    @Override // com.google.android.libraries.places.api.model.CircularBounds
    public final double getRadius() {
        return this.zzb;
    }

    public final int hashCode() {
        return ((this.zza.hashCode() ^ 1000003) * 1000003) ^ ((int) ((Double.doubleToLongBits(this.zzb) >>> 32) ^ Double.doubleToLongBits(this.zzb)));
    }

    public final String toString() {
        StringBuilder sbK = u4.k("CircularBounds{center=", this.zza.toString(), ", radius=");
        sbK.append(this.zzb);
        sbK.append("}");
        return sbK.toString();
    }
}
