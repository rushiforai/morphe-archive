package com.bytedance.adsdk.zb.ycx.zb;

import android.graphics.Path;
import android.graphics.PointF;

/* loaded from: classes2.dex */
public class jw extends com.bytedance.adsdk.zb.ul.ycx<PointF> {

    /* renamed from: ea, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ul.ycx<PointF> f23252ea;

    /* renamed from: jc, reason: collision with root package name */
    private Path f23253jc;

    public jw(com.bytedance.adsdk.zb.ul ulVar, com.bytedance.adsdk.zb.ul.ycx<PointF> ycxVar) {
        super(ulVar, ycxVar.ycx, ycxVar.f23138zb, ycxVar.sya, ycxVar.f23129dj, ycxVar.lud, ycxVar.f23134lt, ycxVar.f23137ul);
        this.f23252ea = ycxVar;
        ycx();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void ycx() {
        T t6;
        T t9;
        T t10 = this.f23138zb;
        boolean z11 = (t10 == 0 || (t9 = this.ycx) == 0 || !((PointF) t9).equals(((PointF) t10).x, ((PointF) t10).y)) ? false : true;
        T t11 = this.ycx;
        if (t11 == 0 || (t6 = this.f23138zb) == 0 || z11) {
            return;
        }
        com.bytedance.adsdk.zb.ul.ycx<PointF> ycxVar = this.f23252ea;
        this.f23253jc = com.bytedance.adsdk.zb.lt.lt.ycx((PointF) t11, (PointF) t6, ycxVar.fby, ycxVar.f23133jw);
    }

    public Path zb() {
        return this.f23253jc;
    }
}
