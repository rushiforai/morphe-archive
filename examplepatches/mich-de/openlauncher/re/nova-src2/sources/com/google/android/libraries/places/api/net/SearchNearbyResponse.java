package com.google.android.libraries.places.api.net;

import androidx.annotation.RecentlyNonNull;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.internal.zznx;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class SearchNearbyResponse {
    @RecentlyNonNull
    public static SearchNearbyResponse newInstance(@RecentlyNonNull List<Place> list) {
        return new zzaf(zznx.zzj(list));
    }

    @RecentlyNonNull
    public abstract List<Place> getPlaces();
}
