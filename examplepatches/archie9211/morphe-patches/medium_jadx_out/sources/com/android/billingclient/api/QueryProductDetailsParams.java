package com.android.billingclient.api;

import defpackage.ay0;
import defpackage.uxf;
import java.util.HashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class QueryProductDetailsParams {
    private final uxf zza;

    public /* synthetic */ QueryProductDetailsParams(Builder builder, zzef zzefVar) {
        this.zza = builder.zza;
    }

    public static Builder newBuilder() {
        return new Builder(null);
    }

    public final uxf zza() {
        return this.zza;
    }

    public final String zzb() {
        return ((Product) this.zza.get(0)).zzb();
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class Product {
        private final String dynamicProductToken;
        private final String zza;
        private final String zzb;

        public /* synthetic */ Product(Builder builder, zzef zzefVar) {
            this.zza = builder.zza;
            this.zzb = builder.zzb;
            this.dynamicProductToken = builder.dynamicProductToken;
        }

        public static Builder newBuilder() {
            return new Builder(null);
        }

        public String getDynamicProductToken() {
            return this.dynamicProductToken;
        }

        public final String zza() {
            return this.zza;
        }

        public final String zzb() {
            return this.zzb;
        }

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public static class Builder {
            private String dynamicProductToken;
            private String zza;
            private String zzb;

            public /* synthetic */ Builder(zzef zzefVar) {
            }

            public Product build() {
                String str = this.zzb;
                if ("first_party".equals(str)) {
                    ay0.e("Serialized doc id must be provided for first party products.");
                    return null;
                }
                if (this.zza == null) {
                    ay0.e("Product id must be provided.");
                    return null;
                }
                if (str != null) {
                    return new Product(this, null);
                }
                ay0.e("Product type must be provided.");
                return null;
            }

            public Builder setDynamicProductToken(String str) {
                this.dynamicProductToken = str;
                return this;
            }

            public Builder setProductId(String str) {
                this.zza = str;
                return this;
            }

            public Builder setProductType(String str) {
                this.zzb = str;
                return this;
            }

            private Builder() {
                throw null;
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class Builder {
        private uxf zza;

        public /* synthetic */ Builder(zzef zzefVar) {
        }

        public QueryProductDetailsParams build() {
            if (this.zza != null) {
                return new QueryProductDetailsParams(this, null);
            }
            ay0.e("Product list must be set to a non empty list.");
            return null;
        }

        public Builder setProductList(List<Product> list) {
            if (list == null || list.isEmpty()) {
                ay0.e("Product list cannot be empty.");
                return null;
            }
            HashSet hashSet = new HashSet();
            for (Product product : list) {
                if (!"play_pass_subs".equals(product.zzb())) {
                    hashSet.add(product.zzb());
                }
            }
            if (hashSet.size() <= 1) {
                this.zza = uxf.t(list);
                return this;
            }
            ay0.e("All products should be of the same product type.");
            return null;
        }

        private Builder() {
            throw null;
        }
    }
}
