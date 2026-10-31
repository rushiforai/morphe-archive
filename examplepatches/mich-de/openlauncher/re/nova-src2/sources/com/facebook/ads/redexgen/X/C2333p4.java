package com.facebook.ads.redexgen.X;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.widget.RelativeLayout;
import android.widget.TextView;

/* renamed from: com.facebook.ads.redexgen.X.p4, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2333p4 extends RelativeLayout {
    public final Paint A00;
    public final RectF A01;

    public C2333p4(C0958Hi c0958Hi, String str) {
        super(c0958Hi);
        float f11 = c0958Hi.getResources().getDisplayMetrics().density;
        TextView textView = new TextView(c0958Hi);
        textView.setTextColor(-16777216);
        textView.setTextSize(16.0f);
        textView.setText(str);
        textView.setTypeface(Typeface.defaultFromStyle(1));
        setGravity(17);
        float density = 6.0f * f11;
        int i5 = (int) density;
        textView.setPadding(i5, i5, i5, i5);
        addView(textView);
        this.A00 = new Paint();
        this.A00.setStyle(Paint.Style.FILL);
        this.A00.setColor(-1);
        this.A01 = new RectF();
        AbstractC2426qc.A0O(this, 0);
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        float f11 = getContext().getResources().getDisplayMetrics().density;
        this.A01.set(0.0f, 0.0f, getWidth(), getHeight());
        canvas.drawRoundRect(this.A01, f11 * 10.0f, 10.0f * f11, this.A00);
        super.onDraw(canvas);
    }
}
