package com.google.android.libraries.places.internal;

import android.graphics.Bitmap;
import android.widget.ImageView;
import com.android.volley.VolleyError;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tasks.Task;
import com.google.android.libraries.places.api.net.PlacesStatusCodes;
import fi.a;
import fi.h;
import java.util.Map;
import jb.f;
import jb.j;
import jb.k;
import jb.l;

/* loaded from: classes3.dex */
public final class zzfg {
    private final j zza;

    public zzfg(j jVar) {
        this.zza = jVar;
    }

    public static void zza(fi.j jVar, VolleyError volleyError) {
        ApiException apiExceptionZza;
        try {
            f fVar = volleyError.f21380a;
            if (fVar != null) {
                int i5 = fVar.f69395a;
                apiExceptionZza = i5 != 400 ? i5 != 403 ? zzeu.zza(volleyError) : new ApiException(new Status(PlacesStatusCodes.REQUEST_DENIED, "The provided API key is invalid.", null, null)) : new ApiException(new Status(PlacesStatusCodes.INVALID_REQUEST, "The provided parameters are invalid (did you include a max width or height?).", null, null));
            }
            jVar.b(apiExceptionZza);
        } catch (Error | RuntimeException e3) {
            zzkd.zzb(e3);
            throw e3;
        }
    }

    public static /* synthetic */ void zzc(zzhs zzhsVar, fi.j jVar, Bitmap bitmap) {
        try {
            zzhsVar.zzb(bitmap);
            jVar.c(zzhsVar.zza());
        } catch (Error | RuntimeException e3) {
            zzkd.zzb(e3);
            throw e3;
        }
    }

    public final Task zzb(zzfi zzfiVar, final zzhs zzhsVar) {
        String strZzc = zzfiVar.zzc();
        Map mapZzd = zzfiVar.zzd();
        a aVarZza = zzfiVar.zza();
        final fi.j jVar = aVarZza != null ? new fi.j(aVarZza) : new fi.j();
        final zzff zzffVar = new zzff(this, strZzc, new l() { // from class: com.google.android.libraries.places.internal.zzfc
            @Override // jb.l
            public final void onResponse(Object obj) {
                zzfg.zzc(zzhsVar, jVar, (Bitmap) obj);
            }
        }, 0, 0, ImageView.ScaleType.CENTER, Bitmap.Config.ARGB_8888, new k() { // from class: com.google.android.libraries.places.internal.zzfd
            @Override // jb.k
            public final void onErrorResponse(VolleyError volleyError) {
                zzfg.zza(jVar, volleyError);
            }
        }, mapZzd);
        if (aVarZza != null) {
            aVarZza.a(new h() { // from class: com.google.android.libraries.places.internal.zzfe
                @Override // fi.h
                public final void onCanceled() {
                    zzffVar.cancel();
                }
            });
        }
        this.zza.a(zzffVar);
        return jVar.f55135a;
    }
}
