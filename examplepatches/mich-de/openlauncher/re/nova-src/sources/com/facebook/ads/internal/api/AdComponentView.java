package com.facebook.ads.internal.api;

import android.view.View;
import android.view.ViewGroup;
import androidx.annotation.Keep;

@Keep
/* loaded from: classes.dex */
public interface AdComponentView {
    void addView(View view);

    void addView(View view, int i5);

    void addView(View view, int i5, int i11);

    void addView(View view, int i5, ViewGroup.LayoutParams layoutParams);

    void addView(View view, ViewGroup.LayoutParams layoutParams);

    void onWindowFocusChanged(boolean z11);

    void setLayoutParams(ViewGroup.LayoutParams layoutParams);
}
