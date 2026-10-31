package com.bytedance.sdk.component.zb.ycx;

/* loaded from: classes2.dex */
public final class lt {
    private final String[] ycx;

    public lt(String[] strArr) {
        this.ycx = strArr;
    }

    public int ycx() {
        return this.ycx.length / 2;
    }

    public String zb(int i5) {
        return this.ycx[(i5 * 2) + 1];
    }

    public String ycx(int i5) {
        return this.ycx[i5 * 2];
    }
}
