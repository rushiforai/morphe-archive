package com.fyber.inneractive.sdk.renderers;

import android.content.Context;
import android.view.View;
import android.widget.RelativeLayout;

/* loaded from: classes3.dex */
public final class l extends RelativeLayout {

    /* renamed from: a, reason: collision with root package name */
    public final float f30994a;

    public l(Context context, float f11) {
        super(context);
        this.f30994a = f11;
    }

    @Override // android.widget.RelativeLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        int iMakeMeasureSpec;
        View.MeasureSpec.getMode(i5);
        int mode = View.MeasureSpec.getMode(i11);
        if (mode == 0 || (mode == Integer.MIN_VALUE && View.MeasureSpec.getSize(i11) > 0)) {
            int size = View.MeasureSpec.getSize(i5);
            int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(size, 1073741824);
            float f11 = this.f30994a;
            if (f11 != 0.0f) {
                i11 = View.MeasureSpec.makeMeasureSpec((int) (size * f11), 1073741824);
            }
            iMakeMeasureSpec = iMakeMeasureSpec2;
        } else {
            int size2 = View.MeasureSpec.getSize(i5);
            int size3 = View.MeasureSpec.getSize(i11);
            iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(size2, 1073741824);
            i11 = View.MeasureSpec.makeMeasureSpec(size3, 1073741824);
        }
        super.onMeasure(iMakeMeasureSpec, i11);
    }
}
