package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import android.widget.ImageView;

/* renamed from: com.facebook.ads.redexgen.X.te, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2614te extends FrameLayout {
    public int A00;
    public int A01;
    public final ImageView A02;
    public final ImageView A03;

    public C2614te(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A03 = new ImageView(c0958Hi);
        this.A02 = new ImageView(c0958Hi);
        A00();
    }

    public C2614te(C0958Hi c0958Hi, AttributeSet attributeSet) {
        super(c0958Hi, attributeSet);
        this.A03 = new ImageView(c0958Hi, attributeSet);
        this.A02 = new ImageView(c0958Hi, attributeSet);
        A00();
    }

    public C2614te(C0958Hi c0958Hi, AttributeSet attributeSet, int i5) {
        super(c0958Hi, attributeSet, i5);
        this.A03 = new ImageView(c0958Hi, attributeSet, i5);
        this.A02 = new ImageView(c0958Hi, attributeSet, i5);
        A00();
    }

    public C2614te(C0958Hi c0958Hi, AttributeSet attributeSet, int i5, int i11) {
        super(c0958Hi, attributeSet, i5, i11);
        this.A03 = new ImageView(c0958Hi, attributeSet, i5, i11);
        this.A02 = new ImageView(c0958Hi, attributeSet, i5, i11);
        A00();
    }

    private void A00() {
        addView(this.A02, new FrameLayout.LayoutParams(-1, -1));
        addView(this.A03, new FrameLayout.LayoutParams(-2, -2));
        EnumC2391q3.A04(this.A03, EnumC2391q3.A0A);
        setId(AbstractC2426qc.A00());
    }

    public ImageView getBodyImageView() {
        return this.A03;
    }

    public int getImageHeight() {
        return this.A00;
    }

    public int getImageWidth() {
        return this.A01;
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        if (this.A01 <= 0 || this.A00 <= 0) {
            super.onLayout(z11, i5, i11, i12, i13);
            return;
        }
        int i14 = i12 - i5;
        int i15 = i13 - i11;
        float fMin = Math.min(i14 / this.A01, i15 / this.A00);
        int i16 = (int) (this.A01 * fMin);
        int i17 = (int) (this.A00 * fMin);
        this.A02.layout(i5, i11, i12, i13);
        int blurBorderViewHeight = (i14 / 2) + i5;
        int blurBorderViewWidth = (i15 / 2) + i11;
        this.A03.layout(blurBorderViewHeight - (i16 / 2), blurBorderViewWidth - (i17 / 2), (i16 / 2) + blurBorderViewHeight, blurBorderViewWidth + (i17 / 2));
        this.A02.setVisibility(0);
    }

    public void setImage(Bitmap bitmap, Bitmap bitmap2) {
        if (bitmap2 != null) {
            AbstractC2426qc.A0W(this.A02, new BitmapDrawable(getContext().getResources(), bitmap2));
        } else {
            AbstractC2426qc.A0O(this.A02, 0);
        }
        if (bitmap != null) {
            this.A01 = bitmap.getWidth();
            this.A00 = bitmap.getHeight();
            this.A03.setImageBitmap(Bitmap.createBitmap(bitmap));
            return;
        }
        this.A03.setImageDrawable(null);
    }
}
