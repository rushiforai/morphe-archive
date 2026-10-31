package com.bytedance.adsdk.ycx.zb.sya.ycx;

import com.bytedance.adsdk.ycx.zb.zb.ycx.thx;
import java.util.Deque;

/* loaded from: classes2.dex */
public class dj extends lt {
    @Override // com.bytedance.adsdk.ycx.zb.sya.ycx.lt
    public int ycx(String str, int i5, Deque<com.bytedance.adsdk.ycx.zb.zb.ycx> deque, com.bytedance.adsdk.ycx.zb.sya.ycx ycxVar) {
        if ('(' != ycx(i5, str)) {
            return ycxVar.ycx(str, i5, deque);
        }
        deque.push(new thx(com.bytedance.adsdk.ycx.zb.dj.dj.LEFT_PAREN));
        return i5 + 1;
    }
}
