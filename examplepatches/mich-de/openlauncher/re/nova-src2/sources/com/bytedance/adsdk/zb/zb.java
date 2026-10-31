package com.bytedance.adsdk.zb;

/* loaded from: classes2.dex */
class zb {
    static final int[] ycx = new int[0];

    /* renamed from: zb, reason: collision with root package name */
    static final long[] f23273zb = new long[0];
    static final Object[] sya = new Object[0];

    public static int ycx(int[] iArr, int i5, int i11) {
        int i12 = i5 - 1;
        int i13 = 0;
        while (i13 <= i12) {
            int i14 = (i13 + i12) >>> 1;
            int i15 = iArr[i14];
            if (i15 < i11) {
                i13 = i14 + 1;
            } else {
                if (i15 <= i11) {
                    return i14;
                }
                i12 = i14 - 1;
            }
        }
        return ~i13;
    }
}
