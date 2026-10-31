package com.android.billingclient.api;

/* loaded from: classes.dex */
public interface BillingClientStateListener {
    void onBillingServiceDisconnected();

    void onBillingSetupFinished(BillingResult billingResult);
}
