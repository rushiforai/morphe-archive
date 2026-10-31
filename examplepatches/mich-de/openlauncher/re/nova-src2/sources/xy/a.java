package xy;

import android.animation.ValueAnimator;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import b.c0;
import kotlin.NotImplementedError;

/* loaded from: classes4.dex */
public final class a extends Drawable {

    /* renamed from: a, reason: collision with root package name */
    public ValueAnimator f96475a;

    /* renamed from: b, reason: collision with root package name */
    public final Paint f96476b = new Paint();

    /* renamed from: c, reason: collision with root package name */
    public int f96477c;

    public a(int i5) {
        this.f96477c = i5;
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        int i5 = this.f96477c;
        Paint paint = this.f96476b;
        paint.setColor(i5);
        canvas.drawRect(getBounds(), paint);
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        int i5 = this.f96477c >>> 24;
        if (i5 != 0) {
            return i5 != 255 ? -3 : -1;
        }
        return -2;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        throw new NotImplementedError("An operation is not implemented: not implemented");
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        throw new NotImplementedError("An operation is not implemented: not implemented");
    }

    public final String toString() {
        return c0.l("DynamicColorDrawable(", Integer.toHexString(this.f96477c), ")");
    }
}
