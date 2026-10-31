package com.bytedance.adsdk.zb.ycx.ycx;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import com.bytedance.adsdk.zb.ycx.zb.ycx;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class ul implements ea, lud, ycx.InterfaceC0028ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.sya.ycx f23207dj;

    /* renamed from: ea, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.jw f23208ea;
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> fby;

    /* renamed from: jc, reason: collision with root package name */
    private com.bytedance.adsdk.zb.ycx.zb.ycx<ColorFilter, ColorFilter> f23209jc;

    /* renamed from: jw, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> f23210jw;

    /* renamed from: lt, reason: collision with root package name */
    private final boolean f23211lt;
    private final String lud;

    /* renamed from: ok, reason: collision with root package name */
    private com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> f23212ok;

    /* renamed from: ry, reason: collision with root package name */
    private com.bytedance.adsdk.zb.ycx.zb.sya f23213ry;
    private final Paint sya;

    /* renamed from: ul, reason: collision with root package name */
    private final List<ry> f23214ul;
    float ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final Path f23215zb;

    public ul(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar, com.bytedance.adsdk.zb.sya.zb.syc sycVar) {
        Path path = new Path();
        this.f23215zb = path;
        this.sya = new com.bytedance.adsdk.zb.ycx.ycx(1);
        this.f23214ul = new ArrayList();
        this.f23207dj = ycxVar;
        this.lud = sycVar.ycx();
        this.f23211lt = sycVar.lud();
        this.f23208ea = jwVar;
        if (ycxVar.jc() != null) {
            com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVarYcx = ycxVar.jc().ycx().ycx();
            this.f23212ok = ycxVarYcx;
            ycxVarYcx.ycx(this);
            ycxVar.ycx(this.f23212ok);
        }
        if (ycxVar.ea() != null) {
            this.f23213ry = new com.bytedance.adsdk.zb.ycx.zb.sya(this, ycxVar, ycxVar.ea());
        }
        if (sycVar.zb() == null || sycVar.sya() == null) {
            this.fby = null;
            this.f23210jw = null;
            return;
        }
        path.setFillType(sycVar.dj());
        com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> ycxVarYcx2 = sycVar.zb().ycx();
        this.fby = ycxVarYcx2;
        ycxVarYcx2.ycx(this);
        ycxVar.ycx(ycxVarYcx2);
        com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> ycxVarYcx3 = sycVar.sya().ycx();
        this.f23210jw = ycxVarYcx3;
        ycxVarYcx3.ycx(this);
        ycxVar.ycx(ycxVarYcx3);
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.InterfaceC0028ycx
    public void ycx() {
        this.f23208ea.invalidateSelf();
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.sya
    public void ycx(List<sya> list, List<sya> list2) {
        for (int i5 = 0; i5 < list2.size(); i5++) {
            sya syaVar = list2.get(i5);
            if (syaVar instanceof ry) {
                this.f23214ul.add((ry) syaVar);
            }
        }
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(Canvas canvas, Matrix matrix, int i5) {
        if (this.f23211lt) {
            return;
        }
        com.bytedance.adsdk.zb.lud.ycx("FillContent#draw");
        this.sya.setColor((com.bytedance.adsdk.zb.lt.lud.ycx((int) ((((i5 / 255.0f) * this.f23210jw.ul().intValue()) / 100.0f) * 255.0f), 0, 255) << 24) | (((com.bytedance.adsdk.zb.ycx.zb.zb) this.fby).jw() & 16777215));
        com.bytedance.adsdk.zb.ycx.zb.ycx<ColorFilter, ColorFilter> ycxVar = this.f23209jc;
        if (ycxVar != null) {
            this.sya.setColorFilter(ycxVar.ul());
        }
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVar2 = this.f23212ok;
        if (ycxVar2 != null) {
            float fFloatValue = ycxVar2.ul().floatValue();
            if (fFloatValue == 0.0f) {
                this.sya.setMaskFilter(null);
            } else if (fFloatValue != this.ycx) {
                this.sya.setMaskFilter(this.f23207dj.zb(fFloatValue));
            }
            this.ycx = fFloatValue;
        }
        com.bytedance.adsdk.zb.ycx.zb.sya syaVar = this.f23213ry;
        if (syaVar != null) {
            syaVar.ycx(this.sya);
        }
        this.f23215zb.reset();
        for (int i11 = 0; i11 < this.f23214ul.size(); i11++) {
            this.f23215zb.addPath(this.f23214ul.get(i11).dj(), matrix);
        }
        canvas.drawPath(this.f23215zb, this.sya);
        com.bytedance.adsdk.zb.lud.zb("FillContent#draw");
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(RectF rectF, Matrix matrix, boolean z11) {
        this.f23215zb.reset();
        for (int i5 = 0; i5 < this.f23214ul.size(); i5++) {
            this.f23215zb.addPath(this.f23214ul.get(i5).dj(), matrix);
        }
        this.f23215zb.computeBounds(rectF, false);
        rectF.set(rectF.left - 1.0f, rectF.top - 1.0f, rectF.right + 1.0f, rectF.bottom + 1.0f);
    }
}
