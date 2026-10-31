package com.bytedance.sdk.openadsdk.component.reward;

import com.bytedance.sdk.openadsdk.utils.yzp;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public class sya extends com.bytedance.sdk.component.fby.zb.sya {
    private final List<? extends com.bytedance.sdk.component.fby.zb.sya> ycx;

    public sya(String str, List<? extends com.bytedance.sdk.component.fby.zb.sya> list) {
        super(str);
        this.ycx = list;
    }

    @Override // java.lang.Runnable
    public void run() {
        List<? extends com.bytedance.sdk.component.fby.zb.sya> list;
        if (com.bytedance.sdk.component.utils.pmi.sya(com.bytedance.sdk.openadsdk.core.pmi.ycx()) != 0 && (list = this.ycx) != null) {
            Iterator<? extends com.bytedance.sdk.component.fby.zb.sya> it = list.iterator();
            while (it.hasNext()) {
                yzp.ycx(it.next(), 1);
                it.remove();
            }
        }
        try {
            com.bytedance.sdk.component.utils.jw.ycx().removeCallbacks(this);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVk=", "eOEjgQqyfMKkRcBTgB6hLG/vPp4=", "Sfsj", 38);
        }
    }
}
