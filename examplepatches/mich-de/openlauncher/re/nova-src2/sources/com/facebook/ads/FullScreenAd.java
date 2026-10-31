package com.facebook.ads;

import androidx.annotation.Keep;
import com.facebook.ads.Ad;

/* loaded from: classes.dex */
public interface FullScreenAd extends Ad {

    @Keep
    /* loaded from: classes2.dex */
    public interface ShowAdConfig {
    }

    @Keep
    /* loaded from: classes2.dex */
    public interface ShowConfigBuilder {
        ShowAdConfig build();
    }

    Ad.LoadConfigBuilder buildLoadAdConfig();

    ShowConfigBuilder buildShowAdConfig();

    boolean show();
}
