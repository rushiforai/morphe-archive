package com.facebook.ads.internal.api;

import androidx.annotation.Keep;
import com.facebook.ads.AdClosedListener;

@Keep
/* loaded from: classes.dex */
public interface AdOptionsViewApi extends AdComponentViewApiProvider {
    void setIconColor(int i5);

    void setIconSizeDp(int i5);

    void setOnAdClosedListener(AdClosedListener adClosedListener);

    void setSingleIcon(boolean z11);
}
