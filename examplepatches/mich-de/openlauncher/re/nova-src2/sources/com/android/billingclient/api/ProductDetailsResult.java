package com.android.billingclient.api;

import a80.m;
import androidx.annotation.RecentlyNonNull;
import androidx.annotation.RecentlyNullable;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0011\u0010\u000e\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0003J%\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0019\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0017"}, d2 = {"Lcom/android/billingclient/api/ProductDetailsResult;", b.f42142b, "billingResult", "Lcom/android/billingclient/api/BillingResult;", "productDetailsList", b.f42142b, "Lcom/android/billingclient/api/ProductDetails;", "<init>", "(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V", "getBillingResult", "()Lcom/android/billingclient/api/BillingResult;", "getProductDetailsList", "()Ljava/util/List;", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "java.com.google.android.libraries.play.billing.public.ktbilling_granule"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class ProductDetailsResult {

    @NotNull
    private final BillingResult zza;

    @Nullable
    private final List zzb;

    public ProductDetailsResult(@RecentlyNonNull BillingResult billingResult, @Nullable List<ProductDetails> list) {
        Intrinsics.g(billingResult, "billingResult");
        this.zza = billingResult;
        this.zzb = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @RecentlyNonNull
    public static /* synthetic */ ProductDetailsResult copy$default(@RecentlyNonNull ProductDetailsResult productDetailsResult, @RecentlyNonNull BillingResult billingResult, @RecentlyNonNull List list, int i5, @RecentlyNonNull Object obj) {
        if ((i5 & 1) != 0) {
            billingResult = productDetailsResult.zza;
        }
        if ((i5 & 2) != 0) {
            list = productDetailsResult.zzb;
        }
        return productDetailsResult.copy(billingResult, list);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final BillingResult getZza() {
        return this.zza;
    }

    @RecentlyNullable
    public final List<ProductDetails> component2() {
        return this.zzb;
    }

    @NotNull
    public final ProductDetailsResult copy(@RecentlyNonNull BillingResult billingResult, @Nullable List<ProductDetails> productDetailsList) {
        Intrinsics.g(billingResult, "billingResult");
        return new ProductDetailsResult(billingResult, productDetailsList);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ProductDetailsResult)) {
            return false;
        }
        ProductDetailsResult productDetailsResult = (ProductDetailsResult) other;
        return Intrinsics.b(this.zza, productDetailsResult.zza) && Intrinsics.b(this.zzb, productDetailsResult.zzb);
    }

    @NotNull
    public final BillingResult getBillingResult() {
        return this.zza;
    }

    @RecentlyNullable
    public final List<ProductDetails> getProductDetailsList() {
        return this.zzb;
    }

    public int hashCode() {
        int iHashCode = this.zza.hashCode() * 31;
        List list = this.zzb;
        return iHashCode + (list == null ? 0 : list.hashCode());
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ProductDetailsResult(billingResult=");
        sb2.append(this.zza);
        sb2.append(", productDetailsList=");
        return m.j(sb2, this.zzb, ")");
    }
}
