package com.bytedance.adsdk.ycx.zb.sya.ycx;

import java.util.Deque;

/* loaded from: classes2.dex */
public abstract class lt {
    public char ycx(int i5, String str) {
        if (i5 >= str.length()) {
            return (char) 26;
        }
        return str.charAt(i5);
    }

    public abstract int ycx(String str, int i5, Deque<com.bytedance.adsdk.ycx.zb.zb.ycx> deque, com.bytedance.adsdk.ycx.zb.sya.ycx ycxVar);

    public int zb(int i5, String str) {
        while (com.bytedance.adsdk.ycx.zb.lud.ycx.ycx(ycx(i5, str))) {
            i5++;
        }
        return i5;
    }
}
