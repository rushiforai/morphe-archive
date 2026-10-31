package com.bytedance.adsdk.zb.sya.ycx;

import java.util.Arrays;
import java.util.List;

/* loaded from: classes2.dex */
abstract class xkz<V, O> implements ry<V, O> {
    final List<com.bytedance.adsdk.zb.ul.ycx<V>> ycx;

    public xkz(List<com.bytedance.adsdk.zb.ul.ycx<V>> list) {
        this.ycx = list;
    }

    @Override // com.bytedance.adsdk.zb.sya.ycx.ry
    public List<com.bytedance.adsdk.zb.ul.ycx<V>> sya() {
        return this.ycx;
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder();
        if (!this.ycx.isEmpty()) {
            sb2.append("values=");
            sb2.append(Arrays.toString(this.ycx.toArray()));
        }
        return sb2.toString();
    }

    @Override // com.bytedance.adsdk.zb.sya.ycx.ry
    public boolean zb() {
        return this.ycx.isEmpty() || (this.ycx.size() == 1 && this.ycx.get(0).lud());
    }
}
