package com.google.android.libraries.places.api.model;

import android.os.Parcelable;
import android.text.SpannableString;
import android.text.style.CharacterStyle;
import androidx.annotation.RecentlyNonNull;
import androidx.annotation.RecentlyNullable;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.internal.zznx;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class AutocompletePrediction implements Parcelable {

    public static abstract class Builder {
        @RecentlyNonNull
        public AutocompletePrediction build() {
            AutocompletePrediction autocompletePredictionZze = zze();
            setPlaceTypes(zznx.zzj(autocompletePredictionZze.getPlaceTypes()));
            setTypes(zznx.zzj(autocompletePredictionZze.getTypes()));
            zza(zznx.zzj(autocompletePredictionZze.zzd()));
            zzc(zznx.zzj(autocompletePredictionZze.zze()));
            zzd(zznx.zzj(autocompletePredictionZze.zzf()));
            return zze();
        }

        @RecentlyNullable
        public abstract Integer getDistanceMeters();

        @RecentlyNonNull
        public abstract String getFullText();

        @RecentlyNonNull
        public abstract List<Place.Type> getPlaceTypes();

        @RecentlyNonNull
        public abstract String getPrimaryText();

        @RecentlyNonNull
        public abstract String getSecondaryText();

        @RecentlyNonNull
        public abstract List<String> getTypes();

        @RecentlyNonNull
        public abstract Builder setDistanceMeters(Integer num);

        @RecentlyNonNull
        public abstract Builder setFullText(@RecentlyNonNull String str);

        @RecentlyNonNull
        public abstract Builder setPlaceTypes(@RecentlyNonNull List<Place.Type> list);

        @RecentlyNonNull
        public abstract Builder setPrimaryText(@RecentlyNonNull String str);

        @RecentlyNonNull
        public abstract Builder setSecondaryText(@RecentlyNonNull String str);

        @RecentlyNonNull
        public abstract Builder setTypes(@RecentlyNonNull List<String> list);

        @RecentlyNonNull
        public abstract Builder zza(@RecentlyNonNull List list);

        public abstract Builder zzb(String str);

        @RecentlyNonNull
        public abstract Builder zzc(@RecentlyNonNull List list);

        @RecentlyNonNull
        public abstract Builder zzd(@RecentlyNonNull List list);

        public abstract AutocompletePrediction zze();
    }

    @RecentlyNonNull
    public static Builder builder(@RecentlyNonNull String str) {
        zzg zzgVar = new zzg();
        zzgVar.zza(new ArrayList());
        zzgVar.zzb(str);
        zzgVar.setPlaceTypes(new ArrayList());
        zzgVar.zzc(new ArrayList());
        zzgVar.zzd(new ArrayList());
        zzgVar.setTypes(new ArrayList());
        zzgVar.setFullText(b.f42142b);
        zzgVar.setPrimaryText(b.f42142b);
        zzgVar.setSecondaryText(b.f42142b);
        return zzgVar;
    }

    private static final SpannableString zzg(String str, List list, CharacterStyle characterStyle) {
        SpannableString spannableString = new SpannableString(str);
        if (str.length() != 0 && characterStyle != null && !list.isEmpty()) {
            Iterator it = list.iterator();
            while (it.hasNext()) {
                zzby zzbyVar = (zzby) it.next();
                spannableString.setSpan(CharacterStyle.wrap(characterStyle), zzbyVar.zzb(), zzbyVar.zza() + zzbyVar.zzb(), 0);
            }
        }
        return spannableString;
    }

    @RecentlyNullable
    public abstract Integer getDistanceMeters();

    @RecentlyNonNull
    public SpannableString getFullText(CharacterStyle characterStyle) {
        return zzg(zza(), zzd(), characterStyle);
    }

    @RecentlyNonNull
    public abstract String getPlaceId();

    @RecentlyNonNull
    @Deprecated
    public abstract List<Place.Type> getPlaceTypes();

    @RecentlyNonNull
    public SpannableString getPrimaryText(CharacterStyle characterStyle) {
        return zzg(zzb(), zze(), characterStyle);
    }

    @RecentlyNonNull
    public SpannableString getSecondaryText(CharacterStyle characterStyle) {
        return zzg(zzc(), zzf(), characterStyle);
    }

    @RecentlyNonNull
    public abstract List<String> getTypes();

    public abstract String zza();

    public abstract String zzb();

    public abstract String zzc();

    public abstract List zzd();

    public abstract List zze();

    public abstract List zzf();
}
