package com.android.billingclient.api;

import defpackage.ay0;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class BillingProgramReportingDetailsParams {
    private final int zza;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    /* JADX INFO: loaded from: classes2.dex */
    public static final class Builder {
        private int zza = 0;

        private Builder() {
        }

        public Builder setBillingProgram(int i) {
            this.zza = i;
            return this;
        }

        public BillingProgramReportingDetailsParams build() {
            int i = this.zza;
            if (i == 0) {
                ay0.e("Billing program is not specified.");
                return null;
            }
            if (i != 5) {
                return new BillingProgramReportingDetailsParams(this, null);
            }
            ay0.e(eoLmc.DbWmXAAxOFY);
            return null;
        }

        public /* synthetic */ Builder(zzda zzdaVar) {
        }
    }

    public /* synthetic */ BillingProgramReportingDetailsParams(Builder builder, zzda zzdaVar) {
        this.zza = builder.zza;
    }

    public static Builder newBuilder() {
        return new Builder(null);
    }

    public int getBillingProgram() {
        return this.zza;
    }
}
