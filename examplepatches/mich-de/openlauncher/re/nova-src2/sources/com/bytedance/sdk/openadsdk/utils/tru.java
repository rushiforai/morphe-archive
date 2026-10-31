package com.bytedance.sdk.openadsdk.utils;

import java.security.SecureRandom;
import java.util.UUID;

/* loaded from: classes2.dex */
public class tru {
    private static final ThreadLocal<SecureRandom> ycx = new ThreadLocal<>();

    public static String ycx() {
        byte[] bArr = new byte[16];
        ThreadLocal<SecureRandom> threadLocal = ycx;
        SecureRandom secureRandom = threadLocal.get();
        if (secureRandom == null) {
            secureRandom = new SecureRandom();
            threadLocal.set(secureRandom);
        }
        secureRandom.nextBytes(bArr);
        byte b11 = (byte) (bArr[6] & 15);
        bArr[6] = b11;
        bArr[6] = (byte) (b11 | 64);
        byte b12 = (byte) (bArr[8] & 63);
        bArr[8] = b12;
        bArr[8] = (byte) (b12 | 128);
        long j11 = 0;
        long j12 = 0;
        for (int i5 = 0; i5 < 8; i5++) {
            j12 = (j12 << 8) | (bArr[i5] & 255);
        }
        for (int i11 = 8; i11 < 16; i11++) {
            j11 = (j11 << 8) | (bArr[i11] & 255);
        }
        return new UUID(j12, j11).toString();
    }
}
