package com.bytedance.adsdk.zb.sya.zb;

/* loaded from: classes2.dex */
public class fby {

    /* renamed from: dj, reason: collision with root package name */
    private final boolean f23043dj;
    private final com.bytedance.adsdk.zb.sya.ycx.dj sya;
    private final ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.ycx.fby f23044zb;

    public enum ycx {
        MASK_MODE_ADD,
        MASK_MODE_SUBTRACT,
        MASK_MODE_INTERSECT,
        MASK_MODE_NONE
    }

    public fby(ycx ycxVar, com.bytedance.adsdk.zb.sya.ycx.fby fbyVar, com.bytedance.adsdk.zb.sya.ycx.dj djVar, boolean z11) {
        this.ycx = ycxVar;
        this.f23044zb = fbyVar;
        this.sya = djVar;
        this.f23043dj = z11;
    }

    public boolean dj() {
        return this.f23043dj;
    }

    public com.bytedance.adsdk.zb.sya.ycx.dj sya() {
        return this.sya;
    }

    public ycx ycx() {
        return this.ycx;
    }

    public com.bytedance.adsdk.zb.sya.ycx.fby zb() {
        return this.f23044zb;
    }
}
