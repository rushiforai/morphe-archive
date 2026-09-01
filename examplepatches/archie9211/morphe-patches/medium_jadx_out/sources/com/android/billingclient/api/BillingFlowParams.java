package com.android.billingclient.api;

import android.text.TextUtils;
import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.ProductDetails;
import defpackage.ay0;
import defpackage.exf;
import defpackage.lyf;
import defpackage.uxf;
import defpackage.z72;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class BillingFlowParams {
    private boolean zza;
    private String zzb;
    private String zzc;
    private SubscriptionUpdateParams zzd;
    private uxf zze;
    private ArrayList zzf;
    private boolean zzg;
    private DeveloperBillingOptionParams zzh;

    public /* synthetic */ BillingFlowParams(zzcx zzcxVar) {
    }

    public static Builder newBuilder() {
        return new Builder(null);
    }

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
        BillingResult billingResultA;
        BillingResult billingResultA2;
        if (this.zze.isEmpty()) {
            return n.i;
        }
        ProductDetailsParams productDetailsParams = (ProductDetailsParams) this.zze.get(0);
        for (int i = 1; i < this.zze.size(); i++) {
            ProductDetailsParams productDetailsParams2 = (ProductDetailsParams) this.zze.get(i);
            if (!productDetailsParams2.zza().getProductType().equals(productDetailsParams.zza().getProductType()) && !productDetailsParams2.zza().getProductType().equals("play_pass_subs")) {
                return n.a(5, "All products should have same ProductType.");
            }
        }
        String strZza = productDetailsParams.zza().zza();
        HashMap map = new HashMap();
        HashSet<String> hashSet = new HashSet();
        uxf uxfVar = this.zze;
        int size = uxfVar.size();
        boolean z = false;
        for (int i2 = 0; i2 < size; i2++) {
            ProductDetailsParams productDetailsParams3 = (ProductDetailsParams) uxfVar.get(i2);
            ProductDetailsParams.SubscriptionProductReplacementParams subscriptionProductReplacementParams2 = productDetailsParams3.getSubscriptionProductReplacementParams();
            if (subscriptionProductReplacementParams2 != null) {
                if (!productDetailsParams3.zza().getProductType().equals(BillingClient.ProductType.SUBS)) {
                    billingResultA2 = n.a(5, "Non-subscription product cannot have SubscriptionProductReplacementParams. Invalid product id: " + productDetailsParams3.zza().getProductId());
                } else if (subscriptionProductReplacementParams2.getReplacementMode() <= 0) {
                    billingResultA2 = n.a(5, "replacementMode is required for constructing SubscriptionProductReplacementParams. Not correctly set for product id: " + productDetailsParams3.zza().getProductId());
                } else {
                    String str = subscriptionProductReplacementParams2.oldProductId;
                    billingResultA2 = (str == null || str.isEmpty()) ? n.a(5, "oldProductId is required for constructing SubscriptionProductReplacementParams. Not correctly set for product id: " + productDetailsParams3.zza().getProductId()) : n.i;
                }
                if (billingResultA2 != n.i) {
                    return billingResultA2;
                }
            }
            if (subscriptionProductReplacementParams2 != null && subscriptionProductReplacementParams2.getReplacementMode() == 6) {
                if (productDetailsParams3.zzb() != null) {
                    billingResultA = n.a(5, "When using KEEP_EXISTING mode, offerToken in ProductDetailsParams should not be set. Offer token is set for product id: " + productDetailsParams3.zza().getProductId());
                } else if (subscriptionProductReplacementParams2.getOldProductId().equals(productDetailsParams3.zza().getProductId())) {
                    billingResultA = n.i;
                } else {
                    billingResultA = n.a(5, "When using KEEP_EXISTING mode, oldProductId in SubscriptionProductReplacementParams should be the same as the product id in ProductDetails. Value is invalid for product id: " + productDetailsParams3.zza().getProductId());
                }
                if (billingResultA != n.i) {
                    return billingResultA;
                }
            }
            if (productDetailsParams3.zza().getSubscriptionOfferDetails() != null && productDetailsParams3.zzb() == null && (subscriptionProductReplacementParams2 == null || subscriptionProductReplacementParams2.getReplacementMode() != 6)) {
                return n.a(5, "offerToken is required for constructing ProductDetailsParams for subscriptions. Missing value for product id: " + productDetailsParams3.zza().getProductId());
            }
            if (map.containsKey(productDetailsParams3.zza().getProductId())) {
                return n.a(5, "ProductId can not be duplicated. Invalid product id: " + productDetailsParams3.zza().getProductId() + ".");
            }
            map.put(productDetailsParams3.zza().getProductId(), productDetailsParams3);
            if (subscriptionProductReplacementParams2 != null) {
                if (hashSet.contains(subscriptionProductReplacementParams2.getOldProductId())) {
                    return n.a(5, "OldProductId can not be duplicated. Invalid old product id: " + subscriptionProductReplacementParams2.getOldProductId() + ".");
                }
                hashSet.add(subscriptionProductReplacementParams2.getOldProductId());
                z = true;
            }
            if (!productDetailsParams.zza().getProductType().equals("play_pass_subs") && !productDetailsParams3.zza().getProductType().equals("play_pass_subs") && !strZza.equals(productDetailsParams3.zza().zza())) {
                return n.a(5, "All products must have the same package name.");
            }
        }
        for (String str2 : hashSet) {
            if (map.containsKey(str2) && ((subscriptionProductReplacementParams = ((ProductDetailsParams) map.get(str2)).getSubscriptionProductReplacementParams()) == null || !subscriptionProductReplacementParams.getOldProductId().equals(str2))) {
                return n.a(5, "OldProductId must not be one of the products to be purchased. Invalid old product id: " + str2 + ".");
            }
        }
        if (z && this.zzd.zza() != 0) {
            return n.a(5, "SubscriptionUpdateParams.setSubscriptionReplaceMode and  ProductDetailsParams.setSubscriptionProductReplacementParams cannot be called at the same time.");
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
                return n.a(5, "Both autoPayDetails and autoPayBalanceThreshold is required for constructing ProductDetailsParams for autopay.");
            }
        }
        return n.i;
    }

    public final String zze() {
        return this.zzb;
    }

    public final String zzf() {
        return this.zzc;
    }

    @Deprecated
    public String zzg() {
        return null;
    }

    @Deprecated
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
        uxf uxfVar = this.zze;
        if (uxfVar != null) {
            int size = uxfVar.size();
            int i = 0;
            while (i < size) {
                ProductDetailsParams.SubscriptionProductReplacementParams subscriptionProductReplacementParams = ((ProductDetailsParams) uxfVar.get(i)).getSubscriptionProductReplacementParams();
                i++;
                if (subscriptionProductReplacementParams != null) {
                    return true;
                }
            }
        }
        return false;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class ProductDetailsParams {
        private final SubscriptionProductReplacementParams mSubscriptionProductReplacementParams;
        private final ProductDetails zza;
        private final String zzb;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public static class SubscriptionProductReplacementParams {
            private String oldProductId;
            private int replacementMode;

            /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
            public static class Builder {
                private String oldProductId;
                private int replacementMode;

                private Builder() {
                    this.replacementMode = 0;
                }

                public SubscriptionProductReplacementParams build() {
                    SubscriptionProductReplacementParams subscriptionProductReplacementParams = new SubscriptionProductReplacementParams();
                    subscriptionProductReplacementParams.oldProductId = this.oldProductId;
                    subscriptionProductReplacementParams.replacementMode = this.replacementMode;
                    return subscriptionProductReplacementParams;
                }

                public Builder setOldProductId(String str) {
                    this.oldProductId = str;
                    return this;
                }

                public Builder setReplacementMode(int i) {
                    this.replacementMode = i;
                    return this;
                }
            }

            /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
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

            public String getOldProductId() {
                return this.oldProductId;
            }

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

        public SubscriptionProductReplacementParams getSubscriptionProductReplacementParams() {
            return this.mSubscriptionProductReplacementParams;
        }

        public final ProductDetails zza() {
            return this.zza;
        }

        public final String zzb() {
            return this.zzb;
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public static class Builder {
            private SubscriptionProductReplacementParams mSubscriptionProductReplacementParams;
            private ProductDetails zza;
            private String zzb;

            public /* synthetic */ Builder(zzcx zzcxVar) {
            }

            public ProductDetailsParams build() {
                if (this.zza != null) {
                    return new ProductDetailsParams(this, null);
                }
                z72.c("ProductDetails is required for constructing ProductDetailsParams.");
                return null;
            }

            public Builder setOfferToken(String str) {
                if (TextUtils.isEmpty(str)) {
                    ay0.e("offerToken can not be empty");
                    return null;
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

            public Builder setSubscriptionProductReplacementParams(SubscriptionProductReplacementParams subscriptionProductReplacementParams) {
                this.mSubscriptionProductReplacementParams = subscriptionProductReplacementParams;
                return this;
            }

            private Builder() {
                throw null;
            }
        }
    }

    private BillingFlowParams() {
        throw null;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class SubscriptionUpdateParams {
        private String zza;
        private String zzb;
        private int zzc = 0;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
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
            builderNewBuilder.setOldPurchaseToken(subscriptionUpdateParams.zza);
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

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
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
                boolean z = true;
                zzcx zzcxVar = null;
                if (TextUtils.isEmpty(this.zza) && TextUtils.isEmpty(null)) {
                    z = false;
                }
                boolean zIsEmpty = TextUtils.isEmpty(this.zzb);
                if (z && !zIsEmpty) {
                    ay0.e("Please provide Old SKU purchase information(token/id) or original external transaction id, not both.");
                    return null;
                }
                if (!this.zzc && !z && zIsEmpty) {
                    ay0.e("Old SKU purchase information(token/id) or original external transaction id must be provided.");
                    return null;
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

            public Builder setOriginalExternalTransactionId(String str) {
                this.zzb = str;
                return this;
            }

            @Deprecated
            public Builder setSubscriptionReplacementMode(int i) {
                this.zzd = i;
                return this;
            }

            public /* synthetic */ Builder(zzcx zzcxVar) {
            }
        }

        public /* synthetic */ SubscriptionUpdateParams(zzcx zzcxVar) {
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class Builder {
        private String zza;
        private String zzb;
        private List zzc;
        private boolean zzd;
        private SubscriptionUpdateParams.Builder zze;
        private DeveloperBillingOptionParams zzf;

        private Builder() {
            SubscriptionUpdateParams.Builder builderNewBuilder = SubscriptionUpdateParams.newBuilder();
            SubscriptionUpdateParams.Builder.zza(builderNewBuilder);
            this.zze = builderNewBuilder;
        }

        public BillingFlowParams build() {
            uxf uxfVarT;
            List list = this.zzc;
            zzcx zzcxVar = null;
            if (list == null || list.isEmpty()) {
                ay0.e("Details of the products must be provided.");
                return null;
            }
            List list2 = this.zzc;
            if (list2 != null) {
                Iterator it2 = list2.iterator();
                while (it2.hasNext()) {
                    if (((ProductDetailsParams) it2.next()) == null) {
                        ay0.e("ProductDetailsParams cannot be null.");
                        return null;
                    }
                }
            }
            BillingFlowParams billingFlowParams = new BillingFlowParams(zzcxVar);
            billingFlowParams.zza = !((ProductDetailsParams) this.zzc.get(0)).zza().zza().isEmpty();
            billingFlowParams.zzb = this.zza;
            billingFlowParams.zzc = this.zzb;
            billingFlowParams.zzd = this.zze.build();
            billingFlowParams.zzf = new ArrayList();
            billingFlowParams.zzg = this.zzd;
            List list3 = this.zzc;
            if (list3 != null) {
                uxfVarT = uxf.t(list3);
            } else {
                exf exfVar = uxf.b;
                uxfVarT = lyf.e;
            }
            billingFlowParams.zze = uxfVarT;
            billingFlowParams.zzh = this.zzf;
            return billingFlowParams;
        }

        public Builder enableDeveloperBillingOption(DeveloperBillingOptionParams developerBillingOptionParams) {
            this.zzf = developerBillingOptionParams;
            return this;
        }

        public Builder setIsOfferPersonalized(boolean z) {
            this.zzd = z;
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

        public Builder setSubscriptionUpdateParams(SubscriptionUpdateParams subscriptionUpdateParams) {
            this.zze = SubscriptionUpdateParams.zzb(subscriptionUpdateParams);
            return this;
        }

        public /* synthetic */ Builder(zzcx zzcxVar) {
            SubscriptionUpdateParams.Builder builderNewBuilder = SubscriptionUpdateParams.newBuilder();
            SubscriptionUpdateParams.Builder.zza(builderNewBuilder);
            this.zze = builderNewBuilder;
        }
    }
}
