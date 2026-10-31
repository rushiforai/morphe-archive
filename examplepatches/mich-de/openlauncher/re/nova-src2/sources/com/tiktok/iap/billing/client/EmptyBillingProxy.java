package com.tiktok.iap.billing.client;

import com.tiktok.iap.billing.GPBillVersions;

/* loaded from: classes4.dex */
class EmptyBillingProxy implements IBillingProxy {
    @Override // com.tiktok.iap.billing.client.IBillingProxy
    public GPBillVersions.GPBillingVer getVersion() {
        return GPBillVersions.GPBillingVer.NONE;
    }

    @Override // com.tiktok.iap.billing.client.IBillingProxy
    public void init() {
    }

    @Override // com.tiktok.iap.billing.client.IBillingProxy
    public void queryPurchaseHistory() {
    }
}
