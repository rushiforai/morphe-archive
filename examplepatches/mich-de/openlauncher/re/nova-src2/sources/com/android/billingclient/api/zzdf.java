package com.android.billingclient.api;

/* loaded from: classes2.dex */
enum zzdf {
    GET_BILLING_CONFIG("getBillingConfig", 29),
    IS_BILLING_PROGRAM_AVAILABLE_ASYNC("isIndirectBillingProgramAvailable", 33),
    CREATE_BILLING_PROGRAM_REPORTING_DETAILS_ASYNC("createIndirectBillingReportingDetails", 35);

    private final String zze;
    private final int zzf;

    zzdf(String str, int i5) {
        this.zze = str;
        this.zzf = i5;
    }

    public final String zza() {
        return this.zze;
    }

    public final int zzb() {
        return this.zzf;
    }
}
