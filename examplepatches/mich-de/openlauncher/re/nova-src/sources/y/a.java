package y;

import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/* loaded from: classes2.dex */
public final class a extends Drawable {

    /* renamed from: a, reason: collision with root package name */
    public final float f96487a;

    /* renamed from: b, reason: collision with root package name */
    public final Paint f96488b;

    /* renamed from: c, reason: collision with root package name */
    public final RectF f96489c;

    /* renamed from: d, reason: collision with root package name */
    public final Rect f96490d;

    /* renamed from: e, reason: collision with root package name */
    public float f96491e;

    /* renamed from: h, reason: collision with root package name */
    public ColorStateList f96494h;

    /* renamed from: i, reason: collision with root package name */
    public PorterDuffColorFilter f96495i;

    /* renamed from: j, reason: collision with root package name */
    public ColorStateList f96496j;

    /* renamed from: f, reason: collision with root package name */
    public boolean f96492f = false;

    /* renamed from: g, reason: collision with root package name */
    public boolean f96493g = true;

    /* renamed from: k, reason: collision with root package name */
    public PorterDuff.Mode f96497k = PorterDuff.Mode.SRC_IN;

    public a(ColorStateList colorStateList, float f11) {
        this.f96487a = f11;
        Paint paint = new Paint(5);
        this.f96488b = paint;
        colorStateList = colorStateList == null ? ColorStateList.valueOf(0) : colorStateList;
        this.f96494h = colorStateList;
        paint.setColor(colorStateList.getColorForState(getState(), this.f96494h.getDefaultColor()));
        this.f96489c = new RectF();
        this.f96490d = new Rect();
    }

    public final PorterDuffColorFilter a(ColorStateList colorStateList, PorterDuff.Mode mode) {
        if (colorStateList == null || mode == null) {
            return null;
        }
        return new PorterDuffColorFilter(colorStateList.getColorForState(getState(), 0), mode);
    }

    public final void b(Rect rect) {
        if (rect == null) {
            rect = getBounds();
        }
        float f11 = rect.left;
        float f12 = rect.top;
        float f13 = rect.right;
        float f14 = rect.bottom;
        RectF rectF = this.f96489c;
        rectF.set(f11, f12, f13, f14);
        Rect rect2 = this.f96490d;
        rect2.set(rect);
        if (this.f96492f) {
            float f15 = this.f96491e;
            boolean z11 = this.f96493g;
            float f16 = this.f96487a;
            rect2.inset((int) Math.ceil(b.a(this.f96491e, f16, this.f96493g)), (int) Math.ceil(b.b(f15, f16, z11)));
            rectF.set(rect2);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        boolean z11;
        PorterDuffColorFilter porterDuffColorFilter = this.f96495i;
        Paint paint = this.f96488b;
        if (porterDuffColorFilter == null || paint.getColorFilter() != null) {
            z11 = false;
        } else {
            paint.setColorFilter(this.f96495i);
            z11 = true;
        }
        RectF rectF = this.f96489c;
        float f11 = this.f96487a;
        canvas.drawRoundRect(rectF, f11, f11, paint);
        if (z11) {
            paint.setColorFilter(null);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public final void getOutline(Outline outline) {
        outline.setRoundRect(this.f96490d, this.f96487a);
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean isStateful() {
        ColorStateList colorStateList = this.f96496j;
        if (colorStateList != null && colorStateList.isStateful()) {
            return true;
        }
        ColorStateList colorStateList2 = this.f96494h;
        return (colorStateList2 != null && colorStateList2.isStateful()) || super.isStateful();
    }

    @Override // android.graphics.drawable.Drawable
    public final void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        b(rect);
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean onStateChange(int[] iArr) {
        PorterDuff.Mode mode;
        ColorStateList colorStateList = this.f96494h;
        int colorForState = colorStateList.getColorForState(iArr, colorStateList.getDefaultColor());
        Paint paint = this.f96488b;
        boolean z11 = colorForState != paint.getColor();
        if (z11) {
            paint.setColor(colorForState);
        }
        ColorStateList colorStateList2 = this.f96496j;
        if (colorStateList2 == null || (mode = this.f96497k) == null) {
            return z11;
        }
        this.f96495i = a(colorStateList2, mode);
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        this.f96488b.setAlpha(i5);
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        this.f96488b.setColorFilter(colorFilter);
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTintList(ColorStateList colorStateList) {
        this.f96496j = colorStateList;
        this.f96495i = a(colorStateList, this.f96497k);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public final void setTintMode(PorterDuff.Mode mode) {
        this.f96497k = mode;
        this.f96495i = a(this.f96496j, mode);
        invalidateSelf();
    }
}
