package fk;

import android.graphics.Canvas;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/* loaded from: classes3.dex */
public final class g extends bk.g {

    /* renamed from: z, reason: collision with root package name */
    public static final /* synthetic */ int f55182z = 0;

    /* renamed from: y, reason: collision with root package name */
    public f f55183y;

    @Override // bk.g
    public final void f(Canvas canvas) {
        if (this.f55183y.f55181r.isEmpty()) {
            super.f(canvas);
            return;
        }
        canvas.save();
        canvas.clipOutRect(this.f55183y.f55181r);
        super.f(canvas);
        canvas.restore();
    }

    @Override // bk.g, android.graphics.drawable.Drawable
    public final Drawable mutate() {
        this.f55183y = new f(this.f55183y);
        return this;
    }

    public final void q(float f11, float f12, float f13, float f14) {
        RectF rectF = this.f55183y.f55181r;
        if (f11 == rectF.left && f12 == rectF.top && f13 == rectF.right && f14 == rectF.bottom) {
            return;
        }
        rectF.set(f11, f12, f13, f14);
        invalidateSelf();
    }
}
