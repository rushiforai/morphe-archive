package com.android.billingclient.api;

import java.util.List;

@Deprecated
/* loaded from: classes2.dex */
public interface SkuDetailsResponseListener {
    void onSkuDetailsResponse(BillingResult billingResult, List<SkuDetails> list);
}
