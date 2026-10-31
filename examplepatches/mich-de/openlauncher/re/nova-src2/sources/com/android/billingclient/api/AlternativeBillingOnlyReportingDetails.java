package com.android.billingclient.api;

import org.json.JSONException;
import org.json.JSONObject;

@zzf
/* loaded from: classes2.dex */
public final class AlternativeBillingOnlyReportingDetails {
    private final String externalTransactionToken;

    public AlternativeBillingOnlyReportingDetails(String str) throws JSONException {
        this.externalTransactionToken = new JSONObject(str).optString("externalTransactionToken");
    }

    public String getExternalTransactionToken() {
        return this.externalTransactionToken;
    }
}
