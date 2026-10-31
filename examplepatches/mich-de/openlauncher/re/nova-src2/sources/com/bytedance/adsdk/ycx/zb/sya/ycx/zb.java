package com.bytedance.adsdk.ycx.zb.sya.ycx;

import com.bytedance.adsdk.ycx.zb.zb.ycx.htf;
import java.util.Deque;

/* loaded from: classes2.dex */
public class zb extends lt {
    @Override // com.bytedance.adsdk.ycx.zb.sya.ycx.lt
    public int ycx(String str, int i5, Deque<com.bytedance.adsdk.ycx.zb.zb.ycx> deque, com.bytedance.adsdk.ycx.zb.sya.ycx ycxVar) {
        if ('\'' != ycx(i5, str)) {
            return ycxVar.ycx(str, i5, deque);
        }
        int i11 = i5 + 1;
        int length = str.length();
        int i12 = i11;
        while (i12 < length && ycx(i12, str) != '\'') {
            i12++;
        }
        if (ycx(i12, str) != '\'') {
            throw new com.bytedance.adsdk.ycx.ycx.ycx("String expression not surrounded by '", str.substring(i5));
        }
        deque.push(new htf(str.substring(i11, i12)));
        return i12 + 1;
    }
}
