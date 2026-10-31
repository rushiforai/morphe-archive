package com.instabridge.ai.billing;

import aq.o;
import aq.s;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import fq.c;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@s(generateAdapter = true)
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u0017\u0012\u000e\b\u0001\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u0019\u0010\n\u001a\u00020\u00002\u000e\b\u0003\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0001J\u0013\u0010\u000b\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\u0012"}, d2 = {"Lcom/instabridge/ai/billing/ProductsResponse;", b.f42142b, "products", b.f42142b, "Lcom/instabridge/ai/billing/BillingProduct;", "<init>", "(Ljava/util/List;)V", "getProducts", "()Ljava/util/List;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class ProductsResponse {
    public static final int $stable = 8;

    @NotNull
    private final List<BillingProduct> products;

    public ProductsResponse(@o(name = "products") @NotNull List<BillingProduct> products) {
        Intrinsics.g(products, "products");
        this.products = products;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ ProductsResponse copy$default(ProductsResponse productsResponse, List list, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            list = productsResponse.products;
        }
        return productsResponse.copy(list);
    }

    @NotNull
    public final List<BillingProduct> component1() {
        return this.products;
    }

    @NotNull
    public final ProductsResponse copy(@o(name = "products") @NotNull List<BillingProduct> products) {
        Intrinsics.g(products, "products");
        return new ProductsResponse(products);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof ProductsResponse) && Intrinsics.b(this.products, ((ProductsResponse) other).products);
    }

    @NotNull
    public final List<BillingProduct> getProducts() {
        return this.products;
    }

    public int hashCode() {
        return this.products.hashCode();
    }

    @NotNull
    public String toString() {
        return c.e(new StringBuilder("ProductsResponse(products="), this.products, ')');
    }
}
