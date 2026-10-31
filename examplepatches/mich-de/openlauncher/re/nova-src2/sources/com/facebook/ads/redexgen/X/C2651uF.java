package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.widget.ImageView;

/* renamed from: com.facebook.ads.redexgen.X.uF, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2651uF extends ImageView {
    public final float A00;
    public final int A01;
    public final int A02;
    public final Bitmap A03;

    public C2651uF(C0958Hi c0958Hi, int i5, int i11, EnumC2437qn enumC2437qn) {
        super(c0958Hi);
        this.A00 = 1.0f;
        this.A01 = i5;
        this.A02 = i11;
        this.A03 = AbstractC2438qo.A01(enumC2437qn);
    }

    @Override // android.widget.ImageView, android.view.View
    public final void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        Paint paint = new Paint(2);
        paint.setColorFilter(new PorterDuffColorFilter(this.A01, PorterDuff.Mode.SRC_IN));
        canvas.drawBitmap(this.A03, (Rect) null, new Rect(0, 0, getWidth(), getHeight()), paint);
        paint.setColorFilter(new PorterDuffColorFilter(this.A02, PorterDuff.Mode.SRC_ATOP));
        Rect fillRect = new Rect(0, 0, (int) (this.A03.getWidth() * 1.0f), this.A03.getHeight());
        Rect drawRect = new Rect(0, 0, (int) (getWidth() * 1.0f), getHeight());
        canvas.drawBitmap(this.A03, fillRect, drawRect, paint);
    }
}
