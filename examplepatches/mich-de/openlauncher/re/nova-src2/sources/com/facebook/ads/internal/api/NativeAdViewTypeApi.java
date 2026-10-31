package com.facebook.ads.internal.api;

import androidx.annotation.Keep;
import com.facebook.infer.annotation.Nullsafe;

@Keep
@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes.dex */
public interface NativeAdViewTypeApi {
    public static final int HEIGHT_100 = 0;
    public static final int HEIGHT_120 = 1;

    @Deprecated
    public static final int HEIGHT_300 = 2;

    @Deprecated
    public static final int HEIGHT_400 = 3;
    public static final int HEIGHT_50 = 4;
    public static final int RECT_DYNAMIC = 5;

    int getHeight();

    int getValue();

    int getWidth();
}
