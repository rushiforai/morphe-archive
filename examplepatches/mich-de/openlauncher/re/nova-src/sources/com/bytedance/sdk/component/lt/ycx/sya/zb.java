package com.bytedance.sdk.component.lt.ycx.sya;

import com.bytedance.sdk.component.lt.ycx.lud;
import com.bytedance.sdk.component.lt.ycx.ul;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes2.dex */
public class zb {
    public static void ycx(AtomicLong atomicLong, int i5) {
        lud ludVarSyc = ul.lt().syc();
        if (ludVarSyc == null || !ludVarSyc.ul() || atomicLong == null) {
            return;
        }
        atomicLong.getAndAdd(i5);
    }
}
