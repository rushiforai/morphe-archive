package com.tiktok.iap.billing.client;

import com.tiktok.iap.billing.GPBillVersions;

/* loaded from: classes4.dex */
public interface IBillingProxy {
    GPBillVersions.GPBillingVer getVersion();

    void init();

    void queryPurchaseHistory();
}
