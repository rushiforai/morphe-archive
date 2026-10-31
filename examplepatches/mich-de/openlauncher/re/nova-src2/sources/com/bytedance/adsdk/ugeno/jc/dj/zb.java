package com.bytedance.adsdk.ugeno.jc.dj;

import a2.c;
import a5.k;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build;
import android.util.Log;
import android.widget.ImageView;
import java.util.HashSet;

/* loaded from: classes2.dex */
public class zb extends Drawable {

    /* renamed from: dj, reason: collision with root package name */
    private final Bitmap f22311dj;

    /* renamed from: dy, reason: collision with root package name */
    private final boolean[] f22312dy;

    /* renamed from: ea, reason: collision with root package name */
    private final RectF f22313ea;
    private final RectF fby;
    private ImageView.ScaleType htf;

    /* renamed from: jc, reason: collision with root package name */
    private final Matrix f22314jc;

    /* renamed from: jw, reason: collision with root package name */
    private final Paint f22315jw;

    /* renamed from: lt, reason: collision with root package name */
    private final int f22316lt;
    private final Paint lud;

    /* renamed from: ok, reason: collision with root package name */
    private Shader.TileMode f22317ok;
    private float pmi;

    /* renamed from: ry, reason: collision with root package name */
    private Shader.TileMode f22318ry;
    private final RectF sya;
    private float syc;

    /* renamed from: uh, reason: collision with root package name */
    private ColorStateList f22319uh;

    /* renamed from: ul, reason: collision with root package name */
    private final int f22320ul;
    private boolean wie;
    private boolean xkz;
    private final RectF ycx = new RectF();

    /* renamed from: zb, reason: collision with root package name */
    private final RectF f22321zb = new RectF();

