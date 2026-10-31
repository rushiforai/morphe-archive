package com.fyber.inneractive.sdk.util;

/* loaded from: classes3.dex */
public abstract class k1 {
    public static boolean a(String str) {
        int i5 = com.fyber.inneractive.sdk.config.n.f27870a;
        String property = System.getProperty("ia.testEnvironmentConfiguration.response");
        return property != null && property.trim().length() > 0 && str != null && str.toLowerCase().startsWith("fyberInternalTesting".toLowerCase()) && str.contains("crash");
    }
}
