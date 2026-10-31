package com.instabridge.ai.billing;

import aq.e0;
import aq.f;
import aq.h0;
import aq.o;
import aq.s;
import b.c0;
import bq.e;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import fq.c;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@s(generateAdapter = true)
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\b\u0087\b\u0018\u0000 \u00192\u00020\u0001:\u0001\u0019B+\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0003\u0012\u000e\b\u0001\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006HÆ\u0003J-\u0010\u0012\u001a\u00020\u00002\b\b\u0003\u0010\u0002\u001a\u00020\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u00032\u000e\b\u0003\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000e¨\u0006\u001a"}, d2 = {"Lcom/instabridge/ai/billing/BillingProduct;", b.f42142b, "productId", b.f42142b, "plan", "basePlans", b.f42142b, "Lcom/instabridge/ai/billing/BasePlan;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V", "getProductId", "()Ljava/lang/String;", "getPlan", "getBasePlans", "()Ljava/util/List;", "component1", "component2", "component3", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class BillingProduct {
    private static final h0 moshi;

    @NotNull
    private final List<BasePlan> basePlans;

    @NotNull
    private final String plan;

    @NotNull
    private final String productId;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u001b\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00070\u00062\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\b\u0010\tR\u001c\u0010\f\u001a\n \u000b*\u0004\u0018\u00010\n0\n8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/instabridge/ai/billing/BillingProduct$Companion;", b.f42142b, "<init>", "()V", b.f42142b, "json", b.f42142b, "Lcom/instabridge/ai/billing/BillingProduct;", "fromApiResponse", "(Ljava/lang/String;)Ljava/util/List;", "Laq/h0;", "kotlin.jvm.PlatformType", "moshi", "Laq/h0;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final List<BillingProduct> fromApiResponse(@NotNull String json) {
            Intrinsics.g(json, "json");
            h0 h0Var = BillingProduct.moshi;
            h0Var.getClass();
            ProductsResponse productsResponse = (ProductsResponse) h0Var.a(ProductsResponse.class, e.f18422a).b(json);
            List<BillingProduct> products = productsResponse != null ? productsResponse.getProducts() : null;
            return products == null ? EmptyList.f71733a : products;
        }

        private Companion() {
        }
    }

    static {
        e0 e0Var = new e0(0);
        e0Var.b(new f(6));
        moshi = new h0(e0Var);
    }

    public BillingProduct(@o(name = "product_id") @NotNull String productId, @o(name = "plan") @NotNull String plan, @o(name = "base_plans") @NotNull List<BasePlan> basePlans) {
        Intrinsics.g(productId, "productId");
        Intrinsics.g(plan, "plan");
        Intrinsics.g(basePlans, "basePlans");
        this.productId = productId;
        this.plan = plan;
        this.basePlans = basePlans;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ BillingProduct copy$default(BillingProduct billingProduct, String str, String str2, List list, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = billingProduct.productId;
        }
        if ((i5 & 2) != 0) {
            str2 = billingProduct.plan;
        }
        if ((i5 & 4) != 0) {
            list = billingProduct.basePlans;
        }
        return billingProduct.copy(str, str2, list);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getProductId() {
        return this.productId;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getPlan() {
        return this.plan;
    }

    @NotNull
    public final List<BasePlan> component3() {
        return this.basePlans;
    }

    @NotNull
    public final BillingProduct copy(@o(name = "product_id") @NotNull String productId, @o(name = "plan") @NotNull String plan, @o(name = "base_plans") @NotNull List<BasePlan> basePlans) {
        Intrinsics.g(productId, "productId");
        Intrinsics.g(plan, "plan");
        Intrinsics.g(basePlans, "basePlans");
        return new BillingProduct(productId, plan, basePlans);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof BillingProduct)) {
            return false;
        }
        BillingProduct billingProduct = (BillingProduct) other;
        return Intrinsics.b(this.productId, billingProduct.productId) && Intrinsics.b(this.plan, billingProduct.plan) && Intrinsics.b(this.basePlans, billingProduct.basePlans);
    }

    @NotNull
    public final List<BasePlan> getBasePlans() {
        return this.basePlans;
    }

    @NotNull
    public final String getPlan() {
        return this.plan;
    }

    @NotNull
    public final String getProductId() {
        return this.productId;
    }

    public int hashCode() {
        return this.basePlans.hashCode() + c0.e(this.productId.hashCode() * 31, 31, this.plan);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("BillingProduct(productId=");
        sb2.append(this.productId);
        sb2.append(", plan=");
        sb2.append(this.plan);
        sb2.append(", basePlans=");
        return c.e(sb2, this.basePlans, ')');
    }
}
