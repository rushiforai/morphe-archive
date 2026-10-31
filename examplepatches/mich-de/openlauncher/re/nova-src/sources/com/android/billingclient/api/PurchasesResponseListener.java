package com.android.billingclient.api;

import java.util.List;

/* loaded from: classes2.dex */
public interface PurchasesResponseListener {
    void onQueryPurchasesResponse(BillingResult billingResult, List<Purchase> list);
}
