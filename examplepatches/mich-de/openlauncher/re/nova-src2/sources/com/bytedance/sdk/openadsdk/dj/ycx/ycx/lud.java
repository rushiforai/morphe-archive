package com.bytedance.sdk.openadsdk.dj.ycx.ycx;

/* loaded from: classes2.dex */
public final class lud {
    private static final byte[] ycx = {105, -42, 73, -118, 67, -35, 89, -76, 122, -9, 45, 88, 34, 76, 10, 55};

    /* renamed from: zb, reason: collision with root package name */
    private static byte[] f26749zb = null;

    public static byte[] ycx() {
        if (f26749zb == null) {
            byte[] bArr = new byte[ycx.length];
            int i5 = 0;
            while (true) {
                byte[] bArr2 = ycx;
                if (i5 >= bArr2.length) {
                    break;
                }
                bArr[i5] = (byte) (bArr2[i5] ^ 20);
                i5++;
            }
            f26749zb = bArr;
        }
        return f26749zb;
    }
}
