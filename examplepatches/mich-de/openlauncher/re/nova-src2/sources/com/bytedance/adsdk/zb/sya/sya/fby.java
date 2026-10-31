package com.bytedance.adsdk.zb.sya.sya;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;

/* loaded from: classes2.dex */
public class fby extends ycx {

    /* renamed from: ea, reason: collision with root package name */
    private final lud f22954ea;
    private final Paint fby;

    /* renamed from: jc, reason: collision with root package name */
    private final Path f22955jc;

    /* renamed from: jw, reason: collision with root package name */
    private final float[] f22956jw;

    /* renamed from: ok, reason: collision with root package name */
    private com.bytedance.adsdk.zb.ycx.zb.ycx<ColorFilter, ColorFilter> f22957ok;

    /* renamed from: ul, reason: collision with root package name */
    private final RectF f22958ul;

    public fby(com.bytedance.adsdk.zb.jw jwVar, lud ludVar) {
        super(jwVar, ludVar);
        this.f22958ul = new RectF();
        com.bytedance.adsdk.zb.ycx.ycx ycxVar = new com.bytedance.adsdk.zb.ycx.ycx();
        this.fby = ycxVar;
        this.f22956jw = new float[8];
        this.f22955jc = new Path();
        this.f22954ea = ludVar;
        ycxVar.setAlpha(0);
        ycxVar.setStyle(Paint.Style.FILL);
        ycxVar.setColor(ludVar.dy());
    }

    @Override // com.bytedance.adsdk.zb.sya.sya.ycx, com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(RectF rectF, Matrix matrix, boolean z11) {
        super.ycx(rectF, matrix, z11);
        this.f22958ul.set(0.0f, 0.0f, this.f22954ea.pmi(), this.f22954ea.wie());
        this.ycx.mapRect(this.f22958ul);
        rectF.set(this.f22958ul);
    }

    @Override // com.bytedance.adsdk.zb.sya.sya.ycx
    public void zb(Canvas canvas, Matrix matrix, int i5) {
        super.zb(canvas, matrix, i5);
        int iAlpha = Color.alpha(this.f22954ea.dy());
        if (iAlpha == 0) {
            return;
        }
        int iIntValue = (int) ((((iAlpha / 255.0f) * (this.f23000dj.ycx() == null ? 100 : this.f23000dj.ycx().ul().intValue())) / 100.0f) * (i5 / 255.0f) * 255.0f);
        this.fby.setAlpha(iIntValue);
        com.bytedance.adsdk.zb.ycx.zb.ycx<ColorFilter, ColorFilter> ycxVar = this.f22957ok;
        if (ycxVar != null) {
            this.fby.setColorFilter(ycxVar.ul());
        }
        if (iIntValue > 0) {
            float[] fArr = this.f22956jw;
            fArr[0] = 0.0f;
            fArr[1] = 0.0f;
            fArr[2] = this.f22954ea.pmi();
            float[] fArr2 = this.f22956jw;
            fArr2[3] = 0.0f;
            fArr2[4] = this.f22954ea.pmi();
            this.f22956jw[5] = this.f22954ea.wie();
            float[] fArr3 = this.f22956jw;
            fArr3[6] = 0.0f;
            fArr3[7] = this.f22954ea.wie();
            matrix.mapPoints(this.f22956jw);
            this.f22955jc.reset();
            Path path = this.f22955jc;
            float[] fArr4 = this.f22956jw;
            path.moveTo(fArr4[0], fArr4[1]);
            Path path2 = this.f22955jc;
            float[] fArr5 = this.f22956jw;
            path2.lineTo(fArr5[2], fArr5[3]);
            Path path3 = this.f22955jc;
            float[] fArr6 = this.f22956jw;
            path3.lineTo(fArr6[4], fArr6[5]);
            Path path4 = this.f22955jc;
            float[] fArr7 = this.f22956jw;
            path4.lineTo(fArr7[6], fArr7[7]);
            Path path5 = this.f22955jc;
            float[] fArr8 = this.f22956jw;
            path5.lineTo(fArr8[0], fArr8[1]);
            this.f22955jc.close();
            canvas.drawPath(this.f22955jc, this.fby);
        }
    }
}
