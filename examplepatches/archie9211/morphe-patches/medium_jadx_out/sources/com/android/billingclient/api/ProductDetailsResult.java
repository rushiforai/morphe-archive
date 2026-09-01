package com.android.billingclient.api;

import defpackage.b09;
import defpackage.g76;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0011\u0010\u000e\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0003J%\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0001J\u0014\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0083\u0004J\n\u0010\u0013\u001a\u00020\u0014HÖ\u0081\u0004J\n\u0010\u0015\u001a\u00020\u0016HÖ\u0081\u0004R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0019\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0017"}, d2 = {"Lcom/android/billingclient/api/ProductDetailsResult;", "", "billingResult", "Lcom/android/billingclient/api/BillingResult;", "productDetailsList", "", "Lcom/android/billingclient/api/ProductDetails;", "<init>", "(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V", "getBillingResult", "()Lcom/android/billingclient/api/BillingResult;", "getProductDetailsList", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "", "java.com.google.android.libraries.play.billing.public.ktbilling_granule"}, k = 1, mv = {2, 3, 0}, xi = 48)
public final /* data */ class ProductDetailsResult {
    private final BillingResult zza;
    private final List zzb;

    public ProductDetailsResult(BillingResult billingResult, List<ProductDetails> list) {
        billingResult.getClass();
        this.zza = billingResult;
        this.zzb = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ ProductDetailsResult copy$default(ProductDetailsResult productDetailsResult, BillingResult billingResult, List list, int i, Object obj) {
        if ((i & 1) != 0) {
            billingResult = productDetailsResult.zza;
        }
        if ((i & 2) != 0) {
            list = productDetailsResult.zzb;
        }
        return productDetailsResult.copy(billingResult, list);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final BillingResult getZza() {
        return this.zza;
    }

    public final List<ProductDetails> component2() {
        return this.zzb;
    }

    public final ProductDetailsResult copy(BillingResult billingResult, List<ProductDetails> productDetailsList) {
        billingResult.getClass();
        return new ProductDetailsResult(billingResult, productDetailsList);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ProductDetailsResult)) {
            return false;
        }
        ProductDetailsResult productDetailsResult = (ProductDetailsResult) other;
        return g76.L(this.zza, productDetailsResult.zza) && g76.L(this.zzb, productDetailsResult.zzb);
    }

    public final BillingResult getBillingResult() {
        return this.zza;
    }

    public final List<ProductDetails> getProductDetailsList() {
        return this.zzb;
    }

    public int hashCode() {
        int iHashCode = this.zza.hashCode() * 31;
        List list = this.zzb;
        return iHashCode + (list == null ? 0 : list.hashCode());
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("ProductDetailsResult(billingResult=");
        sb.append(this.zza);
        sb.append(", productDetailsList=");
        return b09.B(sb, this.zzb, ")");
    }
}
