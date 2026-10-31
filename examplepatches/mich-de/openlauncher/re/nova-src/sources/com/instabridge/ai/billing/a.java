package com.instabridge.ai.billing;

import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.PurchasesResponseListener;
import com.android.billingclient.api.PurchasesUpdatedListener;
import java.util.List;

/* loaded from: classes3.dex */
public final /* synthetic */ class a implements PurchasesUpdatedListener, PurchasesResponseListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ BillingManager f35312a;

    public /* synthetic */ a(BillingManager billingManager) {
        this.f35312a = billingManager;
    }

    @Override // com.android.billingclient.api.PurchasesUpdatedListener
    public void onPurchasesUpdated(BillingResult billingResult, List list) {
        BillingManager.purchasesUpdatedListener$lambda$0(this.f35312a, billingResult, list);
    }

    @Override // com.android.billingclient.api.PurchasesResponseListener
    public void onQueryPurchasesResponse(BillingResult billingResult, List list) {
        BillingManager.recoverPendingPurchases$lambda$12(this.f35312a, billingResult, list);
    }
}
