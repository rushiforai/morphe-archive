package com.bytedance.adsdk.zb.ycx.zb;

import java.util.List;

/* loaded from: classes2.dex */
public class lt extends ul<Integer> {
    public lt(List<com.bytedance.adsdk.zb.ul.ycx<Integer>> list) {
        super(list);
    }

    public int jw() {
        return sya(sya(), lud());
    }

    public int sya(com.bytedance.adsdk.zb.ul.ycx<Integer> ycxVar, float f11) {
        if (ycxVar.ycx == null || ycxVar.f23138zb == null) {
            throw new IllegalStateException("Missing values for keyframe.");
        }
        if (this.sya == null) {
            return com.bytedance.adsdk.zb.lt.lud.ycx(ycxVar.fby(), ycxVar.jw(), f11);
        }
        ycxVar.f23137ul.getClass();
        dj();
        fby();
        throw null;
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public Integer ycx(com.bytedance.adsdk.zb.ul.ycx<Integer> ycxVar, float f11) {
        return Integer.valueOf(sya(ycxVar, f11));
    }
}
