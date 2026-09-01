package com.android.billingclient.api;

import defpackage.lv8;
import defpackage.rxf;
import defpackage.xvf;
import defpackage.yyf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class BillingResult {
    private int zza;
    private int zzb;
    private String zzc;

    public static Builder newBuilder() {
        return new Builder(null);
    }

    public String getDebugMessage() {
        return this.zzc;
    }

    public int getOnPurchasesUpdatedSubResponseCode() {
        return this.zzb;
    }

    public int getResponseCode() {
        return this.zza;
    }

    public String toString() {
        int i = this.zza;
        int i2 = rxf.a;
        yyf yyfVar = xvf.b;
        Integer numValueOf = Integer.valueOf(i);
        return lv8.r("Response Code: ", (!yyfVar.containsKey(numValueOf) ? xvf.RESPONSE_CODE_UNSPECIFIED : (xvf) yyfVar.get(numValueOf)).toString(), ", Debug Message: ", this.zzc);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class Builder {
        private int zza;
        private int zzb = 0;
        private String zzc = "";

        private Builder() {
        }

        public BillingResult build() {
            BillingResult billingResult = new BillingResult();
            billingResult.zza = this.zza;
            billingResult.zzb = this.zzb;
            billingResult.zzc = this.zzc;
            return billingResult;
        }

        public Builder setDebugMessage(String str) {
            this.zzc = str;
            return this;
        }

        public Builder setOnPurchasesUpdatedSubResponseCode(int i) {
            this.zzb = i;
            return this;
        }

        public Builder setResponseCode(int i) {
            this.zza = i;
            return this;
        }

        public /* synthetic */ Builder(zzdb zzdbVar) {
        }
    }
}
