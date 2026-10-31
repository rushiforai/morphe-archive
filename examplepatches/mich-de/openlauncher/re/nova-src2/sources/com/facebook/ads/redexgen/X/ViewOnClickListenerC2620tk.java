package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.tk, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2620tk implements View.OnClickListener {
    public float A00;
    public float A01;
    public View.OnClickListener A02;

    public ViewOnClickListenerC2620tk(View.OnClickListener onClickListener) {
        this.A02 = onClickListener;
    }

    public final void A00(float f11, float f12) {
        this.A00 = f11;
        this.A01 = f12;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            int width = view.getWidth();
            int height = view.getHeight();
            int diff = Math.abs(width - height) / 2;
            if (width == height || ((width > height && this.A00 >= diff && this.A00 <= width - diff) || (height > width && this.A01 >= diff && this.A01 <= height - diff))) {
                this.A02.onClick(view);
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
