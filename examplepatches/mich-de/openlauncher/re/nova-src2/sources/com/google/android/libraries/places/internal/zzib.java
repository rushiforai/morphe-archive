package com.google.android.libraries.places.internal;

import android.text.TextUtils;
import com.google.android.libraries.places.api.model.TypeFilter;
import com.google.android.libraries.places.api.net.FindAutocompletePredictionsRequest;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/* loaded from: classes3.dex */
final class zzib extends zzik {
    public zzib(FindAutocompletePredictionsRequest findAutocompletePredictionsRequest, Locale locale, String str, boolean z11, zzki zzkiVar) {
        super(findAutocompletePredictionsRequest, locale, str, false, zzkiVar);
    }

    @Override // com.google.android.libraries.places.internal.zzik
    public final String zze() {
        return "autocomplete/json";
    }

    @Override // com.google.android.libraries.places.internal.zzik
    public final Map zzf() {
        HashMap map = new HashMap();
        FindAutocompletePredictionsRequest findAutocompletePredictionsRequest = (FindAutocompletePredictionsRequest) zzb();
        TypeFilter typeFilter = findAutocompletePredictionsRequest.getTypeFilter();
        List<String> typesFilter = findAutocompletePredictionsRequest.getTypesFilter();
        String query = findAutocompletePredictionsRequest.getQuery();
        zzik.zzg(map, "input", query == null ? null : query.replaceFirst("^\\s+", b.f42142b).replaceFirst("\\s+$", " "), null);
        if (typesFilter.isEmpty()) {
            zzik.zzg(map, "types", typeFilter != null ? zzje.zza(typeFilter) : null, null);
        } else {
            zzik.zzg(map, "types", TextUtils.join("|", typesFilter), null);
        }
        zzik.zzg(map, "sessiontoken", findAutocompletePredictionsRequest.getSessionToken(), null);
        zzik.zzg(map, "origin", zzjc.zzb(findAutocompletePredictionsRequest.getOrigin()), null);
        zzik.zzg(map, "locationbias", zzjc.zzc(findAutocompletePredictionsRequest.getLocationBias()), null);
        zzik.zzg(map, "locationrestriction", zzjc.zzd(findAutocompletePredictionsRequest.getLocationRestriction()), null);
        List<String> countries = findAutocompletePredictionsRequest.getCountries();
        StringBuilder sb2 = new StringBuilder();
        for (String str : countries) {
            String strConcat = TextUtils.isEmpty(str) ? null : "country:".concat(String.valueOf(str.toLowerCase(Locale.US)));
            if (strConcat != null) {
                if (sb2.length() != 0) {
                    sb2.append('|');
                }
                sb2.append(strConcat);
            }
        }
        zzik.zzg(map, "components", sb2.length() == 0 ? null : sb2.toString(), null);
        return map;
    }
}
