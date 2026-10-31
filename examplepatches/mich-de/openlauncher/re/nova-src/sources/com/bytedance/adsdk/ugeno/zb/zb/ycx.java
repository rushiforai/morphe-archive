package com.bytedance.adsdk.ugeno.zb.zb;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.Choreographer;
import com.bytedance.adsdk.ugeno.zb.zb.zb;

/* loaded from: classes2.dex */
final class ycx extends Drawable {

    /* renamed from: lt, reason: collision with root package name */
    private boolean f22774lt;
    private Choreographer lud;
    private final Paint sya;
    private final lud ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final zb.dj[] f22776zb;

    /* renamed from: dj, reason: collision with root package name */
    private final Path f22773dj = new Path();

    /* renamed from: ul, reason: collision with root package name */
    private final Choreographer.FrameCallback f22775ul = new Choreographer.FrameCallback() { // from class: com.bytedance.adsdk.ugeno.zb.zb.ycx.1
        @Override // android.view.Choreographer.FrameCallback
        public void doFrame(long j11) {
            if (ycx.this.f22774lt) {
                ycx.this.invalidateSelf();
                if (!ycx.this.f22774lt || ycx.this.lud == null) {
                    return;
                }
                ycx.this.lud.postFrameCallback(this);
            }
        }
    };

    public ycx(lud ludVar) {
        this.ycx = ludVar;
        this.f22776zb = ludVar.sya();
        Paint paint = new Paint(1);
        this.sya = paint;
        paint.setStyle(Paint.Style.FILL);
        if (ludVar.zb().ycx().f22789lt == 1) {
            paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.ADD));
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        lt ltVarYcx;
        int i5;
        Rect bounds = getBounds();
        if (bounds.width() <= 0 || bounds.height() <= 0 || (i5 = (ltVarYcx = this.ycx.ycx()).ycx) <= 0) {
            return;
        }
        int iSave = canvas.save();
        canvas.translate(bounds.left, bounds.top);
        try {
            ycx(canvas, ltVarYcx, i5);
        } finally {
            canvas.restoreToCount(iSave);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        this.ycx.ycx(rect.width(), rect.height());
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int i5) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
        this.sya.setColorFilter(colorFilter);
    }

    public void ycx() {
        if (this.f22774lt) {
            return;
        }
        this.f22774lt = true;
        try {
            Choreographer choreographer = Choreographer.getInstance();
            this.lud = choreographer;
            choreographer.postFrameCallback(this.f22775ul);
        } catch (Throwable unused) {
            this.f22774lt = false;
        }
    }

    public void zb() {
        this.f22774lt = false;
        Choreographer choreographer = this.lud;
        if (choreographer != null) {
            choreographer.removeFrameCallback(this.f22775ul);
            this.lud = null;
        }
    }

    private void ycx(Canvas canvas, lt ltVar, int i5) {
        zb.ycx ycxVar;
        int i11;
        Canvas canvas2 = canvas;
        int i12 = i5;
        int[] iArrYcx = ycx(ltVar, i12);
        float[] fArr = ltVar.sya;
        float[] fArr2 = ltVar.f22750dj;
        float[] fArr3 = ltVar.lud;
        float[] fArr4 = ltVar.f22752lt;
        int[] iArr = ltVar.fby;
        zb.dj[] djVarArr = this.f22776zb;
        int i13 = 0;
        while (i13 < i12) {
            int i14 = iArrYcx[i13];
            int i15 = iArr[i14];
            if (i15 >= 0 && i15 < djVarArr.length && (ycxVar = djVarArr[i15].f22783ok) != null) {
                float f11 = fArr3[i14];
                float f12 = ycxVar.sya * f11;
                float f13 = ycxVar.f22792dj * f11;
                if (f12 > 0.0f && f13 > 0.0f && (i11 = (int) ((fArr4[i14] * 255.0f) + 0.5f)) > 0) {
                    if (i11 > 255) {
                        i11 = 255;
                    }
                    this.sya.setColor(ycxVar.lud);
                    this.sya.setAlpha(i11);
                    float f14 = fArr[i14];
                    float f15 = fArr2[i14];
                    int i16 = ycxVar.f22793zb;
                    if (i16 == 1) {
                        float f16 = f12 / 2.0f;
                        float f17 = f13 / 2.0f;
                        canvas2.drawRect(f14 - f16, f15 - f17, f16 + f14, f15 + f17, this.sya);
                    } else if (i16 != 2) {
                        canvas2.drawCircle(f14, f15, Math.min(f12, f13) / 2.0f, this.sya);
                    } else {
                        ycx(canvas2, f14, f15, Math.min(f12, f13) / 2.0f);
                    }
                }
            }
            i13++;
            canvas2 = canvas;
            i12 = i5;
        }
    }

    private int[] ycx(lt ltVar, int i5) {
        int[] iArr = ltVar.f22751jw;
        for (int i11 = 0; i11 < i5; i11++) {
            iArr[i11] = i11;
        }
        int i12 = ltVar.f22754zb;
        if (i12 != 0 && i12 != 1 && i5 > 1) {
            ycx(iArr, ltVar.f22753ul, i5, i12 == 4);
        }
        return iArr;
    }

    private static void ycx(int[] iArr, float[] fArr, int i5, boolean z11) {
        for (int i11 = 1; i11 < i5; i11++) {
            int i12 = iArr[i11];
            float f11 = fArr[i12];
            int i13 = i11 - 1;
            if (z11) {
                while (i13 >= 0) {
                    int i14 = iArr[i13];
                    if (fArr[i14] > f11) {
                        iArr[i13 + 1] = i14;
                        i13--;
                    }
                }
            } else {
                while (i13 >= 0) {
                    int i15 = iArr[i13];
                    if (fArr[i15] < f11) {
                        iArr[i13 + 1] = i15;
                        i13--;
                    }
                }
            }
            iArr[i13 + 1] = i12;
        }
    }

    private void ycx(Canvas canvas, float f11, float f12, float f13) {
        float f14 = 0.5f * f13;
        Path path = this.f22773dj;
        path.rewind();
        float f15 = -1.5707964f;
        for (int i5 = 0; i5 < 10; i5++) {
            float f16 = i5 % 2 == 0 ? f13 : f14;
            double d5 = f15;
            float fCos = (((float) Math.cos(d5)) * f16) + f11;
            float fSin = (((float) Math.sin(d5)) * f16) + f12;
            if (i5 == 0) {
                path.moveTo(fCos, fSin);
            } else {
                path.lineTo(fCos, fSin);
            }
            f15 += 0.62831855f;
        }
        path.close();
        canvas.drawPath(path, this.sya);
    }
}
