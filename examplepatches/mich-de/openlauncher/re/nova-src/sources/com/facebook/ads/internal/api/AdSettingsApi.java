package com.facebook.ads.internal.api;

import android.content.Context;
import androidx.annotation.Keep;

@Keep
/* loaded from: classes.dex */
public interface AdSettingsApi {
    boolean isTestMode(Context context);

    void turnOnDebugger();
}
