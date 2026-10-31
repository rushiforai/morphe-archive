package com.bytedance.adsdk.zb.ycx.ycx;

import android.graphics.Path;
import android.graphics.PointF;
import com.bytedance.adsdk.zb.sya.zb.uh;
import com.bytedance.adsdk.zb.ycx.zb.ycx;
import java.util.List;

/* loaded from: classes2.dex */
public class lt implements ea, ry, ycx.InterfaceC0028ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, PointF> f23185dj;
    private boolean fby;

    /* renamed from: lt, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.zb.zb f23186lt;
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, PointF> lud;
    private final com.bytedance.adsdk.zb.jw sya;

    /* renamed from: zb, reason: collision with root package name */
    private final String f23188zb;
    private final Path ycx = new Path();

    /* renamed from: ul, reason: collision with root package name */
    private final zb f23187ul = new zb();

    public lt(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar, com.bytedance.adsdk.zb.sya.zb.zb zbVar) {
        this.f23188zb = zbVar.ycx();
        this.sya = jwVar;
        com.bytedance.adsdk.zb.ycx.zb.ycx<PointF, PointF> ycxVarYcx = zbVar.sya().ycx();
        this.f23185dj = ycxVarYcx;
        com.bytedance.adsdk.zb.ycx.zb.ycx<PointF, PointF> ycxVarYcx2 = zbVar.zb().ycx();
        this.lud = ycxVarYcx2;
        this.f23186lt = zbVar;
        ycxVar.ycx(ycxVarYcx);
        ycxVar.ycx(ycxVarYcx2);
        ycxVarYcx.ycx(this);
        ycxVarYcx2.ycx(this);
    }

    private void zb() {
        this.fby = false;
        this.sya.invalidateSelf();
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.ry
    public Path dj() {
        if (this.fby) {
            return this.ycx;
        }
        this.ycx.reset();
        if (this.f23186lt.lud()) {
            this.fby = true;
            return this.ycx;
        }
        PointF pointFUl = this.f23185dj.ul();
        float f11 = pointFUl.x / 2.0f;
        float f12 = pointFUl.y / 2.0f;
        float f13 = f11 * 0.55228f;
        float f14 = 0.55228f * f12;
        this.ycx.reset();
        if (this.f23186lt.dj()) {
            float f15 = -f12;
            this.ycx.moveTo(0.0f, f15);
            float f16 = 0.0f - f13;
            float f17 = -f11;
            float f18 = 0.0f - f14;
            this.ycx.cubicTo(f16, f15, f17, f18, f17, 0.0f);
            float f19 = f14 + 0.0f;
            this.ycx.cubicTo(f17, f19, f16, f12, 0.0f, f12);
            float f21 = f13 + 0.0f;
            this.ycx.cubicTo(f21, f12, f11, f19, f11, 0.0f);
            this.ycx.cubicTo(f11, f18, f21, f15, 0.0f, f15);
        } else {
            float f22 = -f12;
            this.ycx.moveTo(0.0f, f22);
            float f23 = f13 + 0.0f;
            float f24 = 0.0f - f14;
            this.ycx.cubicTo(f23, f22, f11, f24, f11, 0.0f);
            float f25 = f14 + 0.0f;
            this.ycx.cubicTo(f11, f25, f23, f12, 0.0f, f12);
            float f26 = 0.0f - f13;
            float f27 = -f11;
            this.ycx.cubicTo(f26, f12, f27, f25, f27, 0.0f);
            this.ycx.cubicTo(f27, f24, f26, f22, 0.0f, f22);
        }
        PointF pointFUl2 = this.lud.ul();
        this.ycx.offset(pointFUl2.x, pointFUl2.y);
        this.ycx.close();
        this.f23187ul.ycx(this.ycx);
        this.fby = true;
        return this.ycx;
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.InterfaceC0028ycx
    public void ycx() {
        zb();
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.sya
    public void ycx(List<sya> list, List<sya> list2) {
        for (int i5 = 0; i5 < list.size(); i5++) {
            sya syaVar = list.get(i5);
            if (syaVar instanceof thx) {
                thx thxVar = (thx) syaVar;
                if (thxVar.zb() == uh.ycx.SIMULTANEOUSLY) {
                    this.f23187ul.ycx(thxVar);
                    thxVar.ycx(this);
                }
            }
        }
    }
}
