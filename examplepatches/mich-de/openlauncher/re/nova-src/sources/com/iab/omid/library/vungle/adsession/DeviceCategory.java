package com.iab.omid.library.vungle.adsession;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;

/* loaded from: classes3.dex */
public enum DeviceCategory {
    CTV("ctv"),
    MOBILE("mobile"),
    OTHER(InneractiveMediationNameConsts.OTHER);

    private final String deviceCategory;

    DeviceCategory(String str) {
        this.deviceCategory = str;
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.deviceCategory;
    }
}
