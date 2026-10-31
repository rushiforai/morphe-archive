package com.bytedance.adsdk.zb.ycx.zb;

import android.graphics.PointF;
import java.util.Collections;

/* loaded from: classes2.dex */
public class xkz extends ycx<PointF, PointF> {

    /* renamed from: dj, reason: collision with root package name */
    protected com.bytedance.adsdk.zb.ul.zb<Float> f23262dj;
    private final ycx<Float, Float> fby;

    /* renamed from: jw, reason: collision with root package name */
    private final ycx<Float, Float> f23263jw;

    /* renamed from: lt, reason: collision with root package name */
    private final PointF f23264lt;
    protected com.bytedance.adsdk.zb.ul.zb<Float> lud;

    /* renamed from: ul, reason: collision with root package name */
    private final PointF f23265ul;

    public xkz(ycx<Float, Float> ycxVar, ycx<Float, Float> ycxVar2) {
        super(Collections.EMPTY_LIST);
        this.f23264lt = new PointF();
        this.f23265ul = new PointF();
        this.fby = ycxVar;
        this.f23263jw = ycxVar2;
        ycx(fby());
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx
    /* renamed from: jw, reason: merged with bridge method [inline-methods] */
    public PointF ul() {
        return ycx(null, 0.0f);
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public PointF ycx(com.bytedance.adsdk.zb.ul.ycx<PointF> ycxVar, float f11) {
        if (this.f23262dj != null && this.fby.sya() != null) {
            this.fby.lud();
            throw null;
        }
        if (this.lud != null && this.f23263jw.sya() != null) {
            this.f23263jw.lud();
            throw null;
        }
        this.f23265ul.set(this.f23264lt.x, 0.0f);
        PointF pointF = this.f23265ul;
        pointF.set(pointF.x, this.f23264lt.y);
        return this.f23265ul;
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx
    public void ycx(float f11) {
        this.fby.ycx(f11);
        this.f23263jw.ycx(f11);
        this.f23264lt.set(this.fby.ul().floatValue(), this.f23263jw.ul().floatValue());
        for (int i5 = 0; i5 < this.ycx.size(); i5++) {
            this.ycx.get(i5).ycx();
        }
    }
}
