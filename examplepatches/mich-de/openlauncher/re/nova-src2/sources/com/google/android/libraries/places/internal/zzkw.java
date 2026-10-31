package com.google.android.libraries.places.internal;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import com.google.android.gms.common.api.Status;
import com.google.android.libraries.places.api.Places;
import com.google.android.libraries.places.api.model.Place;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class zzkw {
    public static Status zza(Intent intent) {
        try {
            zzmt.zzc(intent, "Intent must not be null.");
            Status status = (Status) intent.getParcelableExtra("places/status");
            zzmt.zzc(status, "Intent expected to contain a Status, but doesn't.");
            return status;
        } catch (Error | RuntimeException e3) {
            zzkd.zzb(e3);
            throw e3;
        }
    }

    public static Place zzb(Intent intent) {
        try {
            zzmt.zzc(intent, "Intent must not be null.");
            Place place = (Place) intent.getParcelableExtra("places/selected_place");
            zzmt.zzc(place, "Intent expected to contain a Place, but doesn't.");
            return place;
        } catch (Error | RuntimeException e3) {
            zzkd.zzb(e3);
            throw e3;
        }
    }

    public static String zzc(Context context, int i5) {
        Locale locale = context.getResources().getConfiguration().getLocales().get(0);
        Locale localeZzb = Places.isInitialized() ? Places.zzc().zzb() : locale;
        if (localeZzb.equals(locale)) {
            return context.getResources().getString(i5);
        }
        Configuration configuration = new Configuration(context.getResources().getConfiguration());
        configuration.setLocale(localeZzb);
        return context.createConfigurationContext(configuration).getResources().getString(i5);
    }
}
