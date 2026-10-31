package com.bytedance.sdk.openadsdk.api.factory;

import android.util.Log;

/* loaded from: classes.dex */
public class SDKTypeConfig {
    private static ISDKTypeFactory ycx;

    public static ISDKTypeFactory getSdkTypeFactory() {
        Log.i("SDKTypeConfig", "getSdkTypeFactory: ");
        return ycx;
    }

    public static void setSdkTypeFactory(ISDKTypeFactory iSDKTypeFactory) {
        Log.i("SDKTypeConfig", "setSdkTypeFactory: ");
        ycx = iSDKTypeFactory;
    }
}
