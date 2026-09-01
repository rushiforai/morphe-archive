package com.android.billingclient.api;

import android.text.TextUtils;
import com.android.billingclient.api.BillingClient;
import defpackage.ay0;
import defpackage.ka1;
import defpackage.km4;
import j$.util.Objects;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ProductDetails {
    private final String zza;
    private final JSONObject zzb;
    private final String zzc;
    private final String zzd;
    private final String zze;
    private final String zzf;
    private final String zzg;
    private final String zzh;
    private final String zzi;
    private final List zzj;
    private final List zzk;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class InstallmentPlanDetails {
        private final int commitmentPaymentsCount;
        private final int subsequentCommitmentPaymentsCount;

        public InstallmentPlanDetails(JSONObject jSONObject) {
            this.commitmentPaymentsCount = jSONObject.getInt("commitmentPaymentsCount");
            this.subsequentCommitmentPaymentsCount = jSONObject.optInt("subsequentCommitmentPaymentsCount");
        }

        public int getInstallmentPlanCommitmentPaymentsCount() {
            return this.commitmentPaymentsCount;
        }

        public int getSubsequentInstallmentPlanCommitmentPaymentsCount() {
            return this.subsequentCommitmentPaymentsCount;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class OneTimePurchaseOfferDetails {
        private final String zza;
        private final long zzb;
        private final String zzc;
        private final String zzd;
        private final String zze;
        private final String zzf;
        private final List zzg;
        private final Long zzh;
        private final DiscountDisplayInfo zzi;
        private final ValidTimeWindow zzj;
        private final LimitedQuantityInfo zzk;
        private final String zzl;
        private final PreorderDetails zzm;
        private final RentalDetails zzn;
        private final zzdv zzo;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public static final class DiscountDisplayInfo {
            private final Integer zza;
            private final DiscountAmount zzb;

            /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
            public static final class DiscountAmount {
                private final String zza;
                private final long zzb;
                private final String zzc;

                public DiscountAmount(JSONObject jSONObject) {
                    this.zza = jSONObject.optString("formattedDiscountAmount");
                    this.zzb = jSONObject.optLong("discountAmountMicros");
                    this.zzc = jSONObject.optString("discountAmountCurrencyCode");
                }

                public String getDiscountAmountCurrencyCode() {
                    return this.zzc;
                }

                public long getDiscountAmountMicros() {
                    return this.zzb;
                }

                public String getFormattedDiscountAmount() {
                    return this.zza;
                }
            }

            public DiscountDisplayInfo(JSONObject jSONObject) {
                this.zza = jSONObject.has("percentageDiscount") ? Integer.valueOf(jSONObject.optInt("percentageDiscount")) : null;
                JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("discountAmount");
                this.zzb = jSONObjectOptJSONObject != null ? new DiscountAmount(jSONObjectOptJSONObject) : null;
            }

            public DiscountAmount getDiscountAmount() {
                return this.zzb;
            }

            public Integer getPercentageDiscount() {
                return this.zza;
            }
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public static final class LimitedQuantityInfo {
            private final int zza;
            private final int zzb;

            public LimitedQuantityInfo(JSONObject jSONObject) {
                this.zza = jSONObject.getInt("maximumQuantity");
                this.zzb = jSONObject.getInt("remainingQuantity");
            }

            public int getMaximumQuantity() {
                return this.zza;
            }

            public int getRemainingQuantity() {
                return this.zzb;
            }
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public static final class PreorderDetails {
            private final long preorderPresaleEndTimeMillis;
            private final long preorderReleaseTimeMillis;

            public PreorderDetails(JSONObject jSONObject) {
                this.preorderReleaseTimeMillis = jSONObject.getLong("preorderReleaseTimeMillis");
                this.preorderPresaleEndTimeMillis = jSONObject.getLong("preorderPresaleEndTimeMillis");
            }

            public long getPreorderPresaleEndTimeMillis() {
                return this.preorderPresaleEndTimeMillis;
            }

            public long getPreorderReleaseTimeMillis() {
                return this.preorderReleaseTimeMillis;
            }
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public static final class RentalDetails {
            private final String rentalExpirationPeriod;
            private final String rentalPeriod;

            public RentalDetails(JSONObject jSONObject) {
                this.rentalPeriod = jSONObject.getString("rentalPeriod");
                String strOptString = jSONObject.optString("rentalExpirationPeriod");
                this.rentalExpirationPeriod = true == strOptString.isEmpty() ? null : strOptString;
            }

            public String getRentalExpirationPeriod() {
                return this.rentalExpirationPeriod;
            }

            public String getRentalPeriod() {
                return this.rentalPeriod;
            }
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public static final class ValidTimeWindow {
            private final Long zza;
            private final Long zzb;

            public ValidTimeWindow(JSONObject jSONObject) {
                this.zza = jSONObject.has("startTimeMillis") ? Long.valueOf(jSONObject.optLong("startTimeMillis")) : null;
                this.zzb = jSONObject.has("endTimeMillis") ? Long.valueOf(jSONObject.optLong("endTimeMillis")) : null;
            }

            public Long getEndTimeMillis() {
                return this.zzb;
            }

            public Long getStartTimeMillis() {
                return this.zza;
            }
        }

        public OneTimePurchaseOfferDetails(JSONObject jSONObject) {
            this.zza = jSONObject.optString("formattedPrice");
            this.zzb = jSONObject.optLong("priceAmountMicros");
            this.zzc = jSONObject.optString("priceCurrencyCode");
            String strOptString = jSONObject.optString("offerIdToken");
            this.zzd = true == strOptString.isEmpty() ? null : strOptString;
            String strOptString2 = jSONObject.optString("offerId");
            this.zze = true == strOptString2.isEmpty() ? null : strOptString2;
            String strOptString3 = jSONObject.optString("purchaseOptionId");
            this.zzf = true == strOptString3.isEmpty() ? null : strOptString3;
            jSONObject.optInt("offerType");
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("offerTags");
            this.zzg = new ArrayList();
            if (jSONArrayOptJSONArray != null) {
                for (int i = 0; i < jSONArrayOptJSONArray.length(); i++) {
                    this.zzg.add(jSONArrayOptJSONArray.getString(i));
                }
            }
            this.zzh = jSONObject.has("fullPriceMicros") ? Long.valueOf(jSONObject.optLong("fullPriceMicros")) : null;
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("discountDisplayInfo");
            this.zzi = jSONObjectOptJSONObject == null ? null : new DiscountDisplayInfo(jSONObjectOptJSONObject);
            JSONObject jSONObjectOptJSONObject2 = jSONObject.optJSONObject("validTimeWindow");
            this.zzj = jSONObjectOptJSONObject2 == null ? null : new ValidTimeWindow(jSONObjectOptJSONObject2);
            JSONObject jSONObjectOptJSONObject3 = jSONObject.optJSONObject("limitedQuantityInfo");
            this.zzk = jSONObjectOptJSONObject3 == null ? null : new LimitedQuantityInfo(jSONObjectOptJSONObject3);
            this.zzl = jSONObject.optString("serializedDocid");
            JSONObject jSONObjectOptJSONObject4 = jSONObject.optJSONObject("preorderDetails");
            this.zzm = jSONObjectOptJSONObject4 == null ? null : new PreorderDetails(jSONObjectOptJSONObject4);
            JSONObject jSONObjectOptJSONObject5 = jSONObject.optJSONObject("rentalDetails");
            this.zzn = jSONObjectOptJSONObject5 == null ? null : new RentalDetails(jSONObjectOptJSONObject5);
            JSONObject jSONObjectOptJSONObject6 = jSONObject.optJSONObject("autoPayDetails");
            this.zzo = jSONObjectOptJSONObject6 != null ? new zzdv(jSONObjectOptJSONObject6) : null;
            JSONArray jSONArrayOptJSONArray2 = jSONObject.optJSONArray("pricingPhases");
            if (jSONArrayOptJSONArray2 == null) {
                return;
            }
            new PricingPhases(jSONArrayOptJSONArray2);
        }

        public DiscountDisplayInfo getDiscountDisplayInfo() {
            return this.zzi;
        }

        public String getFormattedPrice() {
            return this.zza;
        }

        public Long getFullPriceMicros() {
            return this.zzh;
        }

        public LimitedQuantityInfo getLimitedQuantityInfo() {
            return this.zzk;
        }

        public String getOfferId() {
            return this.zze;
        }

        public List<String> getOfferTags() {
            return this.zzg;
        }

        public String getOfferToken() {
            return this.zzd;
        }

        public PreorderDetails getPreorderDetails() {
            return this.zzm;
        }

        public long getPriceAmountMicros() {
            return this.zzb;
        }

        public String getPriceCurrencyCode() {
            return this.zzc;
        }

        public String getPurchaseOptionId() {
            return this.zzf;
        }

        public RentalDetails getRentalDetails() {
            return this.zzn;
        }

        public ValidTimeWindow getValidTimeWindow() {
            return this.zzj;
        }

        public final zzdv zza() {
            return this.zzo;
        }

        public final String zzb() {
            return this.zzl;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class PricingPhase {
        private final String zza;
        private final long zzb;
        private final String zzc;
        private final String zzd;
        private final int zze;
        private final int zzf;

        public PricingPhase(JSONObject jSONObject) {
            this.zzd = jSONObject.optString("billingPeriod");
            this.zzc = jSONObject.optString("priceCurrencyCode");
            this.zza = jSONObject.optString("formattedPrice");
            this.zzb = jSONObject.optLong("priceAmountMicros");
            this.zzf = jSONObject.optInt("recurrenceMode");
            this.zze = jSONObject.optInt("billingCycleCount");
        }

        public int getBillingCycleCount() {
            return this.zze;
        }

        public String getBillingPeriod() {
            return this.zzd;
        }

        public String getFormattedPrice() {
            return this.zza;
        }

        public long getPriceAmountMicros() {
            return this.zzb;
        }

        public String getPriceCurrencyCode() {
            return this.zzc;
        }

        public int getRecurrenceMode() {
            return this.zzf;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class PricingPhases {
        private final List zza;

        public PricingPhases(JSONArray jSONArray) {
            ArrayList arrayList = new ArrayList();
            if (jSONArray != null) {
                for (int i = 0; i < jSONArray.length(); i++) {
                    JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i);
                    if (jSONObjectOptJSONObject != null) {
                        arrayList.add(new PricingPhase(jSONObjectOptJSONObject));
                    }
                }
            }
            this.zza = arrayList;
        }

        public List<PricingPhase> getPricingPhaseList() {
            return this.zza;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Retention(RetentionPolicy.SOURCE)
    public @interface RecurrenceMode {
        public static final int FINITE_RECURRING = 2;
        public static final int INFINITE_RECURRING = 1;
        public static final int NON_RECURRING = 3;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class SubscriptionOfferDetails {
        private final String zza;
        private final String zzb;
        private final String zzc;
        private final PricingPhases zzd;
        private final List zze;
        private final InstallmentPlanDetails zzf;

        public SubscriptionOfferDetails(JSONObject jSONObject) throws JSONException {
            this.zza = jSONObject.optString("basePlanId");
            String strOptString = jSONObject.optString("offerId");
            this.zzb = true == strOptString.isEmpty() ? null : strOptString;
            this.zzc = jSONObject.getString("offerIdToken");
            this.zzd = new PricingPhases(jSONObject.getJSONArray("pricingPhases"));
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("installmentPlanDetails");
            this.zzf = jSONObjectOptJSONObject != null ? new InstallmentPlanDetails(jSONObjectOptJSONObject) : null;
            JSONObject jSONObjectOptJSONObject2 = jSONObject.optJSONObject("transitionPlanDetails");
            if (jSONObjectOptJSONObject2 != null) {
                jSONObjectOptJSONObject2.getString("productId");
                jSONObjectOptJSONObject2.optString("title");
                jSONObjectOptJSONObject2.optString("name");
                jSONObjectOptJSONObject2.optString("description");
                jSONObjectOptJSONObject2.optString("basePlanId");
                JSONObject jSONObjectOptJSONObject3 = jSONObjectOptJSONObject2.optJSONObject("pricingPhase");
                if (jSONObjectOptJSONObject3 != null) {
                    new PricingPhase(jSONObjectOptJSONObject3);
                }
            }
            ArrayList arrayList = new ArrayList();
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("offerTags");
            if (jSONArrayOptJSONArray != null) {
                for (int i = 0; i < jSONArrayOptJSONArray.length(); i++) {
                    arrayList.add(jSONArrayOptJSONArray.getString(i));
                }
            }
            this.zze = arrayList;
        }

        public String getBasePlanId() {
            return this.zza;
        }

        public InstallmentPlanDetails getInstallmentPlanDetails() {
            return this.zzf;
        }

        public String getOfferId() {
            return this.zzb;
        }

        public List<String> getOfferTags() {
            return this.zze;
        }

        public String getOfferToken() {
            return this.zzc;
        }

        public PricingPhases getPricingPhases() {
            return this.zzd;
        }
    }

    public ProductDetails(String str) {
        this.zza = str;
        JSONObject jSONObject = new JSONObject(str);
        this.zzb = jSONObject;
        String strOptString = jSONObject.optString("productId");
        this.zzc = strOptString;
        String strOptString2 = jSONObject.optString("type");
        this.zzd = strOptString2;
        if (TextUtils.isEmpty(strOptString)) {
            ay0.e("Product id cannot be empty.");
            throw null;
        }
        if (TextUtils.isEmpty(strOptString2)) {
            ay0.e("Product type cannot be empty.");
            throw null;
        }
        this.zze = jSONObject.optString("title");
        this.zzf = jSONObject.optString("name");
        this.zzg = jSONObject.optString("description");
        jSONObject.optString("packageDisplayName");
        jSONObject.optString("iconUrl");
        this.zzh = jSONObject.optString("skuDetailsToken");
        this.zzi = jSONObject.optString("serializedDocid");
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("subscriptionOfferDetails");
        if (jSONArrayOptJSONArray != null) {
            ArrayList arrayList = new ArrayList();
            for (int i = 0; i < jSONArrayOptJSONArray.length(); i++) {
                arrayList.add(new SubscriptionOfferDetails(jSONArrayOptJSONArray.getJSONObject(i)));
            }
            this.zzj = arrayList;
        } else {
            this.zzj = (strOptString2.equals(BillingClient.ProductType.SUBS) || strOptString2.equals("play_pass_subs")) ? new ArrayList() : null;
        }
        JSONObject jSONObjectOptJSONObject = this.zzb.optJSONObject("oneTimePurchaseOfferDetails");
        JSONArray jSONArrayOptJSONArray2 = this.zzb.optJSONArray("oneTimePurchaseOfferDetailsList");
        ArrayList arrayList2 = new ArrayList();
        if (jSONArrayOptJSONArray2 != null) {
            for (int i2 = 0; i2 < jSONArrayOptJSONArray2.length(); i2++) {
                arrayList2.add(new OneTimePurchaseOfferDetails(jSONArrayOptJSONArray2.getJSONObject(i2)));
            }
            this.zzk = arrayList2;
            return;
        }
        if (jSONObjectOptJSONObject == null) {
            this.zzk = null;
        } else {
            arrayList2.add(new OneTimePurchaseOfferDetails(jSONObjectOptJSONObject));
            this.zzk = arrayList2;
        }
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof ProductDetails) {
            return TextUtils.equals(this.zza, ((ProductDetails) obj).zza);
        }
        return false;
    }

    public String getDescription() {
        return this.zzg;
    }

    public String getName() {
        return this.zzf;
    }

    public OneTimePurchaseOfferDetails getOneTimePurchaseOfferDetails() {
        List list = this.zzk;
        if (list == null || list.isEmpty()) {
            return null;
        }
        return (OneTimePurchaseOfferDetails) list.get(0);
    }

    public List<OneTimePurchaseOfferDetails> getOneTimePurchaseOfferDetailsList() {
        return this.zzk;
    }

    public String getProductId() {
        return this.zzc;
    }

    public String getProductType() {
        return this.zzd;
    }

    public List<SubscriptionOfferDetails> getSubscriptionOfferDetails() {
        return this.zzj;
    }

    public String getTitle() {
        return this.zze;
    }

    public int hashCode() {
        return this.zza.hashCode();
    }

    public String toString() {
        List list = this.zzj;
        String string = this.zzb.toString();
        String strValueOf = String.valueOf(list);
        StringBuilder sb = new StringBuilder("ProductDetails{jsonString='");
        ka1.C(sb, this.zza, "', parsedJson=", string, ", productId='");
        sb.append(this.zzc);
        sb.append("', productType='");
        sb.append(this.zzd);
        sb.append("', title='");
        sb.append(this.zze);
        sb.append("', productDetailsToken='");
        return km4.C(sb, this.zzh, "', subscriptionOfferDetails=", strValueOf, "}");
    }

    public final String zza() {
        return this.zzb.optString("packageName");
    }

    public final String zzb() {
        return this.zzh;
    }

    public final String zzc(String str) {
        List<OneTimePurchaseOfferDetails> list;
        if (!TextUtils.isEmpty(str) && (list = this.zzk) != null && !list.isEmpty()) {
            for (OneTimePurchaseOfferDetails oneTimePurchaseOfferDetails : list) {
                if (!TextUtils.isEmpty(oneTimePurchaseOfferDetails.zzb()) && Objects.equals(oneTimePurchaseOfferDetails.getOfferToken(), str)) {
                    return oneTimePurchaseOfferDetails.zzb();
                }
            }
        }
        return this.zzi;
    }
}
