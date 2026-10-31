package com.bytedance.adsdk.ycx.zb.sya.ycx;

import b.u4;
import com.bytedance.adsdk.ycx.zb.zb.ycx.dy;
import java.util.Deque;

/* loaded from: classes2.dex */
public class fby extends lt {
    @Override // com.bytedance.adsdk.ycx.zb.sya.ycx.lt
    public int ycx(String str, int i5, Deque<com.bytedance.adsdk.ycx.zb.zb.ycx> deque, com.bytedance.adsdk.ycx.zb.sya.ycx ycxVar) {
        if (!com.bytedance.adsdk.ycx.zb.lud.ycx.dj(ycx(i5, str))) {
            return ycxVar.ycx(str, i5, deque);
        }
        int i11 = i5 + 1;
        String str2 = new String(new char[]{ycx(i5, str), ycx(i11, str)});
        if (com.bytedance.adsdk.ycx.zb.dj.sya.ycx(str2) != null) {
            deque.push(new dy(com.bytedance.adsdk.ycx.zb.dj.sya.ycx(str2)));
            return i5 + 2;
        }
        String strValueOf = String.valueOf(ycx(i5, str));
        if (com.bytedance.adsdk.ycx.zb.dj.sya.ycx(strValueOf) != null) {
            deque.push(new dy(com.bytedance.adsdk.ycx.zb.dj.sya.ycx(strValueOf)));
            return i11;
        }
        StringBuilder sbK = u4.k("Unrecognized:", strValueOf, "examine:");
        sbK.append(str.substring(0, i5));
        throw new IllegalArgumentException(sbK.toString());
    }
}
