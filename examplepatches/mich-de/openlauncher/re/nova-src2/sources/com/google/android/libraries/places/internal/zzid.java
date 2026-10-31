package com.google.android.libraries.places.internal;

import android.text.TextUtils;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.libraries.places.api.model.AutocompletePrediction;
import com.google.android.libraries.places.api.net.FindAutocompletePredictionsResponse;
import com.google.android.libraries.places.api.net.PlacesStatusCodes;
import com.google.android.libraries.places.internal.zzhq;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes3.dex */
public final class zzid {
    public static final FindAutocompletePredictionsResponse zza(zzic zzicVar) throws ApiException {
        int iZza = zzjb.zza(zzicVar.status);
        if (PlacesStatusCodes.isError(iZza)) {
            throw new ApiException(new Status(iZza, zzjb.zzb(zzicVar.status, zzicVar.errorMessage), null, null));
        }
        ArrayList arrayList = new ArrayList();
        zzhq[] zzhqVarArr = zzicVar.predictions;
        if (zzhqVarArr != null) {
            for (zzhq zzhqVar : zzhqVarArr) {
                if (zzhqVar == null || TextUtils.isEmpty(zzhqVar.zzf())) {
                    throw new ApiException(new Status(8, "Unexpected server error: Place ID not provided for an autocomplete prediction result", null, null));
                }
                AutocompletePrediction.Builder builder = AutocompletePrediction.builder(zzhqVar.zzf());
                builder.setDistanceMeters(zzhqVar.zzd());
                builder.setPlaceTypes(zzix.zzd(zzix.zze(zzhqVar.zzc())));
                builder.setTypes(zzix.zzd(zzix.zzf(zzhqVar.zzc())));
                builder.setFullText(zznb.zzc(zzhqVar.zze()));
                builder.zza(zzb(zzhqVar.zzb()));
                zzhq.zza zzaVarZza = zzhqVar.zza();
                if (zzaVarZza != null) {
                    builder.setPrimaryText(zznb.zzc(zzaVarZza.zzc()));
                    builder.zzc(zzb(zzaVarZza.zza()));
                    builder.setSecondaryText(zznb.zzc(zzaVarZza.zzd()));
                    builder.zzd(zzb(zzaVarZza.zzb()));
                }
                arrayList.add(builder.build());
            }
        }
        return FindAutocompletePredictionsResponse.newInstance(arrayList);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static List zzb(List list) throws ApiException {
        ArrayList arrayList = new ArrayList();
        zzoy zzoyVarListIterator = ((zznx) list).listIterator(0);
        while (zzoyVarListIterator.hasNext()) {
            zzhq.zzb zzbVar = (zzhq.zzb) zzoyVarListIterator.next();
            Status status = new Status(8, "Unexpected server error: Place ID not provided for an autocomplete prediction result", null, null);
            if (zzbVar == null) {
                throw new ApiException(status);
            }
            Integer num = zzbVar.offset;
            Integer num2 = zzbVar.length;
            if (num == null || num2 == null) {
                throw new ApiException(status);
            }
            com.google.android.libraries.places.api.model.zzbx zzbxVarZzc = com.google.android.libraries.places.api.model.zzby.zzc();
            zzbxVarZzc.zzb(num.intValue());
            zzbxVarZzc.zza(num2.intValue());
            arrayList.add(zzbxVarZzc.zzc());
        }
        return arrayList;
    }
}
