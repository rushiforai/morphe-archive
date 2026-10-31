package com.android.billingclient.api;

import androidx.annotation.RecentlyNonNull;
import androidx.annotation.RecentlyNullable;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0016"}, d2 = {"Lcom/android/billingclient/api/CreateBillingProgramReportingDetailsResult;", b.f42142b, "billingResult", "Lcom/android/billingclient/api/BillingResult;", "billingProgramReportingDetails", "Lcom/android/billingclient/api/BillingProgramReportingDetails;", "<init>", "(Lcom/android/billingclient/api/BillingResult;Lcom/android/billingclient/api/BillingProgramReportingDetails;)V", "getBillingResult", "()Lcom/android/billingclient/api/BillingResult;", "getBillingProgramReportingDetails", "()Lcom/android/billingclient/api/BillingProgramReportingDetails;", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "java.com.google.android.libraries.play.billing.public.ktbilling_granule"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class CreateBillingProgramReportingDetailsResult {

    @NotNull
    private final BillingResult zza;

    @Nullable
    private final BillingProgramReportingDetails zzb;

    public CreateBillingProgramReportingDetailsResult(@RecentlyNonNull BillingResult billingResult, @Nullable BillingProgramReportingDetails billingProgramReportingDetails) {
        Intrinsics.g(billingResult, "billingResult");
        this.zza = billingResult;
        this.zzb = billingProgramReportingDetails;
    }

    @RecentlyNonNull
    public static /* synthetic */ CreateBillingProgramReportingDetailsResult copy$default(@RecentlyNonNull CreateBillingProgramReportingDetailsResult createBillingProgramReportingDetailsResult, @RecentlyNonNull BillingResult billingResult, @RecentlyNonNull BillingProgramReportingDetails billingProgramReportingDetails, int i5, @RecentlyNonNull Object obj) {
        if ((i5 & 1) != 0) {
            billingResult = createBillingProgramReportingDetailsResult.zza;
        }
        if ((i5 & 2) != 0) {
            billingProgramReportingDetails = createBillingProgramReportingDetailsResult.zzb;
        }
        return createBillingProgramReportingDetailsResult.copy(billingResult, billingProgramReportingDetails);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final BillingResult getZza() {
        return this.zza;
    }

    @RecentlyNullable
    /* renamed from: component2, reason: from getter */
    public final BillingProgramReportingDetails getZzb() {
        return this.zzb;
    }

    @NotNull
    public final CreateBillingProgramReportingDetailsResult copy(@RecentlyNonNull BillingResult billingResult, @Nullable BillingProgramReportingDetails billingProgramReportingDetails) {
        Intrinsics.g(billingResult, "billingResult");
        return new CreateBillingProgramReportingDetailsResult(billingResult, billingProgramReportingDetails);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CreateBillingProgramReportingDetailsResult)) {
            return false;
        }
        CreateBillingProgramReportingDetailsResult createBillingProgramReportingDetailsResult = (CreateBillingProgramReportingDetailsResult) other;
        return Intrinsics.b(this.zza, createBillingProgramReportingDetailsResult.zza) && Intrinsics.b(this.zzb, createBillingProgramReportingDetailsResult.zzb);
    }

    @RecentlyNullable
    public final BillingProgramReportingDetails getBillingProgramReportingDetails() {
        return this.zzb;
    }

    @NotNull
    public final BillingResult getBillingResult() {
        return this.zza;
    }

    public int hashCode() {
        int iHashCode = this.zza.hashCode() * 31;
        BillingProgramReportingDetails billingProgramReportingDetails = this.zzb;
        return iHashCode + (billingProgramReportingDetails == null ? 0 : billingProgramReportingDetails.hashCode());
    }

    @NotNull
    public String toString() {
        return "CreateBillingProgramReportingDetailsResult(billingResult=" + this.zza + ", billingProgramReportingDetails=" + this.zzb + ")";
    }
}
