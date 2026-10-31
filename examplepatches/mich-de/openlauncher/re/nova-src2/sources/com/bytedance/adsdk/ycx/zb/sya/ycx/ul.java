package com.bytedance.adsdk.ycx.zb.sya.ycx;

import com.bytedance.adsdk.ycx.zb.zb.ycx.syc;
import java.util.Deque;

/* loaded from: classes2.dex */
public class ul extends lt {
    private boolean ycx(String str, int i5, Deque<com.bytedance.adsdk.ycx.zb.zb.ycx> deque) {
        if ('-' != ycx(i5, str)) {
            return com.bytedance.adsdk.ycx.zb.lud.ycx.sya(ycx(i5, str));
        }
        if (deque.peek() != null && !com.bytedance.adsdk.ycx.zb.dj.sya.ycx(deque.peek().ycx())) {
            return false;
        }
        if (com.bytedance.adsdk.ycx.zb.lud.ycx.sya(ycx(i5 + 1, str))) {
            return true;
        }
        throw new IllegalArgumentException("Unrecognized - symbol, not a negative number or operator, problem range:" + str.substring(0, i5));
    }

    @Override // com.bytedance.adsdk.ycx.zb.sya.ycx.lt
    public int ycx(String str, int i5, Deque<com.bytedance.adsdk.ycx.zb.zb.ycx> deque, com.bytedance.adsdk.ycx.zb.sya.ycx ycxVar) {
        char cYcx;
        if (!ycx(str, i5, deque)) {
            return ycxVar.ycx(str, i5, deque);
        }
        int i11 = ycx(i5, str) == '-' ? i5 + 1 : i5;
        boolean z11 = false;
        while (true) {
            cYcx = ycx(i11, str);
            if (!com.bytedance.adsdk.ycx.zb.lud.ycx.sya(cYcx) && (z11 || cYcx != '.')) {
                break;
            }
            i11++;
            if (cYcx == '.') {
                z11 = true;
            }
        }
        if (cYcx != '.') {
            deque.push(new syc(str.substring(i5, i11)));
            return i11;
        }
        throw new IllegalArgumentException("Illegal negative number format, problem interval:" + str.substring(i5, i11));
    }
}
