package com.android.billingclient.api;

import android.os.Bundle;
import com.android.billingclient.api.BillingResult;
import com.google.android.gms.internal.play_billing.m0;
import com.google.android.gms.internal.play_billing.w4;
import com.google.android.gms.internal.play_billing.z1;

/* loaded from: classes2.dex */
final class zzdh {
    public static BillingResult zza(Bundle bundle, String str, int i5, zzcz zzczVar, int i11) throws Exception {
        if (!bundle.containsKey("BILLING_RESULT")) {
            m0.h(str, "delegateToBackendAsync does not contain a billing result in the response");
            BillingResult billingResult = zzdc.zzh;
            zzde.zza(w4.MISSING_BILLING_RESULT_IN_DELEGATE_TO_BACKEND_RESPONSE, billingResult, zzczVar, i5, i11);
            return billingResult;
        }
        try {
            byte[] byteArray = bundle.getByteArray("BILLING_RESULT");
            if (byteArray == null) {
                throw new Exception("Billing result is null");
            }
            z1 z1VarR = z1.r(byteArray);
            BillingResult.Builder builderNewBuilder = BillingResult.newBuilder();
            builderNewBuilder.setResponseCode(z1VarR.q());
            builderNewBuilder.setDebugMessage(z1VarR.s());
            BillingResult billingResultBuild = builderNewBuilder.build();
            if (billingResultBuild.getResponseCode() != 0) {
                zzde.zza(w4.BILLING_RESULT_RECEIVED_FROM_PHONESKY, billingResultBuild, zzczVar, i5, i11);
                return billingResultBuild;
            }
            if (bundle.containsKey("RESPONSE_DATA")) {
                return billingResultBuild;
            }
            m0.h(str, "delegateToBackendAsync returned a bundle with neither an error nor response data");
            w4 w4Var = w4.MISSING_RESPONSE_DATA_IN_DELEGATE_TO_BACKEND_RESPONSE;
            BillingResult billingResult2 = zzdc.zzh;
            zzde.zza(w4Var, billingResult2, zzczVar, i5, i11);
            return billingResult2;
        } catch (Exception e3) {
            m0.i(str, "Failed parsing BillingResult.", e3);
            BillingResult billingResult3 = zzdc.zzh;
            zzde.zzb(w4.ERROR_DECODING_DELEGATE_TO_BACKEND_BILLING_RESULT, billingResult3, zzczVar, i5, i11, zzcy.zza(e3));
            return billingResult3;
        }
    }
}
