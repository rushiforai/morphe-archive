package com.google.android.libraries.places.api.net;

import androidx.annotation.RecentlyNonNull;
import com.google.android.libraries.places.api.model.PlaceLikelihood;
import com.google.android.libraries.places.internal.zznx;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class FindCurrentPlaceResponse {
    @RecentlyNonNull
    public static FindCurrentPlaceResponse newInstance(@RecentlyNonNull List<PlaceLikelihood> list) {
        return new zzt(zznx.zzj(list));
    }

    @RecentlyNonNull
    public abstract List<PlaceLikelihood> getPlaceLikelihoods();
}
