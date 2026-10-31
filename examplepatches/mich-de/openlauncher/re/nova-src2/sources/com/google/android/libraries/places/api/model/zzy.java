package com.google.android.libraries.places.api.model;

import b.u4;

/* loaded from: classes3.dex */
abstract class zzy extends PlaceLikelihood {
    private final Place zza;
    private final double zzb;

    public zzy(Place place, double d5) {
        if (place == null) {
            throw new NullPointerException("Null place");
        }
        this.zza = place;
        this.zzb = d5;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof PlaceLikelihood) {
            PlaceLikelihood placeLikelihood = (PlaceLikelihood) obj;
            if (this.zza.equals(placeLikelihood.getPlace()) && Double.doubleToLongBits(this.zzb) == Double.doubleToLongBits(placeLikelihood.getLikelihood())) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.libraries.places.api.model.PlaceLikelihood
    public final double getLikelihood() {
        return this.zzb;
    }

    @Override // com.google.android.libraries.places.api.model.PlaceLikelihood
    public final Place getPlace() {
        return this.zza;
    }

    public final int hashCode() {
        return ((this.zza.hashCode() ^ 1000003) * 1000003) ^ ((int) ((Double.doubleToLongBits(this.zzb) >>> 32) ^ Double.doubleToLongBits(this.zzb)));
    }

    public final String toString() {
        StringBuilder sbK = u4.k("PlaceLikelihood{place=", this.zza.toString(), ", likelihood=");
        sbK.append(this.zzb);
        sbK.append("}");
        return sbK.toString();
    }
}
