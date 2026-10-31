package z9;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;

/* loaded from: classes2.dex */
public final class g extends Drawable {

    /* renamed from: a, reason: collision with root package name */
    public final Paint f98382a = new Paint(2);

    /* renamed from: b, reason: collision with root package name */
    public final Bitmap f98383b;

    /* renamed from: c, reason: collision with root package name */
    public final j7.d f98384c;

    public g(Bitmap bitmap) {
        this.f98383b = bitmap;
        this.f98384c = new j7.d(bitmap, 2);
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        canvas.drawBitmap(this.f98383b, 0.0f, 0.0f, this.f98382a);
    }

    @Override // android.graphics.drawable.Drawable
    public final Drawable.ConstantState getConstantState() {
        return this.f98384c;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        this.f98382a.setColorFilter(colorFilter);
    }
}
