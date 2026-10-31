package com.bytedance.adsdk.zb.ycx.zb;

import java.util.List;

/* loaded from: classes2.dex */
public class lud extends ul<com.bytedance.adsdk.zb.sya.zb.dj> {

    /* renamed from: dj, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.zb.dj f23254dj;

    public lud(List<com.bytedance.adsdk.zb.ul.ycx<com.bytedance.adsdk.zb.sya.zb.dj>> list) {
        super(list);
        com.bytedance.adsdk.zb.sya.zb.dj djVar = list.get(0).ycx;
        int iSya = djVar != null ? djVar.sya() : 0;
        this.f23254dj = new com.bytedance.adsdk.zb.sya.zb.dj(new float[iSya], new int[iSya]);
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public com.bytedance.adsdk.zb.sya.zb.dj ycx(com.bytedance.adsdk.zb.ul.ycx<com.bytedance.adsdk.zb.sya.zb.dj> ycxVar, float f11) {
        this.f23254dj.ycx(ycxVar.ycx, ycxVar.f23138zb, f11);
        return this.f23254dj;
    }
}
