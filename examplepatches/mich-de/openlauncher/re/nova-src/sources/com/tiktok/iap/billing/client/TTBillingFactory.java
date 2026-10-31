package com.tiktok.iap.billing.client;

import com.tiktok.iap.billing.GPBillVersions;

/* loaded from: classes4.dex */
public class TTBillingFactory {
    public static IBillingProxy createBillingProxy() {
        return GPBillVersions.getMajorVersion() == GPBillVersions.GPBillingVer.V5_V8 ? new V5_V8BillingProxy() : new EmptyBillingProxy();
    }
}
