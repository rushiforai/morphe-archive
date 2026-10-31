package com.android.billingclient.api;

@zzh
/* loaded from: classes2.dex */
public final class BillingProgramReportingDetailsParams {
    private final int billingProgram;

    @zzh
    public static final class Builder {
        private int billingProgram;

        private Builder() {
            this.billingProgram = 0;
        }

        @zzh
        public BillingProgramReportingDetailsParams build() {
            if (this.billingProgram != 0) {
                return new BillingProgramReportingDetailsParams(this);
            }
            throw new IllegalArgumentException("Billing program is not specified.");
        }

        @zzh
        public Builder setBillingProgram(int i5) {
            this.billingProgram = i5;
            return this;
        }
    }

    @zzh
    public static Builder newBuilder() {
        return new Builder();
    }

    @zzh
    public int getBillingProgram() {
        return this.billingProgram;
    }

    private BillingProgramReportingDetailsParams(Builder builder) {
        this.billingProgram = builder.billingProgram;
    }
}
