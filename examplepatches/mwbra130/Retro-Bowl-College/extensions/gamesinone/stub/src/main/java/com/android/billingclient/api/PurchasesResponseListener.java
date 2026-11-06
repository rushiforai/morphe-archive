package com.android.billingclient.api;

import java.util.List;

/**
 * Compile-only stub of the Play Billing listener the Games In One
 * extension implements. At runtime the app's real billing library class
 * is used; only the signatures matter here.
 */
public interface PurchasesResponseListener {
    void onQueryPurchasesResponse(BillingResult billingResult, List<Purchase> purchases);
}
