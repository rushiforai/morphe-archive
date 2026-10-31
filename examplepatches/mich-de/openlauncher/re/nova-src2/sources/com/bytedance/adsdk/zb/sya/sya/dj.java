package com.bytedance.adsdk.zb.sya.sya;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;

/* loaded from: classes2.dex */
public class dj extends ycx {

    /* renamed from: ea, reason: collision with root package name */
    private com.bytedance.adsdk.zb.ycx.zb.ycx<ColorFilter, ColorFilter> f22949ea;
    private final Paint fby;

    /* renamed from: jc, reason: collision with root package name */
    private final Rect f22950jc;

    /* renamed from: jw, reason: collision with root package name */
    private final Rect f22951jw;

    /* renamed from: ok, reason: collision with root package name */
    private com.bytedance.adsdk.zb.ycx.zb.ycx<Bitmap, Bitmap> f22952ok;

    /* renamed from: ul, reason: collision with root package name */
    protected final com.bytedance.adsdk.zb.jc f22953ul;

    public dj(com.bytedance.adsdk.zb.jw jwVar, lud ludVar) {
        super(jwVar, ludVar);
        this.fby = new com.bytedance.adsdk.zb.ycx.ycx(3);
        this.f22951jw = new Rect();
        this.f22950jc = new Rect();
        this.f22953ul = jwVar.lt(ludVar.ul());
    }

    private Bitmap ok() {
        Bitmap bitmapUl;
        com.bytedance.adsdk.zb.ycx.zb.ycx<Bitmap, Bitmap> ycxVar = this.f22952ok;
        if (ycxVar != null && (bitmapUl = ycxVar.ul()) != null) {
            return bitmapUl;
        }
        Bitmap bitmapLud = this.f23013zb.lud(this.sya.ul());
        if (bitmapLud != null) {
            return bitmapLud;
        }
        com.bytedance.adsdk.zb.jc jcVar = this.f22953ul;
        if (jcVar != null) {
            return jcVar.ea();
        }
        return null;
    }

    @Override // com.bytedance.adsdk.zb.sya.sya.ycx, com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(RectF rectF, Matrix matrix, boolean z11) {
        super.ycx(rectF, matrix, z11);
        if (this.f22953ul != null) {
            float fYcx = com.bytedance.adsdk.zb.lt.lt.ycx();
            rectF.set(0.0f, 0.0f, this.f22953ul.ycx() * fYcx, this.f22953ul.zb() * fYcx);
            this.ycx.mapRect(rectF);
        }
    }

    @Override // com.bytedance.adsdk.zb.sya.sya.ycx
    public void zb(Canvas canvas, Matrix matrix, int i5) {
        super.zb(canvas, matrix, i5);
        Bitmap bitmapOk = ok();
        if (bitmapOk == null || bitmapOk.isRecycled() || this.f22953ul == null) {
            return;
        }
        float fYcx = com.bytedance.adsdk.zb.lt.lt.ycx();
        this.fby.setAlpha(i5);
        com.bytedance.adsdk.zb.ycx.zb.ycx<ColorFilter, ColorFilter> ycxVar = this.f22949ea;
        if (ycxVar != null) {
            this.fby.setColorFilter(ycxVar.ul());
        }
        canvas.save();
        canvas.concat(matrix);
        this.f22951jw.set(0, 0, bitmapOk.getWidth(), bitmapOk.getHeight());
        if (this.f23013zb.lud()) {
            this.f22950jc.set(0, 0, (int) (this.f22953ul.ycx() * fYcx), (int) (this.f22953ul.zb() * fYcx));
        } else {
            this.f22950jc.set(0, 0, (int) (bitmapOk.getWidth() * fYcx), (int) (bitmapOk.getHeight() * fYcx));
        }
        canvas.drawBitmap(bitmapOk, this.f22951jw, this.f22950jc, this.fby);
        canvas.restore();
    }
}
