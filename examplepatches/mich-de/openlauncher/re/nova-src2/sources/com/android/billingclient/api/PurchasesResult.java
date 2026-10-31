package com.android.billingclient.api;

import a80.m;
import androidx.annotation.RecentlyNonNull;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0017"}, d2 = {"Lcom/android/billingclient/api/PurchasesResult;", b.f42142b, "billingResult", "Lcom/android/billingclient/api/BillingResult;", "purchasesList", b.f42142b, "Lcom/android/billingclient/api/Purchase;", "<init>", "(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V", "getBillingResult", "()Lcom/android/billingclient/api/BillingResult;", "getPurchasesList", "()Ljava/util/List;", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "java.com.google.android.libraries.play.billing.public.ktbilling_granule"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class PurchasesResult {

    @NotNull
    private final BillingResult zza;

    @NotNull
    private final List zzb;

    public PurchasesResult(@RecentlyNonNull BillingResult billingResult, @RecentlyNonNull List<? extends Purchase> purchasesList) {
        Intrinsics.g(billingResult, "billingResult");
        Intrinsics.g(purchasesList, "purchasesList");
        this.zza = billingResult;
        this.zzb = purchasesList;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @RecentlyNonNull
    public static /* synthetic */ PurchasesResult copy$default(@RecentlyNonNull PurchasesResult purchasesResult, @RecentlyNonNull BillingResult billingResult, @RecentlyNonNull List list, int i5, @RecentlyNonNull Object obj) {
        if ((i5 & 1) != 0) {
            billingResult = purchasesResult.zza;
        }
        if ((i5 & 2) != 0) {
            list = purchasesResult.zzb;
        }
        return purchasesResult.copy(billingResult, list);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final BillingResult getZza() {
        return this.zza;
    }

    @NotNull
    public final List<Purchase> component2() {
        return this.zzb;
    }

    @NotNull
    public final PurchasesResult copy(@RecentlyNonNull BillingResult billingResult, @RecentlyNonNull List<? extends Purchase> purchasesList) {
        Intrinsics.g(billingResult, "billingResult");
        Intrinsics.g(purchasesList, "purchasesList");
        return new PurchasesResult(billingResult, purchasesList);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PurchasesResult)) {
            return false;
        }
        PurchasesResult purchasesResult = (PurchasesResult) other;
        return Intrinsics.b(this.zza, purchasesResult.zza) && Intrinsics.b(this.zzb, purchasesResult.zzb);
    }

    @NotNull
    public final BillingResult getBillingResult() {
        return this.zza;
    }

    @NotNull
    public final List<Purchase> getPurchasesList() {
        return this.zzb;
    }

    public int hashCode() {
        return this.zzb.hashCode() + (this.zza.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("PurchasesResult(billingResult=");
        sb2.append(this.zza);
        sb2.append(", purchasesList=");
        return m.j(sb2, this.zzb, ")");
    }
}
