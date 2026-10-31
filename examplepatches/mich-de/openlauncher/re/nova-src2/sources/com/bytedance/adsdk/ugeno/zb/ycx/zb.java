package com.bytedance.adsdk.ugeno.zb.ycx;

import android.animation.ValueAnimator;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.view.animation.LinearInterpolator;

/* loaded from: classes2.dex */
class zb extends Drawable {
    private LinearGradient aeu;

    /* renamed from: av, reason: collision with root package name */
    private PorterDuffXfermode f22724av;
    private Paint bhi;

    /* renamed from: dj, reason: collision with root package name */
    private final boolean f22725dj;

    /* renamed from: dv, reason: collision with root package name */
    private float f22726dv;

    /* renamed from: dy, reason: collision with root package name */
    private final RectF f22727dy;

    /* renamed from: ea, reason: collision with root package name */
    private final float f22728ea;
    private final int fby;

    /* renamed from: hf, reason: collision with root package name */
    private boolean f22729hf;
    private final Matrix htf;
    private Bitmap ifb;

    /* renamed from: jc, reason: collision with root package name */
    private final boolean f22730jc;

    /* renamed from: jw, reason: collision with root package name */
    private final int f22731jw;
    private float kgy;

    /* renamed from: lt, reason: collision with root package name */
    private final float[] f22732lt;
    private final int[] lud;

    /* renamed from: ok, reason: collision with root package name */
    private final float f22733ok;
    private ValueAnimator oty;
    private final RectF pmi;
    private LinearGradient rmf;
    private LinearGradient rmy;

    /* renamed from: ry, reason: collision with root package name */
    private final int f22734ry;
    private final float[] sya;
    private final float[] syc;
    private final Paint thx;

    /* renamed from: tn, reason: collision with root package name */
    private LinearGradient f22735tn;
    private Paint tru;

    /* renamed from: uh, reason: collision with root package name */
    private final Path f22736uh;

    /* renamed from: ul, reason: collision with root package name */
    private final boolean f22737ul;
    private final Path wie;
    private LinearGradient wwx;
    private final int[] xkz;

    /* renamed from: xz, reason: collision with root package name */
    private LinearGradient f22738xz;
    private final Drawable ycx;
    private boolean yzp = true;

    /* renamed from: zb, reason: collision with root package name */
    private final float f22739zb;

    public zb(Drawable drawable, int[] iArr, float[] fArr, float f11, float[] fArr2, boolean z11, int i5, int i11, boolean z12, float f12, float f13, int i12, int[] iArr2, float[] fArr3) {
        this.ycx = drawable;
        this.f22739zb = f11;
        this.sya = fArr2;
        this.f22725dj = (iArr == null || fArr == null) ? false : true;
        this.lud = iArr;
        this.f22732lt = fArr;
        this.f22737ul = z11;
        this.fby = i5 <= 0 ? 2200 : i5;
        this.f22731jw = i11;
        this.f22730jc = z12;
        this.f22728ea = f12;
        this.f22733ok = Math.max(0.0f, Math.min(1.0f, f13));
        this.f22734ry = Math.max(2, Math.min(i12, 50));
        this.xkz = iArr2;
        this.syc = fArr3;
        this.f22727dy = new RectF();
        this.wie = new Path();
        this.pmi = new RectF();
        this.f22736uh = new Path();
        this.htf = new Matrix();
        Paint paint = new Paint(1);
        this.thx = paint;
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(f11);
        if (z12) {
            Paint paint2 = new Paint(1);
            this.tru = paint2;
            Paint.Style style = Paint.Style.FILL;
            paint2.setStyle(style);
            Paint paint3 = new Paint(1);
            this.bhi = paint3;
            paint3.setStyle(style);
            this.f22724av = new PorterDuffXfermode(PorterDuff.Mode.SRC_IN);
        }
    }

