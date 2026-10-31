package com.android.billingclient.api;

/* loaded from: classes2.dex */
public final class AcknowledgePurchaseParams {
    private String zza;

    public static final class Builder {
        private String zza;

        private Builder() {
            throw null;
        }

        public AcknowledgePurchaseParams build() {
            String str = this.zza;
            if (str == null) {
                throw new IllegalArgumentException("Purchase token must be set");
            }
            AcknowledgePurchaseParams acknowledgePurchaseParams = new AcknowledgePurchaseParams(null);
            acknowledgePurchaseParams.zza = str;
            return acknowledgePurchaseParams;
        }

        public Builder setPurchaseToken(String str) {
            this.zza = str;
            return this;
        }

        public /* synthetic */ Builder(zza zzaVar) {
        }
    }

    private AcknowledgePurchaseParams() {
        throw null;
    }

    public static Builder newBuilder() {
        return new Builder(null);
    }

    public String getPurchaseToken() {
        return this.zza;
    }

    public /* synthetic */ AcknowledgePurchaseParams(zza zzaVar) {
    }
}
