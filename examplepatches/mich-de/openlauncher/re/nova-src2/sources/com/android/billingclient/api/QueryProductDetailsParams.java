package com.android.billingclient.api;

import com.google.android.gms.internal.play_billing.k0;
import java.util.HashSet;
import java.util.List;

/* loaded from: classes2.dex */
public final class QueryProductDetailsParams {
    private final k0 zza;

    public static class Builder {
        private k0 zza;

        private Builder() {
            throw null;
        }

        public QueryProductDetailsParams build() {
            if (this.zza != null) {
                return new QueryProductDetailsParams(this, null);
            }
            throw new IllegalArgumentException("Product list must be set to a non empty list.");
        }

        public Builder setProductList(List<Product> list) {
            if (list == null || list.isEmpty()) {
                throw new IllegalArgumentException("Product list cannot be empty.");
            }
            HashSet hashSet = new HashSet();
            for (Product product : list) {
                if (!"play_pass_subs".equals(product.zzb())) {
                    hashSet.add(product.zzb());
                }
            }
            if (hashSet.size() > 1) {
                throw new IllegalArgumentException("All products should be of the same product type.");
            }
            this.zza = k0.k(list);
            return this;
        }

        public /* synthetic */ Builder(zzeb zzebVar) {
        }
    }

    public static class Product {
        private final String zza;
        private final String zzb;

        public static class Builder {
            private String zza;
            private String zzb;

            private Builder() {
                throw null;
            }

            public Product build() {
                String str = this.zzb;
                if ("first_party".equals(str)) {
                    throw new IllegalArgumentException("Serialized doc id must be provided for first party products.");
                }
                if (this.zza == null) {
                    throw new IllegalArgumentException("Product id must be provided.");
                }
                if (str != null) {
                    return new Product(this, null);
                }
                throw new IllegalArgumentException("Product type must be provided.");
            }

            public Builder setProductId(String str) {
                this.zza = str;
                return this;
            }

            public Builder setProductType(String str) {
                this.zzb = str;
                return this;
            }

            public /* synthetic */ Builder(zzeb zzebVar) {
            }
        }

        public /* synthetic */ Product(Builder builder, zzeb zzebVar) {
            this.zza = builder.zza;
            this.zzb = builder.zzb;
        }

        public static Builder newBuilder() {
            return new Builder(null);
        }

        public final String zza() {
            return this.zza;
        }

        public final String zzb() {
            return this.zzb;
        }
    }

    public /* synthetic */ QueryProductDetailsParams(Builder builder, zzeb zzebVar) {
        this.zza = builder.zza;
    }

    public static Builder newBuilder() {
        return new Builder(null);
    }

    public final k0 zza() {
        return this.zza;
    }

    public final String zzb() {
        return ((Product) this.zza.get(0)).zzb();
    }
}
