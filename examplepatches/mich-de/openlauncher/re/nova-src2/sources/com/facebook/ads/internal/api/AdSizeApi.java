package com.facebook.ads.internal.api;

import androidx.annotation.Keep;
import com.facebook.infer.annotation.Nullsafe;

@Keep
@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes.dex */
public interface AdSizeApi {

    @Deprecated
    public static final int BANNER_320_50 = 4;
    public static final int BANNER_HEIGHT_50 = 5;
    public static final int BANNER_HEIGHT_90 = 6;
    public static final int INTERSTITIAL = 100;
    public static final int RECTANGLE_HEIGHT_250 = 7;

    int getHeight();

    int getWidth();
}
