package com.fyber.inneractive.sdk.interfaces;

import android.view.View;
import android.view.ViewGroup;
import com.fyber.inneractive.sdk.config.enums.Orientation;

/* loaded from: classes3.dex */
public interface e {
    void destroy();

    void disableCloseButton();

    void dismissAd(boolean z11);

    View getCloseButton();

    ViewGroup getLayout();

    boolean isCloseButtonDisplay();

    void secondEndCardWasDisplayed();

    void setActivityOrientation(boolean z11, Orientation orientation);

    void showCloseButton(boolean z11, int i5, int i11);

    void showCloseCountdown();

    void updateCloseCountdown(int i5);

    boolean wasDismissedByUser();
}
