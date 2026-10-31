package com.android.billingclient.api;

import android.text.TextUtils;
import b.c0;
import com.android.billingclient.api.ProductDetails;
import com.google.android.gms.internal.play_billing.i0;
import com.google.android.gms.internal.play_billing.k0;
import com.google.android.gms.internal.play_billing.o0;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public class BillingFlowParams {
    private boolean zza;
    private String zzb;
    private String zzc;
    private SubscriptionUpdateParams zzd;
    private k0 zze;
    private ArrayList zzf;
    private boolean zzg;
    private DeveloperBillingOptionParams zzh;

    public static class Builder {
        private String zza;
        private String zzb;
        private List zzc;
        private ArrayList zzd;
        private boolean zze;
        private SubscriptionUpdateParams.Builder zzf;
        private DeveloperBillingOptionParams zzg;

        private Builder() {
            SubscriptionUpdateParams.Builder builderNewBuilder = SubscriptionUpdateParams.newBuilder();
            SubscriptionUpdateParams.Builder.zza(builderNewBuilder);
            this.zzf = builderNewBuilder;
        }

        public BillingFlowParams build() {
            k0 k0VarK;
            ArrayList arrayList = this.zzd;
            boolean z11 = true;
            boolean z12 = (arrayList == null || arrayList.isEmpty()) ? false : true;
            List list = this.zzc;
            boolean z13 = (list == null || list.isEmpty()) ? false : true;
            if (!z12 && !z13) {
                throw new IllegalArgumentException("Details of the products must be provided.");
            }
            if (z12 && z13) {
                throw new IllegalArgumentException("Set SkuDetails or ProductDetailsParams, not both.");
            }
            zzcx zzcxVar = null;
            if (!z12) {
                List list2 = this.zzc;
                if (list2 != null) {
                    Iterator it = list2.iterator();
                    while (it.hasNext()) {
                        if (((ProductDetailsParams) it.next()) == null) {
                            throw new IllegalArgumentException("ProductDetailsParams cannot be null.");
                        }
                    }
                }
            } else {
                if (this.zzd.contains(null)) {
                    throw new IllegalArgumentException("SKU cannot be null.");
                }
                if (this.zzd.size() > 1) {
                    SkuDetails skuDetails = (SkuDetails) this.zzd.get(0);
                    String type = skuDetails.getType();
                    ArrayList arrayList2 = this.zzd;
                    int size = arrayList2.size();
                    for (int i5 = 0; i5 < size; i5++) {
                        SkuDetails skuDetails2 = (SkuDetails) arrayList2.get(i5);
                        if (!type.equals("play_pass_subs") && !skuDetails2.getType().equals("play_pass_subs") && !type.equals(skuDetails2.getType())) {
                            throw new IllegalArgumentException("SKUs should have the same type.");
                        }
                    }
                    String strZzd = skuDetails.zzd();
                    ArrayList arrayList3 = this.zzd;
                    int size2 = arrayList3.size();
                    for (int i11 = 0; i11 < size2; i11++) {
                        SkuDetails skuDetails3 = (SkuDetails) arrayList3.get(i11);
                        if (!type.equals("play_pass_subs") && !skuDetails3.getType().equals("play_pass_subs") && !strZzd.equals(skuDetails3.zzd())) {
                            throw new IllegalArgumentException("All SKUs must have the same package name.");
                        }
                    }
                }
            }
            BillingFlowParams billingFlowParams = new BillingFlowParams(zzcxVar);
            if ((!z12 || ((SkuDetails) this.zzd.get(0)).zzd().isEmpty()) && (!z13 || ((ProductDetailsParams) this.zzc.get(0)).zza().zza().isEmpty())) {
                z11 = false;
            }
            billingFlowParams.zza = z11;
            billingFlowParams.zzb = this.zza;
            billingFlowParams.zzc = this.zzb;
            billingFlowParams.zzd = this.zzf.build();
            ArrayList arrayList4 = this.zzd;
            billingFlowParams.zzf = arrayList4 != null ? new ArrayList(arrayList4) : new ArrayList();
            billingFlowParams.zzg = this.zze;
            List list3 = this.zzc;
            if (list3 != null) {
                k0VarK = k0.k(list3);
            } else {
                i0 i0Var = k0.f33433b;
                k0VarK = o0.f33465e;
            }
            billingFlowParams.zze = k0VarK;
            billingFlowParams.zzh = this.zzg;
            return billingFlowParams;
        }

        @zzl
        public Builder enableDeveloperBillingOption(DeveloperBillingOptionParams developerBillingOptionParams) {
            this.zzg = developerBillingOptionParams;
            return this;
        }

        public Builder setIsOfferPersonalized(boolean z11) {
            this.zze = z11;
            return this;
        }

        public Builder setObfuscatedAccountId(String str) {
            this.zza = str;
            return this;
        }

        public Builder setObfuscatedProfileId(String str) {
            this.zzb = str;
            return this;
        }

        public Builder setProductDetailsParamsList(List<ProductDetailsParams> list) {
            this.zzc = new ArrayList(list);
            return this;
        }

        @Deprecated
        public Builder setSkuDetails(SkuDetails skuDetails) {
            ArrayList arrayList = new ArrayList();
            arrayList.add(skuDetails);
            this.zzd = arrayList;
            return this;
        }

        public Builder setSubscriptionUpdateParams(SubscriptionUpdateParams subscriptionUpdateParams) {
            this.zzf = SubscriptionUpdateParams.zzb(subscriptionUpdateParams);
            return this;
        }

        public /* synthetic */ Builder(zzcx zzcxVar) {
            SubscriptionUpdateParams.Builder builderNewBuilder = SubscriptionUpdateParams.newBuilder();
            SubscriptionUpdateParams.Builder.zza(builderNewBuilder);
            this.zzf = builderNewBuilder;
        }
    }

    public static final class ProductDetailsParams {

        @zzy
        private final SubscriptionProductReplacementParams mSubscriptionProductReplacementParams;
        private final ProductDetails zza;
        private final String zzb;

        public static class Builder {

            @zzy
            private SubscriptionProductReplacementParams mSubscriptionProductReplacementParams;
            private ProductDetails zza;
            private String zzb;

            private Builder() {
                throw null;
            }

            public ProductDetailsParams build() {
                if (this.zza != null) {
                    return new ProductDetailsParams(this, null);
                }
                throw new NullPointerException("ProductDetails is required for constructing ProductDetailsParams.");
            }

            public Builder setOfferToken(String str) {
                if (TextUtils.isEmpty(str)) {
                    throw new IllegalArgumentException("offerToken can not be empty");
                }
                this.zzb = str;
                return this;
            }

            public Builder setProductDetails(ProductDetails productDetails) {
                this.zza = productDetails;
                if (productDetails.getOneTimePurchaseOfferDetails() != null) {
                    productDetails.getOneTimePurchaseOfferDetails().getClass();
                    ProductDetails.OneTimePurchaseOfferDetails oneTimePurchaseOfferDetails = productDetails.getOneTimePurchaseOfferDetails();
                    if (oneTimePurchaseOfferDetails.getOfferToken() != null) {
                        this.zzb = oneTimePurchaseOfferDetails.getOfferToken();
                    }
                }
                return this;
            }

            @zzy
            public Builder setSubscriptionProductReplacementParams(SubscriptionProductReplacementParams subscriptionProductReplacementParams) {
                this.mSubscriptionProductReplacementParams = subscriptionProductReplacementParams;
                return this;
            }

            public /* synthetic */ Builder(zzcx zzcxVar) {
            }
        }

        @zzy
        public static class SubscriptionProductReplacementParams {
            private String oldProductId;

            @zzy
            private int replacementMode;

            @zzy
            public static class Builder {
                private String oldProductId;
                private int replacementMode;

                private Builder() {
                    this.replacementMode = 0;
                }

                @zzy
                public SubscriptionProductReplacementParams build() {
                    SubscriptionProductReplacementParams subscriptionProductReplacementParams = new SubscriptionProductReplacementParams();
                    subscriptionProductReplacementParams.oldProductId = this.oldProductId;
                    subscriptionProductReplacementParams.replacementMode = this.replacementMode;
                    return subscriptionProductReplacementParams;
                }

                @zzy
                public Builder setOldProductId(String str) {
                    this.oldProductId = str;
                    return this;
                }

                @zzy
                public Builder setReplacementMode(int i5) {
                    this.replacementMode = i5;
                    return this;
                }
            }

            @Retention(RetentionPolicy.SOURCE)
            public @interface ReplacementMode {
                public static final int CHARGE_FULL_PRICE = 4;
                public static final int CHARGE_PRORATED_PRICE = 2;
                public static final int DEFERRED = 5;
                public static final int KEEP_EXISTING = 6;
                public static final int UNKNOWN_REPLACEMENT_MODE = 0;
                public static final int WITHOUT_PRORATION = 3;
                public static final int WITH_TIME_PRORATION = 1;
            }

            public static Builder newBuilder() {
                return new Builder();
            }

            @zzy
            public String getOldProductId() {
                return this.oldProductId;
            }

            @zzy
            public int getReplacementMode() {
                return this.replacementMode;
            }
        }

        public /* synthetic */ ProductDetailsParams(Builder builder, zzcx zzcxVar) {
            this.zza = builder.zza;
            this.zzb = builder.zzb;
            this.mSubscriptionProductReplacementParams = builder.mSubscriptionProductReplacementParams;
        }

        public static Builder newBuilder() {
            return new Builder(null);
        }

        @zzy
        public SubscriptionProductReplacementParams getSubscriptionProductReplacementParams() {
            return this.mSubscriptionProductReplacementParams;
        }

        public final ProductDetails zza() {
            return this.zza;
        }

        public final String zzb() {
            return this.zzb;
        }
    }

    public static class SubscriptionUpdateParams {
        private String zza;
        private String zzb;
        private int zzc = 0;

        public static class Builder {
            private String zza;
            private String zzb;
            private boolean zzc;
            private int zzd = 0;

            private Builder() {
            }

            public static /* synthetic */ Builder zza(Builder builder) {
                builder.zzc = true;
                return builder;
            }

            public SubscriptionUpdateParams build() {
                boolean z11 = true;
                zzcx zzcxVar = null;
                if (TextUtils.isEmpty(this.zza) && TextUtils.isEmpty(null)) {
                    z11 = false;
                }
                boolean zIsEmpty = TextUtils.isEmpty(this.zzb);
                if (z11 && !zIsEmpty) {
                    throw new IllegalArgumentException("Please provide Old SKU purchase information(token/id) or original external transaction id, not both.");
                }
                if (!this.zzc && !z11 && zIsEmpty) {
                    throw new IllegalArgumentException("Old SKU purchase information(token/id) or original external transaction id must be provided.");
                }
                SubscriptionUpdateParams subscriptionUpdateParams = new SubscriptionUpdateParams(zzcxVar);
                subscriptionUpdateParams.zza = this.zza;
                subscriptionUpdateParams.zzc = this.zzd;
                subscriptionUpdateParams.zzb = this.zzb;
                return subscriptionUpdateParams;
            }

            public Builder setOldPurchaseToken(String str) {
                this.zza = str;
                return this;
            }

            @zze
            public Builder setOriginalExternalTransactionId(String str) {
                this.zzb = str;
                return this;
            }

            @Deprecated
            public Builder setSubscriptionReplacementMode(int i5) {
                this.zzd = i5;
                return this;
            }

            @Deprecated
            public final Builder zzb(String str) {
                this.zza = str;
                return this;
            }

            public /* synthetic */ Builder(zzcx zzcxVar) {
            }
        }

        @Retention(RetentionPolicy.SOURCE)
        public @interface ReplacementMode {
            public static final int CHARGE_FULL_PRICE = 5;
            public static final int CHARGE_PRORATED_PRICE = 2;
            public static final int DEFERRED = 6;
            public static final int UNKNOWN_REPLACEMENT_MODE = 0;
            public static final int WITHOUT_PRORATION = 3;
            public static final int WITH_TIME_PRORATION = 1;
        }

        private SubscriptionUpdateParams() {
        }

        public static Builder newBuilder() {
            return new Builder(null);
        }

        public static /* bridge */ /* synthetic */ Builder zzb(SubscriptionUpdateParams subscriptionUpdateParams) {
            Builder builderNewBuilder = newBuilder();
            builderNewBuilder.zzb(subscriptionUpdateParams.zza);
            builderNewBuilder.setSubscriptionReplacementMode(subscriptionUpdateParams.zzc);
            builderNewBuilder.setOriginalExternalTransactionId(subscriptionUpdateParams.zzb);
            return builderNewBuilder;
        }

        public final int zza() {
            return this.zzc;
        }

        public final String zzc() {
            return this.zza;
        }

        public final String zzd() {
            return this.zzb;
        }

        public /* synthetic */ SubscriptionUpdateParams(zzcx zzcxVar) {
        }
    }

    private BillingFlowParams() {
        throw null;
    }

    public static Builder newBuilder() {
        return new Builder(null);
    }

    @zzl
    public DeveloperBillingOptionParams getDeveloperBillingOptionParams() {
        return this.zzh;
    }

    public int zza() {
        return 0;
    }

    public final int zzb() {
        return this.zzd.zza();
    }

    public long zzc() {
        return 0L;
    }

    public final BillingResult zzd() {
        ProductDetails.OneTimePurchaseOfferDetails next;
        ProductDetailsParams.SubscriptionProductReplacementParams subscriptionProductReplacementParams;
        BillingResult billingResultZza;
        if (this.zze.isEmpty()) {
            return zzdc.zzi;
        }
        ProductDetailsParams productDetailsParams = (ProductDetailsParams) this.zze.get(0);
        for (int i5 = 1; i5 < this.zze.size(); i5++) {
            ProductDetailsParams productDetailsParams2 = (ProductDetailsParams) this.zze.get(i5);
            if (!productDetailsParams2.zza().getProductType().equals(productDetailsParams.zza().getProductType()) && !productDetailsParams2.zza().getProductType().equals("play_pass_subs")) {
                return zzdc.zza(5, "All products should have same ProductType.");
            }
        }
        String strZza = productDetailsParams.zza().zza();
        HashMap map = new HashMap();
        HashSet hashSet = new HashSet();
        k0 k0Var = this.zze;
        int size = k0Var.size();
        boolean z11 = false;
        for (int i11 = 0; i11 < size; i11++) {
            ProductDetailsParams productDetailsParams3 = (ProductDetailsParams) k0Var.get(i11);
            ProductDetailsParams.SubscriptionProductReplacementParams subscriptionProductReplacementParams2 = productDetailsParams3.getSubscriptionProductReplacementParams();
            if (subscriptionProductReplacementParams2 != null) {
                if (!productDetailsParams3.zza().getProductType().equals("subs")) {
                    billingResultZza = zzdc.zza(5, c0.k("Non-subscription product cannot have SubscriptionProductReplacementParams. Invalid product id: ", productDetailsParams3.zza().getProductId()));
                } else if (subscriptionProductReplacementParams2.getReplacementMode() <= 0) {
                    billingResultZza = zzdc.zza(5, c0.k("replacementMode is required for constructing SubscriptionProductReplacementParams. Not correctly set for product id: ", productDetailsParams3.zza().getProductId()));
                } else {
                    String str = subscriptionProductReplacementParams2.oldProductId;
                    billingResultZza = (str == null || str.isEmpty()) ? zzdc.zza(5, c0.k("oldProductId is required for constructing SubscriptionProductReplacementParams. Not correctly set for product id: ", productDetailsParams3.zza().getProductId())) : zzdc.zzi;
                }
                if (billingResultZza != zzdc.zzi) {
                    return billingResultZza;
                }
            }
            if (subscriptionProductReplacementParams2 != null && subscriptionProductReplacementParams2.getReplacementMode() == 6) {
                BillingResult billingResultZza2 = productDetailsParams3.zzb() != null ? zzdc.zza(5, c0.k("When using KEEP_EXISTING mode, offerToken in ProductDetailsParams should not be set. Offer token is set for product id: ", productDetailsParams3.zza().getProductId())) : !subscriptionProductReplacementParams2.getOldProductId().equals(productDetailsParams3.zza().getProductId()) ? zzdc.zza(5, c0.k("When using KEEP_EXISTING mode, oldProductId in SubscriptionProductReplacementParams should be the same as the product id in ProductDetails. Value is invalid for product id: ", productDetailsParams3.zza().getProductId())) : zzdc.zzi;
                if (billingResultZza2 != zzdc.zzi) {
                    return billingResultZza2;
                }
            }
            if (productDetailsParams3.zza().getSubscriptionOfferDetails() != null && productDetailsParams3.zzb() == null && (subscriptionProductReplacementParams2 == null || subscriptionProductReplacementParams2.getReplacementMode() != 6)) {
                return zzdc.zza(5, c0.k("offerToken is required for constructing ProductDetailsParams for subscriptions. Missing value for product id: ", productDetailsParams3.zza().getProductId()));
            }
            if (map.containsKey(productDetailsParams3.zza().getProductId())) {
                return zzdc.zza(5, c0.l("ProductId can not be duplicated. Invalid product id: ", productDetailsParams3.zza().getProductId(), "."));
            }
            map.put(productDetailsParams3.zza().getProductId(), productDetailsParams3);
            if (subscriptionProductReplacementParams2 != null) {
                if (hashSet.contains(subscriptionProductReplacementParams2.getOldProductId())) {
                    return zzdc.zza(5, c0.l("OldProductId can not be duplicated. Invalid old product id: ", subscriptionProductReplacementParams2.getOldProductId(), "."));
                }
                hashSet.add(subscriptionProductReplacementParams2.getOldProductId());
                z11 = true;
            }
            if (!productDetailsParams.zza().getProductType().equals("play_pass_subs") && !productDetailsParams3.zza().getProductType().equals("play_pass_subs") && !strZza.equals(productDetailsParams3.zza().zza())) {
                return zzdc.zza(5, "All products must have the same package name.");
            }
        }
        Iterator it = hashSet.iterator();
        while (it.hasNext()) {
            String str2 = (String) it.next();
            if (map.containsKey(str2) && ((subscriptionProductReplacementParams = ((ProductDetailsParams) map.get(str2)).getSubscriptionProductReplacementParams()) == null || !subscriptionProductReplacementParams.getOldProductId().equals(str2))) {
                return zzdc.zza(5, c0.l("OldProductId must not be one of the products to be purchased. Invalid old product id: ", str2, "."));
            }
        }
        if (z11 && this.zzd.zza() != 0) {
            return zzdc.zza(5, "SubscriptionUpdateParams.setSubscriptionReplaceMode and  ProductDetailsParams.setSubscriptionProductReplacementParams cannot be called at the same time.");
        }
        List<ProductDetails.OneTimePurchaseOfferDetails> oneTimePurchaseOfferDetailsList = productDetailsParams.zza().getOneTimePurchaseOfferDetailsList();
        String strZzb = productDetailsParams.zzb();
        if (strZzb != null && oneTimePurchaseOfferDetailsList != null) {
            Iterator<ProductDetails.OneTimePurchaseOfferDetails> it2 = oneTimePurchaseOfferDetailsList.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next = null;
                    break;
                }
                next = it2.next();
                if (strZzb.equals(next.getOfferToken())) {
                    break;
                }
            }
            if (next != null && next.zza() != null) {
                return zzdc.zza(5, "Both autoPayDetails and autoPayBalanceThreshold is required for constructing ProductDetailsParams for autopay.");
            }
        }
        return zzdc.zzi;
    }

    public final String zze() {
        return this.zzb;
    }

    public final String zzf() {
        return this.zzc;
    }

    public String zzg() {
        return null;
    }

    public final String zzh() {
        return this.zzd.zzc();
    }

    public final String zzi() {
        return this.zzd.zzd();
    }

    public final ArrayList zzj() {
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(this.zzf);
        return arrayList;
    }

    public final List zzk() {
        return this.zze;
    }

    public final boolean zzt() {
        return this.zzg;
    }

    public final boolean zzu() {
        if (this.zzb != null || this.zzc != null || this.zzd.zzd() != null || this.zzd.zza() != 0 || this.zza || this.zzg) {
            return true;
        }
        k0 k0Var = this.zze;
        if (k0Var != null) {
            int size = k0Var.size();
            int i5 = 0;
            while (i5 < size) {
                ProductDetailsParams.SubscriptionProductReplacementParams subscriptionProductReplacementParams = ((ProductDetailsParams) k0Var.get(i5)).getSubscriptionProductReplacementParams();
                i5++;
                if (subscriptionProductReplacementParams != null) {
                    return true;
                }
            }
        }
        return false;
    }

    public /* synthetic */ BillingFlowParams(zzcx zzcxVar) {
    }
}
