package com.bytedance.adsdk.ycx.zb.sya.ycx;

import com.bytedance.adsdk.ycx.zb.zb.ycx.wwx;
import java.util.Deque;

/* loaded from: classes2.dex */
public class sya extends lt {
    @Override // com.bytedance.adsdk.ycx.zb.sya.ycx.lt
    public int ycx(String str, int i5, Deque<com.bytedance.adsdk.ycx.zb.zb.ycx> deque, com.bytedance.adsdk.ycx.zb.sya.ycx ycxVar) {
        char cYcx = ycx(i5, str);
        return (com.bytedance.adsdk.ycx.zb.lud.ycx.zb(cYcx) || cYcx == '$') ? ycx(str, i5, deque) : ycxVar.ycx(str, i5, deque);
    }

    private int ycx(String str, int i5, Deque<com.bytedance.adsdk.ycx.zb.zb.ycx> deque) {
        int i11;
        int i12 = 0;
        while (true) {
            i11 = i12 + i5;
            char cYcx = ycx(i11, str);
            if (!com.bytedance.adsdk.ycx.zb.lud.ycx.zb(cYcx) && !com.bytedance.adsdk.ycx.zb.lud.ycx.sya(cYcx) && '.' != cYcx && '[' != cYcx && ']' != cYcx && '_' != cYcx && '$' != cYcx) {
                break;
            }
            i12++;
        }
        String strSubstring = str.substring(i5, i11);
        if (com.bytedance.adsdk.ycx.zb.dj.ycx.ycx(strSubstring) != null) {
            deque.push(new com.bytedance.adsdk.ycx.zb.zb.ycx.ul(strSubstring));
            return i11;
        }
        deque.push(new wwx(strSubstring));
        return i11;
    }
}
