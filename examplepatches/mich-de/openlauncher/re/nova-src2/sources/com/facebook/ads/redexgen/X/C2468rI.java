package com.facebook.ads.redexgen.X;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.view.View;
import android.widget.RelativeLayout;

/* renamed from: com.facebook.ads.redexgen.X.rI, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2468rI extends View {
    public int A00;
    public Paint A01;
    public Paint A02;
    public Paint A03;
    public boolean A04;

    public C2468rI(C0958Hi c0958Hi) {
        this(c0958Hi, 60, true);
    }

    public C2468rI(C0958Hi c0958Hi, int i5, boolean z11) {
        super(c0958Hi);
        this.A00 = i5;
        this.A04 = z11;
        if (z11) {
            this.A02 = new Paint();
            this.A02.setColor(-3355444);
            this.A02.setStyle(Paint.Style.STROKE);
            this.A02.setStrokeWidth(3.0f);
            this.A02.setAntiAlias(true);
            this.A01 = new Paint();
            this.A01.setColor(-1287371708);
            this.A01.setStyle(Paint.Style.FILL);
            this.A01.setAntiAlias(true);
            this.A03 = new Paint();
            this.A03.setColor(-1);
            this.A03.setStyle(Paint.Style.STROKE);
            this.A03.setStrokeWidth(6.0f);
            this.A03.setAntiAlias(true);
        }
    }

    public RelativeLayout.LayoutParams getDefaultLayoutParams() {
        float f11 = AbstractC2385px.A02;
        float density = this.A00;
        int i5 = (int) (density * f11);
        float density2 = this.A00;
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(i5, (int) (density2 * f11));
        layoutParams.addRule(10);
        layoutParams.addRule(11);
        return layoutParams;
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        if (this.A04) {
            canvas.isHardwareAccelerated();
            int iMin = Math.min(canvas.getWidth(), canvas.getHeight());
            int i5 = iMin / 2;
            int i11 = iMin / 2;
            int edgeLength = i5 * 2;
            int i12 = edgeLength / 3;
            canvas.drawCircle(i5, i11, i12, this.A02);
            int edgeLength2 = i12 - 2;
            canvas.drawCircle(i5, i11, edgeLength2, this.A01);
            int centerY = iMin / 3;
            int centerX = iMin / 3;
            int edgeLength3 = centerY * 2;
            float f11 = edgeLength3;
            int edgeLength4 = centerX * 2;
            canvas.drawLine(centerY, centerX, f11, edgeLength4, this.A03);
            int edgeLength5 = centerY * 2;
            int edgeLength6 = centerX * 2;
            canvas.drawLine(edgeLength5, centerX, centerY, edgeLength6, this.A03);
        }
        super.onDraw(canvas);
    }
}
