package com.bytedance.adsdk.zb.ycx.ycx;

import android.graphics.BlurMaskFilter;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.RadialGradient;
import android.graphics.RectF;
import android.graphics.Shader;
import android.util.LongSparseArray;
import com.bytedance.adsdk.zb.ycx.zb.ycx;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class fby implements ea, lud, ycx.InterfaceC0028ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.sya.ycx f23163dj;

    /* renamed from: dy, reason: collision with root package name */
    private com.bytedance.adsdk.zb.ycx.zb.ycx<ColorFilter, ColorFilter> f23164dy;

    /* renamed from: ea, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.zb.ul f23165ea;
    private final Paint fby;
    private com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> htf;

    /* renamed from: jc, reason: collision with root package name */
    private final List<ry> f23166jc;

    /* renamed from: jw, reason: collision with root package name */
    private final RectF f23167jw;

    /* renamed from: ok, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<com.bytedance.adsdk.zb.sya.zb.dj, com.bytedance.adsdk.zb.sya.zb.dj> f23169ok;
    private final com.bytedance.adsdk.zb.jw pmi;

    /* renamed from: ry, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> f23170ry;
    private final boolean sya;
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<PointF, PointF> syc;
    private com.bytedance.adsdk.zb.ycx.zb.sya thx;

    /* renamed from: uh, reason: collision with root package name */
    private final int f23171uh;

    /* renamed from: ul, reason: collision with root package name */
    private final Path f23172ul;
    private com.bytedance.adsdk.zb.ycx.zb.wie wie;
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<PointF, PointF> xkz;
    float ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final String f23173zb;
    private final LongSparseArray<LinearGradient> lud = new LongSparseArray<>();

    /* renamed from: lt, reason: collision with root package name */
    private final LongSparseArray<RadialGradient> f23168lt = new LongSparseArray<>();

    public fby(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.ul ulVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar, com.bytedance.adsdk.zb.sya.zb.lud ludVar) {
        Path path = new Path();
        this.f23172ul = path;
        this.fby = new com.bytedance.adsdk.zb.ycx.ycx(1);
        this.f23167jw = new RectF();
        this.f23166jc = new ArrayList();
        this.ycx = 0.0f;
        this.f23163dj = ycxVar;
        this.f23173zb = ludVar.ycx();
        this.sya = ludVar.fby();
        this.pmi = jwVar;
        this.f23165ea = ludVar.zb();
        path.setFillType(ludVar.sya());
        this.f23171uh = (int) (ulVar.lud() / 32.0f);
        com.bytedance.adsdk.zb.ycx.zb.ycx<com.bytedance.adsdk.zb.sya.zb.dj, com.bytedance.adsdk.zb.sya.zb.dj> ycxVarYcx = ludVar.dj().ycx();
        this.f23169ok = ycxVarYcx;
        ycxVarYcx.ycx(this);
        ycxVar.ycx(ycxVarYcx);
        com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> ycxVarYcx2 = ludVar.lud().ycx();
        this.f23170ry = ycxVarYcx2;
        ycxVarYcx2.ycx(this);
        ycxVar.ycx(ycxVarYcx2);
        com.bytedance.adsdk.zb.ycx.zb.ycx<PointF, PointF> ycxVarYcx3 = ludVar.lt().ycx();
        this.xkz = ycxVarYcx3;
        ycxVarYcx3.ycx(this);
        ycxVar.ycx(ycxVarYcx3);
        com.bytedance.adsdk.zb.ycx.zb.ycx<PointF, PointF> ycxVarYcx4 = ludVar.ul().ycx();
        this.syc = ycxVarYcx4;
        ycxVarYcx4.ycx(this);
        ycxVar.ycx(ycxVarYcx4);
        if (ycxVar.jc() != null) {
            com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVarYcx5 = ycxVar.jc().ycx().ycx();
            this.htf = ycxVarYcx5;
            ycxVarYcx5.ycx(this);
            ycxVar.ycx(this.htf);
        }
        if (ycxVar.ea() != null) {
            this.thx = new com.bytedance.adsdk.zb.ycx.zb.sya(this, ycxVar, ycxVar.ea());
        }
    }

    private int dj() {
        int iRound = Math.round(this.xkz.fby() * this.f23171uh);
        int iRound2 = Math.round(this.syc.fby() * this.f23171uh);
        int iRound3 = Math.round(this.f23169ok.fby() * this.f23171uh);
        int i5 = iRound != 0 ? iRound * 527 : 17;
        if (iRound2 != 0) {
            i5 = i5 * 31 * iRound2;
        }
        return iRound3 != 0 ? i5 * 31 * iRound3 : i5;
    }

    private RadialGradient sya() {
        long jDj = dj();
        RadialGradient radialGradient = this.f23168lt.get(jDj);
        if (radialGradient != null) {
            return radialGradient;
        }
        PointF pointFUl = this.xkz.ul();
        PointF pointFUl2 = this.syc.ul();
        com.bytedance.adsdk.zb.sya.zb.dj djVarUl = this.f23169ok.ul();
        int[] iArrYcx = ycx(djVarUl.zb());
        float[] fArrYcx = djVarUl.ycx();
        float f11 = pointFUl.x;
        float f12 = pointFUl.y;
        float fHypot = (float) Math.hypot(pointFUl2.x - f11, pointFUl2.y - f12);
        if (fHypot <= 0.0f) {
            fHypot = 0.001f;
        }
        RadialGradient radialGradient2 = new RadialGradient(f11, f12, fHypot, iArrYcx, fArrYcx, Shader.TileMode.CLAMP);
        this.f23168lt.put(jDj, radialGradient2);
        return radialGradient2;
    }

    private LinearGradient zb() {
        long jDj = dj();
        LinearGradient linearGradient = this.lud.get(jDj);
        if (linearGradient != null) {
            return linearGradient;
        }
        PointF pointFUl = this.xkz.ul();
        PointF pointFUl2 = this.syc.ul();
        com.bytedance.adsdk.zb.sya.zb.dj djVarUl = this.f23169ok.ul();
        LinearGradient linearGradient2 = new LinearGradient(pointFUl.x, pointFUl.y, pointFUl2.x, pointFUl2.y, ycx(djVarUl.zb()), djVarUl.ycx(), Shader.TileMode.CLAMP);
        this.lud.put(jDj, linearGradient2);
        return linearGradient2;
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.InterfaceC0028ycx
    public void ycx() {
        this.pmi.invalidateSelf();
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.sya
    public void ycx(List<sya> list, List<sya> list2) {
        for (int i5 = 0; i5 < list2.size(); i5++) {
            sya syaVar = list2.get(i5);
            if (syaVar instanceof ry) {
                this.f23166jc.add((ry) syaVar);
            }
        }
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(Canvas canvas, Matrix matrix, int i5) {
        Shader shaderSya;
        if (this.sya) {
            return;
        }
        com.bytedance.adsdk.zb.lud.ycx("GradientFillContent#draw");
        this.f23172ul.reset();
        for (int i11 = 0; i11 < this.f23166jc.size(); i11++) {
            this.f23172ul.addPath(this.f23166jc.get(i11).dj(), matrix);
        }
        this.f23172ul.computeBounds(this.f23167jw, false);
        if (this.f23165ea == com.bytedance.adsdk.zb.sya.zb.ul.LINEAR) {
            shaderSya = zb();
        } else {
            shaderSya = sya();
        }
        shaderSya.setLocalMatrix(matrix);
        this.fby.setShader(shaderSya);
        com.bytedance.adsdk.zb.ycx.zb.ycx<ColorFilter, ColorFilter> ycxVar = this.f23164dy;
        if (ycxVar != null) {
            this.fby.setColorFilter(ycxVar.ul());
        }
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVar2 = this.htf;
        if (ycxVar2 != null) {
            float fFloatValue = ycxVar2.ul().floatValue();
            if (fFloatValue == 0.0f) {
                this.fby.setMaskFilter(null);
            } else if (fFloatValue != this.ycx) {
                this.fby.setMaskFilter(new BlurMaskFilter(fFloatValue, BlurMaskFilter.Blur.NORMAL));
            }
            this.ycx = fFloatValue;
        }
        com.bytedance.adsdk.zb.ycx.zb.sya syaVar = this.thx;
        if (syaVar != null) {
            syaVar.ycx(this.fby);
        }
        this.fby.setAlpha(com.bytedance.adsdk.zb.lt.lud.ycx((int) ((((i5 / 255.0f) * this.f23170ry.ul().intValue()) / 100.0f) * 255.0f), 0, 255));
        canvas.drawPath(this.f23172ul, this.fby);
        com.bytedance.adsdk.zb.lud.zb("GradientFillContent#draw");
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(RectF rectF, Matrix matrix, boolean z11) {
        this.f23172ul.reset();
        for (int i5 = 0; i5 < this.f23166jc.size(); i5++) {
            this.f23172ul.addPath(this.f23166jc.get(i5).dj(), matrix);
        }
        this.f23172ul.computeBounds(rectF, false);
        rectF.set(rectF.left - 1.0f, rectF.top - 1.0f, rectF.right + 1.0f, rectF.bottom + 1.0f);
    }

    private int[] ycx(int[] iArr) {
        if (this.wie == null) {
            return iArr;
        }
        throw null;
    }
}
