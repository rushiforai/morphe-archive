package z9;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

/* loaded from: classes.dex */
public final class b extends Drawable {

    /* renamed from: d, reason: collision with root package name */
    public static final Matrix f98348d = new Matrix();

    /* renamed from: a, reason: collision with root package name */
    public final Path f98349a = new Path();

    /* renamed from: b, reason: collision with root package name */
    public final Paint f98350b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f98351c;

    public b(Paint paint, boolean z11) {
        this.f98350b = paint;
        this.f98351c = z11;
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        canvas.drawPath(this.f98349a, this.f98350b);
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public final void getOutline(Outline outline) {
        Path path = this.f98349a;
        if (path.isConvex()) {
            outline.setConvexPath(path);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void onBoundsChange(Rect rect) {
        Path path = this.f98349a;
        path.reset();
        float fHeight = rect.height() * 0.5f;
        float f11 = 2.0f * fHeight;
        float f12 = fHeight / 5.0f;
        int i5 = rect.left;
        int i11 = rect.top;
        path.addRoundRect(i5, i11, i5 + f11, f11 + i11, new float[]{fHeight, fHeight, fHeight, fHeight, f12, f12, fHeight, fHeight}, Path.Direction.CCW);
        Matrix matrix = f98348d;
        matrix.setRotate(-45.0f, rect.left + fHeight, rect.top + fHeight);
        if (this.f98351c) {
            matrix.postTranslate(rect.width(), 0.0f);
            matrix.postScale(-1.0f, 1.0f, rect.width(), 0.0f);
        }
        path.transform(matrix);
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
    }
}
