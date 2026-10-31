package com.vungle.ads;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bf\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&¨\u0006\u0006"}, d2 = {"Lcom/vungle/ads/RewardedAdListener;", "Lcom/vungle/ads/FullscreenAdListener;", "onAdRewarded", b.f42142b, "baseAd", "Lcom/vungle/ads/BaseAd;", "vungle-ads_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes.dex */
public interface RewardedAdListener extends FullscreenAdListener {
    void onAdRewarded(@NotNull BaseAd baseAd);
}
