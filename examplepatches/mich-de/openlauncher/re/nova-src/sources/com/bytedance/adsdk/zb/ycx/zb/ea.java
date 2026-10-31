package com.bytedance.adsdk.zb.ycx.zb;

import a2.c;
import android.graphics.PointF;
import java.util.List;

/* loaded from: classes2.dex */
public class ea extends ul<PointF> {

    /* renamed from: dj, reason: collision with root package name */
    private final PointF f23247dj;

    public ea(List<com.bytedance.adsdk.zb.ul.ycx<PointF>> list) {
        super(list);
        this.f23247dj = new PointF();
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public PointF ycx(com.bytedance.adsdk.zb.ul.ycx<PointF> ycxVar, float f11) {
        return ycx(ycxVar, f11, f11, f11);
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public PointF ycx(com.bytedance.adsdk.zb.ul.ycx<PointF> ycxVar, float f11, float f12, float f13) {
        PointF pointF;
        PointF pointF2 = ycxVar.ycx;
        if (pointF2 == null || (pointF = ycxVar.f23138zb) == null) {
            throw new IllegalStateException("Missing values for keyframe.");
        }
        PointF pointF3 = pointF2;
        PointF pointF4 = pointF;
        if (this.sya != null) {
            ycxVar.f23137ul.getClass();
            dj();
            fby();
            throw null;
        }
        PointF pointF5 = this.f23247dj;
        float f14 = pointF3.x;
        float fA = c.a(pointF4.x, f14, f12, f14);
        float f15 = pointF3.y;
        pointF5.set(fA, c.a(pointF4.y, f15, f13, f15));
        return this.f23247dj;
    }
}
