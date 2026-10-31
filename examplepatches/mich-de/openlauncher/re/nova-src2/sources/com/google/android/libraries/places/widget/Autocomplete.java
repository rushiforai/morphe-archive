package com.google.android.libraries.places.widget;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.util.TypedValue;
import androidx.annotation.RecentlyNonNull;
import com.google.android.gms.common.api.Status;
import com.google.android.libraries.places.api.model.LocationBias;
import com.google.android.libraries.places.api.model.LocationRestriction;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.api.model.TypeFilter;
import com.google.android.libraries.places.internal.zzkd;
import com.google.android.libraries.places.internal.zzkr;
import com.google.android.libraries.places.internal.zzks;
import com.google.android.libraries.places.internal.zzkt;
import com.google.android.libraries.places.internal.zzkw;
import com.google.android.libraries.places.widget.model.AutocompleteActivityMode;
import java.util.List;

/* loaded from: classes3.dex */
public final class Autocomplete {

    public static class IntentBuilder {
        private final zzks zza;

        public IntentBuilder(zzkt zzktVar) {
            this.zza = zzktVar.zzg();
        }

        @RecentlyNonNull
        public Intent build(@RecentlyNonNull Context context) throws Throwable {
            try {
                Intent intent = new Intent(context, (Class<?>) AutocompleteActivity.class);
                zzks zzksVar = this.zza;
                Resources.Theme theme = context.getTheme();
                TypedValue typedValue = new TypedValue();
                if (theme.resolveAttribute(16843827, typedValue, true)) {
                    zzksVar.zzi(typedValue.data);
                }
                TypedValue typedValue2 = new TypedValue();
                if (theme.resolveAttribute(16843828, typedValue2, true)) {
                    zzksVar.zzj(typedValue2.data);
                }
                intent.putExtra("places/AutocompleteOptions", this.zza.zzn());
                return intent;
            } catch (Error e3) {
                e = e3;
                zzkd.zzb(e);
                throw e;
            } catch (RuntimeException e11) {
                e = e11;
                zzkd.zzb(e);
                throw e;
            }
        }

        @RecentlyNonNull
        public IntentBuilder setCountries(@RecentlyNonNull List<String> list) {
            this.zza.zza(list);
            return this;
        }

        @RecentlyNonNull
        @Deprecated
        public IntentBuilder setCountry(String str) {
            this.zza.zzo(str);
            return this;
        }

        @RecentlyNonNull
        public IntentBuilder setHint(String str) {
            this.zza.zzb(str);
            return this;
        }

        @RecentlyNonNull
        public IntentBuilder setInitialQuery(String str) {
            this.zza.zzc(str);
            return this;
        }

        @RecentlyNonNull
        public IntentBuilder setLocationBias(LocationBias locationBias) {
            this.zza.zzd(locationBias);
            return this;
        }

        @RecentlyNonNull
        public IntentBuilder setLocationRestriction(LocationRestriction locationRestriction) {
            this.zza.zze(locationRestriction);
            return this;
        }

        @RecentlyNonNull
        public IntentBuilder setRegionCode(String str) {
            this.zza.zzk(str);
            return this;
        }

        @RecentlyNonNull
        @Deprecated
        public IntentBuilder setTypeFilter(TypeFilter typeFilter) {
            this.zza.zzl(typeFilter);
            return this;
        }

        @RecentlyNonNull
        public IntentBuilder setTypesFilter(@RecentlyNonNull List<String> list) {
            this.zza.zzm(list);
            return this;
        }

        public final IntentBuilder zza(zzkr zzkrVar) {
            this.zza.zzg(zzkrVar);
            return this;
        }

        public IntentBuilder(@RecentlyNonNull AutocompleteActivityMode autocompleteActivityMode, @RecentlyNonNull List<Place.Field> list) {
            this.zza = zzkt.zzo(autocompleteActivityMode, list, zzkr.INTENT);
        }
    }

    private Autocomplete() {
    }

    @RecentlyNonNull
    public static Place getPlaceFromIntent(@RecentlyNonNull Intent intent) {
        return zzkw.zzb(intent);
    }

    @RecentlyNonNull
    public static Status getStatusFromIntent(@RecentlyNonNull Intent intent) {
        return zzkw.zza(intent);
    }
}
