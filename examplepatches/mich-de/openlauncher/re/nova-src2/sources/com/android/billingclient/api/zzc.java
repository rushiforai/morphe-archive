package com.android.billingclient.api;

import b.c0;
import java.util.Objects;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class zzc {
    private final String zza;
    private final String zzb;
    private final String zzc;

    public /* synthetic */ zzc(JSONObject jSONObject, zzd zzdVar) {
        this.zza = jSONObject.optString("productId");
        this.zzb = jSONObject.optString("productType");
        String strOptString = jSONObject.optString("offerToken");
        this.zzc = true == strOptString.isEmpty() ? null : strOptString;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zzc)) {
            return false;
        }
        zzc zzcVar = (zzc) obj;
        return this.zza.equals(zzcVar.zza) && this.zzb.equals(zzcVar.zzb) && Objects.equals(this.zzc, zzcVar.zzc);
    }

    public final int hashCode() {
        return Objects.hash(this.zza, this.zzb, this.zzc);
    }

    public final String toString() {
        String str = this.zza;
        String str2 = this.zzb;
        return c0.q(c0.w("{id: ", str, ", type: ", str2, ", offer token: "), this.zzc, "}");
    }
}
