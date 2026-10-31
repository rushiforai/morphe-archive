package com.google.android.libraries.places.api.net;

import androidx.annotation.RecentlyNonNull;
import androidx.annotation.RecentlyNullable;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.libraries.places.api.model.AutocompleteSessionToken;
import com.google.android.libraries.places.api.model.LocationBias;
import com.google.android.libraries.places.api.model.LocationRestriction;
import com.google.android.libraries.places.api.model.TypeFilter;
import com.google.android.libraries.places.internal.zzjt;
import com.google.android.libraries.places.internal.zznx;
import fi.a;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class FindAutocompletePredictionsRequest implements zzjt {

    public static abstract class Builder {
        @RecentlyNonNull
        public FindAutocompletePredictionsRequest build() {
            setCountries(zznx.zzj(getCountries()));
            setTypesFilter(zznx.zzj(getTypesFilter()));
            return zza();
        }

        @RecentlyNullable
        public abstract a getCancellationToken();

        @RecentlyNonNull
        public abstract List<String> getCountries();

        @RecentlyNullable
        public abstract Integer getInputOffset();

        @RecentlyNullable
        public abstract LocationBias getLocationBias();

        @RecentlyNullable
        public abstract LocationRestriction getLocationRestriction();

        @RecentlyNullable
        public abstract LatLng getOrigin();

        @RecentlyNullable
        public abstract String getQuery();

        @RecentlyNullable
        public abstract String getRegionCode();

        @RecentlyNullable
        public abstract AutocompleteSessionToken getSessionToken();

        @RecentlyNullable
        @Deprecated
        public abstract TypeFilter getTypeFilter();

        @RecentlyNonNull
        public abstract List<String> getTypesFilter();

        @RecentlyNonNull
        public abstract Builder setCancellationToken(a aVar);

        @RecentlyNonNull
        public abstract Builder setCountries(@RecentlyNonNull List<String> list);

        @RecentlyNonNull
        public Builder setCountries(@RecentlyNonNull String... strArr) {
            return setCountries(zznx.zzk(strArr));
        }

        @RecentlyNonNull
        @Deprecated
        public Builder setCountry(String str) {
            setCountries(str == null ? zznx.zzl() : zznx.zzm(str));
            return this;
        }

        @RecentlyNonNull
        public abstract Builder setInputOffset(Integer num);

        @RecentlyNonNull
        public abstract Builder setLocationBias(LocationBias locationBias);

        @RecentlyNonNull
        public abstract Builder setLocationRestriction(LocationRestriction locationRestriction);

        @RecentlyNonNull
        public abstract Builder setOrigin(LatLng latLng);

        @RecentlyNonNull
        public abstract Builder setQuery(String str);

        @RecentlyNonNull
        public abstract Builder setRegionCode(String str);

        @RecentlyNonNull
        public abstract Builder setSessionToken(AutocompleteSessionToken autocompleteSessionToken);

        @RecentlyNonNull
        @Deprecated
        public abstract Builder setTypeFilter(TypeFilter typeFilter);

        @RecentlyNonNull
        public abstract Builder setTypesFilter(@RecentlyNonNull List<String> list);

        public abstract FindAutocompletePredictionsRequest zza();
    }

    @RecentlyNonNull
    public static Builder builder() {
        zzm zzmVar = new zzm();
        zzmVar.setCountries(new ArrayList());
        zzmVar.setTypesFilter(new ArrayList());
        return zzmVar;
    }

    @RecentlyNonNull
    public static FindAutocompletePredictionsRequest newInstance(String str) {
        Builder builder = builder();
        builder.setQuery(str);
        return builder.build();
    }

    @Override // com.google.android.libraries.places.internal.zzjt
    @RecentlyNullable
    public abstract a getCancellationToken();

    @RecentlyNonNull
    public abstract List<String> getCountries();

    @RecentlyNullable
    @Deprecated
    public String getCountry() {
        if (getCountries().size() > 1) {
            throw new UnsupportedOperationException("Multiple countries found in this request - use getCountries() instead of getCountry().");
        }
        Iterator<T> it = getCountries().iterator();
        return (String) (it.hasNext() ? it.next() : null);
    }

    @RecentlyNullable
    public abstract Integer getInputOffset();

    @RecentlyNullable
    public abstract LocationBias getLocationBias();

    @RecentlyNullable
    public abstract LocationRestriction getLocationRestriction();

    @RecentlyNullable
    public abstract LatLng getOrigin();

    @RecentlyNullable
    public abstract String getQuery();

    @RecentlyNullable
    public abstract String getRegionCode();

    @RecentlyNullable
    public abstract AutocompleteSessionToken getSessionToken();

    @RecentlyNullable
    @Deprecated
    public abstract TypeFilter getTypeFilter();

    @RecentlyNonNull
    public abstract List<String> getTypesFilter();
}
