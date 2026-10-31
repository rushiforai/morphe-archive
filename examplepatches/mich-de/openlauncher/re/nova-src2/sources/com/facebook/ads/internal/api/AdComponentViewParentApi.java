package com.facebook.ads.internal.api;

import android.view.View;
import androidx.annotation.Keep;

@Keep
/* loaded from: classes2.dex */
public interface AdComponentViewParentApi extends AdComponentView {
    void bringChildToFront(View view);

    void onAttachedToWindow();

    void onDetachedFromWindow();

    void onMeasure(int i5, int i11);

    void onVisibilityChanged(View view, int i5);

    void setMeasuredDimension(int i5, int i11);
}
