package com.google.android.libraries.places.api.net;

import androidx.annotation.RecentlyNonNull;
import androidx.annotation.RecentlyNullable;
import com.google.android.libraries.places.api.model.CircularBounds;
import com.google.android.libraries.places.api.model.LocationRestriction;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.internal.zzjt;
import com.google.android.libraries.places.internal.zzmt;
import com.google.android.libraries.places.internal.zznx;
import fi.a;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class SearchNearbyRequest implements zzjt {

    public static abstract class Builder {
        @RecentlyNonNull
        public SearchNearbyRequest build() {
            List<Place.Field> placeFields = getPlaceFields();
            boolean z11 = getLocationRestriction() instanceof CircularBounds;
            List<String> includedTypes = getIncludedTypes();
            List<String> excludedTypes = getExcludedTypes();
            List<String> includedPrimaryTypes = getIncludedPrimaryTypes();
            List<String> excludedPrimaryTypes = getExcludedPrimaryTypes();
            zzmt.zzf(z11, "LocationRestriction must be of type CircularBounds.");
            setPlaceFields(zznx.zzj(placeFields));
            if (includedTypes != null) {
                setIncludedTypes(zznx.zzj(includedTypes));
            }
            if (excludedTypes != null) {
                setExcludedTypes(zznx.zzj(excludedTypes));
            }
            if (includedPrimaryTypes != null) {
                setIncludedPrimaryTypes(zznx.zzj(includedPrimaryTypes));
            }
            if (excludedPrimaryTypes != null) {
                setExcludedPrimaryTypes(zznx.zzj(excludedPrimaryTypes));
            }
            return zza();
        }

        @RecentlyNullable
        public abstract a getCancellationToken();

        @RecentlyNullable
        public abstract List<String> getExcludedPrimaryTypes();

        @RecentlyNullable
        public abstract List<String> getExcludedTypes();

        @RecentlyNullable
        public abstract List<String> getIncludedPrimaryTypes();

        @RecentlyNullable
        public abstract List<String> getIncludedTypes();

        @RecentlyNonNull
        public abstract LocationRestriction getLocationRestriction();

        @RecentlyNullable
        public abstract Integer getMaxResultCount();

        @RecentlyNonNull
        public abstract List<Place.Field> getPlaceFields();

        @RecentlyNullable
        public abstract RankPreference getRankPreference();

        @RecentlyNullable
        public abstract String getRegionCode();

        @RecentlyNonNull
        public abstract Builder setCancellationToken(a aVar);

        @RecentlyNonNull
        public abstract Builder setExcludedPrimaryTypes(List<String> list);

        @RecentlyNonNull
        public abstract Builder setExcludedTypes(List<String> list);

        @RecentlyNonNull
        public abstract Builder setIncludedPrimaryTypes(List<String> list);

        @RecentlyNonNull
        public abstract Builder setIncludedTypes(List<String> list);

        @RecentlyNonNull
        public abstract Builder setLocationRestriction(@RecentlyNonNull LocationRestriction locationRestriction);

        @RecentlyNonNull
        public abstract Builder setMaxResultCount(Integer num);

        @RecentlyNonNull
        public abstract Builder setPlaceFields(@RecentlyNonNull List<Place.Field> list);

        @RecentlyNonNull
        public abstract Builder setRankPreference(RankPreference rankPreference);

        @RecentlyNonNull
        public abstract Builder setRegionCode(String str);

        public abstract SearchNearbyRequest zza();
    }

    public enum RankPreference {
        DISTANCE,
        POPULARITY
    }

    @RecentlyNonNull
    public static Builder builder(@RecentlyNonNull LocationRestriction locationRestriction, @RecentlyNonNull List<Place.Field> list) {
        zzac zzacVar = new zzac();
        zzacVar.setLocationRestriction(locationRestriction);
        zzacVar.setPlaceFields(list);
        return zzacVar;
    }

    @RecentlyNonNull
    public static SearchNearbyRequest newInstance(@RecentlyNonNull LocationRestriction locationRestriction, @RecentlyNonNull List<Place.Field> list) {
        return builder(locationRestriction, list).build();
    }

    @Override // com.google.android.libraries.places.internal.zzjt
    @RecentlyNullable
    public abstract a getCancellationToken();

    @RecentlyNullable
    public abstract List<String> getExcludedPrimaryTypes();

    @RecentlyNullable
    public abstract List<String> getExcludedTypes();

    @RecentlyNullable
    public abstract List<String> getIncludedPrimaryTypes();

    @RecentlyNullable
    public abstract List<String> getIncludedTypes();

    @RecentlyNonNull
    public abstract LocationRestriction getLocationRestriction();

    @RecentlyNullable
    public abstract Integer getMaxResultCount();

    @RecentlyNonNull
    public abstract List<Place.Field> getPlaceFields();

    @RecentlyNullable
    public abstract RankPreference getRankPreference();

    @RecentlyNullable
    public abstract String getRegionCode();
}
