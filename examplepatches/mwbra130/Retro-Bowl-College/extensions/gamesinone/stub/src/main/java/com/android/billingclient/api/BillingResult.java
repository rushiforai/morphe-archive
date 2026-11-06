package com.android.billingclient.api;

/**
 * Compile-only stub of the Play Billing BillingResult class. At runtime
 * the app's real billing library class is used; only the signatures
 * matter here.
 */
public final class BillingResult {
    public int getResponseCode() {
        return 0;
    }

    public String getDebugMessage() {
        return "";
    }

    public static Builder newBuilder() {
        return new Builder();
    }

    public static final class Builder {
        public Builder setResponseCode(int responseCode) {
            return this;
        }

        public Builder setDebugMessage(String debugMessage) {
            return this;
        }

        public BillingResult build() {
            return new BillingResult();
        }
    }
}
