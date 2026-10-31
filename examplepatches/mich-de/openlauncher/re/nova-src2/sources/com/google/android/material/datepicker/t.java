package com.google.android.material.datepicker;

import android.content.Context;
import android.graphics.PointF;
import android.util.DisplayMetrics;
import android.view.View;
import androidx.recyclerview.widget.z0;
import com.google.android.material.carousel.CarouselLayoutManager;

/* loaded from: classes3.dex */
public final class t extends z0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34278a = 0;

    public /* synthetic */ t(Context context) {
        super(context);
    }

    @Override // androidx.recyclerview.widget.z0
    public int calculateDxToMakeVisible(View view, int i5) {
        switch (this.f34278a) {
            case 1:
                return 0;
            default:
                return super.calculateDxToMakeVisible(view, i5);
        }
    }

    @Override // androidx.recyclerview.widget.z0
    public int calculateDyToMakeVisible(View view, int i5) {
        switch (this.f34278a) {
            case 1:
                return 0;
            default:
                return super.calculateDyToMakeVisible(view, i5);
        }
    }

    @Override // androidx.recyclerview.widget.z0
    public float calculateSpeedPerPixel(DisplayMetrics displayMetrics) {
        switch (this.f34278a) {
            case 0:
                return 100.0f / displayMetrics.densityDpi;
            default:
                return super.calculateSpeedPerPixel(displayMetrics);
        }
    }

    @Override // androidx.recyclerview.widget.n2
    public PointF computeScrollVectorForPosition(int i5) {
        switch (this.f34278a) {
            case 1:
                return null;
            default:
                return super.computeScrollVectorForPosition(i5);
        }
    }

    public t(CarouselLayoutManager carouselLayoutManager, Context context) {
        super(context);
    }
}
