package com.google.android.libraries.places.api.net;

import androidx.annotation.RecentlyNonNull;
import com.google.android.libraries.places.api.model.AutocompletePrediction;
import com.google.android.libraries.places.internal.zznx;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class FindAutocompletePredictionsResponse {
    @RecentlyNonNull
    public static FindAutocompletePredictionsResponse newInstance(@RecentlyNonNull List<AutocompletePrediction> list) {
        return new zzp(zznx.zzj(list));
    }

    @RecentlyNonNull
    public abstract List<AutocompletePrediction> getAutocompletePredictions();
}