    /* renamed from: com.bytedance.adsdk.ugeno.jc.dj.zb$1, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] ycx;

        static {
            int[] iArr = new int[ImageView.ScaleType.values().length];
            ycx = iArr;
            try {
                iArr[ImageView.ScaleType.CENTER.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                ycx[ImageView.ScaleType.CENTER_CROP.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                ycx[ImageView.ScaleType.CENTER_INSIDE.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                ycx[ImageView.ScaleType.FIT_CENTER.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                ycx[ImageView.ScaleType.FIT_END.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                ycx[ImageView.ScaleType.FIT_START.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                ycx[ImageView.ScaleType.FIT_XY.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
        }
    }

    public zb(Bitmap bitmap) {
        RectF rectF = new RectF();
        this.sya = rectF;
        this.fby = new RectF();
        this.f22314jc = new Matrix();
        this.f22313ea = new RectF();
        Shader.TileMode tileMode = Shader.TileMode.CLAMP;
        this.f22317ok = tileMode;
        this.f22318ry = tileMode;
        this.xkz = true;
        this.syc = 0.0f;
        this.f22312dy = new boolean[]{true, true, true, true};
        this.wie = false;
        this.pmi = 0.0f;
        this.f22319uh = ColorStateList.valueOf(-16777216);
        this.htf = ImageView.ScaleType.FIT_CENTER;
        this.f22311dj = bitmap;
        int width = bitmap.getWidth();
        this.f22316lt = width;
        int height = bitmap.getHeight();
        this.f22320ul = height;
        rectF.set(0.0f, 0.0f, width, height);
        Paint paint = new Paint();
        this.lud = paint;
        paint.setStyle(Paint.Style.FILL);
        paint.setAntiAlias(true);
        Paint paint2 = new Paint();
        this.f22315jw = paint2;
        paint2.setStyle(Paint.Style.STROKE);
        paint2.setAntiAlias(true);
        paint2.setColor(this.f22319uh.getColorForState(getState(), -16777216));
        paint2.setStrokeWidth(this.pmi);
    }

    public static zb ycx(Bitmap bitmap) {
        if (bitmap != null) {
            return new zb(bitmap);
        }
        return null;
    }

    public static Bitmap zb(Drawable drawable) {
        if (drawable == null) {
            return null;
        }
        if (drawable instanceof BitmapDrawable) {
            return ((BitmapDrawable) drawable).getBitmap();
        }
        try {
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(Math.max(drawable.getIntrinsicWidth(), 2), Math.max(drawable.getIntrinsicHeight(), 2), Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmapCreateBitmap);
            drawable.setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
            drawable.draw(canvas);
            return bitmapCreateBitmap;
        } catch (Throwable unused) {
            Log.w("RoundedDrawable", "Failed to create bitmap from drawable!");
            return null;
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (this.xkz) {
            BitmapShader bitmapShader = new BitmapShader(this.f22311dj, this.f22317ok, this.f22318ry);
            Shader.TileMode tileMode = this.f22317ok;
            Shader.TileMode tileMode2 = Shader.TileMode.CLAMP;
            if (tileMode == tileMode2 && this.f22318ry == tileMode2) {
                bitmapShader.setLocalMatrix(this.f22314jc);
            }
            this.lud.setShader(bitmapShader);
            this.xkz = false;
        }
        if (this.wie) {
            if (this.pmi <= 0.0f) {
                canvas.drawOval(this.f22321zb, this.lud);
                return;
            } else {
                canvas.drawOval(this.f22321zb, this.lud);
                canvas.drawOval(this.fby, this.f22315jw);
                return;
            }
        }
        if (!ycx(this.f22312dy)) {
            canvas.drawRect(this.f22321zb, this.lud);
            if (this.pmi > 0.0f) {
                canvas.drawRect(this.fby, this.f22315jw);
                return;
            }
            return;
        }
        float f11 = this.syc;
        if (this.pmi <= 0.0f) {
            canvas.drawRoundRect(this.f22321zb, f11, f11, this.lud);
            ycx(canvas);
        } else {
            canvas.drawRoundRect(this.f22321zb, f11, f11, this.lud);
            canvas.drawRoundRect(this.fby, f11, f11, this.f22315jw);
            ycx(canvas);
            zb(canvas);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public int getAlpha() {
        return this.lud.getAlpha();
    }

    @Override // android.graphics.drawable.Drawable
    public ColorFilter getColorFilter() {
        return this.lud.getColorFilter();
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return this.f22320ul;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return this.f22316lt;
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        return this.f22319uh.isStateful();
    }

    @Override // android.graphics.drawable.Drawable
    public void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        this.ycx.set(rect);
        ycx();
    }

    @Override // android.graphics.drawable.Drawable
    public boolean onStateChange(int[] iArr) {
        int colorForState = this.f22319uh.getColorForState(iArr, 0);
        if (this.f22315jw.getColor() == colorForState) {
            return super.onStateChange(iArr);
        }
        this.f22315jw.setColor(colorForState);
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int i5) {
        this.lud.setAlpha(i5);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
        this.lud.setColorFilter(colorFilter);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void setDither(boolean z11) {
        this.lud.setDither(z11);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void setFilterBitmap(boolean z11) {
        this.lud.setFilterBitmap(z11);
        invalidateSelf();
    }

    public static Drawable ycx(Drawable drawable) {
        if (drawable != null) {
            if (drawable instanceof zb) {
                return drawable;
            }
            if (Build.VERSION.SDK_INT >= 28 && k.u(drawable)) {
                return drawable;
            }
            if (drawable instanceof LayerDrawable) {
                Drawable.ConstantState constantState = drawable.mutate().getConstantState();
                if (constantState != null) {
                    drawable = constantState.newDrawable();
                }
                LayerDrawable layerDrawable = (LayerDrawable) drawable;
                int numberOfLayers = layerDrawable.getNumberOfLayers();
                for (int i5 = 0; i5 < numberOfLayers; i5++) {
                    layerDrawable.setDrawableByLayerId(layerDrawable.getId(i5), ycx(layerDrawable.getDrawable(i5)));
                }
                return layerDrawable;
            }
        }
        Bitmap bitmapZb = zb(drawable);
        return bitmapZb != null ? new zb(bitmapZb) : drawable;
    }

    private void zb(Canvas canvas) {
        float f11;
        float f12;
        if (zb(this.f22312dy) || this.syc == 0.0f) {
            return;
        }
        RectF rectF = this.f22321zb;
        float f13 = rectF.left;
        float f14 = rectF.top;
        float fWidth = rectF.width() + f13;
        float fHeight = this.f22321zb.height() + f14;
        float f15 = this.syc;
        float f16 = this.pmi / 2.0f;
        if (this.f22312dy[0]) {
            f11 = f14;
        } else {
            f11 = f14;
            canvas.drawLine(f13 - f16, f14, f13 + f15, f11, this.f22315jw);
            canvas.drawLine(f13, f11 - f16, f13, f11 + f15, this.f22315jw);
        }
        if (!this.f22312dy[1]) {
            float f17 = f11;
            canvas.drawLine((fWidth - f15) - f16, f17, fWidth, f11, this.f22315jw);
            canvas.drawLine(fWidth, f17 - f16, fWidth, f17 + f15, this.f22315jw);
            fWidth = fWidth;
        }
        if (this.f22312dy[2]) {
            f12 = fHeight;
        } else {
            canvas.drawLine((fWidth - f15) - f16, fHeight, fWidth + f16, fHeight, this.f22315jw);
            float f18 = fWidth;
            canvas.drawLine(f18, fHeight - f15, fWidth, fHeight, this.f22315jw);
            f12 = fHeight;
        }
        if (this.f22312dy[3]) {
            return;
        }
        canvas.drawLine(f13 - f16, f12, f13 + f15, f12, this.f22315jw);
        canvas.drawLine(f13, f12 - f15, f13, f12, this.f22315jw);
    }

    private void ycx() {
        float fWidth;
        float fHeight;
        int i5 = AnonymousClass1.ycx[this.htf.ordinal()];
        if (i5 == 1) {
            this.fby.set(this.ycx);
            RectF rectF = this.fby;
            float f11 = this.pmi;
            rectF.inset(f11 / 2.0f, f11 / 2.0f);
            this.f22314jc.reset();
            this.f22314jc.setTranslate((int) c.a(this.fby.width(), this.f22316lt, 0.5f, 0.5f), (int) c.a(this.fby.height(), this.f22320ul, 0.5f, 0.5f));
        } else if (i5 == 2) {
            this.fby.set(this.ycx);
            RectF rectF2 = this.fby;
            float f12 = this.pmi;
            rectF2.inset(f12 / 2.0f, f12 / 2.0f);
            this.f22314jc.reset();
            float fWidth2 = 0.0f;
            if (this.fby.height() * this.f22316lt > this.fby.width() * this.f22320ul) {
                fWidth = this.fby.height() / this.f22320ul;
                fHeight = 0.0f;
                fWidth2 = (this.fby.width() - (this.f22316lt * fWidth)) * 0.5f;
            } else {
                fWidth = this.fby.width() / this.f22316lt;
                fHeight = (this.fby.height() - (this.f22320ul * fWidth)) * 0.5f;
            }
            this.f22314jc.setScale(fWidth, fWidth);
            Matrix matrix = this.f22314jc;
            float f13 = this.pmi;
            matrix.postTranslate((f13 / 2.0f) + ((int) (fWidth2 + 0.5f)), (f13 / 2.0f) + ((int) (fHeight + 0.5f)));
        } else if (i5 == 3) {
            this.f22314jc.reset();
            float fMin = (((float) this.f22316lt) > this.ycx.width() || ((float) this.f22320ul) > this.ycx.height()) ? Math.min(this.ycx.width() / this.f22316lt, this.ycx.height() / this.f22320ul) : 1.0f;
            float fWidth3 = (int) (((this.ycx.width() - (this.f22316lt * fMin)) * 0.5f) + 0.5f);
            float fHeight2 = (int) (((this.ycx.height() - (this.f22320ul * fMin)) * 0.5f) + 0.5f);
            this.f22314jc.setScale(fMin, fMin);
            this.f22314jc.postTranslate(fWidth3, fHeight2);
            this.fby.set(this.sya);
            this.f22314jc.mapRect(this.fby);
            RectF rectF3 = this.fby;
            float f14 = this.pmi;
            rectF3.inset(f14 / 2.0f, f14 / 2.0f);
            this.f22314jc.setRectToRect(this.sya, this.fby, Matrix.ScaleToFit.FILL);
        } else if (i5 == 5) {
            this.fby.set(this.sya);
            this.f22314jc.setRectToRect(this.sya, this.ycx, Matrix.ScaleToFit.END);
            this.f22314jc.mapRect(this.fby);
            RectF rectF4 = this.fby;
            float f15 = this.pmi;
            rectF4.inset(f15 / 2.0f, f15 / 2.0f);
            this.f22314jc.setRectToRect(this.sya, this.fby, Matrix.ScaleToFit.FILL);
        } else if (i5 == 6) {
            this.fby.set(this.sya);
            this.f22314jc.setRectToRect(this.sya, this.ycx, Matrix.ScaleToFit.START);
            this.f22314jc.mapRect(this.fby);
            RectF rectF5 = this.fby;
            float f16 = this.pmi;
            rectF5.inset(f16 / 2.0f, f16 / 2.0f);
            this.f22314jc.setRectToRect(this.sya, this.fby, Matrix.ScaleToFit.FILL);
        } else if (i5 != 7) {
            this.fby.set(this.sya);
            this.f22314jc.setRectToRect(this.sya, this.ycx, Matrix.ScaleToFit.CENTER);
            this.f22314jc.mapRect(this.fby);
            RectF rectF6 = this.fby;
            float f17 = this.pmi;
            rectF6.inset(f17 / 2.0f, f17 / 2.0f);
            this.f22314jc.setRectToRect(this.sya, this.fby, Matrix.ScaleToFit.FILL);
        } else {
            this.fby.set(this.ycx);
            RectF rectF7 = this.fby;
            float f18 = this.pmi;
            rectF7.inset(f18 / 2.0f, f18 / 2.0f);
            this.f22314jc.reset();
            this.f22314jc.setRectToRect(this.sya, this.fby, Matrix.ScaleToFit.FILL);
        }
        this.f22321zb.set(this.fby);
        this.xkz = true;
    }

    public zb zb(Shader.TileMode tileMode) {
        if (this.f22318ry != tileMode) {
            this.f22318ry = tileMode;
            this.xkz = true;
            invalidateSelf();
        }
        return this;
    }

    private static boolean zb(boolean[] zArr) {
        for (boolean z11 : zArr) {
            if (z11) {
                return false;
            }
        }
        return true;
    }

    private void ycx(Canvas canvas) {
        if (zb(this.f22312dy) || this.syc == 0.0f) {
            return;
        }
        RectF rectF = this.f22321zb;
        float f11 = rectF.left;
        float f12 = rectF.top;
        float fWidth = rectF.width() + f11;
        float fHeight = this.f22321zb.height() + f12;
        float f13 = this.syc;
        if (!this.f22312dy[0]) {
            this.f22313ea.set(f11, f12, f11 + f13, f12 + f13);
            canvas.drawRect(this.f22313ea, this.lud);
        }
        if (!this.f22312dy[1]) {
            this.f22313ea.set(fWidth - f13, f12, fWidth, f13);
            canvas.drawRect(this.f22313ea, this.lud);
        }
        if (!this.f22312dy[2]) {
            this.f22313ea.set(fWidth - f13, fHeight - f13, fWidth, fHeight);
            canvas.drawRect(this.f22313ea, this.lud);
        }
        if (this.f22312dy[3]) {
            return;
        }
        this.f22313ea.set(f11, fHeight - f13, f13 + f11, fHeight);
        canvas.drawRect(this.f22313ea, this.lud);
    }

    public zb ycx(float f11, float f12, float f13, float f14) {
        HashSet hashSet = new HashSet(4);
        hashSet.add(Float.valueOf(f11));
        hashSet.add(Float.valueOf(f12));
        hashSet.add(Float.valueOf(f13));
        hashSet.add(Float.valueOf(f14));
        hashSet.remove(Float.valueOf(0.0f));
        if (hashSet.size() <= 1) {
            if (!hashSet.isEmpty()) {
                float fFloatValue = ((Float) hashSet.iterator().next()).floatValue();
                if (!Float.isInfinite(fFloatValue) && !Float.isNaN(fFloatValue) && fFloatValue >= 0.0f) {
                    this.syc = fFloatValue;
                } else {
                    throw new IllegalArgumentException("Invalid radius value: ".concat(String.valueOf(fFloatValue)));
                }
            } else {
                this.syc = 0.0f;
            }
            boolean[] zArr = this.f22312dy;
            zArr[0] = f11 > 0.0f;
            zArr[1] = f12 > 0.0f;
            zArr[2] = f13 > 0.0f;
            zArr[3] = f14 > 0.0f;
            return this;
        }
        throw new IllegalArgumentException("Multiple nonzero corner radii not yet supported.");
    }

    public zb ycx(float f11) {
        this.pmi = f11;
        this.f22315jw.setStrokeWidth(f11);
        return this;
    }

    public zb ycx(ColorStateList colorStateList) {
        if (colorStateList == null) {
            colorStateList = ColorStateList.valueOf(0);
        }
        this.f22319uh = colorStateList;
        this.f22315jw.setColor(colorStateList.getColorForState(getState(), -16777216));
        return this;
    }

    public zb ycx(boolean z11) {
        this.wie = z11;
        return this;
    }

    public zb ycx(ImageView.ScaleType scaleType) {
        if (scaleType == null) {
            scaleType = ImageView.ScaleType.FIT_CENTER;
        }
        if (this.htf != scaleType) {
            this.htf = scaleType;
            ycx();
        }
        return this;
    }

    public zb ycx(Shader.TileMode tileMode) {
        if (this.f22317ok != tileMode) {
            this.f22317ok = tileMode;
            this.xkz = true;
            invalidateSelf();
        }
        return this;
    }

    private static boolean ycx(boolean[] zArr) {
        for (boolean z11 : zArr) {
            if (z11) {
                return true;
            }
        }
        return false;
    }
}
