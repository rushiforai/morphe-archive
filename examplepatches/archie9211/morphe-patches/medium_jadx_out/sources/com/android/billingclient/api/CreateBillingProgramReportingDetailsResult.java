package com.android.billingclient.api;

import defpackage.g76;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0014\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0083\u0004J\n\u0010\u0012\u001a\u00020\u0013HÖ\u0081\u0004J\n\u0010\u0014\u001a\u00020\u0015HÖ\u0081\u0004R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0016"}, d2 = {"Lcom/android/billingclient/api/CreateBillingProgramReportingDetailsResult;", "", "billingResult", "Lcom/android/billingclient/api/BillingResult;", "billingProgramReportingDetails", "Lcom/android/billingclient/api/BillingProgramReportingDetails;", "<init>", "(Lcom/android/billingclient/api/BillingResult;Lcom/android/billingclient/api/BillingProgramReportingDetails;)V", "getBillingResult", "()Lcom/android/billingclient/api/BillingResult;", "getBillingProgramReportingDetails", "()Lcom/android/billingclient/api/BillingProgramReportingDetails;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "", "java.com.google.android.libraries.play.billing.public.ktbilling_granule"}, k = 1, mv = {2, 3, 0}, xi = 48)
public final /* data */ class CreateBillingProgramReportingDetailsResult {
    private final BillingResult zza;
    private final BillingProgramReportingDetails zzb;

    public CreateBillingProgramReportingDetailsResult(BillingResult billingResult, BillingProgramReportingDetails billingProgramReportingDetails) {
        billingResult.getClass();
        this.zza = billingResult;
        this.zzb = billingProgramReportingDetails;
    }

    public static /* synthetic */ CreateBillingProgramReportingDetailsResult copy$default(CreateBillingProgramReportingDetailsResult createBillingProgramReportingDetailsResult, BillingResult billingResult, BillingProgramReportingDetails billingProgramReportingDetails, int i, Object obj) {
        if ((i & 1) != 0) {
            billingResult = createBillingProgramReportingDetailsResult.zza;
        }
        if ((i & 2) != 0) {
            billingProgramReportingDetails = createBillingProgramReportingDetailsResult.zzb;
        }
        return createBillingProgramReportingDetailsResult.copy(billingResult, billingProgramReportingDetails);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final BillingResult getZza() {
        return this.zza;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final BillingProgramReportingDetails getZzb() {
        return this.zzb;
    }

    public final CreateBillingProgramReportingDetailsResult copy(BillingResult billingResult, BillingProgramReportingDetails billingProgramReportingDetails) {
        billingResult.getClass();
        return new CreateBillingProgramReportingDetailsResult(billingResult, billingProgramReportingDetails);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CreateBillingProgramReportingDetailsResult)) {
            return false;
        }
        CreateBillingProgramReportingDetailsResult createBillingProgramReportingDetailsResult = (CreateBillingProgramReportingDetailsResult) other;
        return g76.L(this.zza, createBillingProgramReportingDetailsResult.zza) && g76.L(this.zzb, createBillingProgramReportingDetailsResult.zzb);
    }

    public final BillingProgramReportingDetails getBillingProgramReportingDetails() {
        return this.zzb;
    }

    public final BillingResult getBillingResult() {
        return this.zza;
    }

    public int hashCode() {
        int iHashCode = this.zza.hashCode() * 31;
        BillingProgramReportingDetails billingProgramReportingDetails = this.zzb;
        return iHashCode + (billingProgramReportingDetails == null ? 0 : billingProgramReportingDetails.hashCode());
    }

    public String toString() {
        return "CreateBillingProgramReportingDetailsResult(billingResult=" + this.zza + ", billingProgramReportingDetails=" + this.zzb + ")";
    }
}
