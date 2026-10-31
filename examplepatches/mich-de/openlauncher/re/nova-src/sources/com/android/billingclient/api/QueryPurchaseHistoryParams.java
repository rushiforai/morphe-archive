package com.android.billingclient.api;

/* loaded from: classes2.dex */
public final class QueryPurchaseHistoryParams {

    public static class Builder {
        private String zza;

        private Builder() {
            throw null;
        }

        public QueryPurchaseHistoryParams build() {
            if (this.zza != null) {
                return new QueryPurchaseHistoryParams(this, null);
            }
            throw new IllegalArgumentException("Product type must be set");
        }

        public Builder setProductType(String str) {
            this.zza = str;
            return this;
        }

        public /* synthetic */ Builder(zzec zzecVar) {
        }
    }

    public /* synthetic */ QueryPurchaseHistoryParams(Builder builder, zzec zzecVar) {
    }

    public static Builder newBuilder() {
        return new Builder(null);
    }
}
