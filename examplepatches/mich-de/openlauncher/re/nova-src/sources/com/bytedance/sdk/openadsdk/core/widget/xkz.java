package com.bytedance.sdk.openadsdk.core.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;

/* loaded from: classes2.dex */
public class xkz extends com.bytedance.sdk.openadsdk.core.lt.dj {
    private float ycx;

    public xkz(Context context) {
        this(context, null);
    }

    @Override // com.bytedance.sdk.openadsdk.core.lt.dj, android.widget.ImageView, android.view.View
    public void onMeasure(int i5, int i11) {
        int mode = View.MeasureSpec.getMode(i5);
        int size = View.MeasureSpec.getSize(i5);
        int mode2 = View.MeasureSpec.getMode(i11);
        int size2 = View.MeasureSpec.getSize(i11);
        int i12 = getLayoutParams().width;
        int i13 = getLayoutParams().height;
        float f11 = this.ycx;
        if (f11 > 0.0f) {
            if (i12 == -2) {
                size = (int) (size2 * f11);
                mode = 1073741824;
            } else if (i13 == -2) {
                size2 = (int) (size / f11);
                mode2 = 1073741824;
            }
        }
        setMeasuredDimension(View.MeasureSpec.makeMeasureSpec(size, mode), View.MeasureSpec.makeMeasureSpec(size2, mode2));
    }

    public void setRatio(float f11) {
        this.ycx = f11;
    }

    public xkz(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
    }
}
