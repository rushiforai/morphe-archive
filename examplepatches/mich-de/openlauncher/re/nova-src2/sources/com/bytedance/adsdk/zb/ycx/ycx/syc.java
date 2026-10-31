package com.bytedance.adsdk.zb.ycx.ycx;

import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.RectF;
import com.bytedance.adsdk.zb.sya.zb.uh;
import com.bytedance.adsdk.zb.ycx.zb.ycx;
import java.util.List;

/* loaded from: classes2.dex */
public class syc implements ea, ry, ycx.InterfaceC0028ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final boolean f23196dj;

    /* renamed from: ea, reason: collision with root package name */
    private boolean f23197ea;
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> fby;

    /* renamed from: lt, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, PointF> f23200lt;
    private final com.bytedance.adsdk.zb.jw lud;
    private final String sya;

    /* renamed from: ul, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, PointF> f23201ul;
    private final Path ycx = new Path();

    /* renamed from: zb, reason: collision with root package name */
    private final RectF f23202zb = new RectF();

    /* renamed from: jw, reason: collision with root package name */
    private final zb f23199jw = new zb();

    /* renamed from: jc, reason: collision with root package name */
    private com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> f23198jc = null;

    public syc(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar, com.bytedance.adsdk.zb.sya.zb.ea eaVar) {
        this.sya = eaVar.ycx();
        this.f23196dj = eaVar.lud();
        this.lud = jwVar;
        com.bytedance.adsdk.zb.ycx.zb.ycx<PointF, PointF> ycxVarYcx = eaVar.dj().ycx();
        this.f23200lt = ycxVarYcx;
        com.bytedance.adsdk.zb.ycx.zb.ycx<PointF, PointF> ycxVarYcx2 = eaVar.sya().ycx();
        this.f23201ul = ycxVarYcx2;
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVarYcx3 = eaVar.zb().ycx();
        this.fby = ycxVarYcx3;
        ycxVar.ycx(ycxVarYcx);
        ycxVar.ycx(ycxVarYcx2);
        ycxVar.ycx(ycxVarYcx3);
        ycxVarYcx.ycx(this);
        ycxVarYcx2.ycx(this);
        ycxVarYcx3.ycx(this);
    }

    private void zb() {
        this.f23197ea = false;
        this.lud.invalidateSelf();
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.ry
    public Path dj() {
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVar;
        if (this.f23197ea) {
            return this.ycx;
        }
        this.ycx.reset();
        if (this.f23196dj) {
            this.f23197ea = true;
            return this.ycx;
        }
        PointF pointFUl = this.f23201ul.ul();
        float f11 = pointFUl.x / 2.0f;
        float f12 = pointFUl.y / 2.0f;
        com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> ycxVar2 = this.fby;
        float fJw = ycxVar2 == null ? 0.0f : ((com.bytedance.adsdk.zb.ycx.zb.dj) ycxVar2).jw();
        if (fJw == 0.0f && (ycxVar = this.f23198jc) != null) {
            fJw = Math.min(ycxVar.ul().floatValue(), Math.min(f11, f12));
        }
        float fMin = Math.min(f11, f12);
        if (fJw > fMin) {
            fJw = fMin;
        }
        PointF pointFUl2 = this.f23200lt.ul();
        this.ycx.moveTo(pointFUl2.x + f11, (pointFUl2.y - f12) + fJw);
        this.ycx.lineTo(pointFUl2.x + f11, (pointFUl2.y + f12) - fJw);
        if (fJw > 0.0f) {
            RectF rectF = this.f23202zb;
            float f13 = pointFUl2.x;
            float f14 = fJw * 2.0f;
            float f15 = pointFUl2.y;
            rectF.set((f13 + f11) - f14, (f15 + f12) - f14, f13 + f11, f15 + f12);
            this.ycx.arcTo(this.f23202zb, 0.0f, 90.0f, false);
        }
        this.ycx.lineTo((pointFUl2.x - f11) + fJw, pointFUl2.y + f12);
        if (fJw > 0.0f) {
            RectF rectF2 = this.f23202zb;
            float f16 = pointFUl2.x;
            float f17 = pointFUl2.y;
            float f18 = fJw * 2.0f;
            rectF2.set(f16 - f11, (f17 + f12) - f18, (f16 - f11) + f18, f17 + f12);
            this.ycx.arcTo(this.f23202zb, 90.0f, 90.0f, false);
        }
        this.ycx.lineTo(pointFUl2.x - f11, (pointFUl2.y - f12) + fJw);
        if (fJw > 0.0f) {
            RectF rectF3 = this.f23202zb;
            float f19 = pointFUl2.x;
            float f21 = pointFUl2.y;
            float f22 = fJw * 2.0f;
            rectF3.set(f19 - f11, f21 - f12, (f19 - f11) + f22, (f21 - f12) + f22);
            this.ycx.arcTo(this.f23202zb, 180.0f, 90.0f, false);
        }
        this.ycx.lineTo((pointFUl2.x + f11) - fJw, pointFUl2.y - f12);
        if (fJw > 0.0f) {
            RectF rectF4 = this.f23202zb;
            float f23 = pointFUl2.x;
            float f24 = fJw * 2.0f;
            float f25 = pointFUl2.y;
            rectF4.set((f23 + f11) - f24, f25 - f12, f23 + f11, (f25 - f12) + f24);
            this.ycx.arcTo(this.f23202zb, 270.0f, 90.0f, false);
        }
        this.ycx.close();
        this.f23199jw.ycx(this.ycx);
        this.f23197ea = true;
        return this.ycx;
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.InterfaceC0028ycx
    public void ycx() {
        zb();
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0025  */
    @Override // com.bytedance.adsdk.zb.ycx.ycx.sya
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(List<sya> list, List<sya> list2) {
        for (int i5 = 0; i5 < list.size(); i5++) {
            sya syaVar = list.get(i5);
            if (syaVar instanceof thx) {
                thx thxVar = (thx) syaVar;
                if (thxVar.zb() == uh.ycx.SIMULTANEOUSLY) {
                    this.f23199jw.ycx(thxVar);
                    thxVar.ycx(this);
                } else if (syaVar instanceof wie) {
                    this.f23198jc = ((wie) syaVar).zb();
                }
            }
        }
    }
}
