package com.android.billingclient.api;

import b.c0;
import com.google.android.gms.internal.play_billing.m0;
import com.google.android.gms.internal.play_billing.t0;
import com.google.android.gms.internal.play_billing.y;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes2.dex */
public final class BillingResult {
    private int zza;
    private int zzb;
    private String zzc;

    public static class Builder {
        private int zza;
        private int zzb = 0;
        private String zzc = b.f42142b;

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

        @zzq
        public Builder setOnPurchasesUpdatedSubResponseCode(int i5) {
            this.zzb = i5;
            return this;
        }

        public Builder setResponseCode(int i5) {
            this.zza = i5;
            return this;
        }

        public /* synthetic */ Builder(zzdb zzdbVar) {
        }
    }

    public static Builder newBuilder() {
        return new Builder(null);
    }

    public String getDebugMessage() {
        return this.zzc;
    }

    @zzq
    public int getOnPurchasesUpdatedSubResponseCode() {
        return this.zzb;
    }

    public int getResponseCode() {
        return this.zza;
    }

    public String toString() {
        int i5 = this.zza;
        int i11 = m0.f33450a;
        t0 t0Var = y.f33652c;
        Integer numValueOf = Integer.valueOf(i5);
        return c0.m("Response Code: ", (!t0Var.containsKey(numValueOf) ? y.RESPONSE_CODE_UNSPECIFIED : (y) t0Var.get(numValueOf)).toString(), ", Debug Message: ", this.zzc);
    }
}
