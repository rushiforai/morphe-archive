package com.android.billingclient.api;

import defpackage.ka1;
import defpackage.y30;
import j$.util.Objects;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
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
        return ka1.v(y30.u("{id: ", str, ", type: ", str2, ", offer token: "), this.zzc, "}");
    }
}
