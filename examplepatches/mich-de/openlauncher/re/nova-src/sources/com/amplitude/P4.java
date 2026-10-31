package com.amplitude;

import kotlin.UInt;

/* loaded from: classes2.dex */
public abstract class P4 {
    public static int a(byte[] bArr, int i5) {
        int i11 = ((bArr[i5 + 3] & 255) << 24) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16);
        UInt.Companion companion = UInt.f71696b;
        return i11;
    }
}