    private void dj() {
        RectF rectF = this.pmi;
        float f11 = rectF.left;
        float f12 = rectF.top;
        float f13 = rectF.right;
        float f14 = rectF.bottom;
        this.kgy = Math.min(this.f22728ea, Math.min(rectF.width(), this.pmi.height()) / 2.0f);
        int i5 = this.f22734ry;
        int[] iArr = new int[i5];
        float[] fArr = new float[i5];
        int i11 = 0;
        while (true) {
            int i12 = this.f22734ry;
            if (i11 >= i12) {
                float f15 = this.kgy + f12;
                Shader.TileMode tileMode = Shader.TileMode.CLAMP;
                this.rmf = new LinearGradient(0.0f, f12, 0.0f, f15, iArr, fArr, tileMode);
                this.aeu = new LinearGradient(0.0f, f14, 0.0f, f14 - this.kgy, iArr, fArr, tileMode);
                this.f22738xz = new LinearGradient(f11, 0.0f, f11 + this.kgy, 0.0f, iArr, fArr, tileMode);
                this.rmy = new LinearGradient(f13, 0.0f, f13 - this.kgy, 0.0f, iArr, fArr, tileMode);
                this.tru.setShader(this.f22735tn);
                return;
            }
            float f16 = i11 / (i12 - 1);
            fArr[i11] = f16;
            if (i11 == i12 - 1) {
                iArr[i11] = 16777215;
            } else {
                double d5 = f16;
                iArr[i11] = (((int) (Math.exp(((-4.0d) * d5) * d5) * 255.0d)) << 24) | 16777215;
            }
            i11++;
        }
    }

