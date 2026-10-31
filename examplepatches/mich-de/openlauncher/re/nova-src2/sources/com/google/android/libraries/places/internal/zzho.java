package com.google.android.libraries.places.internal;

import com.google.android.libraries.places.api.model.AutocompletePrediction;
import com.google.android.libraries.places.api.model.Place;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
final class zzho {
    private final zzhh zza;

    public zzho(zzhh zzhhVar) {
        this.zza = zzhhVar;
    }

    public static final List zzb(List list) {
        ArrayList arrayList = new ArrayList();
        Iterator it = list.iterator();
        while (it.hasNext()) {
            zzamj zzamjVar = (zzamj) it.next();
            int iZzc = zzamjVar.zzc();
            int iZza = zzamjVar.zza() - zzamjVar.zzc();
            com.google.android.libraries.places.api.model.zzbx zzbxVarZzc = com.google.android.libraries.places.api.model.zzby.zzc();
            zzbxVarZzc.zzb(iZzc);
            zzbxVarZzc.zza(iZza);
            arrayList.add(zzbxVarZzc.zzc());
        }
        return arrayList;
    }

    public final AutocompletePrediction zza(zzamm zzammVar) {
        zzamf zzamfVarZza = zzammVar.zza();
        if (!zzammVar.zzd()) {
            throw new IllegalArgumentException("Suggestion does not contain a PlacePrediction.");
        }
        List<Place.Type> listZza = this.zza.zza(zzamfVarZza.zzh());
        if (listZza == null) {
            listZza = zznx.zzl();
        }
        AutocompletePrediction.Builder builder = AutocompletePrediction.builder(zzamfVarZza.zzg());
        builder.setDistanceMeters(Integer.valueOf(zzamfVarZza.zza()));
        builder.setPlaceTypes(listZza);
        builder.setTypes(zznx.zzj(zzamfVarZza.zzh()));
        builder.setFullText(zzamfVarZza.zzc().zzd());
        builder.zza(zzb(zzamfVarZza.zzc().zze()));
        builder.setPrimaryText(zzamfVarZza.zzf().zza().zzd());
        builder.zzc(zzb(zzamfVarZza.zzf().zza().zze()));
        builder.setSecondaryText(zzamfVarZza.zzf().zzc().zzd());
        builder.zzd(zzb(zzamfVarZza.zzf().zzc().zze()));
        return builder.build();
    }
}
