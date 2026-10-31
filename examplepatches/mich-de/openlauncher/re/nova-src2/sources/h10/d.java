package h10;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.Drawable;
import kotlin.NotImplementedError;

/* loaded from: classes4.dex */
public final class d extends Drawable {

    /* renamed from: a, reason: collision with root package name */
    public fz.p f58854a;

    /* renamed from: b, reason: collision with root package name */
    public final Path f58855b = new Path();

    /* renamed from: c, reason: collision with root package name */
    public final Paint f58856c = new Paint(1);

    /* renamed from: d, reason: collision with root package name */
    public int f58857d;

    /* renamed from: e, reason: collision with root package name */
    public int f58858e;

    /* renamed from: f, reason: collision with root package name */
    public int f58859f;

    public d(fz.p pVar) {
        this.f58854a = pVar;
    }

    public final void a(int i5) {
        this.f58859f = i5;
        this.f58856c.setColor(i5);
    }

    public final void b(fz.p pVar) {
        this.f58854a = pVar;
    }

    public final void c(int i5) {
        this.f58857d = i5;
    }

    public final void d(int i5) {
        this.f58858e = i5;
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        Path path = this.f58855b;
        path.rewind();
        int iWidth = getBounds().width();
        int iHeight = getBounds().height();
        float f11 = (iWidth > iHeight ? (iHeight - (this.f58857d * 2)) - this.f58858e : iWidth - (this.f58857d * 2)) / 100.0f;
        fz.p pVar = this.f58854a;
        int i5 = this.f58857d;
        float f12 = iWidth - (i5 * 2);
        float f13 = iHeight - i5;
        if (this.f58858e != 0) {
            i5 = 0;
        }
        pVar.l(path, f12, f13 - i5, f11);
        float f14 = this.f58857d;
        canvas.translate(f14, f14);
        canvas.drawPath(path, this.f58856c);
        float f15 = -this.f58857d;
        canvas.translate(f15, f15);
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        this.f58856c.setAlpha((((this.f58859f >> 24) & 255) * i5) / 255);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        throw new NotImplementedError("An operation is not implemented: Not yet implemented");
    }
}
