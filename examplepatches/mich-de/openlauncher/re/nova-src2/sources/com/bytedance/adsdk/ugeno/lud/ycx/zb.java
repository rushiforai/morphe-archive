package com.bytedance.adsdk.ugeno.lud.ycx;

import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes2.dex */
public class zb implements sya {
    private List<dj> ycx = new CopyOnWriteArrayList();

    @Override // com.bytedance.adsdk.ugeno.lud.ycx.sya
    public void ycx(dj djVar) {
        this.ycx.add(djVar);
    }

    @Override // com.bytedance.adsdk.ugeno.lud.ycx.sya
    public void ycx(String str) {
        if (this.ycx.isEmpty()) {
            return;
        }
        Iterator<dj> it = this.ycx.iterator();
        while (it.hasNext()) {
            it.next().ycx(str);
        }
    }
}
