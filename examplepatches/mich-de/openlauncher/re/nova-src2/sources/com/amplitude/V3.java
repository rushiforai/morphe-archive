package com.amplitude;

import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes2.dex */
public abstract class V3 {
    public static final long a(String str) {
        Intrinsics.g(str, "<this>");
        try {
            Intrinsics.f(str.getBytes(Charsets.f72000b), "getBytes(...)");
            return r2.length;
        } catch (Throwable unused) {
            return -1L;
        }
    }

    public static final char[] a(char[] cArr) {
        Intrinsics.g(cArr, "<this>");
        int length = cArr.length;
        char[] cArr2 = new char[length];
        for (int i5 = 0; i5 < length; i5++) {
            cArr2[i5] = '*';
        }
        return cArr2;
    }
}
