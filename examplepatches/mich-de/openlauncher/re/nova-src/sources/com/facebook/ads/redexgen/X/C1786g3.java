package com.facebook.ads.redexgen.X;

import com.facebook.ads.AdSettings;

/* renamed from: com.facebook.ads.redexgen.X.g3, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public /* synthetic */ class C1786g3 {
    public static final /* synthetic */ int[] A00 = new int[AdSettings.IntegrationErrorMode.values().length];

    static {
        try {
            A00[AdSettings.IntegrationErrorMode.INTEGRATION_ERROR_CRASH_DEBUG_MODE.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            A00[AdSettings.IntegrationErrorMode.INTEGRATION_ERROR_CALLBACK_MODE.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
    }
}
