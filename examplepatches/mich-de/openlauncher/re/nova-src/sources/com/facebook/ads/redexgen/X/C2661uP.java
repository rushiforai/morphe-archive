package com.facebook.ads.redexgen.X;

import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.RectF;
import android.widget.ImageView;

/* renamed from: com.facebook.ads.redexgen.X.uP, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2661uP extends ImageView {
    public static final int A04 = (int) (AbstractC2385px.A02 * 8.0f);
    public static final float[] A05 = {A04, A04, A04, A04, A04, A04, A04, A04};
    public boolean A00;
    public float[] A01;
    public final Path A02;
    public final RectF A03;

    public C2661uP(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A01 = A05;
        this.A00 = false;
        this.A02 = new Path();
        this.A03 = new RectF();
    }

    private float[] getRadiiForCircularImage() {
        int radiusForCircle = Math.min(getWidth(), getHeight()) / 2;
        return new float[]{radiusForCircle, radiusForCircle, radiusForCircle, radiusForCircle, radiusForCircle, radiusForCircle, radiusForCircle, radiusForCircle};
    }

    @Override // android.widget.ImageView, android.view.View
    public final void onDraw(Canvas canvas) {
        this.A03.set(0.0f, 0.0f, getWidth(), getHeight());
        this.A02.reset();
        this.A02.addRoundRect(this.A03, this.A00 ? getRadiiForCircularImage() : this.A01, Path.Direction.CW);
        canvas.clipPath(this.A02);
        super.onDraw(canvas);
    }

    public void setFullCircleCorners(boolean z11) {
        this.A00 = z11;
    }

    public void setRadius(int i5) {
        int densityAdjustedRadius = (int) (i5 * AbstractC2385px.A02);
        this.A01 = new float[]{densityAdjustedRadius, densityAdjustedRadius, densityAdjustedRadius, densityAdjustedRadius, densityAdjustedRadius, densityAdjustedRadius, densityAdjustedRadius, densityAdjustedRadius};
    }

    public void setRadius(float[] fArr) {
        if (fArr != null) {
            this.A01 = fArr;
        } else {
            this.A01 = A05;
        }
    }
}
