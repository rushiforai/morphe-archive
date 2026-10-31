package com.fyber.inneractive.sdk.util;

/* loaded from: classes3.dex */
public abstract class j1 {
    public static String a(String str, int i5) {
        if (i5 <= 0 || str.length() <= i5) {
            return str;
        }
        return str.substring(0, i5 - 3) + "...";
    }
}
