package com.android.billingclient.api;

import androidx.annotation.RecentlyNonNull;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0016"}, d2 = {"Lcom/android/billingclient/api/IsBillingProgramAvailableResult;", b.f42142b, "billingResult", "Lcom/android/billingclient/api/BillingResult;", "billingProgramAvailabilityDetails", "Lcom/android/billingclient/api/BillingProgramAvailabilityDetails;", "<init>", "(Lcom/android/billingclient/api/BillingResult;Lcom/android/billingclient/api/BillingProgramAvailabilityDetails;)V", "getBillingResult", "()Lcom/android/billingclient/api/BillingResult;", "getBillingProgramAvailabilityDetails", "()Lcom/android/billingclient/api/BillingProgramAvailabilityDetails;", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "java.com.google.android.libraries.play.billing.public.ktbilling_granule"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class IsBillingProgramAvailableResult {

    @NotNull
    private final BillingResult zza;

    @NotNull
    private final BillingProgramAvailabilityDetails zzb;

    public IsBillingProgramAvailableResult(@RecentlyNonNull BillingResult billingResult, @RecentlyNonNull BillingProgramAvailabilityDetails billingProgramAvailabilityDetails) {
        Intrinsics.g(billingResult, "billingResult");
        Intrinsics.g(billingProgramAvailabilityDetails, "billingProgramAvailabilityDetails");
        this.zza = billingResult;
        this.zzb = billingProgramAvailabilityDetails;
    }

    @RecentlyNonNull
    public static /* synthetic */ IsBillingProgramAvailableResult copy$default(@RecentlyNonNull IsBillingProgramAvailableResult isBillingProgramAvailableResult, @RecentlyNonNull BillingResult billingResult, @RecentlyNonNull BillingProgramAvailabilityDetails billingProgramAvailabilityDetails, int i5, @RecentlyNonNull Object obj) {
        if ((i5 & 1) != 0) {
            billingResult = isBillingProgramAvailableResult.zza;
        }
        if ((i5 & 2) != 0) {
            billingProgramAvailabilityDetails = isBillingProgramAvailableResult.zzb;
        }
        return isBillingProgramAvailableResult.copy(billingResult, billingProgramAvailabilityDetails);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final BillingResult getZza() {
        return this.zza;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final BillingProgramAvailabilityDetails getZzb() {
        return this.zzb;
    }

    @NotNull
    public final IsBillingProgramAvailableResult copy(@RecentlyNonNull BillingResult billingResult, @RecentlyNonNull BillingProgramAvailabilityDetails billingProgramAvailabilityDetails) {
        Intrinsics.g(billingResult, "billingResult");
        Intrinsics.g(billingProgramAvailabilityDetails, "billingProgramAvailabilityDetails");
        return new IsBillingProgramAvailableResult(billingResult, billingProgramAvailabilityDetails);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof IsBillingProgramAvailableResult)) {
            return false;
        }
        IsBillingProgramAvailableResult isBillingProgramAvailableResult = (IsBillingProgramAvailableResult) other;
        return Intrinsics.b(this.zza, isBillingProgramAvailableResult.zza) && Intrinsics.b(this.zzb, isBillingProgramAvailableResult.zzb);
    }

    @NotNull
    public final BillingProgramAvailabilityDetails getBillingProgramAvailabilityDetails() {
        return this.zzb;
    }

    @NotNull
    public final BillingResult getBillingResult() {
        return this.zza;
    }

    public int hashCode() {
        return this.zzb.hashCode() + (this.zza.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        return "IsBillingProgramAvailableResult(billingResult=" + this.zza + ", billingProgramAvailabilityDetails=" + this.zzb + ")";
    }
}
