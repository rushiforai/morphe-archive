package com.android.billingclient.api;

import defpackage.ay0;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class AcknowledgePurchaseParams {
    private String zza;

    public /* synthetic */ AcknowledgePurchaseParams(zza zzaVar) {
    }

    public static Builder newBuilder() {
        return new Builder(null);
    }

    public String getPurchaseToken() {
        return this.zza;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class Builder {
        private String zza;

        public /* synthetic */ Builder(zza zzaVar) {
        }

        public AcknowledgePurchaseParams build() {
            String str = this.zza;
            zza zzaVar = null;
            if (str == null) {
                ay0.e("Purchase token must be set");
                return null;
            }
            AcknowledgePurchaseParams acknowledgePurchaseParams = new AcknowledgePurchaseParams(zzaVar);
            acknowledgePurchaseParams.zza = str;
            return acknowledgePurchaseParams;
        }

        public Builder setPurchaseToken(String str) {
            this.zza = str;
            return this;
        }

        private Builder() {
            throw null;
        }
    }

    private AcknowledgePurchaseParams() {
        throw null;
    }
}
