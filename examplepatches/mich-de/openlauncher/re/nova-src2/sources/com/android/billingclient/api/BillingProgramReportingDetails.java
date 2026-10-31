package com.android.billingclient.api;

@zzh
/* loaded from: classes2.dex */
public final class BillingProgramReportingDetails {
    private final int billingProgram;
    private final String externalTransactionToken;

    public BillingProgramReportingDetails(String str, int i5) {
        this.externalTransactionToken = str;
        this.billingProgram = i5;
    }

    public int getBillingProgram() {
        return this.billingProgram;
    }

    public String getExternalTransactionToken() {
        return this.externalTransactionToken;
    }
}
