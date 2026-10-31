package fz;

import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

/* loaded from: classes4.dex */
public final class k0 extends Drawable {

    /* renamed from: a, reason: collision with root package name */
    public final Path f56287a;

    /* renamed from: b, reason: collision with root package name */
    public final int f56288b = 100;

    /* renamed from: c, reason: collision with root package name */
    public final int f56289c = 100;

    /* renamed from: d, reason: collision with root package name */
    public ColorStateList f56290d = ColorStateList.valueOf(-1);

    /* renamed from: e, reason: collision with root package name */
    public final Matrix f56291e = new Matrix();

    /* renamed from: f, reason: collision with root package name */
    public final Path f56292f = new Path();

    /* renamed from: g, reason: collision with root package name */
    public final Paint f56293g = new Paint(5);

    /* renamed from: h, reason: collision with root package name */
    public float f56294h = 1.0f;

    public k0(Path path) {
        this.f56287a = path;
    }

    public final void a() {
        this.f56290d = ColorStateList.valueOf(-1);
    }

    public final void b(ColorStateList colorStateList) {
        this.f56290d = colorStateList;
    }

    public final void c(float f11) {
        this.f56294h = f11;
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        int colorForState = this.f56290d.getColorForState(getState(), this.f56290d.getDefaultColor());
        Paint paint = this.f56293g;
        paint.setColor(colorForState);
        canvas.drawPath(this.f56292f, paint);
    }

    @Override // android.graphics.drawable.Drawable
    public final ColorFilter getColorFilter() {
        return this.f56293g.getColorFilter();
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicHeight() {
        return this.f56289c;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicWidth() {
        return this.f56288b;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean isStateful() {
        return this.f56290d.isStateful();
    }

    @Override // android.graphics.drawable.Drawable
    public final void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        Matrix matrix = this.f56291e;
        matrix.setScale(rect.width() / this.f56288b, rect.height() / this.f56289c);
        float f11 = this.f56294h;
        matrix.postScale(f11, f11, rect.width() / 2.0f, rect.height() / 2.0f);
        this.f56287a.transform(matrix, this.f56292f);
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        this.f56293g.setAlpha(i5);
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        this.f56293g.setColorFilter(colorFilter);
    }
}
