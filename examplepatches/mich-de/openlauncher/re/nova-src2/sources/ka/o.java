package ka;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.Drawable;
import android.os.Build;

/* loaded from: classes2.dex */
public final class o extends Drawable {

    /* renamed from: a, reason: collision with root package name */
    public final Path f71299a;

    /* renamed from: b, reason: collision with root package name */
    public final Paint f71300b;

    public o(float f11, float f12, float f13, float f14, float f15, float f16, float f17, float f18, boolean z11, boolean z12, int i5) {
        Path path = new Path();
        this.f71299a = path;
        Paint paint = new Paint();
        this.f71300b = paint;
        paint.setColor(i5);
        paint.setStyle(Paint.Style.FILL);
        paint.setAntiAlias(true);
        float f19 = f11 / (f12 * 2.0f);
        double d5 = f12;
        double dAtan = (float) Math.atan(f19);
        float fSin = (float) (d5 - (f13 / Math.sin(dAtan)));
        double d11 = f13 / f19;
        float fSin2 = (float) (Math.sin(dAtan) * d11);
        float fCos = (float) (d5 - (Math.cos(dAtan) * d11));
        float f21 = f11 / 2.0f;
        float degrees = (float) Math.toDegrees(dAtan);
        path.reset();
        path.moveTo(0.0f, 0.0f);
        path.moveTo(f11, 0.0f);
        float f22 = -fCos;
        path.lineTo((fSin2 * 2.0f) + f11, f22);
        path.lineTo((-2.0f) * fSin2, f22);
        path.lineTo(0.0f, 0.0f);
        path.lineTo(f11, 0.0f);
        path.lineTo(fSin2 + f21, fCos);
        path.arcTo(f21 - f13, fSin - f13, f21 + f13, fSin + f13, degrees, 180.0f - (2.0f * degrees), false);
        path.lineTo(0.0f, 0.0f);
        path.close();
        Path path2 = new Path();
        path2.addRoundRect(0.0f, 0.0f, f15, f16, f14, f14, Path.Direction.CW);
        path2.offset(-f17, ((-f16) + f18) - 0.5f);
        path.op(path2, Path.Op.DIFFERENCE);
        Matrix matrix = new Matrix();
        matrix.setScale(z12 ? 1.0f : -1.0f, z11 ? -1.0f : 1.0f, f11 * 0.5f, f12 * 0.5f);
        path.transform(matrix);
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        canvas.drawPath(this.f71299a, this.f71300b);
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public final void getOutline(Outline outline) {
        if (Build.VERSION.SDK_INT >= 30) {
            outline.setPath(this.f71299a);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        this.f71300b.setAlpha(i5);
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        this.f71300b.setColorFilter(colorFilter);
    }
}
