package com.bytedance.sdk.component.adexpress.lt;

import android.content.Context;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes2.dex */
public class tn extends FrameLayout {

    /* renamed from: dj, reason: collision with root package name */
    private float f23607dj;
    private float fby;

    /* renamed from: lt, reason: collision with root package name */
    private Drawable f23608lt;
    private Drawable lud;
    private float sya;

    /* renamed from: ul, reason: collision with root package name */
    private double f23609ul;
    LinearLayout ycx;

    /* renamed from: zb, reason: collision with root package name */
    LinearLayout f23610zb;

    /* renamed from: jw, reason: collision with root package name */
    private static final int f23606jw = (com.bytedance.sdk.component.adexpress.dynamic.lud.ea.zb(b.f42142b, 0.0f, true)[1] / 2) + 1;

    /* renamed from: jc, reason: collision with root package name */
    private static final int f23605jc = (com.bytedance.sdk.component.adexpress.dynamic.lud.ea.zb(b.f42142b, 0.0f, true)[1] / 2) + 3;

    public tn(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.ycx = new LinearLayout(getContext());
        this.f23610zb = new LinearLayout(getContext());
        this.ycx.setOrientation(0);
        this.ycx.setGravity(8388611);
        this.f23610zb.setOrientation(0);
        this.f23610zb.setGravity(8388611);
        this.lud = com.bytedance.sdk.component.utils.wwx.sya(context, "tt_star_thick");
        this.f23608lt = com.bytedance.sdk.component.utils.wwx.sya(context, "tt_star");
    }

    private ImageView getStarImageView() {
        ImageView imageView = new ImageView(getContext());
        imageView.setLayoutParams(new ViewGroup.LayoutParams((int) this.sya, (int) this.f23607dj));
        imageView.setPadding(1, f23606jw, 1, f23605jc);
        return imageView;
    }

    public Drawable getStarEmptyDrawable() {
        return this.lud;
    }

    public Drawable getStarFillDrawable() {
        return this.f23608lt;
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        this.ycx.measure(i5, i11);
        double d5 = this.f23609ul;
        float f11 = this.sya;
        this.f23610zb.measure(View.MeasureSpec.makeMeasureSpec((int) (((d5 - ((int) d5)) * (f11 - 2.0f)) + (((int) d5) * f11) + 1.0f), 1073741824), View.MeasureSpec.makeMeasureSpec(this.ycx.getMeasuredHeight(), 1073741824));
        if (this.fby > 0.0f) {
            this.ycx.setPadding(0, ((int) (r7.getMeasuredHeight() - this.fby)) / 2, 0, 0);
            this.f23610zb.setPadding(0, ((int) (this.ycx.getMeasuredHeight() - this.fby)) / 2, 0, 0);
        }
    }

    public void ycx(double d5, int i5, int i11, int i12) {
        float f11 = i11;
        this.sya = (int) com.bytedance.sdk.component.adexpress.dj.ul.sya(getContext(), f11);
        this.f23607dj = (int) com.bytedance.sdk.component.adexpress.dj.ul.sya(getContext(), f11);
        this.f23609ul = d5;
        this.fby = i12;
        removeAllViews();
        for (int i13 = 0; i13 < 5; i13++) {
            ImageView starImageView = getStarImageView();
            starImageView.setScaleType(ImageView.ScaleType.FIT_XY);
            starImageView.setColorFilter(i5, PorterDuff.Mode.SRC_IN);
            starImageView.setImageDrawable(getStarFillDrawable());
            this.f23610zb.addView(starImageView);
        }
        for (int i14 = 0; i14 < 5; i14++) {
            ImageView starImageView2 = getStarImageView();
            starImageView2.setScaleType(ImageView.ScaleType.FIT_XY);
            starImageView2.setImageDrawable(getStarEmptyDrawable());
            this.ycx.addView(starImageView2);
        }
        addView(this.ycx);
        addView(this.f23610zb);
        requestLayout();
    }
}
