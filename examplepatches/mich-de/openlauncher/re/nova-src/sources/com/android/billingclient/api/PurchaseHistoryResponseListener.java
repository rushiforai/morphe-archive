package com.android.billingclient.api;

import java.util.List;

/* loaded from: classes2.dex */
public interface PurchaseHistoryResponseListener {
    void onPurchaseHistoryResponse(BillingResult billingResult, List<PurchaseHistoryRecord> list);
}
