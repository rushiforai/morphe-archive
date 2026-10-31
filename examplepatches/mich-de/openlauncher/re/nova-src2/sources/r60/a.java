package r60;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;

/* loaded from: classes4.dex */
public final class a extends Drawable {

    /* renamed from: a, reason: collision with root package name */
    public final Paint f85553a;

    public a() {
        Paint paint = new Paint(1);
        this.f85553a = paint;
        paint.setStyle(Paint.Style.STROKE);
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        Paint paint = this.f85553a;
        if (paint.getStrokeWidth() > 0.0f) {
            canvas.drawRect(getBounds(), paint);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -1;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
    }
}
