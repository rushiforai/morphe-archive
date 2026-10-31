package com.facebook.ads;

import androidx.annotation.Keep;
import com.facebook.infer.annotation.Nullsafe;

@Keep
@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes2.dex */
public interface InterstitialAdListener extends AdListener {
    void onInterstitialDismissed(Ad ad);

    void onInterstitialDisplayed(Ad ad);
}
