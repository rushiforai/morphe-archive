package com.google.android.libraries.places.internal;

import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.google.android.libraries.places.api.net.PlacesStatusCodes;
import fi.c;

/* loaded from: classes3.dex */
public final /* synthetic */ class zzfr implements c {
    @Override // fi.c
    public final Object then(Task task) {
        ApiException apiException;
        Exception excL = task.l();
        if (excL == null) {
            return task;
        }
        if (excL instanceof ApiException) {
            apiException = (ApiException) excL;
        } else if (excL instanceof zzbdq) {
            zzbdo zzbdoVarZze = zzbdo.zze((zzbdq) excL);
            zzbdj zzbdjVar = zzbdj.OK;
            int iOrdinal = zzbdoVarZze.zza().ordinal();
            apiException = iOrdinal != 3 ? iOrdinal != 4 ? iOrdinal != 5 ? iOrdinal != 7 ? iOrdinal != 13 ? iOrdinal != 14 ? new ApiException(new Status(13, zzbdoVarZze.zzi(), null, null)) : new ApiException(new Status(7, zzbdoVarZze.zzi(), null, null)) : new ApiException(new Status(8, zzbdoVarZze.zzi(), null, null)) : new ApiException(new Status(PlacesStatusCodes.REQUEST_DENIED, zzbdoVarZze.zzi(), null, null)) : new ApiException(new Status(PlacesStatusCodes.NOT_FOUND, zzbdoVarZze.zzi(), null, null)) : new ApiException(new Status(15, zzbdoVarZze.zzi(), null, null)) : new ApiException(new Status(PlacesStatusCodes.INVALID_REQUEST, zzbdoVarZze.zzi(), null, null));
        } else {
            apiException = new ApiException(new Status(13, excL.toString(), null, null));
        }
        return Tasks.c(apiException);
    }
}
