package f10;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.Drawable;
import kotlin.NotImplementedError;

/* loaded from: classes4.dex */
public final class a extends Drawable {

    /* renamed from: a, reason: collision with root package name */
    public final int f54163a;

    /* renamed from: b, reason: collision with root package name */
    public fz.p f54164b;

    /* renamed from: c, reason: collision with root package name */
    public final Path f54165c = new Path();

    /* renamed from: d, reason: collision with root package name */
    public final Paint f54166d;

    public a(float f11, int i5, int i11, fz.p pVar) {
        this.f54163a = i11;
        this.f54164b = pVar;
        Paint paint = new Paint(1);
        paint.setStyle(Paint.Style.STROKE);
        paint.setColor(i5);
        paint.setStrokeWidth(f11);
        this.f54166d = paint;
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        Path path = this.f54165c;
        path.rewind();
        int iSave = canvas.save();
        Paint paint = this.f54166d;
        float strokeWidth = paint.getStrokeWidth() / 2.0f;
        int i5 = (int) (0.5f + strokeWidth);
        int i11 = this.f54163a;
        if (i11 == 0) {
            canvas.clipRect(0, 0, getBounds().width() - i5, getBounds().height() - i5);
            canvas.translate(strokeWidth, strokeWidth);
        } else if (i11 == 1) {
            canvas.clipRect(i5, 0, getBounds().width(), getBounds().height() - i5);
            canvas.translate(-strokeWidth, strokeWidth);
        } else if (i11 == 2) {
            canvas.clipRect(0, i5, getBounds().width() - i5, getBounds().height());
            canvas.translate(strokeWidth, -strokeWidth);
        } else if (i11 == 3) {
            canvas.clipRect(i5, i5, getBounds().width(), getBounds().height());
            float f11 = -strokeWidth;
            canvas.translate(f11, f11);
        }
        int iWidth = getBounds().width();
        float fHeight = getBounds().height();
        float f12 = 0;
        this.f54164b.l(path, iWidth - f12, (fHeight - f12) - f12, fHeight / 100.0f);
        canvas.translate(f12, f12);
        canvas.drawPath(path, paint);
        canvas.restoreToCount(iSave);
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        throw new NotImplementedError("An operation is not implemented: Not yet implemented");
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        throw new NotImplementedError("An operation is not implemented: Not yet implemented");
    }
}
