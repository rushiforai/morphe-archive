package com.android.billingclient.api;

import android.os.Bundle;
import android.os.RemoteException;
import com.android.billingclient.api.BillingResult;
import com.google.android.gms.internal.play_billing.f;
import com.google.android.gms.internal.play_billing.m0;
import com.google.android.gms.internal.play_billing.w4;
import com.google.android.gms.internal.play_billing.z4;
import org.json.JSONException;

/* loaded from: classes2.dex */
final class zzca extends f {
    final BillingConfigResponseListener zza;
    final zzcz zzb;
    final int zzc;

    public zzca(BillingConfigResponseListener billingConfigResponseListener, zzcz zzczVar, int i5, zzch zzchVar) {
        super("com.android.vending.billing.IInAppBillingGetBillingConfigCallback");
        this.zza = billingConfigResponseListener;
        this.zzb = zzczVar;
        this.zzc = i5;
    }

    @Override // com.google.android.gms.internal.play_billing.g
    public final void zza(Bundle bundle) throws RemoteException {
        z4 z4Var = z4.BROADCAST_ACTION_UNSPECIFIED;
        if (bundle == null) {
            zzcz zzczVar = this.zzb;
            BillingResult billingResult = zzdc.zzh;
            zzczVar.zzb(zzcy.zzb(w4.NULL_BUNDLE_FROM_GET_BILLING_CONFIG_SERVICE_CALL, 13, billingResult, null, z4Var), this.zzc);
            this.zza.onBillingConfigResponse(billingResult, null);
            return;
        }
        int iA = m0.a("BillingClient", bundle);
        String strF = m0.f("BillingClient", bundle);
        BillingResult.Builder builderNewBuilder = BillingResult.newBuilder();
        builderNewBuilder.setResponseCode(iA);
        builderNewBuilder.setDebugMessage(strF);
        if (iA != 0) {
            m0.h("BillingClient", "getBillingConfig() failed. Response code: " + iA);
            BillingResult billingResultBuild = builderNewBuilder.build();
            this.zzb.zzb(zzcy.zzb(w4.BILLING_RESULT_RECEIVED_FROM_PHONESKY, 13, billingResultBuild, null, z4Var), this.zzc);
            this.zza.onBillingConfigResponse(billingResultBuild, null);
            return;
        }
        if (!bundle.containsKey("BILLING_CONFIG")) {
            m0.h("BillingClient", "getBillingConfig() returned a bundle with neither an error nor a billing config response");
            builderNewBuilder.setResponseCode(6);
            BillingResult billingResultBuild2 = builderNewBuilder.build();
            this.zzb.zzb(zzcy.zzb(w4.MISSING_BILLING_CONFIG_IN_GET_BILLING_CONFIG_RESPONSE, 13, billingResultBuild2, null, z4Var), this.zzc);
            this.zza.onBillingConfigResponse(billingResultBuild2, null);
            return;
        }
        try {
            this.zza.onBillingConfigResponse(builderNewBuilder.build(), new BillingConfig(bundle.getString("BILLING_CONFIG")));
        } catch (JSONException e3) {
            m0.i("BillingClient", "Got a JSON exception trying to decode BillingConfig. \n Exception: ", e3);
            zzcz zzczVar2 = this.zzb;
            BillingResult billingResult2 = zzdc.zzh;
            zzczVar2.zzb(zzcy.zzb(w4.ERROR_DECODING_BILLING_CONFIG_DATA, 13, billingResult2, null, z4Var), this.zzc);
            this.zza.onBillingConfigResponse(billingResult2, null);
        }
    }
}
