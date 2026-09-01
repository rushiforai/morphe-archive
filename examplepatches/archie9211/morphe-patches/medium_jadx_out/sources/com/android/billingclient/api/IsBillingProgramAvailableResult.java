package com.android.billingclient.api;

import defpackage.g76;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0014\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0083\u0004J\n\u0010\u0012\u001a\u00020\u0013HÖ\u0081\u0004J\n\u0010\u0014\u001a\u00020\u0015HÖ\u0081\u0004R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0016"}, d2 = {"Lcom/android/billingclient/api/IsBillingProgramAvailableResult;", "", "billingResult", "Lcom/android/billingclient/api/BillingResult;", "billingProgramAvailabilityDetails", "Lcom/android/billingclient/api/BillingProgramAvailabilityDetails;", "<init>", "(Lcom/android/billingclient/api/BillingResult;Lcom/android/billingclient/api/BillingProgramAvailabilityDetails;)V", "getBillingResult", "()Lcom/android/billingclient/api/BillingResult;", "getBillingProgramAvailabilityDetails", "()Lcom/android/billingclient/api/BillingProgramAvailabilityDetails;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "", "java.com.google.android.libraries.play.billing.public.ktbilling_granule"}, k = 1, mv = {2, 3, 0}, xi = 48)
public final /* data */ class IsBillingProgramAvailableResult {
    private final BillingResult zza;
    private final BillingProgramAvailabilityDetails zzb;

    public IsBillingProgramAvailableResult(BillingResult billingResult, BillingProgramAvailabilityDetails billingProgramAvailabilityDetails) {
        billingResult.getClass();
        billingProgramAvailabilityDetails.getClass();
        this.zza = billingResult;
        this.zzb = billingProgramAvailabilityDetails;
    }

    public static /* synthetic */ IsBillingProgramAvailableResult copy$default(IsBillingProgramAvailableResult isBillingProgramAvailableResult, BillingResult billingResult, BillingProgramAvailabilityDetails billingProgramAvailabilityDetails, int i, Object obj) {
        if ((i & 1) != 0) {
            billingResult = isBillingProgramAvailableResult.zza;
        }
        if ((i & 2) != 0) {
            billingProgramAvailabilityDetails = isBillingProgramAvailableResult.zzb;
        }
        return isBillingProgramAvailableResult.copy(billingResult, billingProgramAvailabilityDetails);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final BillingResult getZza() {
        return this.zza;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final BillingProgramAvailabilityDetails getZzb() {
        return this.zzb;
    }

    public final IsBillingProgramAvailableResult copy(BillingResult billingResult, BillingProgramAvailabilityDetails billingProgramAvailabilityDetails) {
        billingResult.getClass();
        billingProgramAvailabilityDetails.getClass();
        return new IsBillingProgramAvailableResult(billingResult, billingProgramAvailabilityDetails);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof IsBillingProgramAvailableResult)) {
            return false;
        }
        IsBillingProgramAvailableResult isBillingProgramAvailableResult = (IsBillingProgramAvailableResult) other;
        return g76.L(this.zza, isBillingProgramAvailableResult.zza) && g76.L(this.zzb, isBillingProgramAvailableResult.zzb);
    }

    public final BillingProgramAvailabilityDetails getBillingProgramAvailabilityDetails() {
        return this.zzb;
    }

    public final BillingResult getBillingResult() {
        return this.zza;
    }

    public int hashCode() {
        return this.zzb.hashCode() + (this.zza.hashCode() * 31);
    }

    public String toString() {
        return "IsBillingProgramAvailableResult(billingResult=" + this.zza + ", billingProgramAvailabilityDetails=" + this.zzb + ")";
    }
}
