package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.drawable.GradientDrawable;

/* loaded from: classes2.dex */
public class zb extends GradientDrawable {
    protected Path ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final Paint f23433zb;

    public zb() {
        this.ycx = new Path();
        Paint paint = new Paint(1);
        this.f23433zb = paint;
        paint.setColor(-1);
    }

    @Override // android.graphics.drawable.GradientDrawable, android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        Path path = this.ycx;
        if (path == null || path.isEmpty()) {
            ycx(canvas);
            return;
        }
        int iSaveLayer = canvas.saveLayer(0.0f, 0.0f, canvas.getWidth(), canvas.getHeight(), this.f23433zb, 31);
        ycx(canvas);
        this.f23433zb.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
        canvas.drawPath(this.ycx, this.f23433zb);
        this.f23433zb.setXfermode(null);
        canvas.restoreToCount(iSaveLayer);
    }

    public void ycx(Canvas canvas) {
        super.draw(canvas);
    }

    public void ycx(int i5, int i11, int i12, int i13) {
        this.ycx.addRect(i5, i11, i12, i13, Path.Direction.CW);
        invalidateSelf();
    }

    public zb(GradientDrawable.Orientation orientation, int[] iArr) {
        super(orientation, iArr);
        this.ycx = new Path();
        Paint paint = new Paint(1);
        this.f23433zb = paint;
        paint.setColor(-1);
    }
}