    private void lud() {
        zb();
        this.f22729hf = false;
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, this.f22726dv);
        this.oty = valueAnimatorOfFloat;
        valueAnimatorOfFloat.setDuration(this.fby);
        this.oty.setInterpolator(new LinearInterpolator());
        int i5 = this.f22731jw;
        if (i5 == -1) {
            this.oty.setRepeatCount(-1);
        } else {
            this.oty.setRepeatCount(Math.max(0, i5 - 1));
        }
        this.oty.setRepeatMode(1);
        this.oty.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.adsdk.ugeno.zb.ycx.zb.1
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                zb.this.htf.setTranslate(((Float) valueAnimator.getAnimatedValue()).floatValue(), 0.0f);
                if (zb.this.wwx != null) {
                    zb.this.wwx.setLocalMatrix(zb.this.htf);
                }
                if (zb.this.f22735tn != null) {
                    zb.this.f22735tn.setLocalMatrix(zb.this.htf);
                }
                zb.this.invalidateSelf();
            }
        });
        this.oty.start();
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        this.ycx.draw(canvas);
        if (this.f22730jc && this.f22735tn != null) {
            ycx(canvas);
        }
        if (!this.f22725dj || this.wwx == null) {
            return;
        }
        canvas.drawPath(this.wie, this.thx);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        this.ycx.setBounds(rect);
        float f11 = this.f22739zb / 2.0f;
        this.f22727dy.set(rect.left + f11, rect.top + f11, rect.right - f11, rect.bottom - f11);
        this.wie.reset();
        float[] fArr = this.sya;
        if (fArr != null) {
            this.wie.addRoundRect(this.f22727dy, fArr, Path.Direction.CW);
        } else {
            this.wie.addRect(this.f22727dy, Path.Direction.CW);
        }
        this.pmi.set(rect.left, rect.top, rect.right, rect.bottom);
        this.f22736uh.reset();
        float[] fArr2 = this.sya;
        if (fArr2 != null) {
            this.f22736uh.addRoundRect(this.pmi, fArr2, Path.Direction.CW);
        } else {
            this.f22736uh.addRect(this.pmi, Path.Direction.CW);
        }
        this.f22726dv = this.f22727dy.width();
        if (this.f22725dj) {
            this.wwx = new LinearGradient(0.0f, 0.0f, this.f22726dv, 0.0f, this.lud, this.f22732lt, Shader.TileMode.REPEAT);
            this.htf.reset();
            this.thx.setShader(this.wwx);
        }
        if (this.f22730jc) {
            this.f22735tn = new LinearGradient(0.0f, 0.0f, this.f22726dv, 0.0f, this.xkz, this.syc, Shader.TileMode.REPEAT);
            dj();
            this.yzp = true;
        }
        if (this.f22729hf) {
            lud();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int i5) {
        this.ycx.setAlpha(i5);
        this.thx.setAlpha(i5);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
        this.ycx.setColorFilter(colorFilter);
    }

    private void ycx(Canvas canvas) {
        zb zbVar;
        Bitmap bitmap;
        RectF rectF = this.pmi;
        float f11 = rectF.left;
        float f12 = rectF.top;
        float f13 = rectF.right;
        float f14 = rectF.bottom;
        float f15 = this.kgy;
        int i5 = (int) (f13 - f11);
        int i11 = (int) (f14 - f12);
        if (i5 <= 0 || i11 <= 0) {
            return;
        }
        if (this.f22737ul) {
            canvas.save();
            canvas.clipPath(this.f22736uh);
            canvas.saveLayer(f11, f12, f13, f14, null);
            ycx(canvas, f11, f12, f13, f14, f15);
            this.tru.setAlpha((int) (this.f22733ok * 255.0f));
            this.tru.setXfermode(this.f22724av);
            canvas.drawRect(f11, f12, f13, f14, this.tru);
            this.tru.setXfermode(null);
            canvas.restore();
            canvas.restore();
            return;
        }
        if (this.yzp || (bitmap = this.ifb) == null || bitmap.getWidth() < i5 || this.ifb.getHeight() < i11) {
            Bitmap bitmap2 = this.ifb;
            if (bitmap2 != null) {
                bitmap2.recycle();
            }
            this.ifb = Bitmap.createBitmap(i5, i11, Bitmap.Config.ARGB_8888);
            Canvas canvas2 = new Canvas(this.ifb);
            canvas2.translate(-f11, -f12);
            canvas2.save();
            canvas2.clipPath(this.f22736uh);
            canvas2.saveLayer(f11, f12, f13, f14, null);
            ycx(canvas2, f11, f12, f13, f14, f15);
            zbVar = this;
            f11 = f11;
            f12 = f12;
            zbVar.tru.setAlpha((int) (zbVar.f22733ok * 255.0f));
            zbVar.tru.setXfermode(zbVar.f22724av);
            canvas2.drawRect(f11, f12, f13, f14, zbVar.tru);
            zbVar.tru.setXfermode(null);
            canvas2.restore();
            canvas2.restore();
            zbVar.yzp = false;
        } else {
            zbVar = this;
        }
        canvas.drawBitmap(zbVar.ifb, f11, f12, (Paint) null);
    }

    public boolean sya() {
        return this.f22737ul;
    }

    public void zb() {
        this.f22729hf = false;
        ValueAnimator valueAnimator = this.oty;
        if (valueAnimator != null) {
            valueAnimator.cancel();
            this.oty = null;
        }
    }

    private void ycx(Canvas canvas, float f11, float f12, float f13, float f14, float f15) {
        this.bhi.setShader(this.rmf);
        canvas.drawRect(f11, f12, f13, f12 + f15, this.bhi);
        this.bhi.setShader(this.aeu);
        canvas.drawRect(f11, f14 - f15, f13, f14, this.bhi);
        this.bhi.setShader(this.f22738xz);
        canvas.drawRect(f11, f12, f11 + f15, f14, this.bhi);
        this.bhi.setShader(this.rmy);
        canvas.drawRect(f13 - f15, f12, f13, f14, this.bhi);
    }

    public void ycx() {
        if (this.f22737ul) {
            this.f22729hf = true;
            if (this.f22726dv > 0.0f) {
                if (this.wwx == null && this.f22735tn == null) {
                    return;
                }
                lud();
            }
        }
    }
}
