package com.bytedance.sdk.openadsdk.core;

import android.util.Base64;

/* loaded from: classes2.dex */
public final class ycx {
    private static final String ycx = sya();

    /* renamed from: zb, reason: collision with root package name */
    private static final String f26508zb = pmi.dj().dj();

    private static String sya() {
        char[] cArr = {203, 182, 168, 176, 207, 148, 149, 178, 205, 182, 149, 166, 134, 178, 184, 176, 206, 174, 187, 178, 150, 185, 167, 166};
        char[] cArr2 = new char[24];
        for (int i5 = 23; i5 >= 0; i5--) {
            cArr2[23 - i5] = (char) (cArr[i5] ^ 255);
        }
        return new String(cArr2);
    }

    public static String ycx() {
        return new String(Base64.decode(ycx, 0)).substring(2);
    }

    public static String zb() {
        return new String(Base64.decode(f26508zb, 0)).substring(2);
    }
}
