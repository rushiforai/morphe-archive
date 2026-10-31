package com.google.android.libraries.places.internal;

import com.android.volley.AuthFailureError;
import com.android.volley.NetworkError;
import com.android.volley.ParseError;
import com.android.volley.ServerError;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.libraries.places.api.net.PlacesStatusCodes;
import jb.f;

/* loaded from: classes3.dex */
final class zzeu {
    public static ApiException zza(VolleyError volleyError) {
        int i5 = volleyError instanceof NetworkError ? 7 : volleyError instanceof TimeoutError ? 15 : ((volleyError instanceof ServerError) || (volleyError instanceof ParseError)) ? 8 : volleyError instanceof AuthFailureError ? PlacesStatusCodes.REQUEST_DENIED : 13;
        f fVar = volleyError.f21380a;
        return new ApiException(new Status(i5, String.format("Unexpected server error (HTTP Code: %s. Message: %s.)", fVar == null ? "N/A" : String.valueOf(fVar.f69395a), volleyError), null, null));
    }
}
