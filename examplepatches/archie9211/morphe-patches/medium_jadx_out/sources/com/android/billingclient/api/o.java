package com.android.billingclient.api;

import android.os.Bundle;
import com.android.billingclient.api.BillingResult;
import defpackage.cbg;
import defpackage.d0g;
import defpackage.lbg;
import defpackage.m2g;
import defpackage.qk7;
import defpackage.rxf;
import defpackage.zjf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class o {
    public static BillingResult a(Bundle bundle, String str, int i, d0g d0gVar, int i2) {
        if (!bundle.containsKey("BILLING_RESULT")) {
            rxf.i(str, "delegateToBackendAsync does not contain a billing result in the response");
            cbg cbgVar = cbg.MISSING_BILLING_RESULT_IN_DELEGATE_TO_BACKEND_RESPONSE;
            BillingResult billingResult = n.h;
            qk7.F(cbgVar, billingResult, d0gVar, i, i2);
            return billingResult;
        }
        try {
            byte[] byteArray = bundle.getByteArray("BILLING_RESULT");
            if (byteArray == null) {
                throw new Exception("Billing result is null");
            }
            m2g m2gVarR = m2g.r(byteArray);
            BillingResult.Builder builderNewBuilder = BillingResult.newBuilder();
            builderNewBuilder.setResponseCode(m2gVarR.q());
            builderNewBuilder.setDebugMessage(m2gVarR.s());
            BillingResult billingResultBuild = builderNewBuilder.build();
            if (billingResultBuild.getResponseCode() != 0) {
                qk7.F(cbg.BILLING_RESULT_RECEIVED_FROM_PHONESKY, billingResultBuild, d0gVar, i, i2);
                return billingResultBuild;
            }
            if (bundle.containsKey("RESPONSE_DATA")) {
                return billingResultBuild;
            }
            rxf.i(str, "delegateToBackendAsync returned a bundle with neither an error nor response data");
            cbg cbgVar2 = cbg.MISSING_RESPONSE_DATA_IN_DELEGATE_TO_BACKEND_RESPONSE;
            BillingResult billingResult2 = n.h;
            qk7.F(cbgVar2, billingResult2, d0gVar, i, i2);
            return billingResult2;
        } catch (Exception e) {
            rxf.j(str, "Failed parsing BillingResult.", e);
            cbg cbgVar3 = cbg.ERROR_DECODING_DELEGATE_TO_BACKEND_BILLING_RESULT;
            BillingResult billingResult3 = n.h;
            ((zjf) d0gVar).n(zzcy.zzb(cbgVar3, i, billingResult3, zzcy.zza(e), lbg.BROADCAST_ACTION_UNSPECIFIED), i2);
            return billingResult3;
        }
    }
}
