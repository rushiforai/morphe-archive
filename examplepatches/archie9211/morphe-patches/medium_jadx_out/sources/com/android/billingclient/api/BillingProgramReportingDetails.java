package com.android.billingclient.api;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class BillingProgramReportingDetails {
    private final int billingProgram;
    private final String externalTransactionToken;

    public BillingProgramReportingDetails(String str, int i) {
        this.externalTransactionToken = str;
        this.billingProgram = i;
    }

    public int getBillingProgram() {
        return this.billingProgram;
    }

    public String getExternalTransactionToken() {
        return this.externalTransactionToken;
    }
}
