package com.google.android.libraries.places.internal;

import com.android.volley.VolleyError;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tasks.Task;
import fi.a;
import fi.h;
import java.util.Map;
import jb.j;
import jb.k;
import jb.l;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class zzfa {
    private final j zza;
    private final zzij zzb;

    public zzfa(j jVar, zzij zzijVar) {
        this.zza = jVar;
        this.zzb = zzijVar;
    }

    public static /* synthetic */ void zzc(fi.j jVar, VolleyError volleyError) {
        try {
            jVar.b(zzeu.zza(volleyError));
        } catch (Error | RuntimeException e3) {
            zzkd.zzb(e3);
            throw e3;
        }
    }

    public final Task zza(zzfi zzfiVar, final Class cls) {
        String strZzc = zzfiVar.zzc();
        Map mapZzd = zzfiVar.zzd();
        a aVarZza = zzfiVar.zza();
        final fi.j jVar = aVarZza != null ? new fi.j(aVarZza) : new fi.j();
        final zzez zzezVar = new zzez(this, 0, strZzc, null, new l() { // from class: com.google.android.libraries.places.internal.zzew
            @Override // jb.l
            public final void onResponse(Object obj) {
                this.zza.zzb(cls, jVar, (JSONObject) obj);
            }
        }, new k() { // from class: com.google.android.libraries.places.internal.zzex
            @Override // jb.k
            public final void onErrorResponse(VolleyError volleyError) {
                zzfa.zzc(jVar, volleyError);
            }
        }, mapZzd);
        if (aVarZza != null) {
            aVarZza.a(new h() { // from class: com.google.android.libraries.places.internal.zzey
                @Override // fi.h
                public final void onCanceled() {
                    zzezVar.cancel();
                }
            });
        }
        this.zza.a(zzezVar);
        return jVar.f55135a;
    }

    public final void zzb(Class cls, fi.j jVar, JSONObject jSONObject) {
        try {
            try {
                jVar.c((zzfj) this.zzb.zza(jSONObject.toString(), cls));
            } catch (zzfk e3) {
                jVar.b(new ApiException(new Status(8, e3.getMessage(), null, null)));
            }
        } catch (Error | RuntimeException e11) {
            zzkd.zzb(e11);
            throw e11;
        }
    }
}
