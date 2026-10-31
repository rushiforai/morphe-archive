package com.bytedance.adsdk.ugeno.ycx;

import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.view.View;

/* loaded from: classes2.dex */
public class fby implements ul {

    /* renamed from: dj, reason: collision with root package name */
    private float f22528dj;

    /* renamed from: lt, reason: collision with root package name */
    private float f22529lt;
    private float lud;
    private float sya;
    private View ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f22530zb;

    public fby(View view) {
        this.ycx = view;
    }

    public void dj(float f11) {
        this.lud = f11;
        this.ycx.postInvalidate();
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ul
    public float getRipple() {
        return this.sya;
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ul
    public float getRubIn() {
        return this.f22529lt;
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ul
    public float getShine() {
        return this.f22528dj;
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ul
    public float getStretch() {
        return this.lud;
    }

    public void lud(float f11) {
        this.f22529lt = f11;
        this.ycx.postInvalidate();
    }

    public void sya(float f11) {
        View view = this.ycx;
        if (view == null) {
            return;
        }
        this.f22528dj = f11;
        view.postInvalidate();
    }

    public void ycx(float f11) {
        View view = this.ycx;
        if (view == null) {
            return;
        }
        this.f22530zb = f11;
        Drawable background = view.getBackground();
        if (background instanceof GradientDrawable) {
            ((GradientDrawable) background).setCornerRadius(f11);
        }
    }

    public void zb(float f11) {
        View view = this.ycx;
        if (view == null) {
            return;
        }
        this.sya = f11;
        view.postInvalidate();
    }

    public float ycx() {
        return this.f22530zb;
    }

    public void ycx(int i5) {
        View view = this.ycx;
        if (view == null) {
            return;
        }
        Drawable background = view.getBackground();
        if (background instanceof GradientDrawable) {
            ((GradientDrawable) background).setColor(i5);
        } else if (background instanceof ColorDrawable) {
            ((ColorDrawable) background.mutate()).setColor(i5);
        }
    }
}
