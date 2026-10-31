package com.vungle.ads.nativead;

import androidx.annotation.Keep;
import kotlin.Metadata;

@Keep
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0005\bg\u0018\u00002\u00020\u0001J\b\u0010\u0002\u001a\u00020\u0003H&J\b\u0010\u0004\u001a\u00020\u0003H&J\b\u0010\u0005\u001a\u00020\u0003H&J\b\u0010\u0006\u001a\u00020\u0003H&J\b\u0010\u0007\u001a\u00020\u0003H&¨\u0006\b"}, d2 = {"Lcom/vungle/ads/nativead/NativeVideoListener;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onVideoEnd", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onVideoMute", "onVideoPause", "onVideoPlay", "onVideoUnmute", "vungle-ads_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public interface NativeVideoListener {
    void onVideoEnd();

    void onVideoMute();

    void onVideoPause();

    void onVideoPlay();

    void onVideoUnmute();
}
