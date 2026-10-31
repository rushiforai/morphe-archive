package com.fyber.inneractive.sdk.renderers;

import androidx.recyclerview.widget.n0;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes3.dex */
public enum m {
    BANNER_WIDTH(Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE),
    BANNER_HEIGHT(50),
    BANNER_TABLET_HEIGHT(90),
    BANNER_TABLET_WIDTH(728),
    RECTANGLE_HEIGHT(n0.DEFAULT_SWIPE_ANIMATION_DURATION),
    RECTANGLE_WIDTH(300);

    final int value;

    m(int i5) {
        this.value = i5;
    }
}
