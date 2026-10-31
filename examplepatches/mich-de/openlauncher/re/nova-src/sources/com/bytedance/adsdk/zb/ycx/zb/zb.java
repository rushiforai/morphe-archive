package com.bytedance.adsdk.zb.ycx.zb;

import java.util.List;

/* loaded from: classes2.dex */
public class zb extends ul<Integer> {
    public zb(List<com.bytedance.adsdk.zb.ul.ycx<Integer>> list) {
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
            return com.bytedance.adsdk.zb.lt.zb.ycx(com.bytedance.adsdk.zb.lt.lud.zb(f11, 0.0f, 1.0f), ycxVar.ycx.intValue(), ycxVar.f23138zb.intValue());
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
