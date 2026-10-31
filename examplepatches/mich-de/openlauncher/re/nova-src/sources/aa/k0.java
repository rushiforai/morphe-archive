package aa;

import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.DrawableWrapper;

/* loaded from: classes2.dex */
public final class k0 extends DrawableWrapper {

    /* renamed from: a, reason: collision with root package name */
    public final RectF f602a;

    /* renamed from: b, reason: collision with root package name */
    public final Path f603b;

    /* renamed from: c, reason: collision with root package name */
    public final float f604c;

    public k0(n nVar, float f11) {
        super(nVar);
        this.f602a = new RectF();
        this.f603b = new Path();
        this.f604c = f11;
    }

    @Override // android.graphics.drawable.DrawableWrapper, android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        int iSave = canvas.save();
        canvas.clipPath(this.f603b);
        super.draw(canvas);
        canvas.restoreToCount(iSave);
    }

    @Override // android.graphics.drawable.DrawableWrapper, android.graphics.drawable.Drawable
    public final void onBoundsChange(Rect rect) {
        Rect bounds = getBounds();
        RectF rectF = this.f602a;
        rectF.set(bounds);
        Path path = this.f603b;
        path.reset();
        float f11 = this.f604c;
        path.addRoundRect(rectF, f11, f11, Path.Direction.CCW);
        super.onBoundsChange(rect);
    }
}
