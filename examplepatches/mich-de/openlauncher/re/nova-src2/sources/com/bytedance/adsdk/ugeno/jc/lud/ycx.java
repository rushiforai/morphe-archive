package com.bytedance.adsdk.ugeno.jc.lud;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.PorterDuff;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.bytedance.adsdk.ugeno.fby.dj;
import com.bytedance.adsdk.ugeno.fby.fby;
import com.bytedance.adsdk.ugeno.lud;

/* loaded from: classes2.dex */
public class ycx extends FrameLayout {

    /* renamed from: dj, reason: collision with root package name */
    private float f22336dj;
    private lud fby;

    /* renamed from: lt, reason: collision with root package name */
    private LinearLayout f22337lt;
    private LinearLayout lud;
    private double sya;

    /* renamed from: ul, reason: collision with root package name */
    private Context f22338ul;
    private float ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f22339zb;

    public ycx(Context context) {
        super(context);
        this.f22338ul = context;
        this.lud = new LinearLayout(context);
        this.f22337lt = new LinearLayout(context);
        this.lud.setOrientation(0);
        this.lud.setGravity(8388611);
        this.f22337lt.setOrientation(0);
        this.f22337lt.setGravity(8388611);
    }

    private ImageView getStarImageView() {
        ImageView imageView = new ImageView(getContext());
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams((int) this.ycx, (int) this.f22339zb);
        float f11 = this.f22336dj;
        layoutParams.leftMargin = (int) f11;
        layoutParams.topMargin = 0;
        layoutParams.rightMargin = (int) f11;
        layoutParams.bottomMargin = 1;
        imageView.setLayoutParams(layoutParams);
        return imageView;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        lud ludVar = this.fby;
        if (ludVar != null) {
            ludVar.ul();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        lud ludVar = this.fby;
        if (ludVar != null) {
            ludVar.fby();
        }
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        lud ludVar = this.fby;
        if (ludVar != null) {
            ludVar.ycx(i5, i11, i12, i13);
        }
        super.onLayout(z11, i5, i11, i12, i13);
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        lud ludVar = this.fby;
        if (ludVar != null) {
            ludVar.ycx(i5, i11);
        }
        super.onMeasure(i5, i11);
        this.lud.measure(i5, i11);
        double dFloor = Math.floor(this.sya);
        float f11 = this.f22336dj;
        this.f22337lt.measure(View.MeasureSpec.makeMeasureSpec((int) (((this.sya - dFloor) * this.ycx) + ((f11 + f11 + r2) * dFloor) + f11), 1073741824), View.MeasureSpec.makeMeasureSpec(this.lud.getMeasuredHeight(), 1073741824));
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        lud ludVar = this.fby;
        if (ludVar != null) {
            ludVar.zb(i5, i11, i12, i13);
        }
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        lud ludVar = this.fby;
        if (ludVar != null) {
            ludVar.ycx(z11);
        }
    }

    public void ycx(double d5, int i5, int i11, float f11, int i12) {
        removeAllViews();
        this.lud.removeAllViews();
        this.f22337lt.removeAllViews();
        this.ycx = (int) fby.ycx(this.f22338ul, f11);
        this.f22339zb = (int) fby.ycx(this.f22338ul, f11);
        this.sya = d5;
        this.f22336dj = i12;
        for (int i13 = 0; i13 < 5; i13++) {
            ImageView starImageView = getStarImageView();
            starImageView.setScaleType(ImageView.ScaleType.FIT_XY);
            ycx(starImageView, "tt_ugen_rating_star");
            starImageView.setColorFilter(i5, PorterDuff.Mode.SRC_IN);
            this.f22337lt.addView(starImageView);
        }
        for (int i14 = 0; i14 < 5; i14++) {
            ImageView starImageView2 = getStarImageView();
            starImageView2.setScaleType(ImageView.ScaleType.FIT_XY);
            ycx(starImageView2, "tt_ugen_rating_star");
            starImageView2.setColorFilter(i11);
            this.lud.addView(starImageView2);
        }
        addView(this.lud);
        addView(this.f22337lt);
        requestLayout();
    }

    public void ycx(ImageView imageView, String str) {
        imageView.setImageResource(dj.zb(this.f22338ul, str));
    }

    public void ycx(lud ludVar) {
        this.fby = ludVar;
    }
}
