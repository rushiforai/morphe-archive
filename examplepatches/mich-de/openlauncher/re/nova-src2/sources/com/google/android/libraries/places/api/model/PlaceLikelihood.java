package com.google.android.libraries.places.api.model;

import android.os.Parcelable;
import androidx.annotation.RecentlyNonNull;
import com.google.android.libraries.places.internal.zzmt;
import com.google.android.libraries.places.internal.zzok;

/* loaded from: classes3.dex */
public abstract class PlaceLikelihood implements Parcelable {
    public static final double LIKELIHOOD_MAX_VALUE = 1.0d;
    public static final double LIKELIHOOD_MIN_VALUE = 0.0d;

    @RecentlyNonNull
    public static PlaceLikelihood newInstance(@RecentlyNonNull Place place, double d5) {
        Double dValueOf = Double.valueOf(0.0d);
        Double dValueOf2 = Double.valueOf(1.0d);
        zzok zzokVarZzb = zzok.zzb(dValueOf, dValueOf2);
        Double dValueOf3 = Double.valueOf(d5);
        zzmt.zzm(zzokVarZzb.zzd(dValueOf3), "Likelihood must not be out-of-range: %s to %s, but was: %s.", dValueOf, dValueOf2, dValueOf3);
        return new zzbm(place, d5);
    }

    public abstract double getLikelihood();

    @RecentlyNonNull
    public abstract Place getPlace();
}
