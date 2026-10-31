package com.bytedance.sdk.openadsdk.tn;

/* loaded from: classes2.dex */
public enum xkz {
    NUMERIC(new int[]{10, 12, 14}, 1),
    ALPHANUMERIC(new int[]{9, 11, 13}, 2),
    BYTE(new int[]{8, 16, 16}, 4),
    ECI(new int[]{0, 0, 0}, 7),
    KANJI(new int[]{8, 10, 12}, 8),
    FNC1_FIRST_POSITION(new int[]{0, 0, 0}, 5);

    private final int fby;

    /* renamed from: ul, reason: collision with root package name */
    private final int[] f27083ul;

    xkz(int[] iArr, int i5) {
        this.f27083ul = iArr;
        this.fby = i5;
    }

    public int ycx(uh uhVar) {
        int iYcx = uhVar.ycx();
        return this.f27083ul[iYcx <= 9 ? (char) 0 : iYcx <= 26 ? (char) 1 : (char) 2];
    }

    public int ycx() {
        return this.fby;
    }
}
