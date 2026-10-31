package com.google.android.exoplayer2.ui;

import ai.i2;
import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import uf.e;

/* loaded from: classes3.dex */
public final class AspectRatioFrameLayout extends FrameLayout {

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ int f31578d = 0;

    /* renamed from: a, reason: collision with root package name */
    public final i2 f31579a;

    /* renamed from: b, reason: collision with root package name */
    public float f31580b;

    /* renamed from: c, reason: collision with root package name */
    public int f31581c;

    public AspectRatioFrameLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f31581c = 0;
        if (attributeSet != null) {
            TypedArray typedArrayObtainStyledAttributes = context.getTheme().obtainStyledAttributes(attributeSet, e.f91124a, 0, 0);
            try {
                this.f31581c = typedArrayObtainStyledAttributes.getInt(0, 0);
            } finally {
                typedArrayObtainStyledAttributes.recycle();
            }
        }
        this.f31579a = new i2(this, 4);
    }

    @Override // android.widget.FrameLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        float f11;
        float f12;
        super.onMeasure(i5, i11);
        if (this.f31580b <= 0.0f) {
            return;
        }
        int measuredWidth = getMeasuredWidth();
        int measuredHeight = getMeasuredHeight();
        float f13 = measuredWidth;
        float f14 = measuredHeight;
        float f15 = (this.f31580b / (f13 / f14)) - 1.0f;
        float fAbs = Math.abs(f15);
        i2 i2Var = this.f31579a;
        if (fAbs <= 0.01f) {
            if (i2Var.f13012b) {
                return;
            }
            i2Var.f13012b = true;
            ((AspectRatioFrameLayout) i2Var.f13013c).post(i2Var);
            return;
        }
        int i12 = this.f31581c;
        if (i12 != 0) {
            if (i12 != 1) {
                if (i12 == 2) {
                    f11 = this.f31580b;
                } else if (i12 == 4) {
                    if (f15 > 0.0f) {
                        f11 = this.f31580b;
                    } else {
                        f12 = this.f31580b;
                    }
                }
                measuredWidth = (int) (f14 * f11);
            } else {
                f12 = this.f31580b;
            }
            measuredHeight = (int) (f13 / f12);
        } else if (f15 > 0.0f) {
            f12 = this.f31580b;
            measuredHeight = (int) (f13 / f12);
        } else {
            f11 = this.f31580b;
            measuredWidth = (int) (f14 * f11);
        }
        if (!i2Var.f13012b) {
            i2Var.f13012b = true;
            ((AspectRatioFrameLayout) i2Var.f13013c).post(i2Var);
        }
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(measuredWidth, 1073741824), View.MeasureSpec.makeMeasureSpec(measuredHeight, 1073741824));
    }
}
