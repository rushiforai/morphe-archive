package com.bytedance.adsdk.ycx.zb.sya.ycx;

import java.util.Deque;
import java.util.LinkedList;

/* loaded from: classes2.dex */
public class jw extends lt {
    @Override // com.bytedance.adsdk.ycx.zb.sya.ycx.lt
    public int ycx(String str, int i5, Deque<com.bytedance.adsdk.ycx.zb.zb.ycx> deque, com.bytedance.adsdk.ycx.zb.sya.ycx ycxVar) {
        com.bytedance.adsdk.ycx.zb.zb.ycx ycxVarPollFirst;
        if (')' != ycx(i5, str)) {
            return ycxVar.ycx(str, i5, deque);
        }
        LinkedList<com.bytedance.adsdk.ycx.zb.zb.ycx> linkedList = new LinkedList();
        while (true) {
            ycxVarPollFirst = deque.pollFirst();
            if (ycxVarPollFirst == null || ycxVarPollFirst.ycx() == com.bytedance.adsdk.ycx.zb.dj.dj.LEFT_PAREN || ((ycxVarPollFirst instanceof com.bytedance.adsdk.ycx.zb.zb.ycx.jc) && ycxVarPollFirst.ycx() == com.bytedance.adsdk.ycx.zb.dj.zb.METHOD && !((com.bytedance.adsdk.ycx.zb.zb.ycx.jc) ycxVarPollFirst).sya())) {
                break;
            }
            linkedList.addFirst(ycxVarPollFirst);
        }
        if (ycxVarPollFirst == null) {
            throw new IllegalArgumentException(str.substring(0, i5));
        }
        if (ycxVarPollFirst.ycx() != com.bytedance.adsdk.ycx.zb.dj.zb.METHOD) {
            deque.push(com.bytedance.adsdk.ycx.zb.lud.zb.ycx(linkedList, str, i5));
            return i5 + 1;
        }
        com.bytedance.adsdk.ycx.zb.zb.ycx.jc jcVar = (com.bytedance.adsdk.ycx.zb.zb.ycx.jc) ycxVarPollFirst;
        LinkedList linkedList2 = new LinkedList();
        LinkedList linkedList3 = new LinkedList();
        for (com.bytedance.adsdk.ycx.zb.zb.ycx ycxVar2 : linkedList) {
            if (ycxVar2.ycx() == com.bytedance.adsdk.ycx.zb.dj.dj.COMMA) {
                linkedList2.add(com.bytedance.adsdk.ycx.zb.lud.zb.ycx(linkedList3, str, i5));
                linkedList3.clear();
            } else {
                linkedList3.addLast(ycxVar2);
            }
        }
        if (!linkedList3.isEmpty()) {
            linkedList2.add(com.bytedance.adsdk.ycx.zb.lud.zb.ycx(linkedList3, str, i5));
        }
        jcVar.ycx((com.bytedance.adsdk.ycx.zb.zb.ycx[]) linkedList2.toArray(new com.bytedance.adsdk.ycx.zb.zb.ycx[linkedList2.size()]));
        jcVar.ycx(true);
        int i11 = i5 + 1;
        deque.push(jcVar);
        return i11;
    }
}
