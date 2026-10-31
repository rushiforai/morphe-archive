package org.chromium.net;

/* loaded from: classes5.dex */
public class ApiVersion {
    private static final int API_LEVEL = 40;
    private static final String CRONET_VERSION = "143.0.7445.0";
    private static final String LAST_CHANGE = "1f9b13829402b4f23081b627300dc00cc91c4d37-refs/branch-heads/7445@{#1}";
    private static final int MIN_COMPATIBLE_API_LEVEL = 3;

    private ApiVersion() {
    }

    public static int getApiLevel() {
        return 3;
    }

    public static String getCronetVersion() {
        return CRONET_VERSION;
    }

    public static String getCronetVersionWithLastChange() {
        return "143.0.7445.0@1f9b1382";
    }

    public static String getLastChange() {
        return LAST_CHANGE;
    }

    public static int getMaximumAvailableApiLevel() {
        return 40;
    }
}
