package com.bytedance.adsdk.ugeno.lud.ycx;

import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public class ycx {
    private volatile Map<String, sya> ycx = new HashMap();

    public sya ycx(String str) {
        if (this.ycx.containsKey(str) && this.ycx.get(str) != null) {
            return this.ycx.get(str);
        }
        zb zbVar = new zb();
        this.ycx.put(str, zbVar);
        return zbVar;
    }

    public void ycx(String str, sya syaVar) {
        if (!this.ycx.containsKey(str) || this.ycx.get(str) == null) {
            this.ycx.put(str, syaVar);
        }
    }
}
