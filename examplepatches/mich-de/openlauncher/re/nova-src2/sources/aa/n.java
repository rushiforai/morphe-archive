package aa;

import android.animation.ObjectAnimator;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import com.android.launcher3.icons.BitmapInfo;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes.dex */
public class n extends Drawable {

    /* renamed from: m, reason: collision with root package name */
    public static ColorMatrixColorFilter f625m;

    /* renamed from: a, reason: collision with root package name */
    public final Paint f626a;

    /* renamed from: b, reason: collision with root package name */
    public Bitmap f627b;

    /* renamed from: c, reason: collision with root package name */
    public final int f628c;

    /* renamed from: d, reason: collision with root package name */
    public ColorFilter f629d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f630e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f631f;

    /* renamed from: g, reason: collision with root package name */
    public float f632g;

    /* renamed from: h, reason: collision with root package name */
    public ObjectAnimator f633h;

    /* renamed from: i, reason: collision with root package name */
    public float f634i;

    /* renamed from: j, reason: collision with root package name */
    public int f635j;

    /* renamed from: k, reason: collision with root package name */
    public static final AccelerateInterpolator f623k = new AccelerateInterpolator();

    /* renamed from: l, reason: collision with root package name */
    public static final DecelerateInterpolator f624l = new DecelerateInterpolator();
    public static final l n = new l(0, Float.TYPE, "scale");

    public n(BitmapInfo bitmapInfo) {
        this(bitmapInfo.f21151a, bitmapInfo.f21152b, false);
    }

    public static ColorMatrixColorFilter h(float f11) {
        ColorMatrix colorMatrix = new ColorMatrix();
        ColorMatrix colorMatrix2 = new ColorMatrix();
        colorMatrix2.setSaturation(0.0f);
        float[] array = colorMatrix.getArray();
        array[0] = 0.5f;
        array[6] = 0.5f;
        array[12] = 0.5f;
        float f12 = Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        array[4] = f12;
        array[9] = f12;
        array[14] = f12;
        array[18] = f11;
        colorMatrix2.preConcat(colorMatrix);
        return new ColorMatrixColorFilter(colorMatrix2);
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        if (this.f634i == 1.0f) {
            f(canvas, getBounds());
            return;
        }
        int iSave = canvas.save();
        Rect bounds = getBounds();
        float f11 = this.f634i;
        canvas.scale(f11, f11, bounds.exactCenterX(), bounds.exactCenterY());
        f(canvas, bounds);
        canvas.restoreToCount(iSave);
    }

    public void f(Canvas canvas, Rect rect) {
        canvas.drawBitmap(this.f627b, (Rect) null, rect, this.f626a);
    }

    public Bitmap g() {
        return this.f627b;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getAlpha() {
        return this.f635j;
    }

    @Override // android.graphics.drawable.Drawable
    public final ColorFilter getColorFilter() {
        return this.f626a.getColorFilter();
    }

    @Override // android.graphics.drawable.Drawable
    public Drawable.ConstantState getConstantState() {
        return new m(this.f627b, this.f628c, this.f631f);
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicHeight() {
        return this.f627b.getHeight();
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicWidth() {
        return this.f627b.getWidth();
    }

    @Override // android.graphics.drawable.Drawable
    public final int getMinimumHeight() {
        return getBounds().height();
    }

    @Override // android.graphics.drawable.Drawable
    public final int getMinimumWidth() {
        return getBounds().width();
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    public boolean i() {
        return this instanceof q0;
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean isStateful() {
        return true;
    }

    public final void j(boolean z11) {
        if (this.f631f != z11) {
            this.f631f = z11;
            k();
        }
    }

    public void k() {
        ColorFilter colorFilter;
        if (this.f631f) {
            if (f625m == null) {
                f625m = h(this.f632g);
            }
            colorFilter = f625m;
        } else {
            colorFilter = this.f629d;
        }
        this.f626a.setColorFilter(colorFilter);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean onStateChange(int[] iArr) {
        boolean z11;
        int length = iArr.length;
        int i5 = 0;
        while (true) {
            if (i5 >= length) {
                z11 = false;
                break;
            }
            if (iArr[i5] == 16842919) {
                z11 = true;
                break;
            }
            i5++;
        }
        if (this.f630e == z11) {
            return false;
        }
        this.f630e = z11;
        ObjectAnimator objectAnimator = this.f633h;
        if (objectAnimator != null) {
            objectAnimator.cancel();
            this.f633h = null;
        }
        boolean z12 = this.f630e;
        l lVar = n;
        if (z12) {
            ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this, lVar, 1.1f);
            this.f633h = objectAnimatorOfFloat;
            objectAnimatorOfFloat.setDuration(200L);
            this.f633h.setInterpolator(f623k);
            this.f633h.start();
            return true;
        }
        if (!isVisible()) {
            this.f634i = 1.0f;
            invalidateSelf();
            return true;
        }
        ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(this, lVar, 1.0f);
        this.f633h = objectAnimatorOfFloat2;
        objectAnimatorOfFloat2.setDuration(200L);
        this.f633h.setInterpolator(f624l);
        this.f633h.start();
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        if (this.f635j != i5) {
            this.f635j = i5;
            this.f626a.setAlpha(i5);
            invalidateSelf();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        this.f629d = colorFilter;
        k();
    }

    @Override // android.graphics.drawable.Drawable
    public final void setFilterBitmap(boolean z11) {
        Paint paint = this.f626a;
        paint.setFilterBitmap(z11);
        paint.setAntiAlias(z11);
    }

    public n(Bitmap bitmap, int i5, boolean z11) {
        this.f626a = new Paint(3);
        this.f632g = 1.0f;
        this.f634i = 1.0f;
        this.f635j = 255;
        if (bitmap != null) {
            this.f627b = bitmap;
            this.f628c = i5;
            setFilterBitmap(true);
            j(z11);
            return;
        }
        throw new IllegalStateException();
    }
}
