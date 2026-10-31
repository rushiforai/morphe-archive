package com.bytedance.adsdk.zb.ycx.ycx;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.DashPathEffect;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PathMeasure;
import android.graphics.RectF;
import com.bytedance.adsdk.zb.sya.zb.uh;
import com.bytedance.adsdk.zb.ycx.zb.ycx;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public abstract class ycx implements ea, lud, ycx.InterfaceC0028ycx {

    /* renamed from: dy, reason: collision with root package name */
    private com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> f23228dy;

    /* renamed from: ea, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> f23229ea;
    private final com.bytedance.adsdk.zb.jw fby;

    /* renamed from: jc, reason: collision with root package name */
    private final float[] f23230jc;

    /* renamed from: ok, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, Integer> f23233ok;

    /* renamed from: ry, reason: collision with root package name */
    private final List<com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float>> f23234ry;
    float sya;
    private com.bytedance.adsdk.zb.ycx.zb.ycx<ColorFilter, ColorFilter> syc;
    private com.bytedance.adsdk.zb.ycx.zb.sya wie;
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> xkz;
    protected final com.bytedance.adsdk.zb.sya.sya.ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    final Paint f23236zb;

    /* renamed from: dj, reason: collision with root package name */
    private final PathMeasure f23227dj = new PathMeasure();
    private final Path lud = new Path();

    /* renamed from: lt, reason: collision with root package name */
    private final Path f23232lt = new Path();

    /* renamed from: ul, reason: collision with root package name */
    private final RectF f23235ul = new RectF();

    /* renamed from: jw, reason: collision with root package name */
    private final List<C0027ycx> f23231jw = new ArrayList();

    /* renamed from: com.bytedance.adsdk.zb.ycx.ycx.ycx$ycx, reason: collision with other inner class name */
    public static final class C0027ycx {
        private final List<ry> ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final thx f23237zb;

        private C0027ycx(thx thxVar) {
            this.ycx = new ArrayList();
            this.f23237zb = thxVar;
        }
    }

    public ycx(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar, Paint.Cap cap, Paint.Join join, float f11, com.bytedance.adsdk.zb.sya.ycx.dj djVar, com.bytedance.adsdk.zb.sya.ycx.zb zbVar, List<com.bytedance.adsdk.zb.sya.ycx.zb> list, com.bytedance.adsdk.zb.sya.ycx.zb zbVar2) {
        com.bytedance.adsdk.zb.ycx.ycx ycxVar2 = new com.bytedance.adsdk.zb.ycx.ycx(1);
        this.f23236zb = ycxVar2;
        this.sya = 0.0f;
        this.fby = jwVar;
        this.ycx = ycxVar;
        ycxVar2.setStyle(Paint.Style.STROKE);
        ycxVar2.setStrokeCap(cap);
        ycxVar2.setStrokeJoin(join);
        ycxVar2.setStrokeMiter(f11);
        this.f23233ok = djVar.ycx();
        this.f23229ea = zbVar.ycx();
        if (zbVar2 == null) {
            this.xkz = null;
        } else {
            this.xkz = zbVar2.ycx();
        }
        this.f23234ry = new ArrayList(list.size());
        this.f23230jc = new float[list.size()];
        for (int i5 = 0; i5 < list.size(); i5++) {
            this.f23234ry.add(list.get(i5).ycx());
        }
        ycxVar.ycx(this.f23233ok);
        ycxVar.ycx(this.f23229ea);
        for (int i11 = 0; i11 < this.f23234ry.size(); i11++) {
            ycxVar.ycx(this.f23234ry.get(i11));
        }
        com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> ycxVar3 = this.xkz;
        if (ycxVar3 != null) {
            ycxVar.ycx(ycxVar3);
        }
        this.f23233ok.ycx(this);
        this.f23229ea.ycx(this);
        for (int i12 = 0; i12 < list.size(); i12++) {
            this.f23234ry.get(i12).ycx(this);
        }
        com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> ycxVar4 = this.xkz;
        if (ycxVar4 != null) {
            ycxVar4.ycx(this);
        }
        if (ycxVar.jc() != null) {
            com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVarYcx = ycxVar.jc().ycx().ycx();
            this.f23228dy = ycxVarYcx;
            ycxVarYcx.ycx(this);
            ycxVar.ycx(this.f23228dy);
        }
        if (ycxVar.ea() != null) {
            this.wie = new com.bytedance.adsdk.zb.ycx.zb.sya(this, ycxVar, ycxVar.ea());
        }
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.InterfaceC0028ycx
    public void ycx() {
        this.fby.invalidateSelf();
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0055  */
    @Override // com.bytedance.adsdk.zb.ycx.ycx.sya
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(List<sya> list, List<sya> list2) {
        thx thxVar = null;
        for (int size = list.size() - 1; size >= 0; size--) {
            sya syaVar = list.get(size);
            if (syaVar instanceof thx) {
                thx thxVar2 = (thx) syaVar;
                if (thxVar2.zb() == uh.ycx.INDIVIDUALLY) {
                    thxVar = thxVar2;
                }
            }
        }
        if (thxVar != null) {
            thxVar.ycx(this);
        }
        C0027ycx c0027ycx = null;
        for (int size2 = list2.size() - 1; size2 >= 0; size2--) {
            sya syaVar2 = list2.get(size2);
            if (syaVar2 instanceof thx) {
                thx thxVar3 = (thx) syaVar2;
                if (thxVar3.zb() == uh.ycx.INDIVIDUALLY) {
                    if (c0027ycx != null) {
                        this.f23231jw.add(c0027ycx);
                    }
                    c0027ycx = new C0027ycx(thxVar3);
                    thxVar3.ycx(this);
                } else if (syaVar2 instanceof ry) {
                    if (c0027ycx == null) {
                        c0027ycx = new C0027ycx(thxVar);
                    }
                    c0027ycx.ycx.add((ry) syaVar2);
                }
            }
        }
        if (c0027ycx != null) {
            this.f23231jw.add(c0027ycx);
        }
    }

    public void ycx(Canvas canvas, Matrix matrix, int i5) {
        com.bytedance.adsdk.zb.lud.ycx("StrokeContent#draw");
        if (com.bytedance.adsdk.zb.lt.lt.zb(matrix)) {
            com.bytedance.adsdk.zb.lud.zb("StrokeContent#draw");
            return;
        }
        this.f23236zb.setAlpha(com.bytedance.adsdk.zb.lt.lud.ycx((int) ((((i5 / 255.0f) * ((com.bytedance.adsdk.zb.ycx.zb.lt) this.f23233ok).jw()) / 100.0f) * 255.0f), 0, 255));
        this.f23236zb.setStrokeWidth(com.bytedance.adsdk.zb.lt.lt.ycx(matrix) * ((com.bytedance.adsdk.zb.ycx.zb.dj) this.f23229ea).jw());
        if (this.f23236zb.getStrokeWidth() <= 0.0f) {
            com.bytedance.adsdk.zb.lud.zb("StrokeContent#draw");
            return;
        }
        ycx(matrix);
        com.bytedance.adsdk.zb.ycx.zb.ycx<ColorFilter, ColorFilter> ycxVar = this.syc;
        if (ycxVar != null) {
            this.f23236zb.setColorFilter(ycxVar.ul());
        }
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVar2 = this.f23228dy;
        if (ycxVar2 != null) {
            float fFloatValue = ycxVar2.ul().floatValue();
            if (fFloatValue == 0.0f) {
                this.f23236zb.setMaskFilter(null);
            } else if (fFloatValue != this.sya) {
                this.f23236zb.setMaskFilter(this.ycx.zb(fFloatValue));
            }
            this.sya = fFloatValue;
        }
        com.bytedance.adsdk.zb.ycx.zb.sya syaVar = this.wie;
        if (syaVar != null) {
            syaVar.ycx(this.f23236zb);
        }
        for (int i11 = 0; i11 < this.f23231jw.size(); i11++) {
            C0027ycx c0027ycx = this.f23231jw.get(i11);
            if (c0027ycx.f23237zb != null) {
                ycx(canvas, c0027ycx, matrix);
            } else {
                com.bytedance.adsdk.zb.lud.ycx("StrokeContent#buildPath");
                this.lud.reset();
                for (int size = c0027ycx.ycx.size() - 1; size >= 0; size--) {
                    this.lud.addPath(((ry) c0027ycx.ycx.get(size)).dj(), matrix);
                }
                com.bytedance.adsdk.zb.lud.zb("StrokeContent#buildPath");
                com.bytedance.adsdk.zb.lud.ycx("StrokeContent#drawPath");
                canvas.drawPath(this.lud, this.f23236zb);
                com.bytedance.adsdk.zb.lud.zb("StrokeContent#drawPath");
            }
        }
        com.bytedance.adsdk.zb.lud.zb("StrokeContent#draw");
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0110  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void ycx(Canvas canvas, C0027ycx c0027ycx, Matrix matrix) {
        float f11;
        float fMin;
        com.bytedance.adsdk.zb.lud.ycx("StrokeContent#applyTrimPath");
        if (c0027ycx.f23237zb == null) {
            com.bytedance.adsdk.zb.lud.zb("StrokeContent#applyTrimPath");
            return;
        }
        this.lud.reset();
        for (int size = c0027ycx.ycx.size() - 1; size >= 0; size--) {
            this.lud.addPath(((ry) c0027ycx.ycx.get(size)).dj(), matrix);
        }
        float fFloatValue = c0027ycx.f23237zb.sya().ul().floatValue() / 100.0f;
        float fFloatValue2 = c0027ycx.f23237zb.dj().ul().floatValue() / 100.0f;
        float fFloatValue3 = c0027ycx.f23237zb.lud().ul().floatValue() / 360.0f;
        if (fFloatValue < 0.01f && fFloatValue2 > 0.99f) {
            canvas.drawPath(this.lud, this.f23236zb);
            com.bytedance.adsdk.zb.lud.zb("StrokeContent#applyTrimPath");
            return;
        }
        this.f23227dj.setPath(this.lud, false);
        float length = this.f23227dj.getLength();
        while (this.f23227dj.nextContour()) {
            length += this.f23227dj.getLength();
        }
        float f12 = fFloatValue3 * length;
        float f13 = (fFloatValue * length) + f12;
        float fMin2 = Math.min((fFloatValue2 * length) + f12, (f13 + length) - 1.0f);
        float f14 = 0.0f;
        for (int size2 = c0027ycx.ycx.size() - 1; size2 >= 0; size2--) {
            this.f23232lt.set(((ry) c0027ycx.ycx.get(size2)).dj());
            this.f23232lt.transform(matrix);
            this.f23227dj.setPath(this.f23232lt, false);
            float length2 = this.f23227dj.getLength();
            if (fMin2 > length) {
                float f15 = fMin2 - length;
                if (f15 >= f14 + length2 || f14 >= f15) {
                    float f16 = f14 + length2;
                    if (f16 >= f13 && f14 <= fMin2) {
                        if (f16 > fMin2 || f13 >= f14) {
                            f11 = f13 < f14 ? 0.0f : (f13 - f14) / length2;
                            fMin = fMin2 > f16 ? 1.0f : (fMin2 - f14) / length2;
                        } else {
                            canvas.drawPath(this.f23232lt, this.f23236zb);
                        }
                    }
                } else {
                    f11 = f13 > length ? (f13 - length) / length2 : 0.0f;
                    fMin = Math.min(f15 / length2, 1.0f);
                }
                com.bytedance.adsdk.zb.lt.lt.ycx(this.f23232lt, f11, fMin, 0.0f);
                canvas.drawPath(this.f23232lt, this.f23236zb);
            }
            f14 += length2;
        }
        com.bytedance.adsdk.zb.lud.zb("StrokeContent#applyTrimPath");
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(RectF rectF, Matrix matrix, boolean z11) {
        com.bytedance.adsdk.zb.lud.ycx("StrokeContent#getBounds");
        this.lud.reset();
        for (int i5 = 0; i5 < this.f23231jw.size(); i5++) {
            C0027ycx c0027ycx = this.f23231jw.get(i5);
            for (int i11 = 0; i11 < c0027ycx.ycx.size(); i11++) {
                this.lud.addPath(((ry) c0027ycx.ycx.get(i11)).dj(), matrix);
            }
        }
        this.lud.computeBounds(this.f23235ul, false);
        float fJw = ((com.bytedance.adsdk.zb.ycx.zb.dj) this.f23229ea).jw();
        RectF rectF2 = this.f23235ul;
        float f11 = fJw / 2.0f;
        rectF2.set(rectF2.left - f11, rectF2.top - f11, rectF2.right + f11, rectF2.bottom + f11);
        rectF.set(this.f23235ul);
        rectF.set(rectF.left - 1.0f, rectF.top - 1.0f, rectF.right + 1.0f, rectF.bottom + 1.0f);
        com.bytedance.adsdk.zb.lud.zb("StrokeContent#getBounds");
    }

    private void ycx(Matrix matrix) {
        com.bytedance.adsdk.zb.lud.ycx("StrokeContent#applyDashPattern");
        if (this.f23234ry.isEmpty()) {
            com.bytedance.adsdk.zb.lud.zb("StrokeContent#applyDashPattern");
            return;
        }
        float fYcx = com.bytedance.adsdk.zb.lt.lt.ycx(matrix);
        for (int i5 = 0; i5 < this.f23234ry.size(); i5++) {
            this.f23230jc[i5] = this.f23234ry.get(i5).ul().floatValue();
            if (i5 % 2 == 0) {
                float[] fArr = this.f23230jc;
                if (fArr[i5] < 1.0f) {
                    fArr[i5] = 1.0f;
                }
            } else {
                float[] fArr2 = this.f23230jc;
                if (fArr2[i5] < 0.1f) {
                    fArr2[i5] = 0.1f;
                }
            }
            float[] fArr3 = this.f23230jc;
            fArr3[i5] = fArr3[i5] * fYcx;
        }
        com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> ycxVar = this.xkz;
        this.f23236zb.setPathEffect(new DashPathEffect(this.f23230jc, ycxVar == null ? 0.0f : fYcx * ycxVar.ul().floatValue()));
        com.bytedance.adsdk.zb.lud.zb("StrokeContent#applyDashPattern");
    }
}
