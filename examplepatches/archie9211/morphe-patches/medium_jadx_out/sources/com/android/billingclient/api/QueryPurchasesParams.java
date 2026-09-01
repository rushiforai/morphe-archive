package com.android.billingclient.api;

import com.android.billingclient.api.BillingClient;
import defpackage.ay0;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class QueryPurchasesParams {
    private final String zza;
    private final boolean zzb;

    public /* synthetic */ QueryPurchasesParams(Builder builder, zzeg zzegVar) {
        this.zza = builder.zza;
        this.zzb = builder.zzb;
    }

    public static Builder newBuilder() {
        return new Builder(null);
    }

    public boolean getIncludeSuspendedSubscriptions() {
        return this.zzb;
    }

    public final String zza() {
        return this.zza;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class Builder {
        private String zza;
        private boolean zzb = false;

        private Builder() {
        }

        public QueryPurchasesParams build() {
            String str = this.zza;
            zzeg zzegVar = null;
            if (str == null) {
                ay0.e("Product type must be set");
                return null;
            }
            if (!this.zzb || str.equals(BillingClient.ProductType.SUBS)) {
                return new QueryPurchasesParams(this, zzegVar);
            }
            ay0.e("includeSuspendedSubscriptions is only supported for subscription purchases");
            return null;
        }

        public Builder includeSuspendedSubscriptions(boolean z) {
            this.zzb = z;
            return this;
        }

        public Builder setProductType(String str) {
            this.zza = str;
            return this;
        }

        public /* synthetic */ Builder(zzeg zzegVar) {
        }
    }
}
