package com.fyber.inneractive.sdk.util;

import java.util.Locale;

/* loaded from: classes3.dex */
public enum g {
    DISPLAY("DISPLAY"),
    VIDEO_CTA("VIDEO_CTA"),
    VIDEO_CLICK("VIDEO_CLICK"),
    VAST_ENDCARD("VAST_ENDCARD"),
    DEFAULT_ENDCARD("DEFAULT_ENDCARD"),
    VIDEO_APP_INFO("VIDEO_APP_INFO"),
    FMP_ENDCARD("FMP_ENDCARD"),
    STORE_PROMO_CTA("STORE_PROMO_CTA"),
    NATIVE_CTA("NATIVE_CTA"),
    NATIVE_AD_TITLE("NATIVE_AD_TITLE"),
    NATIVE_AD_DESCRIPTION("NATIVE_AD_DESCRIPTION"),
    NATIVE_AD_RATING("NATIVE_AD_RATING"),
    NATIVE_AD_IMAGE("NATIVE_AD_IMAGE"),
    NATIVE_AD_VIDEO("NATIVE_AD_VIDEO"),
    NATIVE_AD_ICON("NATIVE_AD_ICON"),
    NATIVE_AD_ROOT("NATIVE_AD_ROOT"),
    NATIVE("NATIVE");

    private final String key;
    private String mVersion = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private int mOrderShown = 0;

    g(String str) {
        this.key = str;
    }

    public final void a(String str) {
        this.mVersion = str;
    }

    @Override // java.lang.Enum
    public final String toString() {
        if ((this != FMP_ENDCARD || this.mOrderShown != 1) && this.mOrderShown != 2) {
            return this.key;
        }
        Locale locale = Locale.US;
        return this.key + "_" + this.mOrderShown;
    }

    public final String a() {
        return this.mVersion;
    }

    public final void a(int i5) {
        this.mOrderShown = i5;
    }
}
