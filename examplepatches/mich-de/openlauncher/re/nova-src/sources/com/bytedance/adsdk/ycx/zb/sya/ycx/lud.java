package com.bytedance.adsdk.ycx.zb.sya.ycx;

import java.util.Deque;

/* loaded from: classes2.dex */
public class lud extends lt {
    @Override // com.bytedance.adsdk.ycx.zb.sya.ycx.lt
    public int ycx(String str, int i5, Deque<com.bytedance.adsdk.ycx.zb.zb.ycx> deque, com.bytedance.adsdk.ycx.zb.sya.ycx ycxVar) {
        char cYcx;
        int i11 = i5;
        while (true) {
            cYcx = ycx(i11, str);
            if (!com.bytedance.adsdk.ycx.zb.lud.ycx.zb(cYcx) && !com.bytedance.adsdk.ycx.zb.lud.ycx.sya(cYcx)) {
                break;
            }
            i11++;
        }
        if (cYcx != '(') {
            return ycxVar.ycx(str, i5, deque);
        }
        deque.push(new com.bytedance.adsdk.ycx.zb.zb.ycx.jc(str.substring(i5, i11)));
        return i11 + 1;
    }
}
