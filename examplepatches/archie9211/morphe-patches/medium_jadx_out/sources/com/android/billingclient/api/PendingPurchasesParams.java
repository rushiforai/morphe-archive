package com.android.billingclient.api;

import defpackage.ay0;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class PendingPurchasesParams {
    private final boolean enableOneTimeProducts;
    private final boolean enablePrepaidPlans;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class Builder {
        private boolean enableOneTimeProducts;
        private boolean enablePrepaidPlans;

        private Builder() {
        }

        public PendingPurchasesParams build() {
            if (this.enableOneTimeProducts) {
                return new PendingPurchasesParams(true, this.enablePrepaidPlans);
            }
            ay0.e("Pending purchases for one-time products must be supported.");
            return null;
        }

        public Builder enableOneTimeProducts() {
            this.enableOneTimeProducts = true;
            return this;
        }

        public Builder enablePrepaidPlans() {
            this.enablePrepaidPlans = true;
            return this;
        }
    }

    private PendingPurchasesParams(boolean z, boolean z2) {
        this.enableOneTimeProducts = z;
        this.enablePrepaidPlans = z2;
    }

    public static Builder newBuilder() {
        return new Builder();
    }

    public boolean isEnabledForOneTimeProducts() {
        return this.enableOneTimeProducts;
    }

    public boolean isEnabledForPrepaidPlans() {
        return this.enablePrepaidPlans;
    }
}
