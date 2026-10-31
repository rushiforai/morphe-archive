package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.widget.ImageView;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.uJ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2655uJ extends ImageView {
    public float A00;
    public final int A01;
    public final int A02;

    @Nullable
    public final Bitmap A03;

    public C2655uJ(Context context, int i5, int i11, EnumC2437qn enumC2437qn) {
        super(context);
        this.A00 = 1.0f;
        this.A01 = i5;
        this.A02 = i11;
        this.A03 = AbstractC2438qo.A01(enumC2437qn);
    }

    @Override // android.widget.ImageView, android.view.View
    public final void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.A03 != null) {
            Paint paint = new Paint(2);
            paint.setColorFilter(new PorterDuffColorFilter(this.A01, PorterDuff.Mode.SRC_IN));
            canvas.drawBitmap(this.A03, (Rect) null, new Rect(0, 0, getWidth(), getHeight()), paint);
            paint.setColorFilter(new PorterDuffColorFilter(this.A02, PorterDuff.Mode.SRC_ATOP));
            Rect fillRect = new Rect(0, 0, (int) (this.A00 * this.A03.getWidth()), this.A03.getHeight());
            Rect drawRect = new Rect(0, 0, (int) (this.A00 * getWidth()), getHeight());
            canvas.drawBitmap(this.A03, fillRect, drawRect, paint);
        }
    }

    public void setFillRatio(float f11) {
        this.A00 = f11;
        postInvalidate();
    }
}
