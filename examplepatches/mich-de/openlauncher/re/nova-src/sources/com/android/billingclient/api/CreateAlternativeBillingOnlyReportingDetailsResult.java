package com.android.billingclient.api;

import androidx.annotation.RecentlyNonNull;
import androidx.annotation.RecentlyNullable;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0016"}, d2 = {"Lcom/android/billingclient/api/CreateAlternativeBillingOnlyReportingDetailsResult;", b.f42142b, "billingResult", "Lcom/android/billingclient/api/BillingResult;", "alternativeBillingOnlyReportingDetails", "Lcom/android/billingclient/api/AlternativeBillingOnlyReportingDetails;", "<init>", "(Lcom/android/billingclient/api/BillingResult;Lcom/android/billingclient/api/AlternativeBillingOnlyReportingDetails;)V", "getBillingResult", "()Lcom/android/billingclient/api/BillingResult;", "getAlternativeBillingOnlyReportingDetails", "()Lcom/android/billingclient/api/AlternativeBillingOnlyReportingDetails;", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "java.com.google.android.libraries.play.billing.public.ktbilling_granule"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class CreateAlternativeBillingOnlyReportingDetailsResult {

    @NotNull
    private final BillingResult zza;

    @Nullable
    private final AlternativeBillingOnlyReportingDetails zzb;

    public CreateAlternativeBillingOnlyReportingDetailsResult(@RecentlyNonNull BillingResult billingResult, @Nullable AlternativeBillingOnlyReportingDetails alternativeBillingOnlyReportingDetails) {
        Intrinsics.g(billingResult, "billingResult");
        this.zza = billingResult;
        this.zzb = alternativeBillingOnlyReportingDetails;
    }

    @RecentlyNonNull
    public static /* synthetic */ CreateAlternativeBillingOnlyReportingDetailsResult copy$default(@RecentlyNonNull CreateAlternativeBillingOnlyReportingDetailsResult createAlternativeBillingOnlyReportingDetailsResult, @RecentlyNonNull BillingResult billingResult, @RecentlyNonNull AlternativeBillingOnlyReportingDetails alternativeBillingOnlyReportingDetails, int i5, @RecentlyNonNull Object obj) {
        if ((i5 & 1) != 0) {
            billingResult = createAlternativeBillingOnlyReportingDetailsResult.zza;
        }
        if ((i5 & 2) != 0) {
            alternativeBillingOnlyReportingDetails = createAlternativeBillingOnlyReportingDetailsResult.zzb;
        }
        return createAlternativeBillingOnlyReportingDetailsResult.copy(billingResult, alternativeBillingOnlyReportingDetails);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final BillingResult getZza() {
        return this.zza;
    }

    @RecentlyNullable
    /* renamed from: component2, reason: from getter */
    public final AlternativeBillingOnlyReportingDetails getZzb() {
        return this.zzb;
    }

    @NotNull
    public final CreateAlternativeBillingOnlyReportingDetailsResult copy(@RecentlyNonNull BillingResult billingResult, @Nullable AlternativeBillingOnlyReportingDetails alternativeBillingOnlyReportingDetails) {
        Intrinsics.g(billingResult, "billingResult");
        return new CreateAlternativeBillingOnlyReportingDetailsResult(billingResult, alternativeBillingOnlyReportingDetails);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CreateAlternativeBillingOnlyReportingDetailsResult)) {
            return false;
        }
        CreateAlternativeBillingOnlyReportingDetailsResult createAlternativeBillingOnlyReportingDetailsResult = (CreateAlternativeBillingOnlyReportingDetailsResult) other;
        return Intrinsics.b(this.zza, createAlternativeBillingOnlyReportingDetailsResult.zza) && Intrinsics.b(this.zzb, createAlternativeBillingOnlyReportingDetailsResult.zzb);
    }

    @RecentlyNullable
    public final AlternativeBillingOnlyReportingDetails getAlternativeBillingOnlyReportingDetails() {
        return this.zzb;
    }

    @NotNull
    public final BillingResult getBillingResult() {
        return this.zza;
    }

    public int hashCode() {
        int iHashCode = this.zza.hashCode() * 31;
        AlternativeBillingOnlyReportingDetails alternativeBillingOnlyReportingDetails = this.zzb;
        return iHashCode + (alternativeBillingOnlyReportingDetails == null ? 0 : alternativeBillingOnlyReportingDetails.hashCode());
    }

    @NotNull
    public String toString() {
        return "CreateAlternativeBillingOnlyReportingDetailsResult(billingResult=" + this.zza + ", alternativeBillingOnlyReportingDetails=" + this.zzb + ")";
    }
}
