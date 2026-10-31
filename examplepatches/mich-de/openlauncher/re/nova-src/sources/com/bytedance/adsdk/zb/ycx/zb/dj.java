package com.bytedance.adsdk.zb.ycx.zb;

import java.util.List;

/* loaded from: classes2.dex */
public class dj extends ul<Float> {
    public dj(List<com.bytedance.adsdk.zb.ul.ycx<Float>> list) {
        super(list);
    }

    public float jw() {
        return sya(sya(), lud());
    }

    public float sya(com.bytedance.adsdk.zb.ul.ycx<Float> ycxVar, float f11) {
        if (ycxVar.ycx == null || ycxVar.f23138zb == null) {
            throw new IllegalStateException("Missing values for keyframe.");
        }
        if (this.sya == null) {
            return com.bytedance.adsdk.zb.lt.lud.ycx(ycxVar.lt(), ycxVar.ul(), f11);
        }
        ycxVar.f23137ul.getClass();
        dj();
        fby();
        throw null;
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public Float ycx(com.bytedance.adsdk.zb.ul.ycx<Float> ycxVar, float f11) {
        return Float.valueOf(sya(ycxVar, f11));
    }
}
