package com.bytedance.sdk.component.lud.zb.zb;

import com.bytedance.sdk.component.lud.uh;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes2.dex */
public class lud implements lt {
    @Override // com.bytedance.sdk.component.lud.zb.zb.lt
    public boolean ycx(com.bytedance.sdk.component.lud.zb.sya.sya syaVar, uh uhVar, com.bytedance.sdk.component.lud.zb.sya.ycx ycxVar) {
        List<com.bytedance.sdk.component.lud.zb.sya.sya> copyOnWriteArrayList;
        String strUh = syaVar.uh();
        Map<String, List<com.bytedance.sdk.component.lud.zb.sya.sya>> mapJw = syaVar.dy().jw();
        syaVar.ea();
        syaVar.ycx();
        synchronized (mapJw) {
            try {
                copyOnWriteArrayList = mapJw.get(strUh);
                if (copyOnWriteArrayList == null) {
                    copyOnWriteArrayList = new CopyOnWriteArrayList<>();
                    mapJw.put(strUh, copyOnWriteArrayList);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        synchronized (copyOnWriteArrayList) {
            copyOnWriteArrayList.add(syaVar);
            if (copyOnWriteArrayList.size() <= 1) {
                return true;
            }
            syaVar.ea();
            syaVar.ycx();
            return false;
        }
    }

    @Override // com.bytedance.sdk.component.lud.zb.zb.lt
    public String ycx() {
        return "check_duplicate";
    }
}
