package com.facebook.ads.redexgen.X;

import java.util.concurrent.ConcurrentHashMap;

/* renamed from: com.facebook.ads.redexgen.X.jm, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2012jm {
    public static final ConcurrentHashMap<String, C1048Kz> A00 = new ConcurrentHashMap<>();

    public static C1048Kz A00(String str) {
        return A00.remove(str);
    }

    public static void A01(String str) {
        A00.remove(str);
    }

    public static void A02(String str, C1048Kz c1048Kz) {
        A00.put(str, c1048Kz);
    }
}
